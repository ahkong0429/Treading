import 'package:flutter/material.dart';

class Modal {
  alert(BuildContext context, String content) {
    showDialog(
        context: context,
        builder: (ctx) {
          return SimpleDialog(
            title: Text("信息"),
            titlePadding: EdgeInsets.all(10),
            backgroundColor: Colors.white,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(6))),
            children: <Widget>[
              ListTile(
                title: Center(
                  child: Text(content),
                ),
              ),
            ],
          );
        });
  }
}
