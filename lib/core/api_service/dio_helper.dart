import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:tf_dio_cache/dio_http_cache.dart';

import '../helpers/snack_helper.dart';

class DioHelper {
  late Dio _dio;
  late DioCacheManager _manager;
  final bool forceRefresh;
  static late String baseUrl;
  // static late Map<String,String> headers;

  static init({required String base,}){
    baseUrl=base;
  }

  DioHelper({this.forceRefresh = true,}){
    _dio = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          contentType: "application/x-www-form-urlencoded; charset=utf-8"),
    )
      ..interceptors.add(_getCacheManager().interceptor)
      ..interceptors.add(LogInterceptor(responseBody: true,requestBody: true,logPrint: (data)=>log(data.toString())));
  }

  DioCacheManager _getCacheManager() {
    _manager = DioCacheManager(
        CacheConfig(baseUrl: baseUrl, defaultRequestMethod: "POST"));
    return _manager;
  }

  Options _buildCacheOptions() {
    return buildCacheOptions(
      const Duration(days: 1),
      maxStale: const Duration(days: 7),
      forceRefresh: forceRefresh,
      options: Options(extra: {}),
    );
  }

  Future<dynamic> get({required BuildContext context,required String url, Map<String, dynamic>? query}) async {
    _dio.options.headers = await _getHeader();
    try {
      var response = await _dio.get(url,queryParameters: query, options: _buildCacheOptions());
      log("response ${response.statusCode}");
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      } else{
        if((context.mounted)){
          showErrorMessage(response,context);
        }        }
    } on DioError catch (e) {
      if((context.mounted)){
        showErrorMessage(e.response,context);
      }      }
    return null;
  }

  Future<dynamic> post(
      {required BuildContext context,required String url, required Map<String, dynamic> body,bool showLoader = true,Map<String, dynamic>? query}) async {

    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    bool haveFile = false;
    body.forEach((key, value) async {
      if ((value) is File) {
        haveFile = true;
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        haveFile = true;
        List<MapEntry<String, MultipartFile>> files = [];
        for(int i = 0; i >= value.length; i++ ) {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                value[i].path,
                filename: value[i].path.split("/").last,
              ));
          files.add(pic);
        }
        formData.files.addAll(files);
      }
    });

    _dio.options.headers = await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.post(url, data: haveFile? formData : body,queryParameters: query);
      log("response ${response.statusCode}");
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      } else{
        if((context.mounted)){
          showErrorMessage(response,context);
        }        }
    } on DioError catch (e) {
      if((context.mounted)){
        showErrorMessage(e.response,context);
      }      }

    return null;
  }


  Future<dynamic> put(
      {required BuildContext context,required String url, required Map<String, dynamic> body,bool showLoader = true,Map<String, dynamic>? query}) async {
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    bool haveFile = false;
    body.forEach((key, value) async {
      if ((value) is File) {
        haveFile = true;
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        haveFile = true;
        List<MapEntry<String, MultipartFile>> files = [];
        // value.forEach((element) async {
        //   MapEntry<String, MultipartFile> pic = MapEntry(
        //       key,
        //       MultipartFile.fromFileSync(
        //         element.path,
        //         filename: element.path.split("/").last,
        //       ));
        //   files.add(pic);
        // });
        for(int i = 0; i >= value.length; i++ ) {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                value[i].path,
                filename: value[i].path.split("/").last,
              ));
          files.add(pic);
        }
        formData.files.addAll(files);
      }
    });

    _dio.options.headers = await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.put(url, data: haveFile? formData : body,queryParameters: query);
      log("response ${response.statusCode}");
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      } else{
        if((context.mounted)){
          showErrorMessage(response,context);
        }        }
    } on DioError catch (e) {
      if((context.mounted)){
        showErrorMessage(e.response,context);
      }      }

    return null;
  }

  Future<dynamic> patch({required BuildContext context,required String url,required Map<String, dynamic> body,bool showLoader = true,Map<String, dynamic>? query}) async {
    _printRequestBody(body);
    _dio.options.headers = await _getHeader();
    try {
      var response =
      await _dio.patch(url, data: body,queryParameters: query);
      log("response ${response.statusCode}");
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      } else{
        if((context.mounted)){
          showErrorMessage(response,context);
        }
      }
    } on DioError catch (e) {
      if((context.mounted)){
        showErrorMessage(e.response,context);
      }
    }

    return null;
  }

  Future<dynamic> delete({required BuildContext context,required String url, Map<String, dynamic>? body,
    bool showLoader = true,Map<String, dynamic>? query}) async {
    // _printRequestBody(body!);
    _dio.options.headers = await _getHeader();
    try {
      var response =
      await _dio.delete(url, data: body,queryParameters: query);
      log("body response ${response.statusCode}");
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      } else{
        if((context.mounted)){
          showErrorMessage(response,context);
        }        }
    } on DioError catch (e) {
      if((context.mounted)){
        showErrorMessage(e.response,context);
      }      }

    return null;
  }

  Future<dynamic> uploadChatFile(BuildContext context,String url, Map<String, dynamic> body,
      {bool showLoader = true}) async {
    _printRequestBody(body);
    FormData formData = FormData.fromMap(body);
    body.forEach((key, value) async {
      if ((value) is File) {
        //create multipart using filepath, string or bytes
        MapEntry<String, MultipartFile> pic = MapEntry(
          key,
          MultipartFile.fromFileSync(value.path,
              filename: value.path.split("/").last),
        );
        //add multipart to request
        formData.files.add(pic);
      } else if ((value) is List<File>) {
        List<MapEntry<String, MultipartFile>> files = [];
        for(int i = 0; i >= value.length; i++ ) {
          MapEntry<String, MultipartFile> pic = MapEntry(
              key,
              MultipartFile.fromFileSync(
                value[i].path,
                filename: value[i].path.split("/").last,
              ));
          files.add(pic);
        }
        formData.files.addAll(files);
      } else {
        // requestData.addAll({"$key":"$value"});

      }
    });

    _dio.options.headers = await _getHeader();
    //create multipart request for POST or PATCH method

    try {
      var response = await _dio.post(url, data: formData);
      log("response ${response.statusCode}");
      if (response.statusCode==200||response.statusCode==201) {
        return response.data;
      } else{
        if((context.mounted)){
          showErrorMessage(response,context);
        }        }
    } on DioError catch (e) {
      if((context.mounted)){
        showErrorMessage(e.response,context);
      }      }

    return null;
  }

  void _printRequestBody(Map<String, dynamic> body) {
    log(
        "-------------------------------------------------------------------");
    log("$body");
    log(
        "-------------------------------------------------------------------");
  }


  showErrorMessage(Response? response,BuildContext context){
    if (response==null) {
      log("failed response Check Server");
      SnackBarHelper.showBasicSnack( msg: "Check Server",context: context);
    }else{
      log("failed response ${response.statusCode}");
      log("failed response ${response.data}");
      var data = response.data;
      if(data is String) data = json.decode(response.data);
      switch(response.statusCode){
        case 500:
          SnackBarHelper.showBasicSnack( msg: data["message"].toString(),context: context);
          break;
        case 422:
          if(data["errors"]!=null){
            Map<String,dynamic> errors = data["message"];
            log("response errors $errors");
            errors.forEach((key, value){
              List<String> lst = List<String>.from(value.map((e) => e));
              for (var e in lst) {
                SnackBarHelper.showBasicSnack( msg: e, context: context);
              }
            });
          }else{
            SnackBarHelper.showBasicSnack( msg: data["message"].toString(), context: context);
          }
          break;
        case 401:
          tokenExpired();
          break;
        case 301:
        case 302:
          tokenExpired();
          break;
      }
    }
  }

  _getHeader() async {
    // var lang = navigatorKey.currentContext!.read<LangCubit>().state.locale.languageCode;
    return {
      'Accept-Language': 'ar',
      'Accept': 'application/json',
      'Authorization': 'Bearer ',
    };
  }


  void tokenExpired()async {
    // NavigationService.navigateAndReplacement(Login());
  }
}
