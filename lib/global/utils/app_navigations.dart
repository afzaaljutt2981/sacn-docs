import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class AppNavigation {
  static void popPage(context) {
    Navigator.of(context).pop();
  }

  static void pushAndRemoveUntilPage(context, transition, Widget page) {
    Navigator.pushAndRemoveUntil(context,
        PageTransition(type: transition, child: page), (route) => false);
  }

  static Future pushPage(context, transition, Widget page) async {
    return await Navigator.push(
        context, PageTransition(type: transition, child: page));
  }
}
