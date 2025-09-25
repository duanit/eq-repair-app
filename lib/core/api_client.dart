import 'package:dio/dio.dart';
import 'env.dart';

final dio = Dio(BaseOptions(baseUrl: Env.apiBase));
