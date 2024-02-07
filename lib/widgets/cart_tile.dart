import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/cart_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/screens/cart_screen.dart';
import 'package:milkshakes_and_smoothies_bar_app/utils/colors.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Obx(
      () => InkWell(
        onTap: () {
          Get.to(() => const CartScreen(), transition: Transition.cupertino);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          decoration: const BoxDecoration(
            color: menuColor,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Icons.shopping_bag,
                color: backgroundColor.withOpacity(0.8),
                size: 36,
              ),
              Text(
                '\$${cartController.totalItemSubtotal.toStringAsFixed(2)}',
                style: TextStyle(
                  color: backgroundColor.withOpacity(0.8),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                size: 34,
                color: backgroundColor.withOpacity(0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
