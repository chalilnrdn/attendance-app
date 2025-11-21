import 'package:attendance_app/models/attendance_record.dart';
import 'package:attendance_app/screens/home/widget/camera_button.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final AttendanceRecord? todayRecord;
  final bool isLoading;
  final VoidCallback onCheckIn;
  final VoidCallback onCheckOut;
  final Function(String) onCheckInWithPhoto;
  final Function(String) onCheckOutWithPhoto;

  const ActionButton({super.key, this.todayRecord, required this.isLoading, required this.onCheckIn, required this.onCheckOut, required this.onCheckInWithPhoto, required this.onCheckOutWithPhoto});

  @override
  //TODO : make logic fr history

  @override
  Widget build(BuildContext context) {
    final hasCheckedIn = todayRecord != null;
    final hasCheckedOut = todayRecord?.checkOutTime != null;

    if (hasCheckedOut) {
      return _buildCompletedCard();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: hasCheckedIn ? _buildCheckOutButtons() : _buildCheckInButtons(),
    );
  }

  Widget _buildCompletedCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(Icons.check_circle_outline_rounded, size: 64, color: Colors.green[600]),
            SizedBox(height: 16),
            Text(
              'Great Job Today!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 8),
            Text(
              "You've completed your work for today.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }
  
  List<Widget> _buildCheckInButtons() {
    return [
      _ActionButton(
        label: 'Check In without Photo',
        icon: Icons.login_rounded,
        color: Colors.blue[600]!,
        onPressed: isLoading ? null : onCheckIn,
        isLoading: isLoading,
      ),
      SizedBox(height: 12),
      _PhotoButton(
        label: 'Check In with Photo',
        color: Colors.blue[600]!,
        onImageCaptured: onCheckInWithPhoto,
        isLoading: isLoading,
      )
    ];
  }

  List<Widget> _buildCheckOutButtons() {
    return [
      _ActionButton(
        label: 'Check Out without Photo',
        icon: Icons.logout_rounded,
        color: Colors.red[600]!,
        onPressed: isLoading ? null : onCheckOut,
        isLoading: isLoading,
      ),
      SizedBox(height: 12),
      _PhotoButton(
        label: 'Check Out with Photo',
        color: Colors.red[600]!,
        onImageCaptured: onCheckOutWithPhoto,
        isLoading: isLoading,
      )
    ];
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback? onPressed;
  final Color color;
  final bool isLoading;

  const _ActionButton({super.key, required this.label, required this.icon, required this.onPressed, required this.color, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
      ),
      child: isLoading
          ? SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(),
          )
          : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 24),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold             
                 ),
              )
            ],
          )
    );
  }
}

class _PhotoButton extends StatelessWidget {
  final String label;
  final Color color;
  final Function(String) onImageCaptured;
  final bool isLoading;

  const _PhotoButton({super.key, required this.label, required this.color, required this.onImageCaptured, required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isLoading ? null : null,
      style: OutlinedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        side: BorderSide(color: color, width: 2),
      ),
      child: CameraButton(
        onImageCaptured: onImageCaptured,
        buttonText: label,
      ),

    );
  }
}