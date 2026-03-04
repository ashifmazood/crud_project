import 'package:flutter/material.dart';

class UpdateScreen extends StatefulWidget {
  const UpdateScreen({super.key});

  @override
  State<UpdateScreen> createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Update',style: TextStyle(
              fontSize: 30,fontWeight: FontWeight.w600,color: Colors.black,
            ),),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'task',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(
                  color: Colors.black87,width: 2
                )),
                focusColor: Colors.blueGrey.shade200,
                
                
              ),
            ), 
            TextFormField(
              decoration: InputDecoration(
                hintText: 'des',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(
                  color: Colors.black87,width: 2
                )),
                focusColor: Colors.blueGrey.shade200,
                
                
              ),
            ),
        
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Number',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15),borderSide: BorderSide(
                  color: Colors.black87,width: 2
                )),
                focusColor: Colors.blueGrey.shade200,
                
                
              ),
            ),
        
            InkWell(
              onTap: () {
                
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.brown),
                child: Center(child: Text('update',style: TextStyle(color:Colors.white,fontSize: 20,fontWeight: FontWeight.w600),)),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*0.2,)
        
          ],
        ),
      ),
    );
  }
}