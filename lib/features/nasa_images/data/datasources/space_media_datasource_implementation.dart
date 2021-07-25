import 'dart:convert';

import 'package:nasa_clean_arch/core/errors/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_clean_arch/core/utils/converts/date_input_converter.dart';
import 'package:nasa_clean_arch/features/nasa_images/data/datasources/endpoints/nase_endpoints.dart';
import 'package:nasa_clean_arch/features/nasa_images/data/datasources/space_media_datasource.dart';
import 'package:nasa_clean_arch/features/nasa_images/data/models/space_media_model.dart';

class NasaDatasourceImplementation implements ISpaceMediaDatasource {
  final DateInputConverter converter;
  final http.Client client;

  NasaDatasourceImplementation({
    required this.converter,
    required this.client,
  });

  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    final dateConverted = converter.format(date);
    final response = await client.get(NasaEndoints.apod(
      'DEMO_KEY',
      dateConverted,
    ));

    if (response.statusCode == 200) {
      return SpaceMediaModel.fromJson(jsonDecode(response.body));
    } else {
      throw ServerException();
    }
  }
}
