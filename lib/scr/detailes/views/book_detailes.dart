import 'package:bookly/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'widgets/book_detailes_section.dart';
import 'widgets/detailes_appbar.dart';
import 'widgets/similar_book_section.dart';

class BookDetailes extends StatelessWidget {
  const BookDetailes({super.key, required this.bookModel});
  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const DetailesAppBar(),
               BookDetailesSection(bookModel: bookModel,),
              const SizedBox(height: 50),
              Column(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "You can also like",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        )),
                  ),
                  SizedBox(height: 16),
                  Padding(
                      padding: EdgeInsets.only(left: 30),
                      child: SimilarBookSection()),
                ],
              ),
              const SizedBox(height: 40)
            ],
          ),
        ),
      ),
    );
  }
}
