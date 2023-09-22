mixin class ValidationMixing {
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'this field is required';
    } else if (value.length < 5) {
      return "minimum 5 characters";
    } else if (!value.contains('@')) {
      return 'please enter a valid email';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'this field is required';
    } else if (value.length < 5) {
      return 'minimum lenght is 5';
    }
    return null;
  }
}
