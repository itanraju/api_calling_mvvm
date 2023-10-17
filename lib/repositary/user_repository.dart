import '../data/network/BaseApiServices.dart';
import '../data/network/NetworkApiServices.dart';
import '../res/app_url.dart';

class UserRepository {
  BaseApiServices _apiServices=NetworkApiService();

  Future<dynamic> userListApi() async {
    try{
      dynamic response = await _apiServices.getGetApiResponse(AppUrl.userListUrl);
      return response;
    }catch(e){
      throw e;
    }
  }
}