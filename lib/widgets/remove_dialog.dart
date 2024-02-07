import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/cart_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/models/drink_model.dart';
import 'package:milkshakes_and_smoothies_bar_app/utils/colors.dart';

class RemoveDialog extends StatelessWidget {
  final Drink drink;
  const RemoveDialog({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return AlertDialog(
      backgroundColor: menuColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      content: const Text(
        "Are you sure?",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: backgroundColor,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ),
      contentPadding: const EdgeInsets.all(40),
      actions: [
        ButtonBar(
          children: [
            TextButton(
              onPressed: () {
                Get.back();
              },
              child: const Text(
                'No',
                style: TextStyle(
                  fontSize: 22,
                  color: backgroundColor,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                cartController.removeItem(drink, context);
              },
              child: Container(
                padding: const EdgeInsets.only(top: 6, bottom: 6, left: 18, right: 18),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(60),
                ),
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
