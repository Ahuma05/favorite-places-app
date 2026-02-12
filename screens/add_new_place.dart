import 'package:flutter/material.dart';

class AddNewPlaceScreen extends StatefulWidget {
  const AddNewPlaceScreen({super.key});

  @override
  State<AddNewPlaceScreen> createState() => _AddNewPlaceScreenState();
}

class _AddNewPlaceScreenState extends State<AddNewPlaceScreen> {
  final TextEditingController _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Place', style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: TextField(
          controller: _nameController,
          decoration: InputDecoration(hintText: 'Name of place'),
        ),
      ),
    );
  }
}
