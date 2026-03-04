import 'package:crud_project/API/api_screen.dart';
import 'package:crud_project/firebase_options.dart';
import 'package:crud_project/provider/crud_provider.dart';
import 'package:crud_project/smooth_model.dart/smooth22.dart';
import 'package:crud_project/splash_screen.dart';
import 'package:crud_project/storage/image_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CrudProvider(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        debugShowCheckedModeBanner: false,
        home:ApiDemoScreen()
      ),
    );
  }
}

