import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:treading/config/const.dart';
import 'package:treading/controller/category.dart';
import 'package:treading/controller/loading.dart';
import 'package:treading/model/category.dart';
import 'package:treading/model/loading.dart';
import 'package:treading/util/modal/loading.dart';
import 'package:treading/view/component/catelist.dart';
import 'package:treading/view/component/leftmenu.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() async {
    super.initState();
    // LoadingController.setLoading(context);
    // LoadingController.endLoading(context);
    await CategoryController.getData(context);
    await CategoryController.getCateList(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Config.APP_TITLE),
      ),
      body: Consumer<LoadModel>(builder: (context, loads, _) {
        return Loading(
          loading: loads.isloading,
          msg: "加载中",
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 10, bottom: 10),
              child: CateList(),
            ),
          ),
        );
      }),
      drawer: Drawer(
        child: Consumer<CategoryList>(builder: (context, cates, _) {
          return LeftMenu().build(context, cates.list);
        }),
      ),
    );
  }
}
