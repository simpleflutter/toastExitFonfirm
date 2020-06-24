import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomePage extends StatelessWidget {
  DateTime oldTime;

  Future<bool> exitConfirm() {
    DateTime newTime = DateTime.now();

    if (oldTime == null || newTime.difference(oldTime) > Duration(seconds: 2)) {
      oldTime = newTime;
      Fluttertoast.showToast(msg: 'Press again to exit');
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exitConfirm,
      child: Scaffold(
        appBar: AppBar(),
      ),
    );
  }
}
