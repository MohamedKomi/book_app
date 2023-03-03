import 'package:flutter/material.dart';

class SearchResultsListView extends StatelessWidget {
  const SearchResultsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List list=[];
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemBuilder: (context, index) {
        return  Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
        child: list[index],

        );
      },
      itemCount: list.length,
    );
  }
}
