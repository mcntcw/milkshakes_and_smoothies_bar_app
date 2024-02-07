import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/cart_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/utils/colors.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Obx(
      () => InkWell(
        onTap: () {
          cartController.choosePaymentMethod();
        },
        child: Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(12),
          decoration: const BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          child: Row(
            children: [
              Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  decoration: BoxDecoration(
                    color: backgroundColor.withOpacity(0.8),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(60),
                    ),
                  ),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: 'Total: ',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        TextSpan(
                          text: '\$${cartController.totalItemSubtotal.toStringAsFixed(2)}',
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                            fontWeight: FontWeight.bold, // Pogrubienie dla wartości
                          ),
                        ),
                      ],
                    ),
                  )),
              const Expanded(child: SizedBox()),
              Text(
                'Checkout',
                style: TextStyle(
                  color: backgroundColor.withOpacity(0.8),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/images/gui/wallet.png',
                height: MediaQuery.of(context).size.height * 0.03,
                color: backgroundColor.withOpacity(0.8),
              ),
              const SizedBox(width: 10),
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
