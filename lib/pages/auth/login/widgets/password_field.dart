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
    final loginViewModel = ref.watch(loginViewModelProvider);

    return TextFormField(
      initialValue: password,
      obscureText: !isPasswordVisible,
      onChanged: (value) => loginViewModel.updatePassword(value),
      decoration: InputDecoration(
        labelText: 'Mot de passe',
        prefixIcon: const Icon(Icons.lock_outlined),
        errorText: passwordError,
        suffixIcon: IconButton(
          icon: Icon(
            isPasswordVisible ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: () => loginViewModel.togglePasswordVisibility(),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Color(0xFF667eea), width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: Colors.red),
        ),
      ),
    );
  }
}
