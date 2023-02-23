import 'package:bookly/constans.dart';
import 'package:bookly/data/models/book_model/book_model.dart';
import 'package:bookly/scr/detailes/views/book_detailes.dart';
import 'package:bookly/scr/home/views/widgets/book_image.dart';
import 'package:bookly/scr/home/views/widgets/book_rating.dart';
import 'package:flutter/material.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    Key? key,
    required this.bookModel,
  }) : super(key: key);
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BookDetailes(
                      bookModel: bookModel,
                    )));
      },
      child: Row(
        children: [
          SizedBox(
              height: 125,
              child:
                  BookImage(imgUrl: bookModel.volumeInfo.imageLinks.thumbnail)),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    bookModel.volumeInfo.title!,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: kMyFont),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  bookModel.volumeInfo.authors![0],
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Free",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    BookRating(
                      count: bookModel.volumeInfo.ratingsCount ?? 0,
                      rating: bookModel.volumeInfo.averageRating ?? 0,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
