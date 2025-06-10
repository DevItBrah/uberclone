import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:ubereats/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:ubereats/controller/services/provider/authProvider.dart';
import 'package:ubereats/view/authScreen/mobileLoginScren.dart';
import 'package:ubereats/view/authScreen/otpScreen.dart';
import 'package:ubereats/view/bottomNavigationBar.dart';
import 'package:ubereats/view/singInLoginScreen/signInLoginScreen.dart';

class MobileAuthServices {
  static bool CheckAuthentication(BuildContext context) {
    User? user = auth.currentUser;
    if (user == null) {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => const MobileLoginScreen()),
        (route) => false,
      );
      return false;
    }
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomNavExample(),
      ),
      (route) => false,
    );
    return true;
  }

  static receiveOTP({
    required BuildContext context,
    required String mobileNo,
  }) async {
    try {
      await auth.verifyPhoneNumber(
        phoneNumber: mobileNo,
        verificationCompleted: (PhoneAuthCredential credentials) {
          log(credentials.toString());
        },
        verificationFailed: (FirebaseAuthException exception) {
          log(exception.toString());
          throw Exception(exception);
        },
        codeSent: (String verificationID, int? resendToken) {
          context.read<MobileAuthProvider>().updateVerificationID(
            verificationID,
          );
          Navigator.push(
            context,
            PageTransition(
              child: const OTPScreen(),
              type: PageTransitionType.rightToLeft,
            ),
          );
        },
        codeAutoRetrievalTimeout: (String verification) {},
      );
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }

  static verifyOTP({required BuildContext context, required String otp}) async {
    try {
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<MobileAuthProvider>().verificationID!,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        PageTransition(
          child: const SignInLogicScreen(),
          type: PageTransitionType.rightToLeft,
        ),
      );
    } catch (e) {
      log(e.toString());
      throw Exception(e);
    }
  }
}
