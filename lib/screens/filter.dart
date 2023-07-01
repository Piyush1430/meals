import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "package:meals/providers/filters_provider.dart";

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);
    Widget builderSwitchListTile(
        bool value, Filter filter, String title, String subtitle) {
      return SwitchListTile(
        value: value,
        onChanged: (isChecked) {
          ref.read(filtersProvider.notifier).setFilter(filter, isChecked);
        },
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        subtitle: Text(
          subtitle,
          style: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
        activeColor: Theme.of(context).colorScheme.tertiary,
        contentPadding: const EdgeInsets.only(left: 34, right: 22),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("You Filters"),
      ),
      body: Column(
        children: [
          builderSwitchListTile(
              activeFilters[Filter.glutenFree]!,
              Filter.glutenFree,
              "Gluten-Free",
              "Only include  gluten free meals.."),
          builderSwitchListTile(
              activeFilters[Filter.lactoseFree]!,
              Filter.lactoseFree,
              "Lactose-Free",
              "Only include lactose free meals.."),
          builderSwitchListTile(activeFilters[Filter.vegan]!, Filter.vegan,
              "Vegan ", "Only include  Vegan meals.."),
          builderSwitchListTile(
              activeFilters[Filter.vegetarian]!,
              Filter.vegetarian,
              "Vegetarain",
              "Only include vegetarain meals.."),
        ],
      ),
    );
  }
}
