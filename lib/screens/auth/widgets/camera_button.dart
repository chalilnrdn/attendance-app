import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraButton extends StatelessWidget {
  final Function(String imagePath) onImageCaptured;
  final String buttonText;

  const CameraButton({super.key, required this.onImageCaptured, required this.buttonText});

  Future<void> _takePhoto(BuildContext context) async {
    try {
      // request camera permission
      final status = await Permission.camera.request();

      if (status.isDenied) {
        if (context.mounted) {
          ScaffoldMessenger.of( context).showSnackBar(
            SnackBar(content: Text("Camera permission is required to take photos"), backgroundColor: Colors.orange)
          );
        }
        return;
      }

      if (status.isPermanentlyDenied) {
        if (context.mounted) {
          ScaffoldMessenger.of( context).showSnackBar(
            SnackBar(content: Text("Camera permission denied. Please enable permission from settings"), 
            backgroundColor: Colors.red,
            action: SnackBarAction(
              label: 'Settings', 
              onPressed: () => openAppSettings()
              ),
            )
          );
        }
        return;
        
      }
    } catch (e) {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}