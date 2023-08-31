import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';
import 'package:patrol/patrol.dart';

class Search extends Base {
  //Constructor
  Search(WidgetTester tester) : super(tester: tester);

  Future<void> searchText(PatrolTester $, String searchRequest, bool press) async {
    await navBar.goToNavTab($, 'Search');
    await $(find.byType(TextField)).enterText(searchRequest);
    if (press) {
      await $.tester.sendKeyEvent(LogicalKeyboardKey.enter);
    }
  }

  Future<void> goToLiveSearchResult(PatrolTester $, String section) async {
    String sectionPath = '';
    switch (section) {
      case 'Product':
        await $('DESIGNERS').waitUntilVisible();
        await $('CATEGORIES').waitUntilVisible();
        sectionPath = 'PRODUCTS';
        
        break;
      case 'Brand':
        await $('PRODUCTS').waitUntilVisible();
        await $('CATEGORIES').waitUntilVisible();
        await $(find.widgetWithText(GestureDetector, 'VIEW MORE')).tap();
        sectionPath = 'DESIGNERS';
        
        break;
      default:
        await $(GestureDetector).containing('CATEGORIES').$(find.text('VIEW MORE')).tap();
        // await $(find.widgetWithText(GestureDetector, 'CATEGORIES VIEW More')).tap();
        // await $('CATEGORIES VIEW More').waitUntilVisible();
        sectionPath = 'CATEGORIES';

        break;
    }

    await $.tester.pump(const Duration(seconds: 15));

    // final String name = await $(find.widgetWithText(IconButtonTheme, sectionPath)).text!;
    // // find.ancestor(
    // //   of: find.text('Activated'),
    // //   matching: find.descendant(
    // //     of: find.byType(ListTile),
    // //     matching: find.byKey(Key('learnMore')),
    // //   ),
    // // ).first
    // print(name);
    // await $(find.widgetWithText(IconButtonTheme, sectionPath)).tap();
    //
    // switch (section) {
    //   case 'Product':
    //     await $(name).waitUntilVisible();
    //
    //     break;
    //   case 'Brand':
    //     await $(name.toUpperCase()).waitUntilVisible();
    //
    //     break;
    //   default:
    //     await $(name.toUpperCase()).waitUntilVisible();
    //
    //     break;
    // }
  }

  Future<void> goToAllProductsFromLiveSearchResult(PatrolTester $, String searchRequest) async {
    await $.tester.scrollUntilVisible(find.widgetWithText(GestureDetector, "VIEW ALL PRODUCTS"), -100.0);
    await $(find.widgetWithText(GestureDetector, 'VIEW ALL PRODUCTS')).tap();
  }
}
