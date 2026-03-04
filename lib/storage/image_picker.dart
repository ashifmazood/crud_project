import 'dart:typed_data';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ImageUploadPage extends StatefulWidget {
  const ImageUploadPage({Key? key}) : super(key: key);

  @override
  State<ImageUploadPage> createState() => _ImageUploadPageState();
}

class _ImageUploadPageState extends State<ImageUploadPage> {
  XFile? pickedFile;
  Uint8List? webImage;
  String? imageUrl;
  bool isLoading = false;

  final ImagePicker picker = ImagePicker();

  /// Pick image from gallery or camera
  Future<void> pickImage(ImageSource source) async {
    final XFile? image = await picker.pickImage(source: source);

    if (image != null) {
      if (kIsWeb) {
        webImage = await image.readAsBytes();
      }

      setState(() {
        pickedFile = image;
      });
    }
  }

  /// Upload image to Firebase Storage
  Future<void> uploadImage() async {
    if (pickedFile == null) return;

    setState(() => isLoading = true);

    try {
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final ref = FirebaseStorage.instance
          .ref()
          .child('profile_images/$fileName.jpg');

      if (kIsWeb) {
        await ref.putData(
          webImage!,
          SettableMetadata(contentType: 'image/jpeg'),
        );
      } else {
        await ref.putFile(
          File(pickedFile!.path),
          SettableMetadata(contentType: 'image/jpeg'),
        );
      }

      final url = await ref.getDownloadURL();

      setState(() {
        imageUrl = url;
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Uploaded successfully!')),
      );
    } catch (e) {
      setState(() => isLoading = false);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  /// Show image preview
  Widget showImage() {
    if (pickedFile == null) {
      return const Icon(Icons.image, size: 150, color: Colors.grey);
    }

    if (kIsWeb) {
      return Image.memory(webImage!, height: 180, fit: BoxFit.cover);
    } else {
      return Image.file(
        File(pickedFile!.path),
        height: 180,
        fit: BoxFit.cover,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Image Picker Web & Mobile"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              showImage(),
              const SizedBox(height: 20),

              /// Pick buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () => pickImage(ImageSource.gallery),
                    child: const Text("Pick Image"),
                  ),
                  ElevatedButton(
                    onPressed: () => pickImage(ImageSource.camera),
                    child: const Text("Take Photo"),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// Upload button
              ElevatedButton(
                onPressed: uploadImage,
                child: isLoading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text("Save"),
              ),

              if (imageUrl != null) ...[
                const SizedBox(height: 20),
                const Text("Uploaded Image URL:"),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    imageUrl!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}