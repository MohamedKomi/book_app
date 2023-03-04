import 'package:book_app/features/search/presentation/maneger/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: buildOutlineInputBorder(),
          focusedBorder: buildOutlineInputBorder(),
          hintText: "Search",
          suffixIcon: IconButton(
            onPressed: () {
              BlocProvider.of<SearchCubit>(context)
                  .fetchSearchBooks(searchString: controller.text);
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 24,
            ),
          ),
        ),
        onChanged: (text) {
          BlocProvider.of<SearchCubit>(context)
              .fetchSearchBooks(searchString: text);
        },
        onSubmitted: (text) {
          BlocProvider.of<SearchCubit>(context)
              .fetchSearchBooks(searchString: text);
        });
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
