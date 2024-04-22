import 'dart:convert';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:sample_api_study/number_fact_response/number_fact_response.dart';

Future<NumberFactResponse> getNumberFact({required String number})async{
  final response = await http.get(Uri.parse("http://numbersapi.com/$number?json"));
  final bodyAsJson = jsonDecode(response.body) as Map<String,dynamic>;
  final data = NumberFactResponse.fromJson(bodyAsJson);
  return data;
}
