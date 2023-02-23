import 'package:bloc/bloc.dart';
import 'package:bookly/data/models/book_model/book_model.dart';
import 'package:bookly/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit(this.homeRepo) : super(NewsetBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fatchNewsetBooks() async {
    emit(NewsetBooksLoading());
    var result = await homeRepo.fatchNewsetBooks();
    result.fold((failuer) {
      emit(NewsetBooksFailuer(failuer.errorMessege));
    }, (books) {
      emit(NewsetBooksSuccess(books));
    });
  }
}
