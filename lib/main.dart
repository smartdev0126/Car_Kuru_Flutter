import 'package:car_kuru/utils/shared_preference.dart';
import 'package:car_kuru/views/homepage.dart';
import 'package:car_kuru/views/splash.dart';
import 'package:car_kuru/views/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import 'models/user.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    EasyLocalization(
        supportedLocales: [Locale('en', 'US'), Locale('de', 'DE')],
        path: 'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en', 'US'),
        child: MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car Kuru',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Car Kuru Mobile App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Users user;
  int loginStatus = 0;


  @override
  void initState() {

    getUser().then((data){
      setState(() {
        user = data;
        if(data!=null){
          int id = user.id;
          print("id is ${id}");
          loginStatus = 1;
        }
        if(loginStatus ==0){
          new Future.delayed(const Duration(seconds: 3), () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen()));
          });
        }else{
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
        }

      });
    });


    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SplashScreen(),
    );
  }
}
