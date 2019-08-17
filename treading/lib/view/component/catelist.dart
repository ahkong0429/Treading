import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:treading/config/const.dart';
import 'package:treading/controller/loading.dart';
import 'package:treading/model/book.dart';
import 'package:treading/controller/category.dart';
import 'package:treading/model/category.dart';

class CateList extends StatelessWidget {
  buildItems(context, BookList books) {
    List<Widget> list = [];
    books.list.forEach((f) {
      list.add(GestureDetector(
        child: Column(
          children: <Widget>[
            FadeInImage.memoryNetwork(
              placeholder: kTransparentImage,
              image: Config.HOST + f.thumb,
              height: 210,
            ),
            Text(
              f.title,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ));
    });
    list.add(GestureDetector(
      child: ButtonBar(
        alignment: MainAxisAlignment.center,
        children: <Widget>[Text("加载更多")],
      ),
      onTap: () async {
        LoadingController.setLoading(context);
        await CategoryController.nextPage(context);
        LoadingController.endLoading(context);
      },
    ));
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<BookList>(builder: (context, books, _) {
      return Container(
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, //横轴2个子widget
            childAspectRatio: 0.73, //宽高比为1时，子widget
            crossAxisSpacing: 1.0, //间隔
          ),
          children: buildItems(context, books),
        ),
      );
    });
  }
}
