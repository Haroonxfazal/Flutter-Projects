import 'package:flutter/material.dart';
import 'package:meals_app/data/dummy_data.dart';
import 'package:meals_app/screens/categories.dart';
import 'package:meals_app/screens/filters.dart';
import 'package:meals_app/screens/meals.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/meals_provider.dart';
import 'package:meals_app/provider/favourites_provider.dart';
import 'package:meals_app/provider/filters_provider.dart';

class Tabs extends ConsumerStatefulWidget {
  const Tabs({super.key});

  @override
  ConsumerState<Tabs> createState() {
    return _TabsState();
  }
}

class _TabsState extends ConsumerState<Tabs> {
  int activePageIndex = 0;
  String activeTitle = 'Categories';
  // final List<Meal> favoutitesList = [];
  Widget? activeScreen;
  @override
  void initState() {
    activeScreen = const Categories(
        availableMeals: dummyMeals); // onFavouriteSelect: _addFavouriteMeal,

    super.initState();
  }

  // void _addFavouriteMeal(Meal meal) {
  //   final mealExists = favoutitesList.contains(meal);

  //   if (mealExists) {
  //     setState(() {
  //       favoutitesList.remove(meal);
  //     });
  //     _favouriteMessagePopup('Removed from favourites');
  //   } else {
  //     setState(() {
  //       favoutitesList.add(meal);
  //     });
  //     _favouriteMessagePopup('Marked as favourite');
  //   }
  // }

  void _setPageIndex(int index) {
    setState(() {
      activePageIndex = index;
    });
  }

  void _onDrawerScreenTap(String identifier) {
    Navigator.pop(context);
    if (identifier == 'filters') {
      Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => const Filters()));

      // setState(() {
      //   filters = result ?? kInitialFilters;
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);
    final activeFilters = ref.watch(filtersProvider);

    List<Meal> availableMeals = meals.where((meal) {
      if (!meal.isGlutenFree && activeFilters[FilterStatesEnum.glutenFree]!) {
        return false;
      }
      if (!meal.isLactoseFree && activeFilters[FilterStatesEnum.lactoseFree]!) {
        return false;
      }
      if (!meal.isVegan && activeFilters[FilterStatesEnum.vegan]!) {
        return false;
      }
      if (!meal.isVegetarian && activeFilters[FilterStatesEnum.vegetarian]!) {
        return false;
      }
      return true;
    }).toList();

    final List<Meal> favouritesList = ref.watch(favouritesProvider);
    if (activePageIndex == 0) {
      activeScreen = Categories(
        // onFavouriteSelect: _addFavouriteMeal,
        availableMeals: availableMeals,
      );
      activeTitle = 'Categories';
    } else {
      activeScreen = Meals(
        meals: favouritesList,
        // onFavouriteSelect: _addFavouriteMeal,
      );
      activeTitle = 'Your Favourites';
    }

    return Scaffold(
      drawer: MainDrawer(
        onScreenSelect: _onDrawerScreenTap,
      ),
      appBar: AppBar(
        title: Text(activeTitle),
      ),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _setPageIndex,
        currentIndex: activePageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favourites'),
        ],
      ),
    );
  }
}
