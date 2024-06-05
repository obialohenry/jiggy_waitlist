import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:jiggy_waitlist/repository/backend/jiggy_waitlist_backend.dart';
import 'package:jiggy_waitlist/src/model.dart';
import 'package:jiggy_waitlist/src/utils.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

final jiggyWaitlistViewModel = ChangeNotifierProvider((ref) => JiggyWaitlistViewModel());

class JiggyWaitlistViewModel extends ChangeNotifier {
  late SharedPreferences sharedPreferances;
  final jiggyWaitlistService = JiggyWaitlistBackend();
  String? _school;
  String? get school => _school;
  List<SouthEastUniversityResponse>? _southEastUniversitiesList;
  List<SouthEastUniversityResponse>? get southEastUniversitiesList => _southEastUniversitiesList;
  String? _phoneNumber;
  int? _universityOrCollegeId;
  int? _expectedYearOfGraduation;
  bool _isPostingWaitlistForm = false;
  bool get isPostingWaitlistForm => _isPostingWaitlistForm;
  bool _isLoggingIn = false;
  bool get isLoggingIn => _isLoggingIn;
  bool _userHasSignedUp = false;
  bool get userHasSignedUp => _userHasSignedUp;
  TextEditingController _emailController = TextEditingController(text: DummyData.email);
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _expectedYearOfGraduationController = TextEditingController();
  TextEditingController _referralController = TextEditingController();
  TextEditingController get emailController => _emailController;
  TextEditingController get phoneNumberController => _phoneNumberController;
  TextEditingController get expectedYearOfGraduationController =>
      _expectedYearOfGraduationController;
  TextEditingController get referralController => _referralController;

//A method to store a selected southeast university from the list of southeast universities and store it in a variable called _school.
  void selectASouthEastUniversity(String? selectedUniversity) {
    _school = selectedUniversity;
    notifyListeners();
  }

//A method to get a university id based on the name of university selected.
  void getUniversityId() {
    for (int i = 0; i < _southEastUniversitiesList!.length; i++) {
      if (_southEastUniversitiesList![i].name == _school) {
        _universityOrCollegeId = _southEastUniversitiesList![i].id;
        notifyListeners();
      }
    }
  }

//A get method to get the list of South-east universities in Nigeria.
  Future<void> getAllUniversitiesInTheSouthEast(BuildContext context) async {
    try {
      await jiggyWaitlistService
          .getAllSouthEastUniversities()
          .then((southEastUniversitiesJson) async {
        print("get value: $southEastUniversitiesJson");
        if (southEastUniversitiesJson != null) {
          final decodedResponse = jsonDecode(southEastUniversitiesJson);
          print("decoded response: $decodedResponse");
          _southEastUniversitiesList = (decodedResponse as List)
              .map((aSouthEastUniversity) =>
                  SouthEastUniversityResponse.fromJson(aSouthEastUniversity))
              .toList();
          print("university list: $_southEastUniversitiesList");
          notifyListeners();
        }
      });
    } catch (e, s) {
      logger.e(s);
    }
  }

//A method that locally saves a user's email locally using the sharedprefernces package.
  saveEmailLocally(String email) async {
    sharedPreferances = await SharedPreferences.getInstance();
    sharedPreferances.setString("email", email);
    logger.i("$email successfully saved to the device using sharedpreference package.");
  }

  //A method that locally saves a user's referall code locally using the sharedprefernces package.
  saveReferallCodeLocally(String referallCode) async {
    sharedPreferances = await SharedPreferences.getInstance();
    sharedPreferances.setString("referral_code", referallCode);
    logger.i("$referallCode successfully saved to the device using sharedpreference package.");
  }

  //A method that get's  a user's referall code  that was locally saved in his/her device using the sharedprefernces package.
  getLocallySavedReferallCode() async {
    sharedPreferances = await SharedPreferences.getInstance();
    DummyData.referralCode = sharedPreferances.getString("referral_code");
    logger.i("${DummyData.referralCode} gotten successfully");
  }

  //A method that get's  a user's email  that was locally saved in his/her device using the sharedprefernces package.
  getLocallySavedEmail() async {
    sharedPreferances = await SharedPreferences.getInstance();
    DummyData.referralCode = sharedPreferances.getString("email");
    logger.i("${DummyData.email} gotten successfully");
  }

//A post method to post user's that have signed up on the web using the waitlist form to the database.
  Future<void> aWaitlistForm(BuildContext context) async {
    _isPostingWaitlistForm = true;
    DummyData.email = _emailController.text;
    print("users emailz:${DummyData.email}");
    notifyListeners();
    try {
      await jiggyWaitlistService
          .postAWaitlistForm(
        email: DummyData.email!,
        phoneNumber: _phoneNumberController.text,
        universityOrCollege: _universityOrCollegeId ?? 1,
        expectedGraduationYear: int.parse(_expectedYearOfGraduationController.text),
      )
          .then((userInfo) async {
        if (userInfo != null) {
          final decodedResponse = jsonDecode(userInfo);
          DummyData.referralCode = decodedResponse["referral_code"];
          logger.i("referral code: ${decodedResponse["referral_code"]}");
          print("referral code: ${decodedResponse["referral_code"]}");
          _userHasSignedUp = true;
          await saveEmailLocally(_emailController.text);
          await getLocallySavedEmail();
          await saveReferallCodeLocally(decodedResponse["referral_code"]);
          await getLocallySavedReferallCode();
          notifyListeners();
          showToast(msg: "You have been successfully waitlisted", isError: false);
        } else {
          showToast(msg: "Student with this email already exist", isError: true);
        }
      }).whenComplete(() {
        _isPostingWaitlistForm = false;
        notifyListeners();
      });
    } catch (e, s) {
      logger.e(s);
    }
  }
}
