import 'dart:developer';
import 'package:bambinifashion/modules/product_single/presentation/image_carousel.dart';
import 'package:bambinifashion/modules/product_single/presentation/size_guide_button.dart';
import 'package:bambinifashion/modules/core/presentation/arrow_right_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';

class Product extends Base {
  //Constructor
  Product(WidgetTester tester) : super(tester: tester);

  Future<int> addToCart() async {
    //await tester.scrollUntilVisible(finder, delta);
    // find.widgetWithText(Row, 'SOLD OUT')
    // find.widgetWithText(Container, 'SOLD OUT')
    // find.byType(Opacity)
    // find.widgetWithText(GestureDetector, 'SOLD OUT')
    // find.widgetWithText(CustomPaint, 'SOLD OUT')
    // find.widgetWithText(GlowingOverscrollIndicator, 'SOLD OUT')
    // find.widgetWithText(Align, 'ADD TO BAG')
    // find.widgetWithText(GestureDetector, 'ADD TO BAG')
    // find.widgetWithText(MouseRegion, 'ADD TO BAG')
    // find.widgetWithText(InkWell, 'ADD TO BAG')
    // find.widgetWithText(PhysicalShape, 'ADD TO BAG')
    // find.widgetWithText(Row, 'Select size')
    // find.widgetWithText(Container, 'Select size')
    // find.byType(Opacity)
    // find.widgetWithText(GestureDetector, 'Select size')
    // find.widgetWithText(CustomPaint, 'Select size')
    // find.widgetWithText(GlowingOverscrollIndicator, 'Select size')
    await Future.delayed(Duration(seconds: 5));
    await tester.tap(find.byType(Opacity));
    await tester.pump(const Duration(seconds: 5));
    await selectSize();
    //final String priceField = await driver.getText(drive.find.byValueKey("\$"));
    //final int price = int.parse(priceField.replaceAll(RegExp(r'\D'), ''));
    //log(priceField);
    await tester.tap(find.widgetWithText(GestureDetector, 'ADD TO BAG'));
    await tester.pump(const Duration(seconds: 5));
    // await tester.pumpAndSettle();
    // find.text('SHOPPING BAG')
    // find.widgetWithText(Align, 'SHOPPING BAG')
    // find.widgetWithText(MouseRegion, 'SHOPPING BAG')
    // find.widgetWithText(InkWell, 'SHOPPING BAG')
    // find.widgetWithText(ElevatedButton, 'SHOPPING BAG')
    // find.widgetWithText(Expanded, 'SHOPPING BAG')
    await scrollUpByGesture(500, -100);
    await tester.ensureVisible(find.widgetWithText(Expanded, 'SHOPPING BAG'));
    await tester.tap(find.widgetWithText(Expanded, 'SHOPPING BAG'));
    await tester.pump(const Duration(seconds: 2));
    // find.byType(OutlinedButton)
    // find.widgetWithText(Expanded, 'CONTINUE SHOPPING')
    int price = 0;

    return price;
  }

  Future<void> selectSize() async {
    await tester.tap(find.byType(ArrowRightIcon).first);
    await tester.pump(const Duration(seconds: 2));
  }

  Future<void> sendRequestSize() async {
    // await tester.scrollUntilVisible(
    //     find.widgetWithText(IconButtonTheme, "Select Size"), -100.0);
    final String str = generateString(5);
    // find.widgetWithText(Row, 'Select size')
    // find.widgetWithText(Container, 'Select size')
    // find.byType(Opacity)
    // find.widgetWithText(GestureDetector, 'Select size')
    // find.widgetWithText(CustomPaint, 'Select size')
    // find.widgetWithText(GlowingOverscrollIndicator, 'Select size')
    await tester.tap(find.byType(Opacity));
    await tester.pump();
    await tester.tap(find.widgetWithText(ListTile, "Request size"));
    await tester.pump();
    await tester.enterText(find.widgetWithText(TextFormField, "Enter e-mail"),
        "$str@bambinifashion.com");
    await tester.tap(find.widgetWithText(Row, "SEND REQUEST"));
    await tester.pump();
    await tester.tap(
        find.widgetWithText(GestureDetector, "Your request has been sent."));
    await tester.pump();
    await tester.tap(find.widgetWithText(Row, 'ClOSE'));
    await tester.pump();
  }

