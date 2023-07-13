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

class Checkout extends Base {
  static const String pay = "PAY SECURELY";
  static const String done = "Done";

  //Constructor
  Checkout(WidgetTester tester) : super(tester: tester);

  Future<void> fillContacts(
      String country, String address, String city, String postcode) async {
    // await Future.delayed(Duration(seconds: 5));
    await tester.pump(const Duration(seconds: 10));
    await pumpUntilFound(
      tester,
      find.widgetWithText(GestureDetector, 'CONTINUE'),
      timeout: const Duration(seconds: 20),
    );
    // await tester.pumpAndSettle();
    await tester.enterText(find.widgetWithText(TextFormField, 'First Name *').first,
        GlobEnv.buyerName);
    await tester.pump();
    await tester.enterText(find.widgetWithText(TextFormField, 'Last Name *').first,
        GlobEnv.buyerLastName);
    await tester.pump();
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Address Line 1 *'), address);
    await tester.pump();
    final countryDropdown = find.widgetWithText(RequiredFormLabel, 'Country *').first;
    final point = await tester.getCenter(countryDropdown);
    print(point.dx);
    print(point.dy);
    await tester.tapAt(Offset(point.dx, point.dy + 20));
    // await tester.tap(find.widgetWithText(RequiredFormLabel, 'Country *').first);
    await tester.pump(const Duration(seconds: 2));
    await tester.scrollUntilVisible(
        find.widgetWithText(ListTile, country), -100.0, scrollable: find.byType(Scrollable).last);
    await tester.pump(const Duration(seconds: 2));
    await tester.tap(find.widgetWithText(IconButtonTheme, country));
    await tester.pump(const Duration(seconds: 2));
    await tester.enterText(
        find.widgetWithText(TextFormField, 'City *'), city);
    await tester.pump();
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Postal code *'), postcode);
    await tester.pump();
    await tester.enterText(find.widgetWithText(TextFormField, 'Telephone *'),
        GlobEnv.buyerPhone);
    await tester.pump();
    await tester.scrollUntilVisible(find.byType(FormButton), -100.0, scrollable: find.byType(Scrollable).first);
    await tester.pump(const Duration(seconds: 2));
    // find.widgetWithText(GestureDetector, 'CONTINUE')
    await tester.tap(find.byType(FormButton));
    await tester.pump(const Duration(seconds: 5));
  }

  Future<int> chooseShippingMethod(String deliveryType) async {
    await tester.pump(const Duration(seconds: 10));
    await pumpUntilFound(
      tester,
      find.byType(FormButton),
      timeout: const Duration(seconds: 20),
    );

    if (deliveryType == 'standard') {
      await tester.tap(find.byType(BambiniCheckboxTick).first);
      await tester.pump(const Duration(seconds: 5));
    } else {
      await tester.tap(find.byType(BambiniCheckboxTick).last);
      await tester.pump(const Duration(seconds: 5));
    }

    await tester.tap(find.byType(FormButton));
    await tester.pump(const Duration(seconds: 5));
    // int totalPrice = await cart.totalAmount();
    int totalPrice = 0;

    return totalPrice;
  }

  Future<void> fillCardData(String cardNumber) async {
    await tester.pump(const Duration(seconds: 10));
    await pumpUntilFound(
      tester,
      find.byType(CardField),
      timeout: const Duration(seconds: 20),
    );
    // find.byType(CardField)
    // find.byType(StripeForm)
    await tester.enterText(find.byType(StripeForm), '${cardNumber}1228123');
    await tester.pump(const Duration(seconds: 5));
    // await tester.enterText(
    //     find.widgetWithText(IconButtonTheme, "expiration date"), "1228");
    // await tester.enterText(find.widgetWithText(IconButtonTheme, "CVC"), "123");
  }

