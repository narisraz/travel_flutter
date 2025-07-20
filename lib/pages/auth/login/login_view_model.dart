import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_flutter/modules/auth/domain/value_objects/email.dart';
import 'package:travel_flutter/modules/auth/domain/value_objects/password.dart';
import 'package:travel_flutter/modules/auth/presentation/notifiers/login_notifier.dart';
import 'package:travel_flutter/modules/auth/infrastructure/providers/auth_providers.dart';

class LoginViewModel extends ChangeNotifier {
  final LoginNotifier _loginNotifier;

  LoginViewModel(this._loginNotifier);

  // État local du ViewModel
  String _email = '';
  String _password = '';
  String? _emailError;
  String? _passwordError;
  bool _isPasswordVisible = false;

  // Getters
  String get email => _email;
  String get password => _password;
  String? get emailError => _emailError;
  String? get passwordError => _passwordError;
  bool get isPasswordVisible => _isPasswordVisible;

  // Méthodes pour mettre à jour l'état
  void updateEmail(String email) {
    _email = email;
    _clearEmailError();
    notifyListeners();
  }

  void updatePassword(String password) {
    _password = password;
    _clearPasswordError();
    notifyListeners();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible = !_isPasswordVisible;
    notifyListeners();
  }

  void _clearEmailError() {
    if (_emailError != null) {
      _emailError = null;
    }
  }

  void _clearPasswordError() {
    if (_passwordError != null) {
      _passwordError = null;
    }
  }

  void clearAllErrors() {
    _emailError = null;
    _passwordError = null;
    notifyListeners();
  }

  // Validation avec les value objects
  bool validateEmail() {
    try {
      Email(value: _email.trim());
      _emailError = null;
      return true;
    } catch (e) {
      _emailError = 'Veuillez saisir un email valide';
      notifyListeners();
      return false;
    }
  }

  bool validatePassword() {
    try {
      Password(value: _password);
      _passwordError = null;
      return true;
    } catch (e) {
      _passwordError = 'Le mot de passe doit contenir au moins 8 caractères';
      notifyListeners();
      return false;
    }
  }

  // Méthode principale de connexion
  Future<void> login() async {
    // Réinitialiser les erreurs
    clearAllErrors();

    // Valider les champs
    final isEmailValid = validateEmail();
    final isPasswordValid = validatePassword();

    if (!isEmailValid || !isPasswordValid) {
      return;
    }

    // Créer les value objects
    final emailValue = Email(value: _email.trim());
    final passwordValue = Password(value: _password);

    // Procéder à la connexion
    await _loginNotifier.login(emailValue, passwordValue);
  }

  void reset() {
    _loginNotifier.reset();
  }
}

// Provider pour le ViewModel
final loginViewModelProvider = ChangeNotifierProvider<LoginViewModel>((ref) {
  final loginNotifier = ref.watch(loginStateProvider.notifier);
  return LoginViewModel(loginNotifier);
});
