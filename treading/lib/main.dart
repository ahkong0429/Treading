import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treading/config/const.dart';
import 'package:treading/model/book.dart';
import 'package:treading/util/router.dart' as router;

// import 'model/book.dart';
import 'model/category.dart';
import 'model/loading.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<CategoryList>(builder: (_) => CategoryList()),
      ChangeNotifierProvider<LoadModel>(builder: (_) => LoadModel()),
      ChangeNotifierProvider<BookList>(builder: (_) => BookList()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Config.APP_TITLE,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      onGenerateRoute: router.generateRoute, //路由组件
      initialRoute: '/', //默认路由页面
    );
  }
}
