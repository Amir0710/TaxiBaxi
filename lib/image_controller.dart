import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageManager extends StatefulWidget {
  final bool isCamera;
  final bool isLoad;
  final String imageKey;
  final Function(String) updateImage;

  const ImageManager({
    super.key,
    required this.isCamera,
    required this.updateImage,
    required this.isLoad,
    required this.imageKey,
  });

  @override
  ImageManagerState createState() => ImageManagerState();
}

class ImageManagerState extends State<ImageManager> {
  File? _image;
  String? _imagePath;

  @override
  void initState() {
    super.initState();
    _loadImage();
  }

  Future<void> _loadImage() async {
    final prefs = await SharedPreferences.getInstance();
    final imagePath = prefs.getString(widget.imageKey);
    if (imagePath != null) {
      setState(() {
        _imagePath = imagePath;
        _image = File(imagePath); // Update _image with the loaded image path
      });
    }
  }

  Future<void> _saveImage(String path) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(widget.imageKey, path);
  }

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(
      source: widget.isCamera ? ImageSource.camera : ImageSource.gallery,
    );

    if (pickedFile != null) {
      setState(() {
        _imagePath = pickedFile.path;
        _image = File(pickedFile.path); // Update _image with the picked file
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image Manager',
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(fontSize: 30),
        ),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _image == null
                    ? Text(
                        'No image selected',
                        style: Theme.of(context).textTheme.headlineSmall,
                      )
                    : ClipOval(
                        child: _imagePath!.contains('assets')
                            ? Image.asset(
                                _imagePath!,
                                width: 250,
                                height: 250,
                                fit: BoxFit.cover,
                              )
                            : Image.file(
                                _image!,
                                width: 250,
                                height: 250,
                                fit: BoxFit.cover,
                              ),
                      ),
                const SizedBox(height: 20),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _pickImage,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).appBarTheme.backgroundColor,
                  ),
                  child: Text(
                    'Select Image',
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: FloatingActionButton(
              onPressed: () {
                if (_imagePath != null) {
                  _saveImage(_imagePath!);
                  widget.updateImage(_imagePath!);
                }
              },
              child: const Icon(Icons.check),
            ),
          ),
        ],
      ),
    );
  }
}
