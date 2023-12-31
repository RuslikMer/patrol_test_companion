import 'dart:developer';
import 'package:bambinifashion/modules/core/presentation/forms/form_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';
import 'package:patrol/patrol.dart';

class Cart extends Base {
  final String digit = "\"d";

  //Constructor
  Cart(WidgetTester tester) : super(tester: tester);

  Future<void> goToCheckout(PatrolTester $) async {
    //await tester.tap(find.widgetWithText(IconButtonTheme, "Import duties included"));
    //await totalAmount();
    await $(find.widgetWithText(GestureDetector, 'CHECKOUT')).tap();
  }

  Future<int> totalAmount() async {
    // final String itemsPriceField = await driver.getText(drive.find.byValueKey("Items"));
    // final int itemsPrice = int.parse(itemsPriceField.replaceAll(RegExp(r'\D'), ''));
    // log(itemsPrice.toString());
    int discount = 0;
    try {
      //final String discountField = await driver.getText(drive.find.byValueKey("Discount"));
      //discount = int.parse(discountField.replaceAll(RegExp(r'\D'), ''));
    } on Exception catch (_) {
      log('ignored');
    }

    int storeCredit = 0;
    try {
      // final String storeCreditField = await driver.getText(drive.find.byValueKey("Credit"));
      // storeCredit = int.parse(storeCreditField.replaceAll(RegExp(r'\D'), ''));
    } on Exception catch (_) {
      log('ignored');
    }

    // final String shippingPriceField =
    //     await driver.getText(drive.find.byValueKey("Shipping"));
    // final int shippingPrice =
    //     int.parse(shippingPriceField.replaceAll(RegExp(r'\D'), ''));
    // final String totalPriceField =
    //     await driver.getText(drive.find.byValueKey("Total"));
    // final int totalPrice =
    //     int.parse(totalPriceField.replaceAll(RegExp(r'\D'), ''));
    // final int expected = (itemsPrice + shippingPrice - discount - storeCredit);
    // expect(totalPrice, expected);
    const int totalPrice = 0;

    return totalPrice;
  }

  Future<void> useVoucher(PatrolTester $, String voucher) async {
    await $(find.widgetWithText(GestureDetector, 'Have a promo voucher?')).tap();
    await $(find.byType(TextField)).enterText(voucher);
    await $(find.byType(FormButton)).tap();
  }
}
