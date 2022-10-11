
import 'package:dartz/dartz.dart';
import '../api/api_constants.dart';
import '../api/dio_consumer.dart';
import '../api/error_handler.dart';

import '../api/faliure.dart';
import '../models/models.dart';
import '../network_info/network_info.dart';
import 'repositry.dart';

class RepositoryImpl implements Repository {
  final NetworkInfo networkInfo;
  final DioConsumer dioConsumer;
  RepositoryImpl({
    required this.networkInfo,
    required this.dioConsumer,
  });

  @override
  Future<Either<Failure, List<Events>>> getEvents() async {
    if (await networkInfo.isConnected) {
      try {
        final response = await dioConsumer.get(ApiConstatnt.baaseUrl);
        List<Events> list = [];
        response.forEach((elment){
          list.add(Events.fromJson(elment));
        });
       
          return Right(list);
       
      } catch (e) {
        return Left(ErrorHandler.handle(e).failure);
      }
    } else {
      return Left(DataSource.NO_INTERNET_CONNECTION.getFailure());
    }
  }
}
