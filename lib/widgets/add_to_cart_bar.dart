import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/cart_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/drink_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/models/drink_model.dart';

class AddToCartBar extends StatelessWidget {
  final Drink drink;
  const AddToCartBar({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    final DrinkController drinkController = Get.find();
    final CartController cartController = Get.find();
    return Obx(
      () => Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 6),
        margin: const EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
          color: drink.color,
          borderRadius: const BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                '\$${drinkController.setTotalPrice(drink).toStringAsFixed(2)}',
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 26,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              decoration: const BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.all(
                  Radius.circular(60),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      drinkController.decreaseDrinks();
                    },
                    icon: Icon(
                      Icons.remove,
                      color: drink.color.withOpacity(0.8),
                      size: 24,
                    ),
                  ),
                  Text(
                    drinkController.numberOfDrinks.value.toString(),
                    style: TextStyle(
                      color: drink.color.withOpacity(0.8),
                      fontSize: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      drinkController.increaseDrinks(drink, context);
                    },
                    icon: Icon(
                      Icons.add,
                      color: drink.color.withOpacity(0.8),
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {
                cartController.addToCart(drink, context);
              },
              icon: const Icon(
                Icons.shopping_bag,
                color: Colors.white70,
                size: 40,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
