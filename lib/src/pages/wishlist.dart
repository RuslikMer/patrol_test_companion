import 'package:bambinifashion/modules/common/presentation/listing_product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';
import 'package:patrol/patrol.dart';

class Wishlist extends Base {
  //Constructor
  Wishlist(WidgetTester tester) : super(tester: tester);

  Future<void> remove(PatrolTester $) async {
    // final String wishlistCount =
    //     await driver.getText(drive.find.byValueKey("favOutlineIcon"));
    // final int countBefore = int.parse(wishlistCount);
    await $(find.byType(IconButton).first).tap();
    // final int countAfter = int.parse(wishlistCount);
    //expect(actual, matcher) countAfter < countBefore;
  }

  Future<void> goToProduct(PatrolTester $) async {
    await $(find.byType(ListingProductImage)).tap();
  }

  Future<void> addToCart(PatrolTester $) async {
    await $(find.widgetWithText(IconButtonTheme, '')).tap();
  }
}
