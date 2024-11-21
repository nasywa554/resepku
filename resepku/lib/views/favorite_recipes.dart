import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:resepku/Models/categories_recipe.dart';
import 'package:resepku/Models/recipe_model.dart';

class FavoriteRecipes extends StatelessWidget {
  final String username;
  int selectedIndex = 0;

  FavoriteRecipes({required this.username});

  List<String> menuItems = ['Resepmu', 'Tersimpan', 'Sudah Dibuat', 'Favorite'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("Favorite Recipe")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mySearchField(),
            const SizedBox(height: 40),
            popularMenuItems(),

            // Use GridView for two-column layout
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Set the number of columns to 2
                  crossAxisSpacing: 10, // Space between columns
                  mainAxisSpacing: 10, // Space between rows
                  childAspectRatio: 1, // Adjust the aspect ratio of the items
                ),
                itemCount: recipeItems.length, // Total number of items
                itemBuilder: (context, index) {
                  final recipe = recipeItems[index];
                  return GestureDetector(
                    onTap: () {
                      // Handle card tap action here
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(recipe.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: recipe.fav ? Colors.red : Colors.black45,
                            ),
                            child: const Icon(
                              Iconsax.heart,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black45,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                        child: Text(
                                      recipe.name,
                                      maxLines: 1,
                                      style: const TextStyle(
                                          fontSize: 16,
                                          height: 0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    )),
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.star,
                                          color: Colors.amberAccent,
                                          size: 18,
                                        ),
                                        Text(
                                          "${recipe.rate}",
                                          style: const TextStyle(
                                              height: 0, color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  "1 Bowl (${recipe.weight}g)",
                                  style: const TextStyle(
                                      color: Colors.white70, fontSize: 12),
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  "${recipe.calorie} Kkal | 25% AKG",
                                  style: const TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mySearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey.shade200,
        ),
        child: TextField(
          decoration: InputDecoration(
            hintText: 'Search for recipes...',
            border: InputBorder.none,
            prefixIcon: Icon(Icons.search, color: Colors.green),
            contentPadding: const EdgeInsets.all(15),
          ),
        ),
      ),
    );
  }

  // Method to display the popular menu items horizontally
  SingleChildScrollView popularMenuItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          menuItems.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      selectedIndex == index ? Colors.green : Colors.white,
                      selectedIndex == index
                          ? Colors.greenAccent
                          : Colors.white,
                    ],
                  ),
                ),
                child: Text(
                  menuItems[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: selectedIndex == index
                        ? FontWeight.bold
                        : FontWeight.w500,
                    color: selectedIndex == index ? Colors.white : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
