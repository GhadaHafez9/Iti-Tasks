 // ignore_for_file: prefer_const_constructors
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/views/cubit/todos_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  State<Page4> createState() => _Page4State();
}



class _Page4State extends State<Page4> {
 
  @override

  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => TodosCubit(),
      child: BlocConsumer<TodosCubit, TodosState>(
        builder: (context, state) {
          if (state is TodosLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is TodosError) {
            return Center(
              child: Text("Error"),
            );
          } 
         return ListView.builder(
          itemCount:context.watch<TodosCubit>() .todos.length
          ,itemBuilder : (BuildContext context ,int  index) {
          return ListTile(
          title: Text (context.watch<TodosCubit>().todos[index] .userId.toString() ),
          subtitle: Text( context.watch<TodosCubit>().todos[index].title.toString()),
          trailing: Icon(Icons.account_box_sharp),
          leading: Text("${index + 1}"),
              );
            }
          );
        },
        listener: (context, state) {},
      ),
    );
  }
}