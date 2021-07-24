import 'package:dartz/dartz.dart';

abstract class Usecase<Output, Input> {
  // Either: Return Left or Right
  Future<Either<Failure, Output>> call(Input params);
}
