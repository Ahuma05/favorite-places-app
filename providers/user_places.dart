import 'package:fav_places_app/model/place.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'dart:io';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const []);

  void addPlace(String title, File image) {
    final newplace = Place(title: title, image: image);
    state = [newplace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>(
      (ref) => UserPlacesNotifier(),
    );
