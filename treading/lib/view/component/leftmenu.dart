import 'package:flutter/material.dart';
import 'package:treading/controller/category.dart';
import 'package:treading/model/category.dart';

class LeftMenu {
  Widget build(BuildContext context, List<Category> list) {
    List<Widget> d = [];
    // print(list.getList());
    list.forEach((Category f) {
      d.add(GestureDetector(
        child: ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.closed_caption),
          ),
          title: Text(f.name),
        ),
        onTap: () async {
          // CategoryController.getData(context);
          await CategoryController.setActiveCate(context, f);
          await CategoryController.getCateList(context);
        },
      ));
    });
    return ListView(
      children: d,
    );
  }
}
