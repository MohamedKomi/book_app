import 'package:book_app/core/utils/app_router.dart';
import 'package:book_app/features/home/presentation/maneger/featured_books_cubit/featured_book_cubit.dart';
import 'package:book_app/features/home/presentation/maneger/newest_books_cibit/newest_books_cubit.dart';
import 'package:book_app/features/search/data/repositories/search_repository_implementation.dart';
import 'package:book_app/features/search/presentation/maneger/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/service_locator.dart';
import 'features/home/data/repositories/home_repository_implementation.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeaturedBookCubit(sl<HomeRepositoryImplementation>())
                ..fetchFeaturedBook(),
        ),
        BlocProvider(
          create: (context) =>
              NewestBooksCubit(sl<HomeRepositoryImplementation>())
                ..fetchNewestBooks(),
        ),
        BlocProvider(
            create: (context) =>
                SearchCubit(sl<SearchRepositoryImplementation>())),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        title: 'Book App',
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
