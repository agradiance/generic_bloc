import 'package:flutter/material.dart';
import 'package:generic_bloc/generic_bloc.dart';
import 'package:provider/provider.dart';

extension BuildContextExtension on BuildContext {
  getModel<B extends GenericBloc>({bool listen = false}) {
    return Provider.of<B>(this, listen: listen).model;
  }
}
