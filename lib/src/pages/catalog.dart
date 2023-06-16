import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import '../src/helper/globEnv.dart';
import '../src/pages/base.dart';
import 'login.dart';

class Catalog extends Base {
  static const String name = "name";

  //Constructor
  Catalog(WidgetTester tester) : super(tester: tester);

  Future<void> goToProduct() async {
//    final FlutterElement item = find().byAncestor(find().bySemanticsLabel("Category Listing"), find().bySemanticsLabel("Listing Product"), false, true);
    //await tester.tap(find.bySemanticsLabel("Listing Product"));
    await tester.pump(const Duration(seconds: 10));
    await tester.tap(find.byKey(const Key('/new-in/page=-182680')));
  }

  Future<void> selectCategoryFilter(String filterName) async {
    // find.widgetWithText(Flexible, 'FILTER PRODUCTS')
    // find.widgetWithText(Row, 'FILTER PRODUCTS')
    // find.widgetWithText(Align, 'FILTER PRODUCTS')
    // find.widgetWithText(GestureDetector, 'FILTER PRODUCTS')
    // find.widgetWithText(MouseRegion, 'FILTER PRODUCTS')
    await tester.pump(const Duration(seconds: 10));
    await tester.tap(find.widgetWithText(GestureDetector, "FILTER PRODUCTS"));
    await expandFilter(filterName);
    //await tester.tap(find.widgetWithText(GestureDetector, "chosen filter"));
    //await tester.tap(find.widgetWithText(IconButtonTheme, "SHOW"));
  }

  Future<void> expandFilter(String filterName) async {
    await tester.pump(const Duration(seconds: 5));
    await tester.tap(find.widgetWithText(ListTile, filterName));
  }

  Future<void> addToWishlist(String auth) async {
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

    // find.byKey(const Key('/new-in/page=-189786'))
    // find.byType(SliverPadding)
    // find.byType(ListView)
    // find.byType(BlocListener<CategoryPageItemsBloc, CategoryPageItemsState>)
    // find.byType(BlocBuilder<CategoryPageItemsBloc, CategoryPageItemsState>)
    // find.byType(BlocConsumer<CategoryPageItemsBloc, CategoryPageItemsState>)
    // find.byKey(const Key('products-US,USD,en/new-in/page=-regular'))
    // find.byKey(const ValueKey<int>(1473207422))
    // find.byElementType(SingleChildStatelessElement)
    // find.byElementType(InheritedModelElement<Object>)

    // final Finder heart = find.widgetWithText(IconButtonTheme, "heartEmpty");
    // await tester.scrollUntilVisible(heart, 100.0);
    // await tester.tap(heart);
    // if (auth == "auth") {
    //   login.doLogin(GlobEnv.buyerEmail, GlobEnv.password);
    // } else if (auth == "guest") {
    //   login.guestLogin();
    // }
    //
    // final int countAfter = int.parse(wishlistCount);
    //expect(actual, matcher) countAfter > countBefore;
  }

  Future<void> removeFromWishList() async {
    /*final String wishlistCount =
        await driver.getText(drive.find.byValueKey("favOutlineIcon"));
    final int countBefore = int.parse(wishlistCount);
    await tester.tap(find.widgetWithText(IconButtonTheme, "heartFull"));
    final int countAfter = int.parse(wishlistCount);*/
    //expect(actual, matcher) countAfter < countBefore;
  }

  Future<void> checkPagination() async {
    // for (int i = 1; i <= 13; i++) {
    //   scrollTo(5, 740, 5, 100);
    // }
    final forward = find.widgetWithText(IconButtonTheme, "Forward");
    await tester.scrollUntilVisible(forward, 100.0);
    await tester.tap(forward);
    // for (int i = 1; i <= 12; i++) {
    //   scrollTo(5, 740, 5, 100);
    // }

    final pagination = find.widgetWithText(IconButtonTheme, "2 OF");
    await tester.scrollUntilVisible(pagination, 100.0);
    //expect(find.text("2 OF"), "");
  }

  Future<void> quickFilter() async {
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
    await tester.tap(find.widgetWithText(IconButtonTheme, "Back"));
    // wait.until(ExpectedConditions.invisibilityOfElementLocated(By.xpath("(//XCUIElementTypeStaticText[@name=\"Back\"])[2]")));
  }

  Future<void> swipeImage(String imagePath) async {
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
