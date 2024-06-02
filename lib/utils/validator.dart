class Validator {
  final phoneNumberRegExp = RegExp(
    r'^([0-9]( |-)?)?(\(?[0-9]{3}\)?|[0-9]{3})( |-)?([0-9]{3}( |-)?[0-9]{4}|[a-zA-Z0-9]{9})$',
  );
  final emailRegExp = RegExp(
    r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$",
  );
  String? validateEmptyTextField(String? value) {
    if (value!.trim().isEmpty) {
      return 'This field cannot be empty';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value!.trim().isEmpty) {
      return 'Email cannot be empty';
    } else if (!emailRegExp.hasMatch(value.trim())) {
      return 'Email is invalid';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    if (value!.trim().isEmpty) {
      return 'Phone number cannot be empty';
    } else if (!phoneNumberRegExp.hasMatch(value.trim())) {
      return 'Phone number is invalid';
    }
    return null;
  }
}
