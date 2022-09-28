// ignore_for_file: prefer_final_fields

import 'package:dio/dio.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopping_app/DataBase/Model/direction_model.dart';
import 'package:shopping_app/Utils/.env.dart';

class DirectionRepository {
  static String _baseUrl =
      "https://maps.googleapis.com/maps/api/directions/json?";

  final Dio _dio;

  DirectionRepository({ Dio dio}) : _dio = dio ?? Dio();

  Future<Directions> getDirections({
     LatLng origin,
     LatLng destination,
  }) async {
    final response = await _dio.get(_baseUrl, queryParameters: {
      'origin': '${origin.latitude}, ${origin.longitude}',
      'destination': '${destination.latitude}, ${destination.longitude}',
      'key': googleAPIKey,
    });

    if (response.statusCode == 200) {
      return Directions.fromMap(response.data);
    }
    return null;
  }
}
