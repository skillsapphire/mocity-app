import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_it/get_it.dart';
import 'package:mocity/constants/constants.dart';
import 'package:mocity/models/api_response.dart';
import 'package:mocity/models/user.dart';
import 'package:mocity/services/user_service.dart';
import 'package:mocity/views/Login/components/background.dart';
import 'package:mocity/views/Signup/signup_screen.dart';
import 'package:mocity/views/components/already_have_an_account_acheck.dart';
import 'package:mocity/views/components/rounded_button.dart';
import 'package:mocity/views/components/text_field_container.dart';

class Body extends StatefulWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  String _username;
  String _email;
  String _password;
  bool isError = false;
  bool loading = false;
  String message;

  UserService get userService => GetIt.I<UserService>();
  APIResponse<User> _apiUserResponse;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Build Username
  Widget _buildUsername(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          hintText: "Your username",
          border: InputBorder.none,
        ),
        validator: (String value) {
        if (value.isEmpty) {
          return 'Username is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _username = value;
      },
      ),
    );
  }
  // End
  // Build Email
  Widget _buildEmail(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          hintText: "Your Email",
          border: InputBorder.none,
        ),
        validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
      ),
    );
  }
  // End

  // Build Password
  Widget _buildPassword(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
        validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
      ),
    );
  }
  // End
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              isError ? Text(message) : Text(''),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              _buildUsername(context),
              //_buildEmail(context),
              _buildPassword(context),
              RoundedButton(
                text: "LOGIN",
                press: () async {
                  if (!_formKey.currentState.validate()) {
                      return;
                    }

                    _formKey.currentState.save();
                    setState(() {
                        loading = true;
                    });
                    _apiUserResponse = await userService.login(_username, _password);

                    if(!_apiUserResponse.error){
                        //Navigator.of(context).pushNamed("/home");
                        setState(() {
                          loading = false;
                        });
                        Navigator.pushReplacementNamed(context, "/home");
                    }else{
                      setState(() {
                        isError = _apiUserResponse.error;
                        message = _apiUserResponse.errorMessage;
                      });
                    }
                    
                },
              ),
              loading ? CircularProgressIndicator() : Text(''),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
