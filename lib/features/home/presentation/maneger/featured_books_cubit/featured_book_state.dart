import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../data/models/book_model/book_model.dart';

@immutable
abstract class FeaturedBookState extends Equatable {
  const FeaturedBookState();

  @override
  List<Object> get props => [];
}

class FeaturedBookInitial extends FeaturedBookState {}

class FeaturedBookLoading extends FeaturedBookState {}

class FeaturedBookFailure extends FeaturedBookState {
  final String errMessage;

  const FeaturedBookFailure(this.errMessage);
}

class FeaturedBookSuccess extends FeaturedBookState {
  final List<BookModel> books;

  const FeaturedBookSuccess(this.books);
}
