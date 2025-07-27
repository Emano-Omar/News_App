import 'package:flutter/material.dart';
import 'package:news_app/features/ui/widgets/drawer/ui/theme_mode_switch.dart';
import 'custom_drawer_header.dart';

class DrawerItem extends StatefulWidget {
  const DrawerItem({super.key});

  @override
  State<DrawerItem> createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;
    final iconColor = Theme.of(context).iconTheme.color;

    return Drawer(
      width: 300,
      child: Container(
        color: Theme.of(context).drawerTheme.backgroundColor,
        child: Column(
          children: [
            CustomDrawerHeader(),
            const SizedBox(height: 20),
            ListTile(
              leading: Icon(Icons.home, color: iconColor),
              title: Text("Home", style: TextStyle(color: textColor)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info, color: iconColor),
              title: Text("About", style: TextStyle(color: textColor)),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            DarkModeSwitch(),
          ],
        ),
      ),
    );
  }
}

