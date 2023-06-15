import 'package:bambinifashion/modules/account/presentation/delete_account_button.dart';
import 'package:bambinifashion/modules/core/presentation/forms/form_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';

class Login extends Base {
  //Constructor
  Login(WidgetTester tester) : super(tester: tester);

  Future<void> doLogin(String email, String password) async {
    await tester.enterText(find.byType(TextFormField).first, email);
    await tester.enterText(find.byType(TextFormField).last, password);
    await tester.tap(find.byType(FormButton).last);
  }

  Future<void> forgotPassword() async {
    await tester.pump(const Duration(seconds: 7));
    await tester.tap(find.widgetWithText(Align, "Forgot password?").first);
    await tester.pump(const Duration(seconds: 2));
    await tester.enterText(find.byType(EditableText).last, "${generateString(5)}@bambinifashion.com");
    await tester.tap(find.byType(FormButton).last);
    await tester.pump(const Duration(seconds: 2));
    await checkout.waitAlert('A password reset link was sent. Click the link in the email to create a new password.', false);
  }

  Future<void> registration(String name, String lastName, String email, String password) async {
    // find.widgetWithText(IconButtonTheme, 'REGISTER')
    // find.widgetWithText(SafeArea, 'REGISTER')
    // find.widgetWithText(Ink, 'REGISTER')
    // find.widgetWithText(GestureDetector, 'REGISTER')
    // find.widgetWithText(MouseRegion, 'REGISTER')
    await tester.tap(find.widgetWithText(IconButtonTheme, "REGISTER"));
    await tester.pump(const Duration(seconds: 2));
    await tester.enterText(find.byType(TextFormField).first, name);
    await tester.enterText(find.widgetWithText(TextFormField, 'Last Name *'), lastName);
    await tester.enterText(find.widgetWithText(TextFormField, 'Your E-mail *'), email);
    await tester.enterText(find.widgetWithText(TextFormField, 'New password'), password);
    await tester.enterText(find.byType(TextFormField).last, password);
    await tester.tap(find.byType(FormButton));
  }

  Future<void> guestLogin() async {
    await tester.enterText(find.byType(TextFormField).first, "${generateString(5)}@bambinifashion.com");
    await tester.tap(find.byType(FormButton).first);
  }

  Future<void> deleteAccount() async {
    await profile.goToTabFromProfile('PERSONAL INFORMATION');
    await tester.pump(const Duration(seconds: 2));
    await tester.tap(find.byType(DeleteAccountButton));
    await tester.tap(find.byType(TextButton).last);
  }
}
