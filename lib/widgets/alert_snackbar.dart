import 'package:flutter/material.dart';
import 'package:milkshakes_and_smoothies_bar_app/models/drink_model.dart';

class AlertSnackBar extends SnackBar {
  AlertSnackBar({
    super.key,
    required BuildContext context,
    required Drink drink,
    required String message,
  }) : super(
          backgroundColor: drink.color,
          duration: const Duration(seconds: 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36),
              topRight: Radius.circular(36),
            ),
          ),
          content: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Center(
              child: Text(
                message,
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white.withOpacity(0.8),
                ),
              ),
            ),
          ),
        );
}
