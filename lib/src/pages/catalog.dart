import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../helper/globEnv.dart';
import 'base.dart';
import 'login.dart';
import 'package:patrol/patrol.dart';
import 'package:bambinifashion/modules/category/presentation/filter_section_default.dart';
import 'package:bambinifashion/modules/core/presentation/forms/bambini_checkbox.dart';
import 'package:bambinifashion/modules/core/presentation/forms/bambini_checkbox_tick.dart';
import 'package:bambinifashion/modules/wishlist/presentation/wishlist_button.dart';
import 'package:bambinifashion/modules/core/presentation/app_bar_wishlist_button.dart';
import 'package:bambinifashion/modules/category/presentation/listing_product_card.dart';

class Catalog extends Base {
  static const String name = "name";

  //Constructor
  Catalog(WidgetTester tester) : super(tester: tester);

  Future<void> goToProduct(PatrolTester $) async {
    await $(find.byType(ListingProductCard).first).tap();
  }

  Future<void> selectCategoryFilter(PatrolTester $, String filterName) async {
    await $(find.widgetWithText(GestureDetector, 'FILTER PRODUCTS')).tap();
    await expandFilter($, filterName);
    // await Future.delayed(Duration(seconds: 5));
    
    //await tester.pumpAndSettle();
    // find.widgetWithText(Row, 'Gender')
    // find.widgetWithText(IconButtonTheme, 'Gender')
    // find.widgetWithText(SafeArea, 'Gender')
    // find.widgetWithText(Ink, 'Gender')
    // find.widgetWithText(GestureDetector, 'Gender')
    // final finder = find.ancestor(of: find.widgetWithText(FilterSectionDefault, filterName), matching: find.widgetWithText(BambiniCheckbox, '1 mth'));
    // print(finder);
    final elements = (find.byType(BambiniCheckbox).allCandidates).length;
    print(elements);
    await $(find.byType(BambiniCheckbox).at(2)).tap();
    await $(find.textContaining('PRODUCTS')).tap();
  }

  Future<void> expandFilter(PatrolTester $, String filterName) async {
    await $(find.widgetWithText(ListTile, filterName)).tap();
  }

  Future<void> addToWishlist(PatrolTester $, String auth) async {
    // find.byType(AppBarWishlistButton)
    // find.byType(IconButtonTheme)
    // find.byType(NavigationToolbar)
    // find.byType(CustomSingleChildLayout)
    // find.byType(SafeArea)
    // find.byElementType(SingleChildStatelessElement)
    // find.byElementType(InheritedModelElement<Object>)

    // final String wishlistCount =
    //     await driver.getText(drive.find.byType("AppBarWishlistButton"));
    // final int countBefore = int.parse(wishlistCount);

    // final Finder heart = find.widgetWithText(IconButtonTheme, "heartEmpty");
    // await tester.scrollUntilVisible(heart, 100.0);
    // await tester.tap(heart);
    await $(find.byType(WishlistButton).first).tap();
    if (auth == 'auth') {
      await login.doLogin($, GlobEnv.buyerEmail, GlobEnv.password);
    } else if (auth == 'guest') {
      await login.guestLogin($);
    }
    
    await $(find.widgetWithText(AppBarWishlistButton, '1')).waitUntilVisible();
  }

  Future<void> removeFromWishList(PatrolTester $) async {
    // /*final String wishlistCount =
    //     await driver.getText(drive.find.byValueKey("favOutlineIcon"));
    // final int countBefore = int.parse(wishlistCount);
    // await Future.delayed(Duration(seconds: 2));
    await scrollUpByGesture($, 500, -300);
    await $(find.byType(WishlistButton).first).tap();

    // expect(find.widgetWithText(AppBarWishlistButton, '1').visible, equals(false));
  }

  Future<void> checkPagination(PatrolTester $) async {
    await Future.delayed(Duration(seconds: 10));
    for (int i = 1; i <= 13; i++) {
      await scrollUpByGesture($, 740, -650);
    }
    
    await $(find.byType(IconButton).last).tap();
    for (int i = 1; i <= 12; i++) {
      await scrollUpByGesture($, 740, -650);
    }

    final pagination = find.widgetWithText(IconButtonTheme, "2 OF");
    await $('2 OF').waitUntilVisible();
  }

  Future<void> quickFilter(PatrolTester $) async {
    // find.text('Girl')
    // find.widgetWithText(Align, 'Girl')
    // find.widgetWithText(GestureDetector, 'Girl')
    // find.widgetWithText(MouseRegion, 'Girl')
    // find.widgetWithText(InkWell, 'Girl')
    // find.widgetWithText(CustomPaint, 'Girl')
    // find.byType(SingleChildScrollView)
    // find.byType(BackdropFilter)
    // find.byType(SliverPersistentHeader)
    // find.byType(NestedScrollViewViewport)
    // find.byType(NestedScrollView)
    // List filters = driver.findElements("-ios class chain", "**/XCUIElementTypeCell[`name == \"XUIElementTypeQuickFilterCell\"`]");
    // System.out.println(filters);
//        int filtersCount = filters.size() - 1;
//        System.out.println(filtersCount);
//        int randomNum = rand.nextInt(10) + 1;
//        System.out.println(randomNum);
//     System.out.println(filters.get(0));
//     WebElement filter = (WebElement) filters.get(0);
//     filter.click();
//     await Future.delayed(Duration(seconds: 5));
//     await tester.pump(const Duration(seconds: 5));

    // final finder = find.ancestor(of: find.byType(BackdropFilter), matching: find.byType(ElevatedButton));
    // print(finder);
    await $(find.byType(ElevatedButton).at(1)).tap();

    // await tester.tap(find.byType(ElevatedButton).at(1));
    // await tester.pump();
    // await Future.delayed(Duration(seconds: 5));
    // await tester.pump(const Duration(seconds: 5));
    await $(find.widgetWithText(GestureDetector, 'Back')).tap();

    // await tester.tap(find.widgetWithText(GestureDetector, 'Back'));
    // await tester.pump(const Duration(seconds: 5));
    // expect(find.widgetWithText(GestureDetector, 'Back').visible, equals(false));
  }

  Future<void> swipeImage(PatrolTester $, String imagePath) async {
    // final Finder productCard = find.widgetWithText(IconButtonTheme, imagePath); //to do
    // final Point location = driver.productCard;
    // final int x = location.getX();
    // final int y = location.getY();
    // final Dimension size = getSize(productCard);
    // final int width = size.getWidth();
    // final int height = size.getHeight();
    // scrollTo(width, y + (height / 2), x, y + (height / 2));
    // expect(find.widgetWithText(IconButtonTheme, "2 OF 2").isDisplayed(), '');
  }
}
