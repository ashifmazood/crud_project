import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_project/home_page.dart';
import 'package:crud_project/provider/crud_provider.dart';
import 'package:crud_project/task_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TaskAdding extends StatefulWidget {
  const TaskAdding({super.key});

  @override
  State<TaskAdding> createState() => _TaskAddingState();
}

class _TaskAddingState extends State<TaskAdding> {
TextEditingController _taskcontroller =TextEditingController();
  TextEditingController _detailscontroller = TextEditingController();
  TextEditingController _numbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CrudProvider>(
        builder: (context, state, child) => 
         Padding(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Add Task',style: TextStyle(
                fontSize: 30,fontWeight: FontWeight.w600,color: Colors.black,
              ),),
              TextFormField(
                controller: _taskcontroller,
                decoration: InputDecoration(
                  hintText: 'task',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(
                    color: Colors.black87,width: 2
                  )),
                  focusColor: Colors.blueGrey.shade200,
                  
                  
                ),
              ), 
              TextFormField(
                controller: _detailscontroller,
                decoration: InputDecoration(
                  hintText: 'details',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(
                    color: Colors.black87,width: 2
                  )),
                  focusColor: Colors.blueGrey.shade200,
                  
                  
                ),
              ),
          
              TextFormField(
                controller: _numbercontroller,
                decoration: InputDecoration(
                  hintText: 'Number',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(
                    color: Colors.black87,width: 2
                  )),
                  focusColor: Colors.blueGrey.shade200,
                  
                  
                ),
              ),
          
              InkWell(
                onTap: () async {
                  if (_detailscontroller.text.isNotEmpty && _numbercontroller.text.isNotEmpty &&_taskcontroller .text.isNotEmpty ){
                      //  FirebaseFirestore.instance.collection("task").add({
                      //   "task":_taskcontroller.text,
                      //   "detail":_detailscontroller.text,
                      //   "number":_numbercontroller.text
                      //  });
                      // 
                       TaskModel task=  TaskModel(
                        taskName: _taskcontroller.text,
                         taskDes: _detailscontroller.text, 
                         taskNumber: _numbercontroller.text, 
                         createdAt: Timestamp.now());
                   await   state.addtask(task);
                      // FirebaseFirestore.instance.collection("task").doc(_numbercontroller.text).set({
                      //       "task":_taskcontroller.text,
                      //       "detail":_detailscontroller.text,
                      //       "number":_numbercontroller.text
                      
                      // }
                      // );
                      
                       
                  }
                  _taskcontroller.clear();
                  _numbercontroller.clear();
                  _detailscontroller.clear();
                 await Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                },
                child: Container(
                  height: 40,
                  width: 150,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.brown),
                  child: Center(child: Text('Save',style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600),)),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.2,)
          
            ],
          ),
        ),
      ),
    );
  }
}