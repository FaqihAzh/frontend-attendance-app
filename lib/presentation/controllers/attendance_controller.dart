import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import '../../data/models/attendance_model.dart';

class AttendanceController extends GetxController {
  var currentTime = DateTime.now().obs;
  var isCheckedIn = false.obs;
  var checkInTime = Rxn<DateTime>();
  var isLoading = false.obs;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    _startTimer();
    _loadAttendanceStatus();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      currentTime.value = DateTime.now();
    });
  }

  void _loadAttendanceStatus() {
    // Load from local storage
    // This is a simplified version
    final today = DateTime.now();
    // Check if already checked in today
  }

  Future<void> checkIn() async {
    isLoading.value = true;
    try {
      await Future.delayed(Duration(seconds: 1)); // Simulate API call

      isCheckedIn.value = true;
      checkInTime.value = DateTime.now();

      Get.snackbar(
        'Success',
        'Check-in successful!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.primaryColor,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Check-in failed. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> checkOut() async {
    isLoading.value = true;
    try {
      await Future.delayed(Duration(seconds: 1)); // Simulate API call

      isCheckedIn.value = false;

      Get.snackbar(
        'Success',
        'Check-out successful!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Get.theme.primaryColor,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Error',
        'Check-out failed. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  String get formattedTime {
    final now = currentTime.value;
    return '${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')} ${now.hour >= 12 ? 'PM' : 'AM'}';
  }

  String get formattedDate {
    final now = currentTime.value;
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    const days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];

    return '${months[now.month - 1]} ${now.day}, ${now.year} - ${days[now.weekday % 7]}';
  }
}