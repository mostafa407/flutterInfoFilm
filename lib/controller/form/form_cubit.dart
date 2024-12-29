import 'package:bloc/bloc.dart';

class FormCubit extends Cubit<Map<String, String>> {
  FormCubit() : super({});

  void updateField(String field, String value) {
    emit({...state, field: value});
  }

  String? validateName(String? value) {
    if (value == null || value.isEmpty) return 'Name is required';
    if (value.length < 3) return 'Name must be at least 3 characters';
    return null;
  }

  String? validateEmail(String? value) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
    if (value == null || value.isEmpty) return 'Email is required';
    if (!emailRegex.hasMatch(value)) return 'Invalid email';
    return null;
  }

  String? validatePhone(String? value) {
    final phoneRegex = RegExp(r'^\d{10}$');
    if (value == null || value.isEmpty) return 'Phone is required';
    if (!phoneRegex.hasMatch(value)) return 'Phone must be 10 digits';
    return null;
  }

  bool isFormValid() {
    return validateName(state['name']) == null &&
        validateEmail(state['email']) == null &&
        validatePhone(state['phone']) == null &&
        state['gender'] != null &&
        state['country'] != null &&
        state['state'] != null &&
        state['city'] != null;
  }
}
