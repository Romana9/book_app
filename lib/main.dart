import 'package:bookly/constans.dart';
import 'package:bookly/data/repos/home_repo_impl.dart';
import 'package:bookly/manger/featured_books_cubit/featured_books_cubit.dart';
import 'package:bookly/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:bookly/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/scr/splash_view/splash_view.dart';
import 'package:bookly/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupServiceLocator();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => FeaturedBooksCubit(
                  getIt.get<HomeRepoImpl>(),
                )..fatchFeaturedBooks()),
        BlocProvider(
            create: (context) => NewsetBooksCubit(
                  getIt.get<HomeRepoImpl>(),
                )..fatchNewsetBooks()),
        BlocProvider(
            create: (context) => SimilarBooksCubit(
                  getIt.get<HomeRepoImpl>(),
                )..fetchSimilarBooks())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
        home: const SplashView(),
      ),
    );
  }
}
