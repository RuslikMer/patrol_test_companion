import 'dart:developer';

import 'package:bambinifashion/modules/checkout/presentation/checkout_address_form.dart';
import 'package:bambinifashion/modules/core/presentation/forms/bambini_checkbox_tick.dart';
import 'package:bambinifashion/modules/core/presentation/forms/required_form_label.dart';
import 'package:bambinifashion/modules/checkout/pages/checkout_payment_page.dart';
import 'package:bambinifashion/modules/core/presentation/forms/form_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tests_companion/helper.dart';
import '../helper/globEnv.dart';
import 'base.dart';
import 'cart.dart';
import 'package:flutter/services.dart';
import 'package:patrol/patrol.dart';

class Checkout extends Base {
  static const String pay = "PAY SECURELY";
  static const String done = "Done";

  //Constructor
  Checkout(WidgetTester tester) : super(tester: tester);

  Future<void> fillContacts(
      PatrolTester $, String country, String address, String city, String postcode) async {
    // await Future.delayed(Duration(seconds: 5));
    await tester.pump(const Duration(seconds: 10));
    await $(find.widgetWithText(TextFormField, 'First Name *').first).enterText(GlobEnv.buyerName, visibleTimeout: Duration(seconds: 5), settleTimeout: Duration(seconds: 5));
    await $(find.widgetWithText(TextFormField, 'Last Name *').first).enterText(GlobEnv.buyerLastName);
    await $(find.widgetWithText(TextFormField, 'Address Line 1 *')).enterText(address);
    final countryDropdown = find.widgetWithText(RequiredFormLabel, 'Country *').first;
    final point = await $.tester.getCenter(countryDropdown);
    print(point.dx);
    print(point.dy);
    await $.tester.tapAt(Offset(point.dx, point.dy + 20));
    await $.tester.scrollUntilVisible(
        find.widgetWithText(ListTile, country), -100.0, scrollable: find.byType(Scrollable).last);
    await $(find.widgetWithText(IconButtonTheme, country)).tap();
    await $(find.widgetWithText(TextFormField, 'City *')).enterText(city);
    await $(find.widgetWithText(TextFormField, 'Postal code *')).enterText(postcode);
    await $.tester.scrollUntilVisible(find.byType(FormButton), -100.0, scrollable: find.byType(Scrollable).first);
    await $(find.widgetWithText(TextFormField, 'Telephone *')).enterText(GlobEnv.buyerPhone);
    await $.tester.scrollUntilVisible(find.byType(FormButton), -100.0, scrollable: find.byType(Scrollable).first);
    await $(find.byType(FormButton)).tap();
  }

  Future<int> chooseShippingMethod(PatrolTester $, String deliveryType) async {
    if (deliveryType == 'standard') {
      await $(find.byType(BambiniCheckboxTick).first).tap();
    } else {
      await $(find.byType(BambiniCheckboxTick).last).tap();
    }

    await $(find.byType(FormButton)).tap();
    // int totalPrice = await cart.totalAmount();
    int totalPrice = 0;

    return totalPrice;
  }

