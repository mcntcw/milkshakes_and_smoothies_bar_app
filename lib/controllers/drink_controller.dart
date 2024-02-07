import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/models/drink_model.dart';
import 'package:milkshakes_and_smoothies_bar_app/widgets/alert_snackbar.dart';

class DrinkController extends GetxController {
  var selectedSize = 0.obs;
  var selectedBubble = false.obs;
  var selectedSweetness = 0.0.obs;
  var numberOfDrinks = 0.obs;
  var totalPrice = 0.0.obs;
  var additionalPrice = 0.0.obs;

  void setSelectedSize(int size, Drink drink) {
    selectedSize.value = size;

    if (size == 330) {
      additionalPrice.value = 1.0;
    } else if (size == 500) {
      additionalPrice.value = 1.50;
    } else {
      additionalPrice.value = 0.0;
    }
    numberOfDrinks.value = 1;
  }

  void setBubbles(Drink drink) {
    selectedBubble.value = !selectedBubble.value;
  }

  void setSweetness(double sliderValue, Drink drink) {
    selectedSweetness.value = sliderValue;
  }

  void increaseDrinks(Drink drink, BuildContext context) {
    if (selectedSize.value != 0) {
      numberOfDrinks.value++;
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        AlertSnackBar(
          context: context,
          drink: drink,
          message: 'Choose size of the drink',
        ),
      );
    }
  }

  void decreaseDrinks() {
    if (numberOfDrinks.value > 0) {
      numberOfDrinks.value--;
    }
  }

  double setTotalPrice(Drink drink) {
    double pearlCost = selectedBubble.value ? 1.0 : 0.0;
    double subTotalPrice = drink.basePrice + additionalPrice.value + pearlCost;
    totalPrice.value = subTotalPrice * numberOfDrinks.value;
    return totalPrice.value;
  }

  void resetValues(Drink drink) {
    selectedSize.value = 0;
    selectedBubble.value = false;
    selectedSweetness.value = 0.0;
    numberOfDrinks.value = 0;
    totalPrice.value = 0.0;
    additionalPrice.value = 0.0;
  }
}
