import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_project/provider/crud_provider.dart';
import 'package:crud_project/update_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List datas=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<CrudProvider>(
         builder: (context, state, child) => 
         Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text('Home Page',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.w600),),
          SizedBox(height: 50,),
              Expanded(
                child: ListView.builder(
                  itemCount:state.allTasks.length ,
                 
                  itemBuilder: (context, index) {
                  final data =state.allTasks[index];
                
                  return InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => UpdateScreen(),));
                    },
                    child: Container(height: 120,
                    width: double.infinity,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.blue),
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data.taskName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.white),),
                              InkWell(
                                onTap: () async {
                                  await state.delete(data.taskId!);
                                },
                                child: Icon(Icons.delete_outline_outlined,size: 30,color: Colors.red,))
                            ],
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data.taskDes,style: TextStyle(fontSize: 16,color:Colors.white,fontWeight: FontWeight.w600),),
                              Icon(Icons.edit,size: 30,color: Colors.black,)
                            ],
                          )
                        ],
                      ),
                    ),
                    ),
                  );
                }
                ),
              ),
        
                                                                                                                                
        
                 SizedBox(height: 100,),
        
               InkWell( 
                onTap: () async {
              //   final tasks=  await FirebaseFirestore.instance.collection("task").get();
              // datas=  tasks.docs.toList();
              //   for(var task in tasks.docs){
              //      log(task.data().toString());
                 
              //   }
              await state.gettask();
                },
                 child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.brown),
                 
                  child: Center(child: Text('GET',style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.w600),)),
                 ),
               )
            ],
          ),
        ),
      ),
    );
  }
}