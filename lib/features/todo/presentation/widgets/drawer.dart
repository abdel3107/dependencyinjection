import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/drawer/drawer_bloc.dart';


NavigationDrawer drawer(BuildContext context){
  return NavigationDrawer(
    selectedIndex: BlocProvider.of<DrawerBloc>(context).state,
    // tilePadding: const EdgeInsets.symmetric(
    //     horizontal: 12,
    //     vertical: 5,
    // ),
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.all(12.0),
        child: CircleAvatar(
          radius: MediaQuery.sizeOf(context).height*0.1,
          // backgroundColor: Colors.white,
          backgroundImage: const AssetImage(
            "assets/images/pic.jpg",
          ),

        ),
      ),
      // SizedBox(height: MediaQuery.sizeOf(context).height*0.01,),
      const NavigationDrawerDestination(
        icon: Icon(Icons.calendar_today),
        label: Text('Yesterday'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.today),
        label: Text('Today'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.calendar_month),
        label: Text('Tomorrow'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.edit_calendar),
        label: Text('Choose a day'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.settings),
        label: Text('Settings'),
      ),
      const NavigationDrawerDestination(
        icon: Icon(Icons.contact_support),
        label: Text('Contact Us'),
      ),
    ],
    onDestinationSelected: (value) {
      BlocProvider.of<DrawerBloc>(context).add(ChangeDrawerItemEvent(value));
    },
  );
}