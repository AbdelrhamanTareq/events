import 'package:dartz/dartz.dart';
import '../api/faliure.dart';
import '../models/models.dart';

abstract class Repository {
  Future<Either<Failure,List<Events>>> getEvents();
}