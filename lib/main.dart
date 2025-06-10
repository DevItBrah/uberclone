import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ubereats/controller/services/provider/authProvider.dart';
import 'package:ubereats/view/authScreen/mobileLoginScren.dart';
import 'package:sizer/sizer.dart';
import 'package:ubereats/view/bottomNavigationBar.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:ubereats/view/singInLoginScreen/signInLoginScreen.dart';
import 'firebase_options.dart';

// ...

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const UberEarts());
}

class UberEarts extends StatelessWidget {
  const UberEarts({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, _, __) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => MobileAuthProvider()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const BottomNavExample(),
          ),
        );
      },
    );
  }
}
