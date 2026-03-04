import 'package:cloud_firestore/cloud_firestore.dart';

class TaskModel {
  String taskName;
  String taskDes;
  String taskNumber;
  String ?taskId;
  Timestamp createdAt;
  TaskModel({required this.taskName,required this.taskDes,required this.taskNumber, this.taskId,required this.createdAt});



Map<String, dynamic> toMap(){
  return <String , dynamic>{
    'taskId':taskId,
    'name':taskName,
    'detail':taskDes,
    'number':taskNumber,
    'createdAt':createdAt,
  };
}

factory TaskModel.fromMap(Map<String ,dynamic> map){
  return TaskModel
  (taskName: map['name'] as String,
   taskDes: map ['detail'] as String,
   taskNumber: map['number'] as String,
  taskId: map['taskId'] != null ? map['taskId'] as String : null,
    createdAt: map['createdAt'] as Timestamp
    );
}
}