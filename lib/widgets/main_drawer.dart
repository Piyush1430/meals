import "package:flutter/material.dart";

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key ,required this.onSelectScreen});
  final void Function(String) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    Widget builderListTile(String title, IconData icon ,String screen) {
      return ListTile(
        leading: Icon(icon,
            size: 26, color: Theme.of(context).colorScheme.onBackground),
        title: Text(
          title,
          style: Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Theme.of(context).colorScheme.onBackground, fontSize: 24),
        ),
        onTap: () => onSelectScreen(screen),
      );
    }

    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.8),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 48,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Text(
                    "Cooking Up..",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Colors.white),
                  )
                ],
              )),
          builderListTile("Meals", Icons.restaurant ,"meals"),
          builderListTile("Filters", Icons.settings, "filter"),
        ],
      ),
    );
  }
}
