import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Pages/FilePickerScreen.dart';
import 'Pages/LogInScreen.dart';
import 'Pages/RangeSelector.dart';
import 'constants.dart';

Future<void> main() async {
  runApp(const MyApp());

  WidgetsFlutterBinding.ensureInitialized();

  Constants.prefs = await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent, systemNavigationBarColor: Colors.teal.shade800));

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cloudy',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home:
      // RangeSelectorScreen(),
      Constants.prefs?.getBool('loggedIn') == true ? BrowseScreen(): LogInScreen(),
    );
  }
}