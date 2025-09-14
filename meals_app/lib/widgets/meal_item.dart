import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meal_details.dart';
import 'package:meals_app/widgets/meal_item_trait.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  const MealItem(
      {super.key, required this.meal}); //, required this.onFavouriteSelect
  final Meal meal;
  // final void Function(Meal meal) onFavouriteSelect;
  void openMeal(context) {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (ctx) => MealDetails(
                meal: meal,
                // onFavouriteSelect: onFavouriteSelect,
              )),
    );
  }

  String get mealTimeComplexity {
    return '${meal.duration}';
  }

  String get mealWorkComplexity {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get mealPriceComplexity {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        onTap: () {
          openMeal(context);
        },
        child: Stack(
          children: [
            FadeInImage(
              placeholder: MemoryImage(kTransparentImage),
              image: NetworkImage(meal.imageUrl),
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                  color: Colors.black45,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 44, vertical: 6),
                  height: meal.title.length > 27 ? 102 : 80,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Text(
                        meal.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MealItemTrait(
                              icon: Icons.schedule, label: mealTimeComplexity),
                          const SizedBox(
                            width: 6,
                          ),
                          MealItemTrait(
                              icon: Icons.work, label: mealWorkComplexity),
                          const SizedBox(
                            width: 6,
                          ),
                          MealItemTrait(
                              icon: Icons.attach_money,
                              label: mealPriceComplexity),
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
