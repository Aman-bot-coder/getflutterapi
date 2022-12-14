import 'package:http/http.dart' as http;
import 'dart:convert';
class ApiServices{
  Future<PostApiRes> postCall(Map<String,dynamic>param) async{
    var url = Uri.parse('https://reqres.in/api/users');
    var response = await http.post(url,body:param);
    print('Response :${response.statusCode}');
    print('Response Body:${response.body}');
    final data = jsonDecode(response.body);
    return PostApiRes(token:data["token"],error:data["error"]);

    
}
}

class PostApiRes {
  final String?token;
  final String? error;
  PostApiRes({this.token,this.error});
}