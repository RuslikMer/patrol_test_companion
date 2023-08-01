import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';
import 'package:patrol/patrol.dart';

class NavBar extends Base {
  //Constructor
  NavBar(WidgetTester tester) : super(tester: tester);

  Future<void> goToNavTab(PatrolTester $, String tabName) async {
    await $(find.widgetWithText(Align, tabName)).tap(visibleTimeout: Duration(seconds: 10));
  }
}
