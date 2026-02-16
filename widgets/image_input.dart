import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPicked});

  final void Function(File image)
  onPicked; // passing this function inorder to send image to places screen

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _selectedImage;

  void _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 600,
    ); //a future that allows you to use the device natice camrea to take picture and store inside of pickedImage....

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _selectedImage = File(
        pickedImage.path,
      ); // changes the image file type from Xfile to File and stores in _selectedImage....
    });

    widget.onPicked(_selectedImage!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      onPressed: _takePicture,
      icon: const Icon(Icons.camera),
      label: Text('Take Picture'),
    );

    if (_selectedImage != null) {
      content = GestureDetector(
        onDoubleTap: () {
          _takePicture();
        },
        child: Image.file(
          _selectedImage!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ); // creates an image from that is displayed on the screen;
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        ),
      ),
      alignment: Alignment.center,
      height: 250,
      width: double.infinity,
      child: content,
    );
  }
}
