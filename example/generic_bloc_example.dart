// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:generic_bloc/generic_bloc.dart';

// user_model.dart
class UserModel extends Equatable {
  final String? lastName;
  final String? firstName;
  final String? otherName;

  const UserModel({
    this.lastName,
    this.firstName,
    this.otherName,
  });

  @override
  List<Object?> get props => [lastName, firstName, otherName];
}

// user_bloc.dart

// overide GenericBloc
class UserBloc extends GenericBloc<UserModel> {}

// overide GenericEvent
class UserEvent extends GenericEvent<UserModel> {}

// Define UserState as type of GenericState<UserModel>
typedef UserState = GenericState<UserModel>;

//Use your bloc anywhere

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        )
      ],
      child: const MaterialApp(
        title: 'Material App',
        home: CustomPage(),
      ),
    );
  }
}

class CustomPage extends StatelessWidget {
  const CustomPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Page"),
        centerTitle: true,
      ),
      body: Center(
        child: BlocSelector<UserBloc, UserState, UserModel?>(
          selector: (state) {
            return state.model;
          },
          builder: (context, userModel) {
            return Column(
              children: [
                Text(userModel?.lastName ?? ''),
                Text(userModel?.firstName ?? ''),
                Text(userModel?.otherName ?? ''),
              ],
            );
          },
        ),
      ),
    );
  }
}
