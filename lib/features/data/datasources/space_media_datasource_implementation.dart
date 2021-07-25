import 'package:nasa_clean_arch/features/data/datasources/space_media_datasource.dart';
import 'package:nasa_clean_arch/features/data/models/space_media_model.dart';

class SpaceMediaDatasourceImplementation implements ISpaceMediaDatasource {
  @override
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date) {
    throw UnimplementedError();
  }
}
