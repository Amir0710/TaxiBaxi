class place {
  final double latitude;
  final double longitude;

  place({required this.latitude, required this.longitude});
}

// (34.79827, 48.51484)
class taxiPlace {
  static List<place> get PlaceList {
    return [
      place(latitude: 34.8, longitude: 48.514),
      place(latitude: 34.81, longitude: 48.515),
      place(latitude: 34.795, longitude: 48.5145),
      place(latitude: 34.79, longitude: 48.51),
      place(latitude: 34.82, longitude: 48.52),
      place(latitude: 34.815, longitude: 48.517),
      place(latitude: 34.818, longitude: 48.519),
      place(latitude: 34.786, longitude: 48.505),
      place(latitude: 34.7976, longitude: 48.5216),
      place(latitude: 34.8025, longitude: 48.5083),
    ];
  }
}

List<place> placelist = taxiPlace.PlaceList;
