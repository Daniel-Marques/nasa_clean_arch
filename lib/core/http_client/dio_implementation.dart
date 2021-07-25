import 'package:dio/dio.dart';
import 'package:nasa_clean_arch/core/http_client/http_client.dart';

class DioImplementation extends HttpClient {
  @override
  Future<HttpResponse> get(String url) {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<HttpResponse> post(String url, {required Map<String, dynamic> body}) {
    // TODO: implement post
    throw UnimplementedError();
  }
}
