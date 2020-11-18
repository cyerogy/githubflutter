import 'dart:convert';

import 'common_api.dart';
import 'http_request.dart';

class ApiList {
  dynamic getCityAttractions(int cityId, int page, int limit) async {
    var result = await new SelfDio().get(CommonApi.GETATTRACTIONSLIST,
        data: {"cityId": cityId, "page": page, "limit": limit});
    var parsed = jsonDecode(result.toString());
    return parsed;
  }

  dynamic getCityFood(int cityId, int page, int limit) async {
    var result = await new SelfDio().get(CommonApi.GETFOOD,
        data: {"cityId": cityId, "page": page, "limit": limit});
    var parsed = jsonDecode(result.toString());
    return parsed;
  }
}
