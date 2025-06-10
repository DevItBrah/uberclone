import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ubereats/utils/colors.dart';
import 'package:ubereats/utils/textStyles.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  List account = [
    [FontAwesomeIcons.shop, 'Orders'],
    [FontAwesomeIcons.heart, 'Your favourites'],
    [FontAwesomeIcons.star, 'Restaurant Rewards'],
    [FontAwesomeIcons.wallet, 'Wallet'],
    [FontAwesomeIcons.gift, 'Send a gift'],
    [FontAwesomeIcons.suitcase, 'Help'],
    [FontAwesomeIcons.tag, 'Promotion'],
    [FontAwesomeIcons.ticket, 'Uber Pass'],
    [FontAwesomeIcons.suitcase, 'Deliver with uber'],
    [FontAwesomeIcons.gear, 'Settings'],
    [FontAwesomeIcons.powerOff, 'Sign Out'],
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          children: [
            SizedBox(height: 2.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 3.h,
                  backgroundColor: grey,
                  child: CircleAvatar(
                    child: FaIcon(FontAwesomeIcons.user, size: 3.h - 2),
                    radius: 3.h,
                  ),
                ),
                SizedBox(width: 10.w),
                Text('Users name', style: AppTextStyles.body16),
              ],
            ),
            SizedBox(height: 4.h),
            ListView.builder(
              itemCount: account.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: FaIcon(
                    account[index][0],
                    size: 3.h,
                    color: Colors.black,
                  ),
                  title: Text(account[index][1], style: AppTextStyles.body14),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
