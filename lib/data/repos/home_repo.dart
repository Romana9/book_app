import 'package:bookly/data/models/book_model/book_model.dart';
import 'package:bookly/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failures, List<BookModel>>> fatchNewsetBooks();
  Future<Either<Failures, List<BookModel>>> fatchFeaturedBooks();
  Future<Either<Failures, List<BookModel>>> fatchSimilarBooks(
      {required String category});
}
