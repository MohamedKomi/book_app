import 'package:book_app/features/home/data/repositories/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'featured_book_state.dart';

class FeaturedBookCubit extends Cubit<FeaturedBookState> {
  FeaturedBookCubit(this.homeRepository) : super(FeaturedBookInitial());
  final HomeRepository homeRepository;

  Future<void> fetchFeaturedBook() async {
    emit(FeaturedBookLoading());
    final result = await homeRepository.fetchFeaturedBooks();
    result.fold((failure) {
      emit(FeaturedBookFailure(failure.errorMessage));
    }, (books) {
      emit(FeaturedBookSuccess(books));
    });
  }
}
