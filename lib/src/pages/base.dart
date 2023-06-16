import 'dart:async';
import 'dart:math';
import 'package:flutter_test/flutter_test.dart';

import 'cart.dart';
import '../../pages/catalog.dart';
import 'checkout.dart';
import 'home.dart';
import 'login.dart';
import '../../pages/menu.dart';
import 'nav_bar.dart';
import 'product.dart';
import 'profile.dart';
import 'search.dart';
import 'wishlist.dart';

class Base {
  final WidgetTester tester;

  NavBar get navBar => NavBar(tester);

  Cart get cart => Cart(tester);

  Checkout get checkout => Checkout(tester);

  Login get login => Login(tester);

  Menu get menu => Menu(tester);

  Catalog get catalog => Catalog(tester);

  Profile get profile => Profile(tester);

  Wishlist get wishlist => Wishlist(tester);

  Home get home => Home(tester);

  Product get product => Product(tester);

  Search get search => Search(tester);

  //Constructor
  Base({
    required this.tester,
  });

  // setUpAll () async {
  //   driver = drive.FlutterDriver.connectedTo();
  // }

  /// Generation of a random string, the number of digits
  /// in a string is set by the parameter.
  String generateString(int length) {
    final Random random = Random();
    const String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWYZ";
    const int numChars = chars.length;
    late String newString = '';
    //int numLenght = 0;

    for (int i = 0; i <= length; i++) {
      final int randomInt = random.nextInt(numChars);
      //int rndChar = rnd(1, numChars) - 1;
      newString += chars[randomInt];
    }

    return newString;
  }

  void scrollTo(int startX, int startY, int endX, int endY) {
    // _tester.scrollUntilVisible(finder, delta)
    // sequence.addAction(finger.createPointerMove(ofMillis(0), PointerInput.Origin.viewport(), startX, startY));
    // sequence.addAction(finger.createPointerDown(PointerInput.MouseButton.MIDDLE.asArg()));
    // sequence.addAction(new Pause(finger, ofMillis(600)));
    // sequence.addAction(finger.createPointerMove(ofMillis(600), PointerInput.Origin.viewport(), endX, endY));
    // sequence.addAction(finger.createPointerUp(PointerInput.MouseButton.MIDDLE.asArg()));
    // appiumDriver.perform(singletonList(sequence));
  }
}
