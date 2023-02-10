import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

import 'custom_search_text_field.dart';
import 'search_results_list_view.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Search Results',
            style: Styles.textStyle18,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: SearchResultsListView(),
          ),
        ],
      ),
    );
  }
}
