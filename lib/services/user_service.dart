
import 'package:mocity/models/api_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:mocity/constants/app_constants.dart';
import 'package:mocity/models/user.dart';

class UserService{

  Future<APIResponse<User>> login(String username, String password) {
    var request = new Map<String, String>();
    request['username'] = username;
    request['password'] = password;

    var headers = new Map<String, String>();
    headers['Content-Type'] = 'application/x-www-form-urlencoded';
    //headers['Content-Type'] = 'application/json';

    return http.post(AUTH_API_BASE_URL + '/token', body: request, headers: headers).then((data) {
      if (data.statusCode == 200) {
        final jsonData = jsonDecode(data.body);
        final userModel = User.fromJson(jsonData);
        return APIResponse<User>(data: userModel);
      }
      if (data.statusCode == 403) 
      {
        return APIResponse<User>(error: true, errorMessage: 'Incorrect credentials');
      }
      return null;
    })
    .catchError((_) => APIResponse<User>(error: true, errorMessage: 'An error occured while login'));
  }

}