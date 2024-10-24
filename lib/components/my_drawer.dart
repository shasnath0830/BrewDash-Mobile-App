import 'package:brew_dash_app/components/my_drawer_tile.dart';
import 'package:brew_dash_app/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout() {
    //get instance of auth service
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          // App logo
          Padding(
            padding:const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          
          // Home list tile
          MyDrawerTile(
            text: "H O M E",
            icon: Icons.home, 
            onTap: () => Navigator.pop(context),
          ),


          //Settings list tile
          MyDrawerTile(
            text: "S  E T T I N G S",
            icon: Icons.settings, 
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => const SettingsPage()
                ),
              );
            },
          ),

          const Spacer(),

          // Logout list tile
          MyDrawerTile(
            text: "L O G O U T",
            icon: Icons.logout, 
            onTap: () {
              logout();
              Navigator.pop(context);
            },
          ),

          const SizedBox(height: 25),
          
        ],
      ),
    );
  }
}
