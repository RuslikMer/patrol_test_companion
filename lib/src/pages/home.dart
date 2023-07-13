import 'package:bambinifashion/modules/home/presentation/category_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';

class Home extends Base {
  //Constructor
  Home(WidgetTester tester) : super(tester: tester);

  Future<void> selectCategory(String sectionName) async {
    // await tester.pump(const Duration(seconds: 7));
    await tester.tap(find.widgetWithText(CategoryTile, sectionName));
    await tester.pump();
  }

  Future<void> openHomePage() async {
    await tester.tap(find.widgetWithText(IconButtonTheme, "NEXT"));
    await tester.pump();
  }

  Future<void> goToWishlist() async {
    await tester.tap(find.widgetWithText(IconButtonTheme, "favOutlineIcon"));
    await tester.pump();
  }
}
