import 'package:book_app/core/utils/service_locator.dart';
import 'package:book_app/features/home/data/models/book_model/book_model.dart';
import 'package:book_app/features/home/presentation/maneger/similar_books_cubit/similar_books_cubit.dart';
import 'package:book_app/features/home/presentation/views/book_details_view.dart';
import 'package:book_app/features/home/presentation/views/home_view.dart';
import 'package:book_app/features/search/presentation/views/search_view.dart';
import 'package:book_app/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/data/repositories/home_repository_implementation.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/bookDetailsView';
  static const kSearchView = '/searchView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashView(),
    ),
    GoRoute(
      path: kSearchView,
      builder: (context, state) => const SearchView(),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
    GoRoute(
      path: kBookDetailsView,
      builder: (context, state) => BlocProvider(
          create: (context) =>
              SimilarBooksCubit(sl<HomeRepositoryImplementation>()),
          child: BookDetailsView(
            bookModel: state.extra as BookModel,
          )),
    ),
  ]);
}
