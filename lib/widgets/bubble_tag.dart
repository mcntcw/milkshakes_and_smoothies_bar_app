import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/drink_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/models/drink_model.dart';

class BubbleTag extends StatelessWidget {
  final Drink drink;
  const BubbleTag({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    final DrinkController drinkController = Get.find();
    return GestureDetector(
      onTap: () {
        drinkController.setBubbles(drink);
      },
      child: Obx(
        () => Container(
          width: MediaQuery.of(context).size.width * 0.24,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
            color: drinkController.selectedBubble.value == true ? drink.color : drink.color.withOpacity(0.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(60),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                'assets/images/gui/bubble.png',
                height: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
              const SizedBox(width: 10),
              drinkController.selectedBubble.value == false
                  ? const Text(
                      '+ \$1',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )
                  : const Icon(
                      Icons.done,
                      size: 20,
                      color: Colors.white,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
