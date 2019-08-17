/// //////////////////////////////////////常量////////////////////////////////////// ///
class Config {
  static const APP_TITLE = "水世界小说";
  static const PAGE_SIZE = 30;
  static const DEBUG = true;
  static const TOKEN_KEY = "token";
  static const USER_NAME_KEY = "user-name";
  static const PW_KEY = "user-pw";
  static const USER_BASIC_CODE = "user-basic-code";
  static const USER_INFO = "user-info";
  static const LANGUAGE_SELECT = "language-select";
  static const LANGUAGE_SELECT_NAME = "language-select-name";
  static const REFRESH_LANGUAGE = "refreshLanguageApp";
  static const THEME_COLOR = "theme-color";
  static const LOCALE = "locale";
  static const HOST = "http://bookpw.com";
}

/// 请求地址数据
class Address {
  static const String host = "http://bookpw.com";

  /// 获取分类
  static String getCategory() {
    return "$host/home/api/category";
  }

  /// 获取文章列表
  static String getCateList(String type, int page) {
    return "$host/home/api/list/cate/$type/page/$page";
  }

  /// 获取章节列表
  static String getChapList(int bookid) {
    return "$host/home/api/chaper/id/$bookid";
  }

  /// 获取章节内容
  static String getAriticle(int bookid, int cid) {
    return "$host/home/api/article/id/$bookid/cid/$cid";
  }

  /// 更新书本缓存，抓取最新数据
  static String updateCache(int bookid) {
    return "$host/home/api/update/id/$bookid";
  }

  // 版本号
  static getVersion() {
    return "$host/home/api/version";
  }
}
