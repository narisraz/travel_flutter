import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_flutter/pages/auth/login/login_view_model.dart';

class PasswordField extends ConsumerWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final password = ref.watch(
      loginViewModelProvider.select((vm) => vm.password),
    );
    final passwordError = ref.watch(
      loginViewModelProvider.select((vm) => vm.passwordError),
    );
    final isPasswordVisible = ref.watch(
      loginViewModelProvider.select((vm) => vm.isPasswordVisible),
    );
    final loginViewModel = ref.read(loginViewModelProvider.notifier);

    return TextFormField(
      initialValue: password,
      obscureText: !isPasswordVisible,
      onChanged: (value) => loginViewModel.updatePassword(value),
      decoration: InputDecoration(
        labelText: 'Mot de passe',
        prefixIcon: const Icon(Icons.lock_outlined),
        errorText: passwordError.fold(() => null, (error) => error),
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () => loginViewModel.togglePasswordVisibility(),
        ),
      ),
    );
  }
}
