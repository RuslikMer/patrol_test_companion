import 'package:bambinifashion/modules/account/presentation/delete_account_button.dart';
import 'package:bambinifashion/modules/core/presentation/forms/form_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'base.dart';
import 'package:patrol/patrol.dart';

class Login extends Base {
  //Constructor
  Login(WidgetTester tester) : super(tester: tester);

  Future<void> doLogin(PatrolTester $, String email, String password) async {
    await $(find.byType(TextFormField).first).enterText(email);
    await $(find.byType(TextFormField).last).enterText(password);
    await $(find.byType(FormButton).last).tap();
  }

  Future<void> forgotPassword(PatrolTester $) async {
    await $(find.widgetWithText(Align, 'Forgot password?').first).tap();
    await $(find.byType(EditableText).last).enterText('${generateString(5)}@bambinifashion.com');
    await $(find.byType(FormButton).last).tap();
    await checkout.waitAlert($, 'A password reset link was sent. Click the link in the email to create a new password.', false);
  }

  Future<void> registration(PatrolTester $, String name, String lastName, String email, String password) async {
    await $(find.widgetWithText(IconButtonTheme, 'REGISTER')).tap();
    await $(find.byType(TextFormField).last).enterText(name);
    await $(find.widgetWithText(TextFormField, 'Last Name *')).enterText(lastName);
    await $(find.widgetWithText(TextFormField, 'Your E-mail *')).enterText(email);
    await $(find.widgetWithText(TextFormField, 'New password')).enterText(password);
    await $(find.byType(TextFormField).last).enterText(password);
    await $(find.byType(FormButton)).tap();
  }

  Future<void> guestLogin(PatrolTester $) async {
    await $(find.byType(TextFormField).first).enterText('${generateString(5)}@bambinifashion.com');
    await $(find.byType(FormButton).first).tap();
  }

  Future<void> deleteAccount(PatrolTester $) async {
    await profile.goToTabFromProfile($, 'PERSONAL INFORMATION');
    await $(find.byType(DeleteAccountButton)).tap();
    await $(find.byType(TextButton).last).tap();
  }
}
