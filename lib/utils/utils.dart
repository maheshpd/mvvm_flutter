import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.green,
        toastLength: Toast.LENGTH_LONG);
  }

  static void flushBarErrorMessage(String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        forwardAnimationCurve: Curves.bounceIn,
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),
        message: message,
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.red,
        reverseAnimationCurve: Curves.easeInOut,
        borderRadius: BorderRadius.circular(20),
        positionOffset: 20,
        icon: const Icon(
          Icons.error,
          size: 20,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static snackBar(String message, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.red,
        content: Text(message))
    );
  }
}
