import 'package:book_app/features/search/data/repositories/search_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/data/models/book_model/book_model.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.searchRepository) : super(SearchInitial());

  final SearchRepository searchRepository;

  Future<void> fetchSearchBooks({required String searchString}) async {
    emit(SearchLoading());
    final result =
        await searchRepository.fetchSearchedBooks(searchString: searchString);
    result.fold((failure) {
      emit(SearchFailure(failure.errorMessage));
    }, (books) {
      emit(SearchSuccess(books));
    });
  }
}
