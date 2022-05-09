import 'package:http/http.dart' as http;

class NetWork {
  static Future<http.Response> get(var url) async {
    var uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    return response;
  }
}
