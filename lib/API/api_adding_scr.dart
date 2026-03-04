import 'package:flutter/material.dart';

class ApiAddingScr extends StatefulWidget {
  const ApiAddingScr({super.key});

  @override
  State<ApiAddingScr> createState() => _ApiAddingScrState();
}

class _ApiAddingScrState extends State<ApiAddingScr> {
  TextEditingController _data1controller = TextEditingController();
  TextEditingController _data2controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
             TextFormField(
                      decoration: InputDecoration(
                        hintText: "Data1",
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 3),
                        borderRadius: BorderRadius.circular(10)
                        )
                      ),
                      controller: _data1controller
                                   ),
                              SizedBox(height: 50,),
                     TextFormField(
                      decoration: InputDecoration(
                        hintText: "Data2",
                        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey,width: 3),
                        borderRadius: BorderRadius.circular(10)
                        )
                      ),
               controller: _data2controller,
            ),
            SizedBox(height: 50,),

            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 40,
                width: 100,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                color: Colors.amberAccent),
                child: Center(
                  child: Text("Add data",style: TextStyle(
                    color: Colors.black,fontSize: 18,fontWeight: FontWeight.w600
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}