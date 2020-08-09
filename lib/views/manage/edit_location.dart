import 'package:flutter/material.dart';
import 'package:mocity/constants/app_constants.dart';
import 'package:mocity/constants/ui_constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:mocity/views/overview/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditLocation extends StatefulWidget {
  @override
  _EditLocationState createState() => _EditLocationState();
}

class _EditLocationState extends State<EditLocation> {

  SharedPreferences _prefs;
  String _cityName;
  bool _hasSelectedLocation = false;

  var _apiRes, _selectedCity;
  List<dynamic> _cities = new List<dynamic>();

  @override
  void initState() {
    super.initState();
    _loadWidget();
  }

  _loadWidget() async {
     _prefs = await SharedPreferences.getInstance();
    _cityName = _prefs.getString('cityName');
    if(_cityName == null){
      _hasSelectedLocation = true;
    }else{
      _hasSelectedLocation = false;
    }
    getCitiesFromAPI();
  }

  getCitiesFromAPI() async{
    _apiRes = await http.get(API_BASE_URL+"/city?_fields=id,name");
    //print(apiRes.body);// this is as string response, so it has to be converted to json
    _cities = jsonDecode(_apiRes.body);
    //print(_cities);
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Update your location", style: TextStyle(fontFamily: appFontFamily, color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),),
        backgroundColor: appPrimaryColor,
      ),
      body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _hasSelectedLocation ? Text("Welcome to MoCity", style: TextStyle(fontFamily: appFontFamily, fontSize: 24, fontWeight: FontWeight.bold, color: appPrimaryColor),)
              : _cityName == null ? CircularProgressIndicator() : Text("Your current city: $_cityName", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: appPrimaryColor),),
              SizedBox(height: 30,),
              Icon(
                Icons.edit_location,
                color: appPrimaryColor,
                size: 50,
              ),
               Divider(
                  height: 30,
                  thickness: 0.5,
                  color: Colors.white.withOpacity(0.3),
                  indent: 32,
                  endIndent: 32,
                ),
              //SizedBox(height: 15,),
              DropdownButton(
                hint: Text('Please choose your city'),
                value: _selectedCity,
                onChanged: (newValue) {
                  setState(() {
                    _selectedCity = newValue;
                  });
                },
                items: _cities.map<DropdownMenuItem<dynamic>>((dynamic city) {
                  return DropdownMenuItem<dynamic>(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new Text(city['name'], style: TextStyle(fontSize: 18),),
                    ),
                    value: city,
                  );
                }).toList(),
              ),
              Container(
                width: MediaQuery.of(context).size.width-80,
                margin: EdgeInsets.all(10),
                child: RaisedButton(
                  elevation: 5,
                  textColor: Colors.white,
                  child: Text('Update location', style: TextStyle(fontSize: 18),),
                  color: appPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(16.0))),
                  onPressed: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setInt('cityId', _selectedCity['id']);
                    prefs.setString('cityName', _selectedCity['name']);
                    Navigator.of(context).pop();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(menu: "Doctors")));
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}