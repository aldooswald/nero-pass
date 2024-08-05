import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../data/models/remote/history_model.dart';
import '../../../data/repositories/history_repository.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  final HistoryRepository repository;
  HistoryCubit({required this.repository}) : super(HistoryInitial());

  void fetchHistory() async {
    emit(HistoryLoading());
    final result = await repository.getHistory();
    result.fold((l) => emit(HistoryError(message: l)),
        (r) => emit(HistoryLoaded(history: r)));
  }
}
