import 'package:webview_flutter/webview_flutter.dart';
import 'package:connectivity/connectivity.dart';

class Servis {
  WebViewController webViewController;
  bool connectControl = false;

  Future<bool> internetControl() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return connectControl = true;
    } else {
      return connectControl = false;
    }
  }
}
