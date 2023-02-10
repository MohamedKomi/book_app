import 'package:book_app/core/widgets/custom_error_widget.dart';
import 'package:book_app/core/widgets/loading_widget.dart';
import 'package:book_app/features/home/presentation/maneger/newest_books_cibit/newest_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'best_seller_listview_item.dart';

class BooksListView extends StatelessWidget {
  const BooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else if (state is NewestBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(
                  bookModel: state.books[index],
                ),
              );
            },
            itemCount: state.books.length,
          );
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
