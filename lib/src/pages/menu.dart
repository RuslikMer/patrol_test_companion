import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../src/pages/base.dart';

class Menu extends Base {
  final String menuTab = "Menu";
  final String newIn = "NEW IN";

  //Constructor
  Menu(WidgetTester tester) : super(tester: tester);

  Future<void> goToMenuCategory(String category) async {
    await navBar.goToNavTab(menuTab);
    await tester.tap(find.widgetWithText(ListTile, category));
    //await categoryCheck(category);
  }

  Future<void> categoryCheck(String category) async {
    await tester.tap(find.widgetWithText(IconButtonTheme, category));
  }

  Future<void> changeCountry(String country) async {
    await navBar.goToNavTab(menuTab);
    await tester.tap(find.widgetWithText(IconButtonTheme, "COUNTRY"));
    await tester.pump(const Duration(seconds: 5));
    await tester.tap(find.widgetWithText(IconButtonTheme, country));
    await tester.pump(const Duration(seconds: 5));
    // find.text('ALBANIA')
    // find.widgetWithText(Row, 'ALBANIA')
    // find.widgetWithText(IconButtonTheme, 'ALBANIA')
    // find.widgetWithText(Ink, 'ALBANIA')
    // find.widgetWithText(MouseRegion, 'ALBANIA')
    // find.widgetWithText(InkWell, 'ALBANIA')
    // expect(find.text(country), findsOneWidget);
  }

  Future<void> changeCurrency(String currency) async {
    await navBar.goToNavTab(menuTab);
    await tester.tap(find.widgetWithText(IconButtonTheme, "CURRENCY"));
    await tester.pump(const Duration(seconds: 5));
    await tester.tap(find.widgetWithText(IconButtonTheme, currency));
    List symbol = currency.split(" ");
    expect(find.text(symbol[0]), "");
  }

  Future<void> goToProfile() async {
    await navBar.goToNavTab(menuTab);
    await tester.tap(find.widgetWithText(ListTile, "MY ACCOUNT"));
  }

  Future<void> logIn(String email, String password) async {
    await goToProfile();
    //await tester.tap(find.widgetWithText(IconButtonTheme, "SIGN IN"));
    await tester.pump(const Duration(seconds: 5));
    await login.doLogin(email, password);
  }
}
