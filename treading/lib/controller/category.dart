import 'dart:convert';

import 'package:treading/config/const.dart';
import 'package:treading/model/book.dart';
import 'package:treading/model/data_request.dart';
import 'package:treading/model/data_result.dart';
import 'package:treading/util/net/request.dart';
import 'package:provider/provider.dart';
import 'package:treading/model/category.dart';

class CategoryController {
  static getData(context) async {
    final List<Category> list = [
      Category(dir: 'xhxz', name: '玄幻修真', order: 10),
      Category(dir: 'wykh', name: '网游科幻', order: 9),
      Category(dir: 'dsyq', name: '都市言情', order: 8),
      Category(dir: 'qtxs', name: '其他小说', order: 7),
    ];
    // CategoryList().setList(list);
    Provider.of<CategoryList>(context).setList(list);
  }

  static setActiveCate(context, Category cate) {
    CategoryList prod = Provider.of<CategoryList>(context);
    prod.setActiveCate(cate);
  }

  static getCateList(context) async {
    // print('getCateList');
    CategoryList prod = Provider.of<CategoryList>(context);
    BookList prodbook = Provider.of<BookList>(context);
    String type = prod.active.dir;
    int page = prod.page;
    String url = Address.getCateList(type, page);
    DataRequest res = await httpManager.netFetch(url, null, null, null);
    if (res.data == null) {
      return DataResult(null, false);
    }
    // Provider.of<CategoryList>(context).setPage(page);
    Provider.of<CategoryList>(context).setTotal(res.data['total']);
    List<Book> booklist = [];
    var list = res.data['articlelist'] as List<dynamic>;
    // print(res.data);
    // print(res.data['total']);
    // print(list);
    list.forEach((f) {
      booklist.add(Book(
          f["title"],
          f["cate"],
          f["catename"],
          f["author"],
          f["description"],
          f["info"],
          f["lastchapter"],
          f["lastcid"],
          f["thumb"],
          f["updatetime"],
          f["status"]));
    });
    prodbook.setList(booklist);
    // print(booklist);
  }

  static nextPage(context) async {
    CategoryList prodcate = Provider.of<CategoryList>(context);
    BookList prodbook = Provider.of<BookList>(context);
    prodcate.nextPage();
    String type = prodcate.active.dir;
    int page = prodcate.page;
    String url = Address.getCateList(type, page);
    DataRequest res = await httpManager.netFetch(url, null, null, null);
    if (res.data == null) {
      return DataResult(null, false);
    }
    // Provider.of<CategoryList>(context).setPage(page);
    Provider.of<CategoryList>(context).setTotal(res.data['total']);
    List<Book> booklist = [];
    var list = res.data['articlelist'] as List<dynamic>;
    // print(res.data);
    // print(res.data['total']);
    // print(list);
    list.forEach((f) {
      booklist.add(Book(
          f["title"],
          f["cate"],
          f["catename"],
          f["author"],
          f["description"],
          f["info"],
          f["lastchapter"],
          f["lastcid"],
          f["thumb"],
          f["updatetime"],
          f["status"]));
    });
    prodbook.appendList(booklist);
  }
}
