import 'package:flutter/material.dart';
import 'package:ubereats/utils/colors.dart';
import 'package:ubereats/utils/textStyles.dart';
import 'package:sizer/sizer.dart';

class BrowseScreen extends StatefulWidget {
  const BrowseScreen({super.key});

  @override
  State<BrowseScreen> createState() => _BrowseScreenState();
}

class _BrowseScreenState extends State<BrowseScreen> {
  List categories = [
    ['assets/images/categories/alcohol.png', 'Alcohol'],
    ['assets/images/categories/asian.png', 'Asian'],
    ['assets/images/categories/american.png', 'American'],
    ['assets/images/categories/burger.png', 'Burger'],
    ['assets/images/categories/carrebian.png', 'Carrebian'],
    ['assets/images/categories/chinese.png', 'Chinese'],
    ['assets/images/categories/convenience.png', 'Convenience'],
    ['assets/images/categories/dessert.png', 'Dessert'],
    ['assets/images/categories/fastFood.png', 'Fast Food'],
    ['assets/images/categories/flower.png', 'Flower'],
    ['assets/images/categories/grocery.png', 'Grocery'],
    ['assets/images/categories/french.png', 'French'],
    ['assets/images/categories/grocery.png', 'Grocery'],
    ['assets/images/categories/halal.png', 'Halal'],
    ['assets/images/categories/icecream.png', 'Ice cream'],
    ['assets/images/categories/indian.png', 'Indian'],
    ['assets/images/categories/petSupplies.png', 'Pet Supplies'],
    ['assets/images/categories/retails.png', 'Retails'],
    ['assets/images/categories/ride.png', 'Ride'],
    ['assets/images/categories/takeout.png', 'Takeout'],
  ];
  String img = 'assets/images/categories/food.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        children: [
          SizedBox(height: 2.h),
          Text(
            'All Categories',
            style: AppTextStyles.body16,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 3.h),
          GridView.builder(
            itemCount: categories.length,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 1,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
            ),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image(image: AssetImage(img)),
                  Expanded(
                    child: Image(image: AssetImage(categories[index][0])),
                  ),
                  SizedBox(height: 0.5.h),
                  Text(categories[index][1], style: AppTextStyles.body14),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
