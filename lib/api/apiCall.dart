import 'package:http/http.dart' as http;
import 'apiCredentials.dart';

class APICall {
  static Future<http.Response> fetchAlbum(queryRows) {
    print("queryRows is $queryRows");
    return http.get(
      "https://od-api.oxforddictionaries.com:443/api/v2/entries/en-gb/${queryRows}",
      // Send authorization headers to the backend.
      headers: {'app_id': APICreds.api_id, 'app_key': APICreds.api_key},
    );
  }
}
