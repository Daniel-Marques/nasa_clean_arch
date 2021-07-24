import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

abstract class Usecase<Output, Input> {
  // Either: Return Left or Right
  Future<Either<Failure, Output>> call(Input params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
