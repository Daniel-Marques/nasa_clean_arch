import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:nasa_clean_arch/features/nasa_images/data/models/space_media_model.dart';
import 'package:nasa_clean_arch/features/nasa_images/domain/entities/space_media_entity.dart';

import '../../../mocks/space_media_mock.dart';

void main() {
  final tSpaceMediaModel = SpaceMediaModel(
    description:
        'Where does space begin? For purposes of spaceflight some would say at the Karman line, currently defined as an altitude of 100 kilometers (60 miles). Others might place a line 80 kilometers (50 miles) above Earth\'s mean sea level. But there is no sharp physical boundary that marks the end of atmosphere and the beginning of space. In fact, the Karman line itself is near the transition between the upper mesophere and lower thermosphere. Night shining or noctilucent clouds are high-latitude summer apparitions formed at altitudes near the top of the mesophere, up to 80 kilometers or so, also known as polar mesopheric clouds. Auroral bands of the northern (and southern) lights caused by energetic particles exciting atoms in the thermosphere can extend above 80 kilometers to over 600 kilometers altitude. Taken from a cockpit while flying at an altitude of 10 kilometers (33,000 feet) in the realm of stratospheric aeronautics, this snapshot captures both noctilucent clouds and aurora borealis under a starry sky, looking toward planet Earth\'s horizon and the edge of space.',
    mediaType: 'image',
    title: 'The Edge of Space',
    mediaUrl:
        'https://apod.nasa.gov/apod/image/2107/AuroraNoctilucent33k_rohner1024.jpg',
  );

  test('should be a subclass of SpaceMediaEntity', () {
    expect(tSpaceMediaModel, isA<SpaceMediaEntity>());
  });

  test('should return a valid model', () {
    final Map<String, dynamic> jsonMap = json.decode(spaceMediaMock);
    final result = SpaceMediaModel.fromJson(jsonMap);
    expect(result, tSpaceMediaModel);
  });

  test('should return a json map containing the proper data', () {
    final expectedMap = {
      "explanation":
          "Where does space begin? For purposes of spaceflight some would say at the Karman line, currently defined as an altitude of 100 kilometers (60 miles). Others might place a line 80 kilometers (50 miles) above Earth's mean sea level. But there is no sharp physical boundary that marks the end of atmosphere and the beginning of space. In fact, the Karman line itself is near the transition between the upper mesophere and lower thermosphere. Night shining or noctilucent clouds are high-latitude summer apparitions formed at altitudes near the top of the mesophere, up to 80 kilometers or so, also known as polar mesopheric clouds. Auroral bands of the northern (and southern) lights caused by energetic particles exciting atoms in the thermosphere can extend above 80 kilometers to over 600 kilometers altitude. Taken from a cockpit while flying at an altitude of 10 kilometers (33,000 feet) in the realm of stratospheric aeronautics, this snapshot captures both noctilucent clouds and aurora borealis under a starry sky, looking toward planet Earth's horizon and the edge of space.",
      "media_type": "image",
      "title": "The Edge of Space",
      "url":
          "https://apod.nasa.gov/apod/image/2107/AuroraNoctilucent33k_rohner1024.jpg"
    };

    final result = tSpaceMediaModel.toJson();
    expect(result, expectedMap);
  });
}
