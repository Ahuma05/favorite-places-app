import 'package:fav_places_app/providers/user_places.dart';
import 'package:fav_places_app/screens/add_new_place.dart';
import 'package:fav_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class YourPlacesScreen extends ConsumerWidget {
  const YourPlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final usersPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => AddNewPlaceScreen()),
            ),
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacesList(places: usersPlaces),
      ),
    );
  }
}
