
import 'package:bambinifashion/modules/core/presentation/forms/form_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';


class Profile extends Base{
  final fieldText = TextEditingController();

  //Constructor
  Profile(WidgetTester tester) : super(tester: tester);

  Future<void> goToTabFromProfile(String tabName) async {
    // find.widgetWithText(IconButtonTheme, 'PERSONAL INFORMATION')
    // find.widgetWithText(SafeArea, 'PERSONAL INFORMATION')
    // find.widgetWithText(Ink, 'PERSONAL INFORMATION')
    // find.widgetWithText(GestureDetector, 'PERSONAL INFORMATION')
    // find.widgetWithText(MouseRegion, 'PERSONAL INFORMATION')
    await tester.runAsync(() async {
      await Future.delayed(const Duration(milliseconds: 1000));
    });
    await tester.tap(find.widgetWithText(IconButtonTheme, tabName), warnIfMissed: false);
  }

  Future<void> updateData(String name, String lastName, String email, String password) async {
    await tester.pump(const Duration(seconds: 2));
    await tester.tap(find.byType(TextButton));
    await tester.tap(find.byType(TextFormField).first);
    fieldText.clear();
    await tester.enterText(find.byType(TextFormField).first, name);
    await tester.tap(find.widgetWithText(TextFormField, 'Last Name *'));
    fieldText.clear();
    await tester.enterText(find.widgetWithText(TextFormField, 'Last Name *'), lastName);
    await tester.tap(find.widgetWithText(TextFormField, 'Your E-mail *'));
    fieldText.clear();
    await tester.enterText(find.widgetWithText(TextFormField, 'Your E-mail *'), email);
    await tester.enterText(find.widgetWithText(TextFormField, 'New password'), password);
    await tester.enterText(find.byType(TextFormField).last, password);
    await tester.tap(find.byType(FormButton));
  }

  Future<void> logOut() async {
    // find.widgetWithText(Align, 'Logout')
    // find.widgetWithText(GestureDetector, 'Logout')
    // find.widgetWithText(MouseRegion, 'Logout')
    // find.widgetWithText(InkWell, 'Logout')
    // find.widgetWithText(CustomPaint, 'Logout')
    await tester.tap(find.widgetWithText(GestureDetector, "LOG OUT"));
  }
}