import 'dart:developer';
import 'package:bambinifashion/modules/product_single/presentation/image_carousel.dart';
import 'package:bambinifashion/modules/product_single/presentation/size_guide_button.dart';
import 'package:bambinifashion/modules/core/presentation/arrow_right_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';
import 'package:patrol/patrol.dart';

class Product extends Base {
  //Constructor
  Product(WidgetTester tester) : super(tester: tester);

  Future<int> addToCart(PatrolTester $) async {
    await $(find.byType(Opacity)).tap();
    await selectSize($);
    //final String priceField = await driver.getText(drive.find.byValueKey("\$"));
    //final int price = int.parse(priceField.replaceAll(RegExp(r'\D'), ''));
    //log(priceField);
    await $(find.widgetWithText(GestureDetector, 'ADD TO BAG')).tap();
    await $(find.widgetWithText(Expanded, 'SHOPPING BAG')).tap();
    // find.byType(OutlinedButton)
    // find.widgetWithText(Expanded, 'CONTINUE SHOPPING')
    int price = 0;

    return price;
  }

  Future<void> selectSize(PatrolTester $) async {
    await $(find.byType(ArrowRightIcon).first).tap();
  }

  Future<void> sendRequestSize(PatrolTester $) async {
    await $.tester.scrollUntilVisible(
        find.widgetWithText(IconButtonTheme, "Select Size"), -100.0);
    final String str = generateString(5);
    await $(find.byType(Opacity)).tap();
    await $(find.widgetWithText(ListTile, 'Request size')).tap();
    await $(find.widgetWithText(TextFormField, 'Enter e-mail')).enterText('$str@bambinifashion.com');
    await $(find.widgetWithText(Row, 'SEND REQUEST')).tap();
    await $(find.widgetWithText(GestureDetector, 'Your request has been sent.')).tap();
    await $(find.widgetWithText(Row, 'ClOSE')).tap();
  }

  Future<void> checkSizeGuide(PatrolTester $) async {
    await $.tester.scrollUntilVisible(
        find.widgetWithText(IconButtonTheme, "Select guide"), -100.0, scrollable: find.byType(Scrollable).last);
    await $(find.byType(SizeGuideButton)).tap();
    await $(find.widgetWithText(GestureDetector, 'Switch to inches')).tap();
    await $(find.widgetWithText(GestureDetector, 'Switch to cm')).tap();
  }

  Future<void> fullView(PatrolTester $) async {
    await $(find.byType(ImageCarousel)).tap();
    await $(find.bySemanticsLabel('Back')).tap();
  }

  Future<void> openTab(PatrolTester $, String tabName, bool back) async {
    final Set description = {
      'Product Features',
      'Product Details',
    };
    final Set delivery = {
      'Delivery',
      '30 Day Return',
      'Shipping',
    };
    final Set subTabs;
    await tester.scrollUntilVisible(
        find.widgetWithText(ListTile, tabName), -200.0, scrollable: find.byType(Scrollable).last);
    await $(find.widgetWithText(IconButtonTheme, tabName)).tap();
    if (tabName == 'DESCRIPTION') {
      subTabs = description;
    } else {
      subTabs = delivery;
    }

    for (String subTab in subTabs) {
      await $(subTab).waitUntilVisible();
    }
    //
    // if (back) {
    //   await tester.tap(find.widgetWithText(IconButtonTheme, "backIcon"));
    // }
  }

  Future<void> sharing(PatrolTester $) async {
    await $(find.widgetWithText(IconButtonTheme, 'Share')).tap();
    await $('Copy').waitUntilVisible();
    await $(find.widgetWithText(IconButtonTheme, 'Close')).tap();
  }

  Future<void> scrollProductsCarousel(PatrolTester $) async {
    await scrollUpByGesture($, 740, -690);
    // final Point location = scrollHor.getLocation();
    // final int x = location.getX();
    // final int y = location.getY();
    // final Dimension size = scrollHor.getSize();
    // final int width = size.getWidth();
    // scrollTo(width, y, x, y);
  }

  Future<void> goToCrossSaleProduct(PatrolTester $) async {
    await scrollUpByGesture($, 740, -690);
    await $(find.widgetWithText(IconButtonTheme, 'getProductCard')).tap();
    await scrollUpByGesture($, 740, -690);
  }
}
