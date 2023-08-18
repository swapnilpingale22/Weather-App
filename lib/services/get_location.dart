import 'package:geolocator/geolocator.dart';

class GPS {
  static Future getPosition(lt, lg) async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        await Geolocator.openLocationSettings();
        // return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      // return Future.error(
      //     'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition().then((value) {
      var lt = value.latitude;
      var lg = value.longitude;
      print("LT= ${lt}");
      print("LG= ${lg}");
      print("Latitude: ${value.latitude}, Longitude: ${value.longitude}");
    });
  }
}
