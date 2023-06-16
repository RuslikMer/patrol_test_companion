import 'dart:async';

import 'package:bambinifashion/modules/core/services/log.dart';
import 'package:bambinifashion/modules/home/presentation/banner_tile.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> pumpUntilFound(
  WidgetTester tester,
  Finder finder, {
  Duration timeout = const Duration(seconds: 10),
}) async {
  bool timerDone = false;
  final timer = Timer(timeout, () => timerDone = true);
  while (timerDone != true) {
    await tester.pump(const Duration(milliseconds: 300));

    final found = tester.any(finder);
    if (found) {
      timerDone = true;
    }
  }
  timer.cancel();
}

Future<void> waitUntilAppIsLoaded(WidgetTester tester) async {
  final finder = find.byWidgetPredicate((widget) => widget is BannerTile);

  Log.it('Searching for BannerTile widget');

  await pumpUntilFound(
    tester,
    finder,
    timeout: const Duration(seconds: 20),
  );

  Log.it('BannerTile widget found');
}
