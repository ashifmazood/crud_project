import 'package:shared_preferences/shared_preferences.dart';

class SmoothModel {
  String image;
  String title;
  String description;

  SmoothModel({
    required this.image,
    required this.title,
    required this.description
  });
  
}

class  SmoothScreenLOcalData{
 static List<SmoothModel> smooth_model=[
  SmoothModel(image: "assets/amico.png", 
  title: "Explore A World Of Flavors", 
  description: "Enjoy Tasty Food To Never Miss Our Dishes With Healthy Meals"),
  SmoothModel(image: "assets/cuate.png", 
  title: "Enjoy Tasty & Healthy Food", 
  description:"We can offer many distinctive\n international flavor with a modern touch \nfrom hand of the most skilled chiefs"),
  SmoothModel(image: "assetsforgotpic5.png", 
  title: "Happy Dishes With Great \nExpress Delivery",
   description: "Fast And Easy Food Delivery From The \nBest Roads Near You"),
  //  SmoothModel(image: "assets/front3.png", 
  //  title: "",
  //   description: "")
];


 static Future<void> readOnBoardingScreen() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setBool('isReadOnboardingScreen', true);
  }

  static Future<bool> getOnBoardingScreen() async {
    final sharedPrefs = await SharedPreferences.getInstance();
    return sharedPrefs.getBool('isReadOnboardingScreen') ?? false;
  } 
}