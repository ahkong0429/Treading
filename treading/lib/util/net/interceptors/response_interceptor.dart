import 'package:dio/dio.dart';
import 'package:treading/model/code.dart';
import 'package:treading/model/data_request.dart';

/*
 * Token拦截器
 * Created by guoshuyu
 * on 2019/3/23.
 */
class ResponseInterceptors extends InterceptorsWrapper {
  @override
  onResponse(Response response) {
    RequestOptions option = response.request;
    try {
      if (option.contentType != null &&
          option.contentType.primaryType == "text") {
        return new DataRequest(response.data, true, Code.SUCCESS);
      }
      if (response.statusCode == 200 || response.statusCode == 201) {
        return new DataRequest(response.data, true, Code.SUCCESS,
            headers: response.headers);
      }
    } catch (e) {
      print(e.toString() + option.path);
      return new DataRequest(response.data, false, response.statusCode,
          headers: response.headers);
    }
  }
}
