import "package:flutter/material.dart";

class MealitemTrait extends StatelessWidget {
  const MealitemTrait({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 17, color: Colors.white),
        const SizedBox(
          width: 4,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        )
      ],
    );
  }
}
