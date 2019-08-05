import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/home.dart';
import './screens/details.dart';

final routes = <String, WidgetBuilder>{
  LoginPage.tag: (context) => LoginPage(),
  HomePage.tag: (context) => HomePage(),
  DetailsPage.tag: (context) => DetailsPage(),
};