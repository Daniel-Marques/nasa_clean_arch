class NasaEndoints {
  static Uri apod(String apiKey, String date) =>
      Uri.https('api.nasa.gov', '/planetary/apod', {
        'api_key': '$apiKey',
        'date': '$date',
      });
}
