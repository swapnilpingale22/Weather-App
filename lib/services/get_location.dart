import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GPS {
  static Future getPosition(
      BuildContext context, double lt, double lg, bool isLoaded) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // return Future.error('Location services are disabled.');
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Alert'),
            content: const Text('Please enable location permission'),
            backgroundColor: Colors.grey,
            actions: [
              TextButton(
                  onPressed: () {
                    Geolocator.openAppSettings();
                  },
                  child: const Text('Enable')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close')),
            ],
          );
        },
      );
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // await Geolocator.openLocationSettings();
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // await Geolocator.openAppSettings();
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition().then(
      (value) {
        lt = value.latitude;
        lg = value.longitude;
        isLoaded = true;
        print("LT= ${lt}");
        print("LG= ${lg}");
        print("Latitude: ${value.latitude}, Longitude: ${value.longitude}");
        print(isLoaded);
      },
    );
  }
}
