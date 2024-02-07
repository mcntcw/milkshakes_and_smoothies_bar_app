import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Drink extends Equatable {
  final int id;
  final String category;
  final String flavor;
  final String imageUrl;
  final Color color;
  final double basePrice;
  late int? size;
  late double? sweetness;
  late bool? bubble;
  late double? price;

  Drink({
    required this.id,
    required this.category,
    required this.flavor,
    required this.imageUrl,
    required this.color,
    required this.basePrice,
    this.size,
    this.sweetness,
    this.bubble,
    this.price,
  });

  @override
  List<Object?> get props => [id, category, flavor, imageUrl, color, basePrice, size, sweetness, bubble, price];

  static List<Drink> get milkshakes {
    return drinks.where((drink) => drink.category == 'Milkshake').toList();
  }

  static List<Drink> get smoothies {
    return drinks.where((drink) => drink.category == 'Smoothie').toList();
  }

  static List<Drink> drinks = [
    Drink(
      id: 1,
      category: 'Milkshake',
      flavor: 'Avocado',
      imageUrl: 'assets/images/drinks/milkshakes/avocado.png',
      color: const Color(0xFF138A36),
      basePrice: 2.80,
    ),
    Drink(
      id: 2,
      category: 'Milkshake',
      flavor: 'Banana',
      imageUrl: 'assets/images/drinks/milkshakes/banana.png',
      color: const Color(0xFFb89600),
      basePrice: 2.65,
    ),
    Drink(
      id: 3,
      category: 'Milkshake',
      flavor: 'Coconut',
      imageUrl: 'assets/images/drinks/milkshakes/coconut.png',
      color: const Color(0xFF5E4D0A),
      basePrice: 2.95,
    ),
    Drink(
      id: 4,
      category: 'Milkshake',
      flavor: 'Peach',
      imageUrl: 'assets/images/drinks/milkshakes/peach.png',
      color: const Color(0xFFE7AD5D),
      basePrice: 2.75,
    ),
    Drink(
      id: 5,
      category: 'Milkshake',
      flavor: 'Strawberry',
      imageUrl: 'assets/images/drinks/milkshakes/strawberry.png',
      color: const Color(0xFFD93B3B),
      basePrice: 2.50,
    ),
    Drink(
      id: 6,
      category: 'Smoothie',
      flavor: 'Apple',
      imageUrl: 'assets/images/drinks/smoothies/apple.png',
      color: const Color(0xFFFF0000),
      basePrice: 1.50,
    ),
    Drink(
      id: 7,
      category: 'Smoothie',
      flavor: 'Kiwi',
      imageUrl: 'assets/images/drinks/smoothies/kiwi.png',
      color: const Color(0xFF6C8F14),
      basePrice: 1.80,
    ),
    Drink(
      id: 8,
      category: 'Smoothie',
      flavor: 'Pear',
      imageUrl: 'assets/images/drinks/smoothies/pear.png',
      color: const Color(0xFF29871D),
      basePrice: 1.65,
    ),
    Drink(
      id: 9,
      category: 'Smoothie',
      flavor: 'Pomegranate',
      imageUrl: 'assets/images/drinks/smoothies/pomegranate.png',
      color: const Color(0xFFC42F2F),
      basePrice: 1.90,
    ),
    Drink(
      id: 10,
      category: 'Smoothie',
      flavor: 'Watermelon',
      imageUrl: 'assets/images/drinks/smoothies/watermelon.png',
      color: const Color(0xFFC42F63),
      basePrice: 1.75,
    ),
  ];
}
