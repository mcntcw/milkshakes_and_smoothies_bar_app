import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milkshakes_and_smoothies_bar_app/controllers/cart_controller.dart';
import 'package:milkshakes_and_smoothies_bar_app/utils/colors.dart';
import 'package:milkshakes_and_smoothies_bar_app/widgets/cart_item.dart';
import 'package:milkshakes_and_smoothies_bar_app/widgets/checkout_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CartController cartController = Get.find();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 39,
            ),
          ),
          const SliverToBoxAdapter(
            child: StartTextAndButton(),
          ),
          CartList(cartController: cartController),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CheckoutButton(),
            ),
          ),
        ],
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({
    super.key,
    required this.cartController,
  });

  final CartController cartController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return CartItem(
              drink: cartController.cart.keys.elementAt(index),
              itemCount: cartController.cart[cartController.cart.keys.elementAt(index)]!,
            );
          },
          childCount: cartController.cart.length,
        ),
      ),
    );
  }
}

class StartTextAndButton extends StatelessWidget {
  const StartTextAndButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 26),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.keyboard_arrow_left,
              color: menuColor,
              size: 50,
            ),
          ),
          const Text(
            'Cart',
            style: TextStyle(
              fontSize: 36,
              color: menuColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
