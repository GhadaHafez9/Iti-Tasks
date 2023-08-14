import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Models/todo_model.dart';
import '../../Service/todo_service.dart';

part 'todos_state.dart';

class TodosCubit extends Cubit<TodosState> {
  TodosCubit() : super(TodosInitial()){
    getMyTodos() ;
  }


    List<UserModel> todos = [];
    getMyTodos() async {

    try {
      emit(TodosLoading());
     todos = await UserService() .gettodos() ;
     emit(TodosSuccess());}
     
     catch(e){
      emit(TodosError());
     }
 




}
}
