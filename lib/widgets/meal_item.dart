import "package:flutter/material.dart";
import "package:transparent_image/transparent_image.dart";

import "package:meals/models/meal.dart";
import "package:meals/screens/meal_detail.dart";
import "package:meals/widgets/meal_item_trait.dart";

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal });
  final Meal meal;
  String get complexityText {
    return meal.complexity.name[0].toUpperCase() +
        meal.complexity.name.substring(1);
  }

  String get affordabilityText {
    return meal.affordability.name[0].toUpperCase() +
        meal.affordability.name.substring(1);
  }

  void selectItem(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (ctx) => MealDetailScreen(meal: meal ,),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 3,
      child: InkWell(
        onTap: () => selectItem(context),
        child: Stack(
          children: [
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover,
                height: 200,
                width: double.infinity,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.black54,
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 44),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MealitemTrait(
                            icon: Icons.schedule,
                            label: "${meal.duration} min"),
                        const SizedBox(
                          width: 12,
                        ),
                        MealitemTrait(icon: Icons.work, label: complexityText),
                        const SizedBox(
                          width: 12,
                        ),
                        MealitemTrait(
                            icon: Icons.attach_money, label: affordabilityText),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
