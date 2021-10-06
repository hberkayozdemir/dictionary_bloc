import 'package:http/http.dart' as http;

class DictionaryApi {
  static final baseurl = "https://api.dictionaryapi.dev/api/v2/entries/";

  Future<http.Response> getRequest(endPoint) async {
    http.Response response;

    final url = Uri.parse("$baseurl$endPoint");
    try {
      response = await http.get(url);
    } on Exception catch (e) {
      throw "Cant connected $e";
    }

    return response;
  }
}
