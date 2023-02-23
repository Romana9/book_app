import 'package:bookly/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/scr/detailes/views/book_detailes.dart';
import 'package:bookly/scr/home/views/widgets/book_image.dart';
import 'package:bookly/scr/home/views/widgets/custom_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookSection extends StatelessWidget {
  const SimilarBookSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: state.books.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => BookDetailes(
                                        bookModel: state.books[index],
                                      )));
                        },
                        child: BookImage(
                            imgUrl: state
                                .books[index].volumeInfo.imageLinks.thumbnail),
                      ));
                }),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomError(errorMessage: state.errorMessage);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
