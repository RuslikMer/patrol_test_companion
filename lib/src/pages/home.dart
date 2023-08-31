import 'package:bambinifashion/modules/home/presentation/category_tile.dart';
import 'package:bambinifashion/modules/core/presentation/app_bar_wishlist_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';
import 'package:patrol/patrol.dart';

class Home extends Base {
  //Constructor
  Home(WidgetTester tester) : super(tester: tester);

  Future<void> selectCategory(PatrolTester $, String sectionName) async {
    await $(find.widgetWithText(CategoryTile, sectionName)).tap();
  }

  Future<void> openHomePage(PatrolTester $) async {
    await $(find.widgetWithText(IconButtonTheme, 'NEXT')).tap();
  }

  Future<void> goToWishlist(PatrolTester $) async {
    await $(find.byType(AppBarWishlistButton)).tap();
  }
}
