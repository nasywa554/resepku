import 'package:flutter/material.dart';
import 'package:resepku/models/ingredients.dart';

List<String> menuItems = [
  'Breakfast',
  'Lunch',
  'Dinner',
  'Snack',
  'Cheat Menu',
];

// Ingredients Model
class Ingredients {
  final Color color;
  final String name;
  final String image;

  Ingredients({
    required this.color,
    required this.name,
    required this.image,
  });
}

class RecipeItems {
  final String image, name, woner, wonerName, reviews;
  final int carb;
  final double rate;
  final int calorie, fat, protein, weight;
  final bool fav;
  final List<Ingredients> ingredients;

  RecipeItems({
    required this.image,
    required this.wonerName,
    required this.woner,
    required this.name,
    required this.fav,
    required this.reviews,
    required this.rate,
    required this.calorie,
    required this.fat,
    required this.weight,
    required this.protein,
    required this.carb,
    required this.ingredients,
  });
}

List<RecipeItems> recipeItems = [
  RecipeItems(
    woner: 'assets/mira.png',
    wonerName: "Mira",
    image: 'assets/nasi goreng.jpg',
    name: 'Nasi Goreng',
    rate: 4,
    calorie: 320,
    reviews: "100",
    weight: 300,
    fat: 16,
    protein: 12,
    fav: true,
    carb: 30,
    ingredients: [
      Ingredients(
        color: const Color(0xffffe9b2),
        name: 'Bawang Merah',
        image: 'assets/bawang_merah.png',
      ),
      Ingredients(
        color: const Color(0xffddd0a4),
        name: 'Bawang Putih',
        image: 'assets/bawang_putih.png',
      ),
      Ingredients(
        color: const Color(0xffd8d8d8),
        name: 'Garam',
        image: 'assets/garam.png',
      ),
      Ingredients(
        color: const Color(0xffd8d8d8),
        name: 'Kecap',
        image: 'assets/kecap.jpg',
      ),
      Ingredients(
        color: const Color(0xffd8d8d8),
        name: 'Nasi',
        image: 'assets/nasi.png',
      ),
    ],
  ),
  RecipeItems(
    woner: "assets/indah.png",
    wonerName: "Indah",
    image: 'assets/soto_betawi.jpg',
    name: 'Soto Betawi',
    rate: 4,
    calorie: 2200,
    reviews: "33",
    weight: 200,
    fat: 30,
    protein: 15,
    fav: false,
    carb: 15,
    ingredients: [
      Ingredients(
        color: const Color(0xfff4cfcc),
        name: 'Kaldu Jamur',
        image: 'assets/kaldu_jamur.png',
      ),
      Ingredients(
        color: const Color(0xffb8efd0),
        name: 'Jeruk Nipis',
        image: 'assets/jeruk_nipis.jpg',
      ),
      Ingredients(
        color: const Color(0xffffe9b2),
        name: 'Daun Jeruk',
        image: 'assets/daun_jeruk.png',
      ),
    ],
  ),
  RecipeItems(
    woner: "assets/yaya.png",
    wonerName: "Yaya",
    image: 'assets/lapis legit.jpg',
    name: 'Lapis Legit',
    rate: 4.3,
    weight: 250,
    calorie: 240,
    reviews: "100",
    fav: false,
    fat: 30,
    protein: 15,
    carb: 15,
    ingredients: [
      Ingredients(
        color: const Color(0xfff4cfcc),
        name: 'Gula',
        image: 'assets/gula.jpg',
      ),
      Ingredients(
        color: const Color(0xffb8efd0),
        name: 'Mentega',
        image: 'assets/mentega.png',
      ),
      Ingredients(
        color: const Color(0xffffe9b2),
        name: 'Telur',
        image: 'assets/telur.png',
      ),
    ],
  ),
  RecipeItems(
    woner: "assets/putri.png",
    wonerName: "Putri",
    image: 'assets/onde-onde.jpg',
    name: 'Onde-onde',
    rate: 5.0,
    fav: true,
    weight: 200,
    calorie: 320,
    reviews: "100",
    fat: 30,
    protein: 15,
    carb: 15,
    ingredients: [
      Ingredients(
        color: const Color(0xfff4cfcc),
        name: 'Gula',
        image: 'assets/gula.jpg',
      ),
      Ingredients(
        color: const Color(0xffb8efd0),
        name: 'Tepung Ketan',
        image: 'assets/tepung_ketan.jpg',
      ),
      Ingredients(
        color: const Color(0xffffe9b2),
        name: 'Wijen',
        image: 'assets/wijen.png',
      ),
    ],
  ),
  RecipeItems(
    woner: "assets/putri.png",
    wonerName: "Putri",
    image: 'assets/rendang.jpg',
    name: 'Rendang',
    rate: 5.0,
    fav: true,
    weight: 200,
    calorie: 320,
    reviews: "100",
    fat: 30,
    protein: 15,
    carb: 15,
    ingredients: [
      Ingredients(
        color: const Color(0xfff4cfcc),
        name: 'Bawang Merah',
        image: 'assets/bawang_merah.png',
      ),
      Ingredients(
        color: const Color(0xffb8efd0),
        name: 'Bawang Putih',
        image: 'assets/bawang_putih.jpg',
      ),
      Ingredients(
        color: const Color(0xffffe9b2),
        name: 'Daging Sapi',
        image: 'assets/daging_sapi.png',
      ),
      Ingredients(
        color: const Color(0xffffe9b2),
        name: 'Kemiri',
        image: 'assets/kemiri.png',
      ),
      Ingredients(
        color: const Color(0xffffe9b2),
        name: 'Lengkuas',
        image: 'assets/lengkuas.png',
      ),
    ],
  ),
];
