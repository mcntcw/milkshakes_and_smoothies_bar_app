// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/drink_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/models/drink_model.dart';
import 'package:milkshakes_and_smoothies_bar_app/widgets/alert_snackbar.dart';
import 'package:milkshakes_and_smoothies_bar_app/widgets/remove_dialog.dart';

class CartController extends GetxController {
  final DrinkController drinkController = Get.put(DrinkController());

  final _cart = {}.obs;

  void addToCart(Drink drink, BuildContext context) {
    double pearlCost = drinkController.selectedBubble.value ? 1.0 : 0.0;
    if (drinkController.selectedSize.value == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        AlertSnackBar(
          context: context,
          drink: drink,
          message: 'Choose size of the drink',
        ),
      );
    } else {
      Drink newDrink = Drink(
        id: drink.id,
        category: drink.category,
        flavor: drink.flavor,
        imageUrl: drink.imageUrl,
        color: drink.color,
        basePrice: drink.basePrice,
        size: drinkController.selectedSize.value,
        bubble: drinkController.selectedBubble.value,
        sweetness: drinkController.selectedSweetness.value,
        price: drink.basePrice + drinkController.additionalPrice.value + pearlCost,
      );

      if (_cart.containsKey(newDrink)) {
        _cart[newDrink] += drinkController.numberOfDrinks.value;
        ScaffoldMessenger.of(context).showSnackBar(
          AlertSnackBar(
            context: context,
            drink: drink,
            message: 'Successfully added to cart',
          ),
        );
      } else {
        _cart[newDrink] = drinkController.numberOfDrinks.value;
        ScaffoldMessenger.of(context).showSnackBar(
          AlertSnackBar(
            context: context,
            drink: drink,
            message: 'Successfully added to cart',
          ),
        );
      }
    }
  }

  get cart => _cart;

  void increaseItem(Drink drink) {
    if (_cart.containsKey(drink)) {
      _cart[drink] = _cart[drink]! + 1;
    }
  }

  void decreaseItem(Drink drink, BuildContext context) {
    if (_cart.containsKey(drink)) {
      if (_cart[drink]! == 1) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return RemoveDialog(
                drink: drink,
              );
            });
      } else {
        _cart[drink] = _cart[drink]! - 1;
      }
    }
  }

  void removeItem(Drink drink, BuildContext context) {
    Get.back();
    _cart.remove(drink);
  }

  void choosePaymentMethod() {
    _cart.forEach((key, value) {
      print('Key: $key, Value: $value');
    });
  }

  double itemSubtotal(Drink drink) {
    return drink.price! * _cart[drink];
  }

  double get totalItemSubtotal {
    double total = 0.0;
    _cart.forEach((drink, quantity) {
      total += drink.price! * quantity;
    });
    return total;
  }
}
