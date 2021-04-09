import 'package:flutter/material.dart';
import 'package:new_test/pages/entryPage.dart';
import 'package:new_test/pages/homePage.dart';
import 'package:new_test/pages/loginPage.dart';
import 'package:new_test/pages/splashPage.dart';
import 'package:new_test/providers/homePageTabChange.dart';
import 'package:new_test/utils/assets/styles.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HomePageTabChange(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: new AppColors().backgroundColor,
          accentColor: new AppColors().borderColor,
          fontFamily: 'Kalam',
        ),
        routes: {
          '/': (context) => SplashScreen(),
          '/homePage': (context) => HomePage(),
          '/entryPage': (context) => EntryPage(),
          '/loginPage': (context) => LoginPage(),
        },
      ),
    );
  }
}
