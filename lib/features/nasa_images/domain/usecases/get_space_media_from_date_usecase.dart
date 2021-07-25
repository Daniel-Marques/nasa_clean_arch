import 'package:nasa_clean_arch/core/errors/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:nasa_clean_arch/core/usecase/usecase.dart';
import 'package:nasa_clean_arch/features/nasa_images/domain/entities/space_media_entity.dart';
import 'package:nasa_clean_arch/features/nasa_images/domain/repositories/space_media_repository.dart';

class GetSpaceMediaFromDateUsecase
    implements Usecase<SpaceMediaEntity, DateTime> {
  final ISpaceMediaRepository repository;

  GetSpaceMediaFromDateUsecase(this.repository);
  @override
  Future<Either<Failure, SpaceMediaEntity>> call(DateTime? date) async {
    return date != null
        ? await repository.getSpaceMediaFromDate(date)
        : Left(NullParamsFailure());
  }
}
