enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unAuthorized,
  notFound,
  internalServerError,
  connectTimeout,
  cancel,
  recieveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
}

class ResponseCode {
  //API status code
  static const int success = 200; //Success with data
  static const int noContent = 201; //Success with no content
  static const int badRequest = 400; //Failure, api rejected the request
  static const int forbidden = 403; //Failure, api rejected the request
  static const int unAuthorized = 401; //Failure, user unauthorized
  static const int notFound = 404; //Failure, url is not correct and not found
  static const int internalServerError =
      500; //Failure, crash happend in the server side

//local status code
  static const int unKnown = -1;
  static const int connectTimeout = -2;
  static const int cancel = -3;
  static const int recieveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
}

class ResponseMessage {
  //API status code
  static const String success = "Success"; //Success with data
  static const String noContent =
      "Success with no content"; //Success with no content
  static const String badRequest =
      "Bad request, try again later"; //Failure, api rejected the request
  static const String forbidden =
      "Forbidden request, try again later"; //Failure, api rejected the request
  static const String unAuthorized =
      "User is unauthorized, try again later"; //Failure, user unauthorized
  static const String notFound =
      "Url is not found, try again later"; //Failure, url is not correct and not found
  static const String internalServerError =
      "Something went wrong, try again later"; //Failure, crash happend in the server side

//local status code
  static const String unKnown = "Something went wrong, try again later";
  static const String connectTimeout = "Time out error, try again later";
  static const String cancel = "Request was canceled, try again later";
  static const String recieveTimeout = "Time out error, try again later";
  static const String sendTimeout = "Time out error, try again later";
  static const String cacheError = "Cache error, try again later";
  static const String noInternetConnection =
      "Please check your internet connection";
}
