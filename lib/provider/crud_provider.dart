
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_project/task_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CrudProvider extends ChangeNotifier {
  final firebase = FirebaseFirestore.instance.collection("task");
  List <TaskModel> allTasks =[];
  Future<void> addtask(TaskModel task_model) async {
    try{
      final id = firebase.doc().id;
      final taskRef = firebase.doc(id);
      task_model.taskId = id;
      await taskRef.set(task_model.toMap());
      log("Task added succussfully with ID :$id");
    }catch (e) {
      log("Error while adding Task :$e");
    }
  }


  Future<void>gettask() async{
    try{
      allTasks.clear();
      final doc_collection = await firebase.get();
      final tasks =
      doc_collection.docs.map((doc){
        final data=doc.data();
        return TaskModel.fromMap(data);
      }
      ).toList();
      allTasks.addAll(tasks);
      log("Geted${tasks.length}tasks");
      notifyListeners();
    }catch (e){
      log("Error while Getting tasks $e ");
    }
  }

Future<void> delete(String taskId) async {
  try{
  
    await firebase.doc(taskId).delete();
    log("deleded $taskId");
    gettask();
  }catch (e){
    log("error${e.toString()}");
  }
}

// Future<void> update(){
//   try{
//     log("Update task...");
//     await firebase.doc()
//   }
// }


} 