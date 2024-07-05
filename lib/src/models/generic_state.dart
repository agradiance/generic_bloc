// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'generic_bloc.dart';

class GenericState<StateModel> extends Equatable {
  final StateModel? model;
  const GenericState({this.model});

  @override
  List<Object?> get props => [model];

  GenericState<StateModel> copyWith({
    StateModel? model,
  }) {
    return GenericState<StateModel>(model: model ?? this.model);
  }
}
