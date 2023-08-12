import 'package:dio/dio.dart';
import 'package:flutter_application_2/Models/users_model.dart';

class UserService {
  String url = "https://jsonplaceholder.typicode.com/users" ;

 Future <List<UserModel>> getUsers() async{
  List<UserModel> UsersList =[];

   final response = await Dio().get(url); 

  var data = response.data ;

  data.forEach ((element){
    UserModel user = UserModel.fromJson(element);
    UsersList.add(user);
    
    });
    return UsersList ;
  
 }
}