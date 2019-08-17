import 'package:provider/provider.dart';
import 'package:treading/model/loading.dart';

class LoadingController {
  static setLoading(context) async {
    Provider.of<LoadModel>(context).startLoading();
  }

  static endLoading(context) async {
    Provider.of<LoadModel>(context).endLoading();
  }
}
