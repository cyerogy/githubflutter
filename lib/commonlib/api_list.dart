import 'dart:convert';

import 'http_request.dart';

class ApiList {
  dynamic getCityAttractions(int cityId, int page, int limit) async {
    var result = await new SelfDio().get("Index/getCityAttractions",
        data: {"cityId": cityId, "page": page, "limit": limit});
    var parsed = jsonDecode(result.toString());
    return parsed;
  }
}
