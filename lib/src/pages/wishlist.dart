import 'package:bambinifashion/modules/common/presentation/listing_product_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';

class Wishlist extends Base {
  //Constructor
  Wishlist(WidgetTester tester) : super(tester: tester);

  Future<void> remove() async {
    // final String wishlistCount =
    //     await driver.getText(drive.find.byValueKey("favOutlineIcon"));
    // final int countBefore = int.parse(wishlistCount);
    await tester.tap(find.byType(IconButton).first);
    await tester.pump();
    // final int countAfter = int.parse(wishlistCount);
    //expect(actual, matcher) countAfter < countBefore;
  }

  Future<void> goToProduct() async {
    await tester.tap(find.byType(ListingProductImage));
    await tester.pump();
  }

  Future<void> addToCart() async {
    await tester.tap(find.widgetWithText(IconButtonTheme, ''));
    await tester.pump();
  }
}
