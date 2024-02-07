import 'package:flutter/material.dart';
import 'package:milkshakes_and_smoothies_bar_app/models/drink_model.dart';

// ignore: must_be_immutable
class DrinkTile extends StatelessWidget {
  final Drink drink;
  final int index;
  VoidCallback onClick;
  DrinkTile({super.key, required this.index, required this.drink, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Stack(
        children: [
          SizedBox(
            height: 300,
            width: 300,
            child: Center(
              child: Container(
                padding: const EdgeInsets.all(14),
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  color: drink.color.withOpacity(0.8),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      drink.flavor,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                            text: '\$${drink.basePrice}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          const TextSpan(
                            text: '/200 ml',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Positioned(
            right: 25,
            top: 30,
            child: Icon(
              Icons.keyboard_arrow_right,
              size: 34,
              color: Colors.white70,
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            child: Image.asset(
              drink.imageUrl,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}
