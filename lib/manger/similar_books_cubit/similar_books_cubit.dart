import 'package:bloc/bloc.dart';
import 'package:bookly/data/models/book_model/book_model.dart';
import 'package:bookly/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks() async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fatchNewsetBooks();
    result.fold((failuer) {
      emit(SimilarBooksFailure(failuer.errorMessege));
    }, (books) {
      emit(SimilarBooksSuccess(books));
    });
  }
}
