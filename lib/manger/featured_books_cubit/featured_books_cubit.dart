import 'package:bloc/bloc.dart';
import 'package:bookly/data/models/book_model/book_model.dart';
import 'package:bookly/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fatchFeaturedBooks() async {
    emit(FeaturedBooksLoading());
    var result = await homeRepo.fatchFeaturedBooks();
    result.fold((failuer) {
      emit(FeaturedBooksFailure(failuer.errorMessege));
    }, (books) {
      emit(FeaturedBooksSuccess(books));
    });
  }
}
