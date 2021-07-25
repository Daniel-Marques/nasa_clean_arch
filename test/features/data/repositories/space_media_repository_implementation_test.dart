import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/errors/exceptions.dart';
import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:nasa_clean_arch/features/nasa_images/data/datasources/space_media_datasource.dart';
import 'package:nasa_clean_arch/features/nasa_images/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/features/nasa_images/data/repositories/space_media_repository_implementation.dart';

import '../../../mocks/date_mock.dart';

class MockSpaceMediaDatasource extends Mock implements ISpaceMediaDatasource {}

void main() {
  late SpaceMediaRepositoryImplementation repository;
  late ISpaceMediaDatasource datasource;

  setUp(() {
    datasource = MockSpaceMediaDatasource();
    repository = SpaceMediaRepositoryImplementation(datasource);
  });

  final tSpaceMediaModel = SpaceMediaModel(
    description:
        'Sprawling emission nebulae IC 1396 and Sh2-129 mix glowing interstellar gas and dark dust clouds in this 10 degree wide field of view toward the northern constellation Cepheus the King. Energized by its bluish central star IC 1396 (left) is hundreds of light-years across and some 3,000 light-years distant. The nebula\'s intriguing dark shapes include a winding dark cloud popularly known as the Elephant\'s Trunk below and right of center. Tens of light-years long, it holds the raw raw material for star formation and is known to hide protostars within. Located a similar distance from planet Earth, the bright knots and swept back ridges of emission of Sh2-129 on the right suggest its popular name, the Flying Bat Nebula. Within the Flying Bat, the most recently recognized addition to this royal cosmic zoo is the faint bluish emission from Ou4, the Giant Squid nebula.',
    mediaType: 'image',
    title: 'Elephant, Bat, and Squid',
    mediaUrl:
        'https://apod.nasa.gov/apod/image/2107/IC1396SH2-129Ou4_50Hsieh_1024.jpg',
  );

  test('should return space media model when calls the datasource', () async {
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenAnswer((_) async => tSpaceMediaModel);
    final result = await repository.getSpaceMediaFromDate(tDate);
    expect(result, Right(tSpaceMediaModel));
    verify(() => datasource.getSpaceMediaFromDate(tDate));
  });

  test(
      'should return a server failure when the call to datasource is unsuccessfull',
      () async {
    when(() => datasource.getSpaceMediaFromDate(tDate))
        .thenThrow(ServerException());
    final result = await repository.getSpaceMediaFromDate(tDate);
    expect(result, Left(ServerFailure()));
    verify(() => datasource.getSpaceMediaFromDate(tDate));
  });
}
