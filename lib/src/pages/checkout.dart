import 'dart:developer';

import 'package:bambinifashion/modules/checkout/presentation/checkout_address_form.dart';
import 'package:bambinifashion/modules/core/presentation/forms/bambini_checkbox_tick.dart';
import 'package:bambinifashion/modules/core/presentation/forms/form_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:flutter_test/flutter_test.dart';
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
    await tester.enterText(find.widgetWithText(CheckoutAddressForm, "First Name *"),
        GlobEnv.buyerName);
    await tester.enterText(find.widgetWithText(CheckoutAddressForm, "Last Name *"),
        GlobEnv.buyerLastName);
    await tester.enterText(
        find.widgetWithText(CheckoutAddressForm, "Address line 1 *"), address);
    await tester.tap(find.byType(DropdownButtonFormField));
    await tester.scrollUntilVisible(
        find.widgetWithText(DropdownButtonFormField, country), -100.0);
    await tester.tap(find.widgetWithText(DropdownButtonFormField, country));
    await tester.enterText(
        find.widgetWithText(CheckoutAddressForm, "City *"), city);
    await tester.enterText(
        find.widgetWithText(CheckoutAddressForm, "Postal code *"), postcode);
    await tester.enterText(find.widgetWithText(CheckoutAddressForm, "Telephone *"),
        GlobEnv.buyerPhone);
    await tester.scrollUntilVisible(find.byType(FormButton), -100.0);
    await tester.tap(find.byType(FormButton));
  }

  Future<int> chooseShippingMethod(String deliveryType) async {
    if (deliveryType == 'standard') {
      await tester.tap(find.byType(BambiniCheckboxTick).first);
    } else {
      await tester.tap(find.byType(BambiniCheckboxTick).last);
    }

    await tester.tap(find.byType(FormButton));
    int totalPrice = await cart.totalAmount();

    return totalPrice;
  }

  Future<void> fillCardData(String cardNumber) async {
    await tester.enterText(find.byType(CardField), '${cardNumber}1228123');
    // await tester.enterText(
    //     find.widgetWithText(IconButtonTheme, "expiration date"), "1228");
    await tester.enterText(find.widgetWithText(IconButtonTheme, "CVC"), "123");
  }

  Future<void> payByPayPal() async {
    await tester.tap(find.byType(BambiniCheckboxTick).last);
    await  confirmOrder();
    await tester.enterText(
        find.widgetWithText(IconButtonTheme, "Email address or mobile number"),
        GlobEnv.paypalLogin);
    await tester.tap(find.widgetWithText(IconButtonTheme, "Next"));
    await tester.enterText(find.widgetWithText(IconButtonTheme, "Password"),
        GlobEnv.paypalPassword);
    await tester.tap(find.widgetWithText(IconButtonTheme, "Log In"));
    await tester.tap(find.widgetWithText(IconButtonTheme, "Complete Purchase"));
  }

  Future<void> payByApplePay() async {
    await tester
        .tap(find.widgetWithText(IconButtonTheme, "Buy with Apple Pay"));
    await addBillingAddressForApplePay();
    await addShippingContactForApplePay();
    await addShippingAddressForApplePay();
    await tester.tap(find.widgetWithText(IconButtonTheme, "Pay with Passcode"));
  }

  Future<void> addBillingAddressForApplePay() async {
    await tester
        .tap(find.widgetWithText(IconButtonTheme, "Add Billing Address"));
    await tester
        .tap(find.widgetWithText(IconButtonTheme, "Add Billing Address"));
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
    await tester.tap(find.widgetWithText(IconButtonTheme, "close"));
  }

  Future<void> addShippingContactForApplePay() async {
    await tester.tap(find.widgetWithText(IconButtonTheme, "Add Contact"));
    await tester.tap(find.widgetWithText(IconButtonTheme, "Add Phone Number"));
    await tester.enterText(find.widgetWithText(IconButtonTheme, "Phone Number"),
        GlobEnv.buyerPhone);
    await tester.tap(find.widgetWithText(IconButtonTheme, "Add Email Address"));
    await tester.enterText(
        find.widgetWithText(IconButtonTheme, "Email"), GlobEnv.buyerEmail);
    await tester.tap(find.widgetWithText(IconButtonTheme, done));
  }

  Future<void> addShippingAddressForApplePay() async {
    await tester.tap(find.widgetWithText(IconButtonTheme, "Add Shipping"));
    await tester
        .tap(find.widgetWithText(IconButtonTheme, "Add Shipping Address"));
    await tester
        .tap(find.widgetWithText(IconButtonTheme, "Add Address Manually"));
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
    await tester.tap(find.widgetWithText(IconButtonTheme, done));
  }

  Future<void> confirmOrder() async {
    await tester.tap(find.byType(FormButton));
  }

  Future<void> complete3DSecure(bool authorize) async {
    await confirmOrder();
    if (authorize) {
      await tester
          .tap(find.widgetWithText(IconButtonTheme, "COMPLETE AUTHENTICATION"));
    } else {
      await tester
          .tap(find.widgetWithText(IconButtonTheme, "FAIL AUTHENTICATION"));
    }

    await tester.tap(find.widgetWithText(IconButtonTheme, "Close"));
  }

  Future<void> waitAlert(String message, bool close) async {
    expect(find.text(message), findsOneWidget);
    if (close) {
      await tester.tap(find.widgetWithText(IconButtonTheme, "closeIconTemplate"));
    }
  }

  Future<Future<String>> viewOrder(int expected) async {
    await tester.tap(find.byType(ElevatedButton));

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
    const String orderId = "";
    return orderId;
  }
}
