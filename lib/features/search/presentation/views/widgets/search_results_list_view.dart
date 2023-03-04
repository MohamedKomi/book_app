import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/core/widgets/custom_error_widget.dart';
import 'package:book_app/core/widgets/loading_widget.dart';
import 'package:book_app/features/home/presentation/views/widgets/best_seller_listview_item.dart';
import 'package:book_app/features/search/presentation/maneger/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchFailure) {
          if (state.errMessage == 'Missing query.') {
            return const Text('');
          } else {
            return CustomErrorWidget(errorMessage: state.errMessage);
          }
        } else if (state is SearchSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: GestureDetector(
                    onTap: () {
                      GoRouter.of(context).push(AppRouter.kBookDetailsView);
                    },
                    child:
                        BestSellerListViewItem(bookModel: state.books[index])),
              );
            },
            itemCount: state.books.length,
          );
        } else if (state is SearchInitial) {
          return const Text('');
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
