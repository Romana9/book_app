import 'package:bookly/constans.dart';
import 'package:bookly/data/models/book_model/book_model.dart';
import 'package:bookly/scr/detailes/views/widgets/book_button.dart';
import 'package:bookly/scr/home/views/widgets/book_image.dart';
import 'package:bookly/scr/home/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookDetailesSection extends StatelessWidget {
  const BookDetailesSection({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.23),
          child: BookImage(imgUrl: bookModel.volumeInfo.imageLinks.thumbnail),
        ),
        const SizedBox(height: 43),
        Text(
          bookModel.volumeInfo.title!,
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontSize: 30, fontWeight: FontWeight.bold, fontFamily: kMyFont),
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            bookModel.volumeInfo.authors![0],
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          count: bookModel.volumeInfo.ratingsCount ?? 0,
          rating: bookModel.volumeInfo.averageRating ?? 0,
        ),
        const SizedBox(height: 37),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 38),
          child: BookButton(),
        ),
      ],
    );
  }
}
