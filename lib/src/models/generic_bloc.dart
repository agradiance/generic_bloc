import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'generic_event.dart';
part 'generic_state.dart';

abstract class GenericBloc<StateModel> extends Bloc<GenericEvent<StateModel>, GenericState<StateModel>> {
  GenericBloc({StateModel? model}) : super(GenericState<StateModel>(model: model)) {
    on<GenericEvent<StateModel>>(onGenericEvent);
  }

  FutureOr onGenericEvent(GenericEvent<StateModel> event, Emitter<GenericState> emit) async {
    if (event.model != null && state.model != event.model) {
      emit(state.copyWith(model: event.model));
    }
  }

  StateModel? get model => state.model;
}
