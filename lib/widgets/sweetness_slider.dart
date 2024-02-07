import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/drink_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/models/drink_model.dart';

class SweetnessSlider extends StatelessWidget {
  final Drink drink;
  const SweetnessSlider({super.key, required this.drink});

  @override
  Widget build(BuildContext context) {
    final DrinkController drinkController = Get.find();
    return Obx(
      () => Align(
        alignment: const Alignment(-1.12, 0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.45,
          child: SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 20.0,
              trackShape: const RoundedRectSliderTrackShape(),
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10.8, elevation: 0),
            ),
            child: Slider(
              value: drinkController.selectedSweetness.value,
              onChanged: (value) {
                drinkController.setSweetness(value, drink);
              },
              min: 0.0,
              max: 100.0,
              divisions: 4,
              thumbColor: drink.color,
              activeColor: drink.color,
              inactiveColor: drink.color.withOpacity(0.2),
              label: '${drinkController.selectedSweetness.value.toStringAsFixed(0)}%',
            ),
          ),
        ),
      ),
    );
  }
}
