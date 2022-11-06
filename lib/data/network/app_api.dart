import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:tut_app/data/network/constant.dart';
import 'package:tut_app/data/responses/response.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;
  @POST("/customers/login")
  Future<AuthenticationResponse> login();
}
