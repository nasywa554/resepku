import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:resepku/Colors/colors.dart';
import 'package:resepku/Models/categories_recipe.dart';
import 'package:resepku/Models/recipe_model.dart';
import 'package:resepku/Views/items_details_screens.dart';
import 'package:resepku/views/explore_page.dart';
import 'package:resepku/views/favorite_recipes.dart';
import 'package:resepku/views/profile_page.dart';

class HomeScreenRecipe extends StatefulWidget {
  final String username;

  static String tag = 'home-page';

  HomeScreenRecipe({required this.username});

  @override
  _HomeScreenRecipeState createState() => _HomeScreenRecipeState();
}

class _HomeScreenRecipeState extends State<HomeScreenRecipe> {
  int selectedIndex = 0; // This tracks the selected index for the menu items
  int selectedPage =
      0; // This tracks the selected page for the bottom navigation

  List<String> menuItems = [
    'Makanan Utama',
    'Lauk Pauk',
    'Sup & Kuah',
    'Camilan',
    'Minuman',
    'Desserts',
  ]; // Define menu items
  List<IconData> icons = [
    Iconsax.home1,
    Icons.search,
    Iconsax.heart,
    Icons.person_outline_rounded,
  ];

  // This function controls the content based on the selected bottom navigation page
  Widget _getPageContent() {
    switch (selectedPage) {
      case 0:
        return Column(
          children: [
            const SizedBox(height: 30),
            mySearchField(),
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Menu Populer",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  Text("Lihat Semua",
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.green,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
            const SizedBox(height: 20),
            popularMenuItems(), // Call the method that shows the popular menu items
            const SizedBox(height: 20),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(recipeItems.length, (index) {
                  final recipe = recipeItems[index];
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.only(left: 20, right: 10)
                        : const EdgeInsets.only(right: 10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) =>
                                  ItemsDetailsScreens(recipeItems: recipe)),
                        );
                      },
                      child: Container(
                        height: 260,
                        width: MediaQuery.of(context).size.width / 2.45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage(recipe.image),
                              fit: BoxFit.cover),
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
                                  color:
                                      recipe.fav ? Colors.red : Colors.black45),
                              child: const Icon(Iconsax.heart,
                                  color: Colors.white, size: 18),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.black45),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                          child: Text(recipe.name,
                                              maxLines: 1,
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  height: 0,
                                                  color: Colors.white,
                                                  fontWeight:
                                                      FontWeight.w500))),
                                      Row(
                                        children: [
                                          const Icon(Icons.star,
                                              color: Colors.amberAccent,
                                              size: 18),
                                          Text("${recipe.rate}",
                                              style: const TextStyle(
                                                  height: 0,
                                                  color: Colors.white)),
                                        ],
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 3),
                                  Text("1 Bowl (${recipe.weight}g)",
                                      style: const TextStyle(
                                          color: Colors.white70,
                                          fontSize: 12,
                                          height: 0)),
                                  const SizedBox(height: 3),
                                  Text("${recipe.calorie} Kkal | 25% AKG",
                                      style: const TextStyle(
                                          color: Colors.white70)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 40),
            // const Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 20),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text("Categories",
            //           style:
            //               TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            //       Text("See all",
            //           style: TextStyle(
            //               fontSize: 14,
            //               color: Colors.green,
            //               fontWeight: FontWeight.w500)),
            //     ],
            //   ),
            // ),
            // const SizedBox(height: 10),
            // categoryItems(),
            // Padding(
            //   padding: const EdgeInsets.all(40),
            //   child: Row(
            //     children: [
            //       Container(
            //         height: 40,
            //         width: 40,
            //         decoration: const BoxDecoration(
            //           shape: BoxShape.circle,
            //           image: DecorationImage(
            //             image: NetworkImage(
            //                 "https://id.pinterest.com/pin/qually-di-2024--700591285811967869/"),
            //             fit: BoxFit.cover,
            //           ),
            //         ),
            //       ),
            //       const SizedBox(width: 20),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: const [
            //           Text("Qually",
            //               style: TextStyle(
            //                   fontWeight: FontWeight.bold,
            //                   color: Colors.black,
            //                   fontSize: 14)),
            //           Text("Expert Chef",
            //               style:
            //                   TextStyle(color: Colors.black45, fontSize: 12)),
            //         ],
            //       )
            //     ],
            //   ),
            // ),
          ],
        );
      case 1:
        return ExplorePage(username: widget.username);
      case 2:
        return FavoriteRecipes(username: widget.username);
      case 3:
        return ProfilePage(username: widget.username);
      default:
        return Center(child: Text("Page not found"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:
            _getPageContent(), // This will display the page content based on the selected tab
      ),
      bottomSheet: Container(
        height: 80,
        decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black12, spreadRadius: 1)]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(icons.length, (index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedPage =
                      index; // Update selectedPage when an icon is tapped
                });
              },
              child: SizedBox(
                height: 40,
                width: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(icons[index],
                        color:
                            index == selectedPage ? Colors.green : Colors.grey,
                        size: 28),
                    index == selectedPage
                        ? Container(
                            height: 3,
                            width: 30,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.green),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            );
          }),
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
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
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

  // Method to display the categories of recipes
  SingleChildScrollView categoryItems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          recipeCategory.length,
          (index) => Padding(
            padding: const EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                // Handle category selection
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.greenAccent,
                ),
                child: Text(
                  recipeCategory[index].image,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Search field widget
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
}
