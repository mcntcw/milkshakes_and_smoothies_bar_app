import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/models/drink_model.dart';
import 'package:milkshakes_and_smoothies_bar_app/utils/colors.dart';
import 'package:milkshakes_and_smoothies_bar_app/widgets/add_to_cart_bar.dart';
import 'package:milkshakes_and_smoothies_bar_app/widgets/bubble_tag.dart';
import 'package:milkshakes_and_smoothies_bar_app/widgets/size_tag.dart';
import 'package:milkshakes_and_smoothies_bar_app/widgets/sweetness_slider.dart';

class DrinkScreen extends StatelessWidget {
  final Drink drink = Get.arguments;
  DrinkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: menuColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            ImageAndBackButton(drink: drink),
            ProductDescription(drink: drink),
          ],
        ),
      ),
    );
  }
}

class ProductDescription extends StatelessWidget {
  final Drink drink;
  const ProductDescription({
    super.key,
    required this.drink,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                drink.flavor,
                style: const TextStyle(
                  fontSize: 36,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                drink.category.toLowerCase(),
                style: TextStyle(
                  fontSize: 36,
                  color: drink.color.withAlpha(150),
                ),
              ),
            ],
          ),
          Text(
            'Choose size:',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              SizeTag(
                drink: drink,
                size: 200,
                priceAddition: 0,
              ),
              SizeTag(
                drink: drink,
                size: 330,
                priceAddition: 1,
              ),
              SizeTag(
                drink: drink,
                size: 500,
                priceAddition: 1.5,
              ),
            ],
          ),
          Text(
            'Choose boba pearls:',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          const SizedBox(height: 5),
          BubbleTag(drink: drink),
          Text(
            'Choose sweetness:',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
          SweetnessSlider(drink: drink),
          const SizedBox(height: 20),
          AddToCartBar(drink: drink),
        ],
      ),
    );
  }
}

class ImageAndBackButton extends StatelessWidget {
  final Drink drink;
  const ImageAndBackButton({
    super.key,
    required this.drink,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(80),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            color: drink.color,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            ),
          ),
          child: Image.asset(
            drink.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          top: 65,
          left: 0,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white.withOpacity(0.8),
              size: 50,
            ),
          ),
        ),
      ],
    );
  }
}
