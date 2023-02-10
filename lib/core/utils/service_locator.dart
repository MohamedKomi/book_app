import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/features/home/data/repositories/home_repository_implementation.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    sl.registerSingleton<ApiService>(ApiService(Dio()));
    sl.registerSingleton<HomeRepositoryImplementation>(
        HomeRepositoryImplementation(sl()));
  }
}
