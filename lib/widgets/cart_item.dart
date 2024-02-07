import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/cart_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/models/drink_model.dart';
import 'package:milkshakes_and_smoothies_bar_app/utils/colors.dart';
import 'package:milkshakes_and_smoothies_bar_app/widgets/remove_dialog.dart';

class CartItem extends StatelessWidget {
  final int itemCount;
  final Drink drink;

  const CartItem({super.key, required this.drink, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Slidable(
      direction: Axis.horizontal,
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            foregroundColor: Colors.white70,
            onPressed: (context) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return RemoveDialog(
                      drink: drink,
                    );
                  });
            },
            icon: Icons.delete,
            backgroundColor: Colors.transparent,
            borderRadius: const BorderRadius.only(bottomRight: Radius.circular(14), topRight: Radius.circular(14)),
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
        padding: const EdgeInsets.all(8),
        decoration: const BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.all(
            Radius.circular(14),
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: drink.color,
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Image.asset(
                drink.imageUrl,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    drink.flavor,
                    style: TextStyle(
                      fontSize: 22,
                      color: backgroundColor.withOpacity(0.8),
                    ),
                  ),
                  Row(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/gui/size.png',
                            height: MediaQuery.of(context).size.height * 0.02,
                            color: backgroundColor.withOpacity(0.8),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${drink.size} ml',
                            style: TextStyle(
                              fontSize: 14,
                              color: backgroundColor.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 8),
                      drink.bubble == true
                          ? Row(
                              children: [
                                Image.asset(
                                  'assets/images/gui/bubble.png',
                                  height: MediaQuery.of(context).size.height * 0.02,
                                  color: backgroundColor.withOpacity(0.8),
                                ),
                                const SizedBox(width: 8),
                              ],
                            )
                          : const SizedBox(),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/gui/sweetness.png',
                            height: MediaQuery.of(context).size.height * 0.02,
                            color: backgroundColor.withOpacity(0.8),
                          ),
                          const SizedBox(width: 2),
                          Text(
                            '${drink.sweetness?.toStringAsFixed(0)}%',
                            style: TextStyle(
                              fontSize: 14,
                              color: backgroundColor.withOpacity(0.6),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    '\$${cartController.itemSubtotal(drink).toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      color: backgroundColor.withOpacity(0.6),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    cartController.increaseItem(drink);
                  },
                  icon: Icon(
                    Icons.add,
                    color: backgroundColor.withOpacity(0.8),
                    size: 14,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: backgroundColor.withOpacity(0.6),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  child: Text(
                    '$itemCount',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    cartController.decreaseItem(drink, context);
                  },
                  icon: Icon(
                    Icons.remove,
                    color: backgroundColor.withOpacity(0.8),
                    size: 14,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
