import 'package:jiggy_waitlist/repository/services/api/api_service.dart';

class JiggyWaitlistBackend extends ApiService {
  Future<dynamic> getAllSouthEastUniversities() async {
    return getMth(
      southEastUniversitiesUri,
      headers: getHeader,
      canShowToast: true,
    );
  }

  Future<dynamic> postAWaitlistForm({
    required String email,
    required String phoneNumber,
    required int universityOrCollege,
    required int expectedGraduationYear,
  }) async {
    return postMth(
      body: {
        "email": email,
        "phone_number": phoneNumber,
        "university_or_college": universityOrCollege,
        "expected_graduation_year": expectedGraduationYear,
      },
      waitlistFormUri,
      headers: postHeader,
      canShowToast: true,
    );
  }
}
