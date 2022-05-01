import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ghibli_bloc/main/bloc/main_state.dart';
import 'package:ghibli_api/ghibli_api.dart';

class MainBloc extends Cubit<MainState> {
  MainBloc(
    this._ghibliApiRepository,
  ) : super(MainStateLoading()) {
    getFilms();
  }

  final GhibliApiRepository _ghibliApiRepository;

  Future<void> getFilms() async {
    try {
      emit(MainStateLoading());
      final films = await _ghibliApiRepository.getFilms();
      emit(MainStateLoaded(films));
    } catch (_) {
      emit(MainStateError());
    }
  }
}
