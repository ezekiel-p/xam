import 'dart:convert';

import '../../logic/bloc/reqres_state.dart';
import '../http/reqres_api.dart';

class ReqResRepository {
  final ReqresAPI api = ReqresAPI();

  Future<Map<String, dynamic>?> createNewDiary(ReqResState state) async {
    try {
      final response = await api.createNewDiary(state);
      if (response.statusCode == 201) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
