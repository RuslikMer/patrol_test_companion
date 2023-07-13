import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';

class Search extends Base {
  //Constructor
  Search(WidgetTester tester) : super(tester: tester);

  Future<void> searchText(String searchRequest, bool press) async {
    await navBar.goToNavTab("Search");
    await tester.enterText(find.byType(TextField), searchRequest);
    if (press) {
      await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    }
  }

  Future<void> goToLiveSearchResult(String section) async {
    final String sectionPath = section;
    switch (section) {
      case "Product":
      // find.widgetWithText(Row, 'PRODUCTS')
      // find.widgetWithText(Padding, 'PRODUCTS')
      // find.widgetWithText(RawGestureDetector, 'PRODUCTS')
      // find.widgetWithText(CustomPaint, 'PRODUCTS')
      // find.byType(GlowingOverscrollIndicator)
      // find.widgetWithText(Scrollable, 'PRODUCTS')
        expect(find.text("DESIGNERS"), findsOneWidget);
        expect(find.text("CATEGORIES"), findsOneWidget);

        break;
      case "Brand":
        expect(find.text("PRODUCTS"), findsOneWidget);
        await tester.tap(find.widgetWithText(GestureDetector, "VIEW MORE"));
        await tester.pump();
        expect(find.text("DESIGNERS"), '');

        break;
      default:
        await tester
            .tap(find.widgetWithText(GestureDetector, "CATEGORIES VIEW More"));
        await tester.pump();
        expect(find.text("CATEGORIES VIEW More"), '');

        break;
    }

    // final String name =
    //     await driver.getText(drive.find.byValueKey(sectionPath));
    // log(sectionPath);
    // log(name);
    await tester.tap(find.widgetWithText(IconButtonTheme, sectionPath));
    await tester.pump();

    switch (section) {
      case "Product":
      //expect(find.text(name).isEnabled(), '');

        break;
      case "Brand":
      //expect(find.text(name.toUpperCase()).isEnabled(), '');

        break;
      default:
      //expect(find.text(name.toUpperCase()).isDisplayed(), '');

        break;
    }
  }

  Future<void> goToAllProductsFromLiveSearchResult(String searchRequest) async {
    await tester.scrollUntilVisible(find.widgetWithText(GestureDetector, "VIEW ALL PRODUCTS"), -100.0);
    await tester.tap(find.widgetWithText(GestureDetector, "VIEW ALL PRODUCTS"));
    await tester.pump();
  }
}
