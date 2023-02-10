import 'package:flutter/material.dart';

import '../../../../home/presentation/views/widgets/best_seller_listview_item.dart';
class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          // child: BestSellerListViewItem(),
          child: Text('data'),
        );
      },
      itemCount: 10,
    );
  }
}
