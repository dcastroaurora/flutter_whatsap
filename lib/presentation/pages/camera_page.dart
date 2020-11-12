import 'dart:io';

import 'package:camera/camera.dart';
import 'package:custom_image_picker/custom_image_picker.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  List<CameraDescription> _cameras;
  CameraController _cameraController;
  List<dynamic> _galleryPhotos;

  @override
  void initState() {
    initializeCamera();
    getImagesFromGallery();
    super.initState();
  }

  Future<void> initializeCamera() async {
    _cameras = await availableCameras();
    _cameraController = CameraController(_cameras[0], ResolutionPreset.medium);
    _cameraController.initialize().then((value) {
      if (!mounted) return;
      setState(() {});
    });
  }

  Future<void> getImagesFromGallery() async {
    CustomImagePicker.getAllImages.then((value) {
      setState(() {
        _galleryPhotos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraController.value.isInitialized) {
      return Container(height: 0.0, width: 0.0);
    }
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: CameraPreview(_cameraController),
          ),
          _cameraButtonWidget(),
          _galleryWidget(),
        ],
      ),
    );
  }

  Widget _cameraButtonWidget() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.flash_on, color: Colors.white, size: 30.0),
            Container(
              width: 80.0,
              height: 80.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: Colors.white, width: 2.0),
              ),
            ),
            Icon(Icons.camera_alt, color: Colors.white, size: 30.0),
          ],
        ),
      ),
    );
  }

  Widget _galleryWidget() {
    return Positioned(
      bottom: 100.0,
      right: 0.0,
      left: 0.0,
      child: Container(
        height: 55,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _galleryPhotos.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              height: 55.0,
              width: 50.0,
              margin: const EdgeInsets.only(right: 8.0),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(.2),
              ),
              child: Image.file(
                File(_galleryPhotos[index]),
                fit: BoxFit.cover,
              ),
            );
          },
        ),
      ),
    );
  }
}
