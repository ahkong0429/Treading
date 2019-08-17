/*
 * 网络结果数据
 * Created by guoshuyu
 * Date: 2018-07-16
 */
class DataRequest {
  var data;
  bool result;
  int code;
  var headers;

  DataRequest(this.data, this.result, this.code, {this.headers});
}
