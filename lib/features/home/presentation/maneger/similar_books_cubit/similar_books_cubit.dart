import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/book_model/book_model.dart';
import '../../../data/repositories/home_repository.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final HomeRepository homeRepository;

  SimilarBooksCubit(this.homeRepository) : super(SimilarBooksInitial());

  Future<void> fetchSimilarBooks({required String category}) async {
    emit(SimilarBooksLoading());
    final result = await homeRepository.fetchSimilarBooks(category: category);
    result.fold((failure) {
      emit(SimilarBooksFailure(failure.errorMessage));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
