import 'package:flutter/material.dart';
import 'package:ubereats/view/authScreen/mobileLoginScren.dart';
import 'package:sizer/sizer.dart';
import 'package:ubereats/view/bottomNavigationBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, _, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const BottomNavExample(),
        );
      },
    );
  }
}
