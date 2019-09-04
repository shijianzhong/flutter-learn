import 'package:dio/dio.dart';
import '../utils/event_bus.dart';

class Http {
  static Http instance;
  static String token;
  static Dio _dio;
  BaseOptions _options;
  static Http getInstance() {
    if (instance == null) {
      instance = new Http();
    }
    return instance;
  }

  Http() {
    // 初始化 Options
    bus.on('login', (arg) {
      print(arg);
      token = arg;
    });
    _options = new BaseOptions(
        baseUrl: "http://211.157.164.162:28083",
        connectTimeout: 5000,
        receiveTimeout: 3000,
        headers: {});

    _dio = new Dio(_options);

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) {
      if (token != null) {
        options.headers['token'] = token;
      }
      // 在请求被发送之前做一些事情
      return options; //continue
      // 如果你想完成请求并返回一些自定义数据，可以返回一个`Response`对象或返回`dio.resolve(data)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义数据data.
      //
      // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象，或返回`dio.reject(errMsg)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onResponse: (Response response) {
      // 在返回响应数据之前做一些预处理
      return response; // continue
    }, onError: (DioError e) {
      // 当请求失败时做一些预处理
      return e; //continue
    }));
  }

  // get 请求封装
  get(
    url,
    data,
  ) async {
    print('get:::url：$url ,body: $data');
    Response response;
    try {
      response = await _dio.get(url,
          queryParameters: data != null ? data : new Map<String, dynamic>());
      print(response);
    } on DioError catch (e) {
      print('get请求发生错误：$e');
    }
    return response;
  }

  // post请求封装
  post(url, data) async {
    print('post请求::: url：$url ,body: $data');
    Response response;
    try {
      response = await _dio.post(url, data: data != null ? data : {});
    } on DioError catch (e) {
      print('post请求发生错误：$e');
    }
    return response;
  }
}
