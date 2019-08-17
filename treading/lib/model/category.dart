import 'package:flutter/cupertino.dart';

class Category {
  String dir; // 分类编码
  String name; // 分类名称
  int order; // 排序

  Category({this.dir, this.name, this.order});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(dir: json["dir"], name: json["name"], order: json["order"]);
  }
}

class CategoryList with ChangeNotifier {
  List<Category> _list = [
    Category(dir: 'xhxz', name: '玄幻修真', order: 10),
    Category(dir: 'wykh', name: '网游科幻', order: 9),
    Category(dir: 'dsyq', name: '都市言情', order: 8),
    Category(dir: 'qtxs', name: '其他小说', order: 7),
  ];
  Category _active = Category(dir: 'xhxz', name: '玄幻修真', order: 10);
  int _page = 1;
  int _total = 1;

  List<Category> get list => _list;
  Category get active => _active;
  int get page => _page;
  int get total => _total;

  void setList(List<Category> data) {
    _list = data;
    // print('通知发生');
    // print(_list);
    notifyListeners();
  }

  void setActiveCate(Category cate) {
    _active = cate;
    notifyListeners();
  }

  void setPage(int page) {
    _page = page;
    notifyListeners();
  }

  void nextPage() {
    _page = _page + 1;
    if (_page > _total) {
      _page = total;
    }
    notifyListeners();
  }

  void prevPage() {
    _page = _page - 1;
    if (_page < 0) {
      _page = 1;
    }
    notifyListeners();
  }

  void setTotal(int total) {
    _total = total;
    notifyListeners();
  }

  // CategoryList(this._list);

  // factory CategoryList.fromJson(List<dynamic> listJson) {
  //   List<Category> list =
  //       listJson.map((value) => Category.fromJson(value)).toList();
  //   return CategoryList(list);
  // }
}
