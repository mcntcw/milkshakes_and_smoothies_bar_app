import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/cart_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/drink_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/models/drink_model.dart';
import 'package:milkshakes_and_smoothies_bar_app/screens/drink_screen.dart';
import 'package:milkshakes_and_smoothies_bar_app/utils/colors.dart';
import 'package:milkshakes_and_smoothies_bar_app/widgets/cart_tile.dart';
import 'package:milkshakes_and_smoothies_bar_app/widgets/drink_tile.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable

    // ignore: unused_local_variable
    final CartController cartController = Get.put(CartController());

    return const Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Banner(),
            SizedBox(height: 10),
            MenuList(),
          ],
        ),
      ),
    );
  }
}

class DrinksList extends StatelessWidget {
  const DrinksList({super.key});

  @override
  Widget build(BuildContext context) {
    final DrinkController drinkController = Get.put(DrinkController());
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Milkshakes',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return DrinkTile(
                index: index,
                drink: Drink.milkshakes[index],
                onClick: () {
                  Get.to(() => DrinkScreen(), arguments: Drink.milkshakes[index], transition: Transition.cupertino);
                  drinkController.resetValues(Drink.milkshakes[index]);
                },
              );
            },
            childCount: Drink.milkshakes.length,
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text(
                  'Smoothies',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return DrinkTile(
                index: index,
                drink: Drink.smoothies[index],
                onClick: () {
                  Get.to(() => DrinkScreen(), arguments: Drink.smoothies[index], transition: Transition.cupertino);
                  drinkController.resetValues(Drink.smoothies[index]);
                },
              );
            },
            childCount: Drink.smoothies.length,
          ),
        ),
      ],
    );
  }
}

class MenuList extends StatelessWidget {
  const MenuList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          color: menuColor,
        ),
        child: const DrinksList(),
      ),
    );
  }
}

class Banner extends StatelessWidget {
  const Banner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(26.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.local_drink_rounded,
            size: 60,
            color: menuColor,
          ),
          CartTile(),
        ],
      ),
    );
  }
}
