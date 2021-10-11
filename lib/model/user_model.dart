import 'dart:convert';

import 'package:http/http.dart' as http;

class User{
  String? name;
  String? job;
  String? id;

  User({
    this.id,
    this.name,
    this.job
  });

  factory User.createUser(Map<String, dynamic> object){
    return User(
      id: object['id'],
      name: object['name'],
      job: object['job'],
    );
  }

  static Future<User> connectApi(String name, String job) async{
    var url = Uri.parse("https://reqres.in/api/users");
   var apiResult = await http.post(url, body: {
      "name": name,
      "job": job,
    });

   var jsonObject = json.decode(apiResult.body);
   return User.createUser(jsonObject);
  }
}