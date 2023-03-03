import 'package:book_app/core/errors/failures.dart';
import 'package:book_app/core/utils/api_service.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/search/data/repositories/search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepositoryImplementation extends SearchRepository {
  final ApiService apiService;

  SearchRepositoryImplementation(this.apiService);

  @override
  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks(
      {required String searchString}) async {
    try {
      final data = await apiService.get(
          endPoint: 'volumes?Filtering=free_ebooks&q=$searchString');
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
      } else {
        return left(
          ServerFailure(e.toString()),
        );
      }
    }
  }
}
