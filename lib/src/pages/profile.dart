import 'package:patrol/patrol.dart';
import 'package:bambinifashion/modules/core/presentation/forms/form_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';


class Profile extends Base{
  final fieldText = TextEditingController();

  //Constructor
  Profile(WidgetTester tester) : super(tester: tester);

  Future<void> goToTabFromProfile(PatrolTester $, String tabName) async {
    await $(find.widgetWithText(IconButtonTheme, tabName)).tap();
  }

  Future<void> updateData(PatrolTester $, String name, String lastName, String email, String password) async {
    await $(find.byType(TextButton)).tap();
    await $(find.byType(TextFormField).first).tap();
    fieldText.clear();
    await $(find.byType(TextFormField).first).enterText(name);
    await $(find.widgetWithText(TextFormField, 'Last Name *')).tap();
    fieldText.clear();
    await $(find.widgetWithText(TextFormField, 'Last Name *')).enterText(lastName);
    await $(find.widgetWithText(TextFormField, 'Your E-mail *')).tap();
    fieldText.clear();
    await $(find.widgetWithText(TextFormField, 'Your E-mail *')).enterText(email);
    await $(find.widgetWithText(TextFormField, 'New password')).enterText(password);
    await $(find.byType(TextFormField).last).enterText(password);
    await $(find.byType(FormButton)).tap();
  }

  Future<void> logOut(PatrolTester $) async {
    await $(find.widgetWithText(GestureDetector, 'LOG OUT')).tap();
  }
}