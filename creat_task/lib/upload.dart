// ignore_for_file: non_constant_identifier_names

import 'dart:io';

import 'package:creat_task/colors.dart';
import 'package:creat_task/home.dart';
import 'package:creat_task/storage.dart';
import 'package:creat_task/text_style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

String? _Image;
String name = '';

class UploadView extends StatefulWidget {
  const UploadView({super.key});

  @override
  State<UploadView> createState() => _UploadViewState();
}

class _UploadViewState extends State<UploadView> {
  var textCon = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
              onPressed: () {
                if (_Image != null && name.isNotEmpty) {
                  AppLocal.cacheData(AppLocal.IS_UPLOAD, true);
                  AppLocal.cacheData(AppLocal.Name_Key, name);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => const Home(),
                  ));
                } else if (_Image == null && name.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text(
                          'Please Upload Your Image and Enter Your Name')));
                } else if (_Image == null) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Please Upload Your Image')));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      backgroundColor: Colors.red,
                      content: Text('Please Enter your Name')));
                }
              },
              child: Text(
                'Done',
                style: subtitles(colort: ColorP.primary),
              ))
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 61,
                backgroundColor: ColorP.primary,
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: ColorP.primary,
                  foregroundImage: (_Image != null)
                      ? FileImage(File(_Image!)) as ImageProvider
                      : const AssetImage(
                          'assets/avatar.png',
                        ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await getImagefromCamera();
                },
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorP.primary),
                  child: const Text(
                    'Upload from Camera',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  await getImagefromGallery();
                },
                child: Container(
                  height: 40,
                  width: 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorP.primary),
                  child: const Text(
                    'Upload from Gallery',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Divider(
                  color: ColorP.primary,
                ),
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    name = value;
                  });
                },
                style: subtitles(colort: Theme.of(context).primaryColor),
                decoration: const InputDecoration(
                  hintText: 'Enter Your Name',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getImagefromCamera() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.Image_Key, pickedImage.path);
      setState(() {
        _Image = pickedImage.path;
      });
    }
  }

  getImagefromGallery() async {
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      AppLocal.cacheData(AppLocal.Image_Key, pickedImage.path);
      setState(() {
        _Image = pickedImage.path;
      });
    }
  }
}
