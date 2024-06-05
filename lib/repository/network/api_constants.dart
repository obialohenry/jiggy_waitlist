import 'dart:io';

class ApiConstants {
  final String scheme = 'https';
  final String host = "jiggybackend.com.ng";
  Map<String, String> getHeader = {
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",

    "Accept-Encoding": "gzip, deflate, br",
    "Access-Control-Allow-Methods": "GET, HEAD"
  };
  Map<String, String> postHeader = {
    "Access-Control-Allow-Origin": "*", // Required for CORS support to work
    // Required for cookies, authorization headers with HTTPS
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",

    "Accept-Encoding": "gzip, deflate, br",
    "Access-Control-Allow-Methods": "POST, HEAD"
  };
  Uri get southEastUniversitiesUri => Uri(scheme: scheme, host: host, path: '/waitlist/student/');
  Uri get waitlistFormUri => Uri(scheme: scheme, host: host, path: '/waitlist/student/');
}
