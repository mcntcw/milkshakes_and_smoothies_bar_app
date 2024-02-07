import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/drink_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/models/drink_model.dart';
import 'package:milkshakes_and_smoothies_bar_app/utils/colors.dart';

// ignore: must_be_immutable
class SizeTag extends StatelessWidget {
  final DrinkController drinkController = Get.find();
  final Drink drink;
  final double priceAddition;
  final int size;

  SizeTag({
    super.key,
    required this.size,
    required this.priceAddition,
    required this.drink,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        drinkController.setSelectedSize(size, drink);
      },
      child: Obx(
        () => Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              margin: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                color: drinkController.selectedSize.value == size ? drink.color : menuColor,
                border: Border.all(
                  color: drink.color,
                  width: 3,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(60),
                ),
              ),
              child: Center(
                child: Text(
                  '$size ml',
                  style: TextStyle(
                    fontSize: 16,
                    color: drinkController.selectedSize.value == size ? menuColor : drink.color,
                  ),
                ),
              ),
            ),
            Text(
              '\$${(drink.basePrice + priceAddition).toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16,
                color: drink.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
