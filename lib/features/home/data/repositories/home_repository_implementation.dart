import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/data/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepositoryImplementation implements HomeRepository {
  final ApiService apiService;

  HomeRepositoryImplementation(this.apiService);

  @override
  Future<Either<Failures, List<BookModel>>> fetchNewestBooks() async {
    try {
      final data = await apiService.get(
          endPoint:
              'volumes?Filtering=free_ebooks&Sorting=newest&q=computer science');
      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      final data = await apiService.get(
          endPoint: 'volumes?Filtering=free_ebooks&q=subject:Programming');
      List<BookModel> books = [];


      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks({required String category}) async{
    try {
      final data = await apiService.get(
          endPoint: 'volumes?Filtering=free_ebooks&Sorting=relevance&q=subject:Programming');
      List<BookModel> books = [];


      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioError) {
        return left(
          ServerFailure.fromDioError(e),
        );
      }
      return left(
        ServerFailure(
          e.toString(),
        ),
      );
    }

  }
}
