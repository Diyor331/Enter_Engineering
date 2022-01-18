import 'dart:async';
import 'dart:developer';

import 'package:enter_engineering_test/blocs/blocs.dart';
import 'package:enter_engineering_test/models/models.dart';
import 'package:enter_engineering_test/services/repositories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostLoadingState());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    if (event is PostLoadEvent) {
      try {
        yield PostLoadedState();
      } catch (_) {
        yield PostErrorState();
      }
    }
  }
}

//State
abstract class PostState {}

class PostLoadingState extends PostState {}

class PostLoadedState extends PostState {}

class PostErrorState extends PostState {}
//State

//Event
abstract class PostEvent {}

class PostLoadEvent extends PostEvent {}

//Event
