import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../data/api/dio_consumer.dart';
import '../../data/network_info/network_info.dart';
import '../../data/repository/repository_impl.dart';
import '../../logic/cubit/events_cubit.dart';

final instance = GetIt.instance;

Future<void> init() async {
  instance.registerLazySingleton<RepositoryImpl>(
      () => RepositoryImpl(networkInfo: instance(), dioConsumer: instance()));

  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());

  final Dio dio = Dio();

  instance.registerLazySingleton<DioConsumer>(() => DioConsumer(dio: dio));

  instance.registerFactory<EventsCubit>(() => EventsCubit(instance()));
}
