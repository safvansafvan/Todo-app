import 'package:fluttertoast/fluttertoast.dart';

showToastMsg(String msg) {
  Fluttertoast.showToast(msg: msg, timeInSecForIosWeb: 2, fontSize: 15);
}
