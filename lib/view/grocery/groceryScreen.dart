import 'package:flutter/material.dart';
import 'package:ubereats/utils/textStyles.dart';

class GroceryScreen extends StatefulWidget {
  const GroceryScreen({super.key});

  @override
  State<GroceryScreen> createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Account Screen', style: AppTextStyles.body16Bold),
      ),
    );
  }
}
