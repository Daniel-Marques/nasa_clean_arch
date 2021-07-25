import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nasa_clean_arch/core/errors/exceptions.dart';
import 'package:nasa_clean_arch/core/http_client/http_client.dart';
import 'package:nasa_clean_arch/core/utils/converts/date_to_string_convert.dart';
import 'package:nasa_clean_arch/features/data/datasources/space_media_datasource_implementation.dart';
import 'package:nasa_clean_arch/features/data/models/space_media_model.dart';

import '../../../mocks/space_media_mock.dart';

class HttpClientMock extends Mock implements HttpClient {}

void main() {
  late NasaDatasourceImplementation datasource;
  late HttpClient client;

  setUp(() {
    client = HttpClientMock();
    datasource = NasaDatasourceImplementation(client);
  });

  final tDateTime = DateTime(2021, 07, 24);
  final urlExpected =
      'https://api.nasa.gov/planetary/apod?api_key=DEMO_KEY&date=2021-07-24';

  void successMock() {
    when(() => client.get(any())).thenAnswer((_) async => HttpResponse(
          data: spaceMediaMock,
          statusCode: 200,
        ));
  }

  test('should call the get method with correct url', () async {
    successMock();
    await datasource.getSpaceMediaFromDate(tDateTime);
    verify(() => client.get(urlExpected)).called(1);
  });

  test('should return a SpaceMediaModel when is successful', () async {
    successMock();
    final tSpaceMediaModelExpected = SpaceMediaModel(
        description:
            "Where does space begin? For purposes of spaceflight some would say at the Karman line, currently defined as an altitude of 100 kilometers (60 miles). Others might place a line 80 kilometers (50 miles) above Earth's mean sea level. But there is no sharp physical boundary that marks the end of atmosphere and the beginning of space. In fact, the Karman line itself is near the transition between the upper mesophere and lower thermosphere. Night shining or noctilucent clouds are high-latitude summer apparitions formed at altitudes near the top of the mesophere, up to 80 kilometers or so, also known as polar mesopheric clouds. Auroral bands of the northern (and southern) lights caused by energetic particles exciting atoms in the thermosphere can extend above 80 kilometers to over 600 kilometers altitude. Taken from a cockpit while flying at an altitude of 10 kilometers (33,000 feet) in the realm of stratospheric aeronautics, this snapshot captures both noctilucent clouds and aurora borealis under a starry sky, looking toward planet Earth's horizon and the edge of space.",
        mediaType: "image",
        title: "The Edge of Space",
        mediaUrl:
            "https://apod.nasa.gov/apod/image/2107/AuroraNoctilucent33k_rohner1024.jpg");
    final result = await datasource.getSpaceMediaFromDate(tDateTime);
    expect(result, tSpaceMediaModelExpected);
  });

  test('should throw a ServerException when the call is unsuccessful',
      () async {
    when(() => client.get(any())).thenAnswer((_) async =>
        HttpResponse(data: 'something went wrong', statusCode: 400));
    final result = datasource.getSpaceMediaFromDate(tDateTime);
    expect(() => result, throwsA(ServerException()));
  });
}
