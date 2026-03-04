// import 'dart:convert';
// import 'dart:developer';

// import 'package:crud_project/API/api_adding_scr.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class ApiScreen extends StatefulWidget {
//   const ApiScreen({super.key});

//   @override
//   State<ApiScreen> createState() => _ApiScreenState();
// }

// class _ApiScreenState extends State<ApiScreen> {

// List  products =[];

// Future <void> getproducts() async {
//   final response = await http.get(
//     Uri.parse("https://dummyjson.com/products")
//   );
//   if(response.statusCode == 200){
//     final data = jsonDecode(response.body);
//     setState(() {
//       products =data["Products"];
//     });
//   }else{
//     print("Failed to loading products");
//   }
//  }
//  Future<void>addproduct() async {
//   final response = await http.post(
//     Uri.parse("https://dummyjson.com/products/add"),
//     headers: {'content-Type':'application/json'},
//     body: jsonEncode({'title ':'new Products','price':199})
//   );

//   if(response.statusCode == 200 || response.statusCode == 201){
//     final data = jsonDecode(response.body);
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text('Product added : ${data['title']}'))
//     );
//   }else{
//     log("Failed to add product");
//   }
//  }

//  Future<void> deleteProduct(int id) async {
//   final response = await http.delete(
//     Uri.parse("https://dummyjson.com/products/$id"),
//   );
//   if(response.statusCode == 200){
//    ScaffoldMessenger.of(context
//    ).showSnackBar(SnackBar(content: Text("Product delete (ID:$id)")));
//   }else{
//     print("Flaied to delete product");
//   }
//  }

//  @override
//   void initState() {
//     super.initState();
//     getproducts();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(20),
//       child: Scaffold(

// floatingActionButton: FloatingActionButton.extended(
//   onPressed: addproduct,
//   label: const Text("Add product"),
//   icon: const Icon(Icons.add),
//   ),

//         // floatingActionButton: 
//         // InkWell(
//         //   onTap: () {
//         //     Navigator.push(context, MaterialPageRoute(builder: (context) => ApiAddingScr(),));
//         //   },
//         //   child: Container(
//         //     height: 50,
//         //     width: 50,
//         //     decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
//         //     border: Border.all(color: Colors.black,width: 3)
//         //     ),
//         //     child: Icon(Icons.add,color: Colors.black,size: 40,weight: 30,),
//         //   ),
//         // ),
//         appBar: AppBar(title: 
        
//         Center(child: Text("API SCREEN")),),
      
//         body: products.isEmpty
//         ? const Center(child: CircularProgressIndicator(),)
//         : ListView.separated(
//           itemCount: products.length,
          
//           itemBuilder:(context, index) {
//             final item = products[index];
//              return ListTile(
//               title: Text(item["title"]),
//               subtitle: Text('${item['price']}'),
//               trailing: IconButton( icon: Icon(Icons.delete,color: Colors.red,),
//               onPressed: () => deleteProduct(item['id']),
//               ),
//              );
//             // Container(
//             //   height: 100,
//             //   width: double.infinity,
//             //   decoration: BoxDecoration(border: Border.all(color: Colors.grey),
//             //   borderRadius: BorderRadius.circular(10),
//             //   color: Colors.black
//             //   ),
//             // );
//           },
//           separatorBuilder: (context, index) {
//             return SizedBox(height: 20,);
//           },
//            ),
//       ),
//     );
//   }
// }


import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiDemoScreen extends StatefulWidget {
  const ApiDemoScreen({super.key});

  @override
  State<ApiDemoScreen> createState() => _ApiDemoScreenState();
}

class _ApiDemoScreenState extends State<ApiDemoScreen> {
  List products = [];

  //  GET Request
  Future<void> getProducts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        products = data['products'];
      });
    } else {
      print('Failed to load products');
    }
  }

  //  POST Request
  Future<void> addProduct() async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/products/add'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'title': 'New Product', 'price': 199}),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added: ${data['title']}')),
      );
    } else {
      log('Failed to add product');
    }
  }

  // DELETE Request
  Future<void> deleteProduct(int id) async {
    final response = await http.delete(
      Uri.parse('https://dummyjson.com/products/$id'),
    );

    if (response.statusCode == 200) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Product deleted (ID: $id)')));
    } else {
      print('Failed to delete product');
    }
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('API Demo (GET, POST, DELETE)')),
      body: products.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final item = products[index];
                return ListTile(
                  title: Text(item['title']),
                  subtitle: Text('₹${item['price']}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => deleteProduct(item['id']),
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: addProduct,
        label: const Text('Add Product'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}