part of 'generic_bloc.dart';

abstract class GenericEvent<StateModel> extends Equatable {
  final StateModel? model;
  const GenericEvent({this.model});

  @override
  List<Object?> get props => [model];
}
