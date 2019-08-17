import 'package:flutter/material.dart';
import 'package:treading/view/page/article.dart';
import 'package:treading/view/page/book.dart';
import 'package:treading/view/page/category.dart';
import 'package:treading/view/page/home.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case '/':
      return MaterialPageRoute(builder: (context) => Home());
    case 'category':
      // var arguments = settings.arguments;
      return MaterialPageRoute(builder: (context) => CategoryView());
    case 'book':
      // var arguments = settings.arguments;
      return MaterialPageRoute(builder: (context) => Book());
    case 'article':
      // var arguments = settings.arguments;
      return MaterialPageRoute(builder: (context) => Article());
    default:
      return MaterialPageRoute(builder: (context) => Home());
  }
}
