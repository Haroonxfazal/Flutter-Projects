import 'package:flutter_riverpod/flutter_riverpod.dart';

enum FilterStatesEnum { glutenFree, lactoseFree, vegetarian, vegan }

class FiltersProviderNotifier
    extends StateNotifier<Map<FilterStatesEnum, bool>> {
  FiltersProviderNotifier()
      : super({
          FilterStatesEnum.glutenFree: false,
          FilterStatesEnum.lactoseFree: false,
          FilterStatesEnum.vegan: false,
          FilterStatesEnum.vegetarian: false,
        });

  void setFilters(Map<FilterStatesEnum, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(FilterStatesEnum filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProviderNotifier, Map<FilterStatesEnum, bool>>(
  (ref) => FiltersProviderNotifier(),
);
