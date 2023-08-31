import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';
import 'package:patrol/patrol.dart';

class Menu extends Base {
  final String menuTab = "Menu";
  final String newIn = "NEW IN";
  final String sale = "SALE";
  final String boy = "BOY";

  //Constructor
  Menu(WidgetTester tester) : super(tester: tester);

  Future<void> goToMenuCategory(PatrolTester $, String category) async {
    await navBar.goToNavTab($, menuTab);
    await $(find.widgetWithText(ListTile, category)).tap();
    //await categoryCheck(category);
  }

  Future<void> categoryCheck(PatrolTester $, String category) async {
    await $(find.widgetWithText(IconButtonTheme, category)).tap();
  }

  Future<void> changeCountry(PatrolTester $, String country) async {
    await navBar.goToNavTab($, menuTab);
    await $(find.widgetWithText(IconButtonTheme, 'COUNTRY')).tap();
    await $(find.widgetWithText(IconButtonTheme, country)).tap();
    await $(country).waitUntilVisible();
  }

  Future<void> changeCurrency(PatrolTester $, String currency) async {
    await navBar.goToNavTab($, menuTab);
    await $(find.widgetWithText(IconButtonTheme, 'CURRENCY')).tap();
    await $(find.widgetWithText(IconButtonTheme, currency)).tap();
    List symbol = currency.split(' ');
    await $(symbol[0]).waitUntilVisible();
  }

  Future<void> goToProfile(PatrolTester $) async {
    await navBar.goToNavTab($, menuTab);
    await $(find.widgetWithText(ListTile, 'MY ACCOUNT')).tap();
  }

  Future<void> logIn(PatrolTester $, String email, String password) async {
    await goToProfile($);
    await login.doLogin($, email, password);
  }
}
