import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/model/meal.dart';

class FavouritesProviderNotifier extends StateNotifier<List<Meal>> {
  FavouritesProviderNotifier() : super([]);

  bool toggleMealFavouriteStatus(Meal meal) {
    final mealexists = state.contains(meal);
    if (mealexists) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouritesProvider =
    StateNotifierProvider<FavouritesProviderNotifier, List<Meal>>((ref) {
  return FavouritesProviderNotifier();
});
