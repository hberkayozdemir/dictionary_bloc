
import 'package:dictionary_app_bloc/data/repository/word_repo.dart';
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "package:dictionary_app_bloc/data/models/word.dart";
import "dart:io";

class DictionaryCubit extends Cubit<DictionaryState> {
  final WordRepository _repository;
  DictionaryCubit(this._repository) : super(NoWordSearchedState());

  final queryController = TextEditingController();
  Future getWordSearched() async {
    emit(WordSearchingState());
    try {
      final words =
          await _repository.getWordsFromDictionary(queryController.text);
      if (words == null) {
        emit(ErrorState("There is some issue"));
      } else {
        WordSearchedState(words);
      }
    } on Exception catch (e) {
      print(e);
      emit(ErrorState(e.toString()));
    }
  }
}

abstract class DictionaryState {}

class NoWordSearchedState extends DictionaryState {}

class WordSearchingState extends DictionaryState {}

class WordSearchedState extends DictionaryState {
  final List<WordResponse> words;
  WordSearchedState(this.words);
}

class ErrorState extends DictionaryState {
  final message;
  ErrorState(this.message);
}