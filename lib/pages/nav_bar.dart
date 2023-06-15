import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';

class NavBar extends Base {
  //Constructor
  NavBar(WidgetTester tester) : super(tester: tester);

  Future<void> goToNavTab(String tabName) async {

    final navButton = find.widgetWithText(Transform, tabName);

    await tester.tap(
      navButton,
      warnIfMissed: false,
    );
    await tester.pump(const Duration(seconds: 7));
  }
}