  Future<void> payByPayPal() async {
    await tester.tap(find.byType(BambiniCheckboxTick).last);
    await tester.pump(const Duration(seconds: 5));
    await confirmOrder();
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

  Future<void> payByApplePay() async {
    await tester
        .tap(find.widgetWithText(IconButtonTheme, "Buy with Apple Pay"));
    await addBillingAddressForApplePay();
    await addShippingContactForApplePay();
    await addShippingAddressForApplePay();
    await tester.tap(find.widgetWithText(IconButtonTheme, "Pay with Passcode"));
    await tester.pump(const Duration(seconds: 5));
  }

  Future<void> addBillingAddressForApplePay() async {
    await tester
        .tap(find.widgetWithText(IconButtonTheme, "Add Billing Address"));
    await tester.pump();
    await tester
        .tap(find.widgetWithText(IconButtonTheme, "Add Billing Address"));
    await tester.pump();
    await tester.enterText(
        find.widgetWithText(IconButtonTheme, "First Name"), GlobEnv.buyerName);
    await tester.enterText(find.widgetWithText(IconButtonTheme, "Last Name"),
        GlobEnv.buyerLastName);
    await tester.enterText(
        find.widgetWithText(
            IconButtonTheme, "Street, Search Contact or Address"),
        GlobEnv.buyerAddress);
    await tester.enterText(
        find.widgetWithText(IconButtonTheme, "State"), "state");
    await tester.enterText(
        find.widgetWithText(IconButtonTheme, "City"), GlobEnv.buyerCity);
    await tester.enterText(
        find.widgetWithText(IconButtonTheme, "ZIP"), GlobEnv.buyerPostcode);
    await tester.tap(find.widgetWithText(IconButtonTheme, done));
    await tester.pump();
    await tester.tap(find.widgetWithText(IconButtonTheme, "close"));
    await tester.pump(const Duration(seconds: 5));
  }

  Future<void> addShippingContactForApplePay() async {
    await tester.tap(find.widgetWithText(IconButtonTheme, "Add Contact"));
    await tester.pump();
    await tester.tap(find.widgetWithText(IconButtonTheme, "Add Phone Number"));
    await tester.pump();
    await tester.enterText(find.widgetWithText(IconButtonTheme, "Phone Number"),
        GlobEnv.buyerPhone);
    await tester.tap(find.widgetWithText(IconButtonTheme, "Add Email Address"));
    await tester.pump();
    await tester.enterText(
        find.widgetWithText(IconButtonTheme, "Email"), GlobEnv.buyerEmail);
    await tester.tap(find.widgetWithText(IconButtonTheme, done));
    await tester.pump(const Duration(seconds: 5));
  }

  Future<void> addShippingAddressForApplePay() async {
    await tester.tap(find.widgetWithText(IconButtonTheme, "Add Shipping"));
    await tester.pump();
    await tester
        .tap(find.widgetWithText(IconButtonTheme, "Add Shipping Address"));
    await tester.pump();
    await tester
        .tap(find.widgetWithText(IconButtonTheme, "Add Address Manually"));
    await tester.pump();
    await tester.enterText(
        find.widgetWithText(IconButtonTheme, "First Name"), GlobEnv.buyerName);
    await tester.enterText(find.widgetWithText(IconButtonTheme, "Last Name"),
        GlobEnv.buyerLastName);
    await tester.enterText(
        find.widgetWithText(
            IconButtonTheme, "Street, Search Contact or Address"),
        GlobEnv.buyerAddress);
    await tester.enterText(
        find.widgetWithText(IconButtonTheme, "State"), "state");
    await tester.enterText(
        find.widgetWithText(IconButtonTheme, "City"), GlobEnv.buyerCity);
    await tester.enterText(
        find.widgetWithText(IconButtonTheme, "ZIP"), GlobEnv.buyerPostcode);
    await tester.tap(find.widgetWithText(IconButtonTheme, done));
    await tester.pump();
    await tester.tap(find.widgetWithText(IconButtonTheme, done));
    await tester.pump(const Duration(seconds: 5));
  }

  Future<void> confirmOrder() async {
    await tester.tap(find.byType(FormButton));
    await tester.pump(const Duration(seconds: 5));
  }

  Future<void> complete3DSecure(bool authorize) async {
    await confirmOrder();
    await tester.pump(const Duration(seconds: 10));
    await pumpUntilFound(
      tester,
      find.widgetWithText(IconButtonTheme, "COMPLETE AUTHENTICATION"),
      timeout: const Duration(seconds: 20),
    );
    if (authorize) {
      await tester.tap(find.widgetWithText(IconButtonTheme, "COMPLETE AUTHENTICATION"));
      await tester.pump();
    } else {
      await tester.tap(find.widgetWithText(IconButtonTheme, "FAIL AUTHENTICATION"));
      await tester.pump();
    }

    await tester.tap(find.widgetWithText(IconButtonTheme, "Close"));
    await tester.pump(const Duration(seconds: 5));
  }

  Future<void> waitAlert(String message, bool close) async {
    expect(find.text(message), findsOneWidget);
    if (close) {
      await tester.tap(find.widgetWithText(IconButtonTheme, "closeIconTemplate"));
      await tester.pump(const Duration(seconds: 5));
    }
  }

  Future<Future<String>> viewOrder(int expected) async {
    await tester.pump(const Duration(seconds: 10));
    await pumpUntilFound(
      tester,
      find.byType(ElevatedButton),
      timeout: const Duration(seconds: 20),
    );
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump(const Duration(seconds: 5));

    return orderData(expected);
  }

  Future<String> orderData(int expected) async {
    // final String orderId =
    //     await driver.getText(drive.find.byValueKey("Reference"));
    // log(orderId);
    // final String totalPriceField =
    //     await driver.getText(drive.find.byValueKey("Total"));
    // final int totalPrice =
    //     int.parse(totalPriceField.replaceAll(RegExp(r'\d'), ''));
    // expect(totalPrice, expected);
    const String orderId = '';

    return orderId;
  }
}
