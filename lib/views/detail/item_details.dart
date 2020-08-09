import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_share_me/flutter_share_me.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mocity/constants/ui_constants.dart';

class DetailPage extends StatelessWidget {

  final item;

  const DetailPage({Key key, @required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: appPrimaryColor,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(item.title, style: TextStyle(fontFamily: appFontFamily, color: Colors.white, fontSize: 20, fontWeight: FontWeight.w900),),
          elevation: 0.0,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () async {
                  var response =
                      await FlutterShareMe().shareToSystem(msg: 'hello share, ${item.content}');
                  if (response == 'success') {
                    print('navigate success');
                  }
                },
                child: SvgPicture.asset(
                  'assets/icons/share.svg',
                  height: 25,
                  width: 25,
                  color: Colors.white,
                ),
              )
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 15,),
                Hero(
                    tag: item.id,
                    child: CircleAvatar(
                      radius: 100.0,
                      backgroundImage: NetworkImage("https://jssors8.azureedge.net/demos/img/gallery/720x480/006.jpg")),
                ),
                SizedBox(height: 10.0,),
                Text("Post Id: ${item.id}",
                    style: TextStyle(
                      fontFamily: appFontFamily,
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${item.title}",
                      style: TextStyle(
                        fontFamily: appFontFamily,
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(color: Colors.white70,child: Html(data: item.content)),
                ),
                SizedBox(height: 20,), 
                /*Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Spacer(),
                        RaisedButton(
                          child: SvgPicture.asset(
                            'assets/icons/whatsapp.svg',
                            height: 20,
                            width: 20,
                          ),
                          onPressed: () {
                            FlutterShareMe().shareToWhatsApp(msg: 'hello whatsapp, ${item.content}');
                          },
                        ),
                        Spacer(),
                        RaisedButton(
                          child: SvgPicture.asset(
                            'assets/icons/facebook.svg',
                            height: 20,
                            width: 20,
                          ),
                          onPressed: () {
                            FlutterShareMe().shareToFacebook(url: 'https://github.com/skillsapphire', msg: 'hello facebook, ${item.content}');
                          },
                        ),
                        Spacer(),
                        RaisedButton(
                          child: SvgPicture.asset(
                            'assets/icons/twitter.svg',
                            height: 20,
                            width: 20,
                          ),
                          onPressed: () {
                            FlutterShareMe().shareToTwitter(msg: 'hello twitter, ${item.content}');
                          },
                        ),
                        Spacer(),
                      ]
                ),*/
              ],
            ),
          ),
        )
      ),
    );
  }
}