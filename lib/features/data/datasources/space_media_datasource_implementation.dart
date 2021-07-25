import 'package:nasa_clean_arch/core/http_client/http_client.dart';
import 'package:nasa_clean_arch/core/utils/keys/nase_api_keys.dart';
import 'package:nasa_clean_arch/features/data/datasources/endpoints/nase_endpoints.dart';
import 'package:nasa_clean_arch/features/data/datasources/space_media_datasource.dart';
import 'package:nasa_clean_arch/features/data/models/space_media_model.dart';

class NasaDatasourceImplementation implements ISpaceMediaDatasource {
  final HttpClient client;

  NasaDatasourceImplementation(this.client);
  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) async {
    return await client.get(NasaEndoints.apod(NasaApiKeys.apiKey, date));
  }
}
