import 'package:book_app/core/widgets/custom_error_widget.dart';
import 'package:book_app/core/widgets/loading_widget.dart';
import 'package:book_app/features/home/presentation/maneger/featured_books_cubit/featured_book_cubit.dart';
import 'package:book_app/features/home/presentation/maneger/featured_books_cubit/featured_book_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/app_router.dart';
import 'custom_book_item.dart';

class FeaturedListView extends StatelessWidget {
  const FeaturedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBookCubit, FeaturedBookState>(
      builder: (context, state) {
        if (state is FeaturedBookSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
                itemCount: state.books.length,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () => GoRouter.of(context).push(
                          AppRouter.kBookDetailsView,
                          extra: state.books[index]),
                      child: CustomBookItem(
                        imageUrl:
                            state.books[index].volumeInfo.imageLinks!.thumbnail,
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBookFailure) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