  Future<void> checkSizeGuide() async {
    await tester.scrollUntilVisible(
        find.widgetWithText(IconButtonTheme, "Select guide"), -100.0, scrollable: find.byType(Scrollable).last);
    // find.widgetWithText(Align, 'Size guide')
    // find.widgetWithText(GestureDetector, 'Size guide')
    // find.widgetWithText(MouseRegion, 'Size guide')
    // find.widgetWithText(InkWell, 'Size guide')
    // find.widgetWithText(PhysicalShape, 'Size guide')
    // find.byType(SizeGuideButton)
    await tester.tap(find.byType(SizeGuideButton));
    await tester.pump();
    await tester.tap(find.widgetWithText(GestureDetector, "Switch to inches"));
    await tester.pump();
    await tester.tap(find.widgetWithText(GestureDetector, "Switch to cm"));
    await tester.pump();
  }

  Future<void> fullView() async {
    // find.byType(ImageCarousel)
    // find.byType(SingleChildScrollView)
    await tester.tap(find.byType(ImageCarousel));
    await tester.pump();
    await tester.tap(find.bySemanticsLabel('Back'));
    await tester.pump();
  }

  Future<void> openTab(String tabName, bool back) async {
    final Set description = {
      'Product Features',
      'Product Details',
    };
    final Set delivery = {
      "Delivery",
      "30 Day Return",
      "Shipping",
    };
    final Set subTabs;
    await tester.scrollUntilVisible(
        find.widgetWithText(ListTile, tabName), -200.0, scrollable: find.byType(Scrollable).last);
    // find.widgetWithText(IconButtonTheme, 'DESCRIPTION')
    // find.widgetWithText(SafeArea, 'DESCRIPTION')
    // find.widgetWithText(Ink, 'DESCRIPTION')
    // find.widgetWithText(GestureDetector, 'DESCRIPTION')
    // find.widgetWithText(MouseRegion, 'DESCRIPTION')
    await tester.tap(find.widgetWithText(IconButtonTheme, tabName));

    if (tabName == "DESCRIPTION") {
      subTabs = description;
    } else {
      subTabs = delivery;
    }

    for (String subTab in subTabs) {
      // find.widgetWithText(Align, 'Product Features')
      // find.widgetWithText(ClipRect, 'Product Features')
      // find.widgetWithText(Container, 'Product Features')
      // find.widgetWithText(ExpansionTile, 'Product Features')
      // find.byType(ProductDescription)
      // find.widgetWithText(RawGestureDetector, 'Product Features')
      //   await tester.scrollUntilVisible(find.widgetWithText(ExpansionTile, subTab), -50.0, scrollable: find.byType(Scrollable).last);

      expect(find.widgetWithText(ExpansionTile, subTab), findsOneWidget);
    }
    //
    // if (back) {
    //   await tester.tap(find.widgetWithText(IconButtonTheme, "backIcon"));
    // }
  }

  Future<void> sharing() async {
    await tester.tap(find.widgetWithText(IconButtonTheme, "Share"));
    await tester.pump();
    expect(find.text("Copy"), findsOneWidget);
    await tester.tap(find.widgetWithText(IconButtonTheme, "Close"));
    await tester.pump();
  }

  Future<void> scrollProductsCarousel() async {
    await scrollUpByGesture(740, -690);
    // final Point location = scrollHor.getLocation();
    // final int x = location.getX();
    // final int y = location.getY();
    // final Dimension size = scrollHor.getSize();
    // final int width = size.getWidth();
    // scrollTo(width, y, x, y);
  }

  Future<void> goToCrossSaleProduct() async {
    await scrollUpByGesture(740, -690);
    await tester.tap(find.widgetWithText(IconButtonTheme, "getProductCard"));
    await tester.pump();
    await scrollUpByGesture(740, -690);
  }
}
