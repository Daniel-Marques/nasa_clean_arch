import 'package:flutter_modular/flutter_modular.dart';
import 'package:nasa_clean_arch/core/utils/converts/date_input_converter.dart';
import 'package:http/http.dart' as http;
import 'package:nasa_clean_arch/features/nasa_images/data/datasources/space_media_datasource_implementation.dart';
import 'package:nasa_clean_arch/features/nasa_images/data/repositories/space_media_repository_implementation.dart';
import 'package:nasa_clean_arch/features/nasa_images/domain/usecases/get_space_media_from_date_usecase.dart';
import 'package:nasa_clean_arch/features/nasa_images/presenter/controllers/home_store.dart';
import 'package:nasa_clean_arch/features/nasa_images/presenter/pages/home_page.dart';
import 'package:nasa_clean_arch/features/nasa_images/presenter/pages/picture_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeStore(i())),
    Bind((i) => GetSpaceMediaFromDateUsecase(i())),
    Bind((i) => SpaceMediaRepositoryImplementation(i())),
    Bind((i) => NasaDatasourceImplementation(converter: i(), client: i())),
    Bind((i) => http.Client()),
    Bind((i) => DateInputConverter()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => HomePage()),
    ChildRoute('/picture', child: (_, __) => PicturePage()),
  ];
}
