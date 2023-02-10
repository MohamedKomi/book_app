import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';

abstract class HomeRepository {
  Future<Either<Failures, List<BookModel>>> fetchFeaturedBooks();

  Future<Either<Failures, List<BookModel>>> fetchNewestBooks();

  Future<Either<Failures, List<BookModel>>> fetchSimilarBooks(
      {required String category});
}
