import 'package:nasa_clean_arch/features/nasa_images/data/models/space_media_model.dart';

abstract class ISpaceMediaDatasource {
  Future<SpaceMediaModel> getSpaceMediaFromDate(DateTime date);
}
