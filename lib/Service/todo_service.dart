import 'package:dio/dio.dart';
import '../Models/todo_model.dart';

class UserService {
  String url = "https://jsonplaceholder.typicode.com/todos" ;

 Future <List<UserModel>> gettodos() async{
  List<UserModel> todolist =[];

   final response = await Dio().get(url); 
   var data = response.data ;
   data.forEach ((element){
   UserModel todo = UserModel.fromJson(element);
    todolist.add(todo);
    
    });
    return todolist ;
  
 }
}