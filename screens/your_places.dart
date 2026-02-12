import 'package:fav_places_app/model/place.dart';
import 'package:fav_places_app/screens/add_new_place.dart';
import 'package:fav_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';

class YourPlacesScreen extends StatefulWidget {
  const YourPlacesScreen({super.key});

  @override
  State<YourPlacesScreen> createState() => _YourPlacesScreenState();
}

final List _placesList = [];

class _YourPlacesScreenState extends State<YourPlacesScreen> {
  void _addNewPlace() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => AddNewPlaceScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places', style: TextStyle(color: Colors.white)),
        actions: [IconButton(onPressed: _addNewPlace, icon: Icon(Icons.add))],
      ),
      body: PlacesList(places: []),
    );
  }
}