  Future<void> fillCardData(PatrolTester $, String cardNumber) async {
    await $.tester.pump(const Duration(seconds: 5));

    // final stripe = find.byType(StripeForm);
    // final point = await $.tester.getCenter(stripe);
    // print(point.dx);
    // print(point.dy);
    // await $.tester.tapAt(Offset(point.dx, point.dy));
    // await $(find.byType(StripeForm)).tap();
    //await $.native.tap(Selector(text: '1234123412341234'));
    // await $.native.enterText(
    //   Selector(text: '1234123412341234 MM/YY'),
    //   text: '${cardNumber}1228123',
    // );
    // await $.native.enterTextByIndex(
    //   cardNumber,
    //   index: 1
    // );
    // await $.native.enterTextByIndex(
    //   cardNumber,
    //   index: 1,
    //   keyboardBehavior: KeyboardBehavior.showAndDismiss,
    // );
    await $.native.enterTextByIndex(
      cardNumber,
      index: 1,
      keyboardBehavior: KeyboardBehavior.alternative,
    );
    await $.tester.scrollUntilVisible(find.byType(FormButton), -100.0, scrollable: find.byType(Scrollable).first);

    // await Future.delayed(Duration(seconds: 15));

    // await $.tester.pump(const Duration(seconds: 15));
    //
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit4);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit2);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit4);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit2);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit4);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit2);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit4);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit2);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit4);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit2);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit4);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit2);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit1);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit2);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit2);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit8);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit1);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit2);
    // await $.tester.sendKeyEvent(LogicalKeyboardKey.digit3);
    // await tester.pump(const Duration(seconds: 10));
  }

  Future<void> payByPayPal(PatrolTester $) async {
    await $(find.byType(BambiniCheckboxTick).last).tap();

    // await tester.tap(find.byType(BambiniCheckboxTick).last);
    // await tester.pump(const Duration(seconds: 5));
    await confirmOrder($);
    // await tester.enterText(
    //     find.widgetWithText(IconButtonTheme, "Email address or mobile number"),
    //     GlobEnv.paypalLogin);
    // await tester.tap(find.widgetWithText(IconButtonTheme, "Next"));
    // await tester.pump();
    // await tester.enterText(find.widgetWithText(IconButtonTheme, "Password"),
    //     GlobEnv.paypalPassword);
    // await tester.tap(find.widgetWithText(IconButtonTheme, "Log In"));
    // await tester.pump();
    // await tester.tap(find.widgetWithText(IconButtonTheme, "Complete Purchase"));
    // await tester.pump(const Duration(seconds: 5));
  }

  Future<void> payByApplePay(PatrolTester $) async {
    await $(find.widgetWithText(IconButtonTheme, 'Buy with Apple Pay')).tap();
    await addBillingAddressForApplePay($);
    await addShippingContactForApplePay($);
    await addShippingAddressForApplePay($);
    await $(find.widgetWithText(IconButtonTheme, 'Pay with Passcode')).tap();
  }

  Future<void> addBillingAddressForApplePay(PatrolTester $) async {
    await $(find.widgetWithText(IconButtonTheme, 'Add Billing Address')).tap();
    await $(find.widgetWithText(IconButtonTheme, 'Add Billing Address')).tap();
    await $(find.widgetWithText(IconButtonTheme, 'First Name')).enterText(GlobEnv.buyerName);
    await $(find.widgetWithText(IconButtonTheme, 'Last Name')).enterText(GlobEnv.buyerLastName);
    await $(find.widgetWithText(IconButtonTheme, 'Street, Search Contact or Address')).enterText(GlobEnv.buyerAddress);
    await $(find.widgetWithText(IconButtonTheme, 'State')).enterText('state');
    await $(find.widgetWithText(IconButtonTheme, 'City')).enterText(GlobEnv.buyerCity);
    await $(find.widgetWithText(IconButtonTheme, 'ZIP')).enterText(GlobEnv.buyerPostcode);
    await $(find.widgetWithText(IconButtonTheme, done)).tap();
    await $(find.widgetWithText(IconButtonTheme, 'close')).tap();
  }

  Future<void> addShippingContactForApplePay(PatrolTester $) async {
    await $(find.widgetWithText(IconButtonTheme, 'Add Contact')).tap();
    await $(find.widgetWithText(IconButtonTheme, 'Add Phone Number')).tap();
    await $(find.widgetWithText(IconButtonTheme, 'Phone Number')).enterText(GlobEnv.buyerPhone);
    await $(find.widgetWithText(IconButtonTheme, 'Add Email Address')).tap();
    await $(find.widgetWithText(IconButtonTheme, 'Email')).enterText(GlobEnv.buyerEmail);
    await $(find.widgetWithText(IconButtonTheme, done)).tap();
  }

  Future<void> addShippingAddressForApplePay(PatrolTester $) async {
    await $(find.widgetWithText(IconButtonTheme, 'Add Shipping')).tap();
    await $(find.widgetWithText(IconButtonTheme, 'Add Shipping Address')).tap();
    await $(find.widgetWithText(IconButtonTheme, 'Add Address Manually')).tap();
    await $(find.widgetWithText(IconButtonTheme, 'First Name')).enterText(GlobEnv.buyerName);
    await $(find.widgetWithText(IconButtonTheme, 'Last Name')).enterText(GlobEnv.buyerLastName);
    await $(find.widgetWithText(IconButtonTheme, 'Street, Search Contact or Address')).enterText(GlobEnv.buyerAddress);
    await $(find.widgetWithText(IconButtonTheme, 'State')).enterText('state');
    await $(find.widgetWithText(IconButtonTheme, 'City')).enterText(GlobEnv.buyerCity);
    await $(find.widgetWithText(IconButtonTheme, 'ZIP')).enterText(GlobEnv.buyerPostcode);
    await $(find.widgetWithText(IconButtonTheme, done)).tap();
    await $(find.widgetWithText(IconButtonTheme, done)).tap();
  }

  Future<void> confirmOrder(PatrolTester $) async {
    await $.tester.scrollUntilVisible(find.byType(FormButton), -100.0, scrollable: find.byType(Scrollable).first);
    await $(find.byType(FormButton)).tap();
  }

  Future<void> complete3DSecure(PatrolTester $, bool authorize) async {
    await confirmOrder($);
    if (authorize) {
      await $(find.widgetWithText(IconButtonTheme, 'COMPLETE AUTHENTICATION')).tap();
    } else {
      await $(find.widgetWithText(IconButtonTheme, 'FAIL AUTHENTICATION')).tap();
    }

    await $(find.widgetWithText(IconButtonTheme, 'Close')).tap();
  }

  Future<void> waitAlert(PatrolTester $, String message, bool close) async {
    await $(message).waitUntilVisible();
    if (close) {
      await $(find.widgetWithText(IconButtonTheme, 'closeIconTemplate')).tap();
    }
  }

  Future<Future<String>> viewOrder(PatrolTester $, int expected) async {
    await $(find.byType(ElevatedButton)).tap();
    return orderData($, expected);
  }

  Future<String> orderData(PatrolTester $, int expected) async {

    // await $(expected).waitUntilVisible();
    // expect(totalPrice, expected);
    const String orderId = '';

    return orderId;
  }
}
