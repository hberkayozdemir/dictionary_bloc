//@dart=2.9
import 'dart:io';
import 'package:dictionary_app_bloc/data/data_providers/dictionary_api.dart';
import 'package:dictionary_app_bloc/data/models/word.dart';

class WordRepository {
  Future<List<WordResponse>> getWordsFromDictionary(String query) async {
    try {
      final response = await DictionaryApi().getRequest("en_US/$query");
      if (response.statusCode == 200) {
        final result = wordResponseFromJson(response.body);
        return result;
      } else {
        return null;
      }
    } on SocketException catch (e) {
      throw e;
    } on HttpException catch (e) {
      throw e;
    } on FormatException catch (e) {
      throw e;
    }
  }
}
