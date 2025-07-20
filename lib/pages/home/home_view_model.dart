import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_flutter/modules/auth/presentation/notifiers/login_notifier.dart';
import 'package:travel_flutter/modules/auth/infrastructure/providers/auth_providers.dart';

class HomeViewModel extends ChangeNotifier {
  final LoginNotifier _loginNotifier;

  HomeViewModel(this._loginNotifier);

  // Méthodes
  void logout() {
    _loginNotifier.reset();
  }
}

// Provider pour le ViewModel
final homeViewModelProvider = ChangeNotifierProvider<HomeViewModel>((ref) {
  final loginNotifier = ref.watch(loginStateProvider.notifier);
  return HomeViewModel(loginNotifier);
});
