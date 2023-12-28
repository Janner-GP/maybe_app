import 'package:dio/dio.dart';
import 'package:maybe_app/domain/message.dart';
import 'package:maybe_app/infrastructure/models/yes_no_model.dart';

class GetYesNoAnswer {

  final _dio = Dio();

  Future<Message> getAnswer (String message) async {

    final response = await _dio.get('https://yesno.wtf/api');
    final yesNoModel = YesNoModel.fromJsonMap(response.data, message);

    return yesNoModel.toMessage();
  }

}