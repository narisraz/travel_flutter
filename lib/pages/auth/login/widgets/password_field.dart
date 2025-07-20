import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_flutter/modules/core/shared/widgets/custom_text_field.dart';
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

    return CustomTextField(
      labelText: 'Mot de passe',
      prefixIcon: Icons.lock_outlined,
      initialValue: password,
      obscureText: !isPasswordVisible,
      errorText: passwordError.fold(() => null, (error) => error),
      suffixIcon: Icon(
        isPasswordVisible ? Icons.visibility_off : Icons.visibility,
      ),
      onChanged: (value) => loginViewModel.updatePassword(value),
      onSuffixIconPressed: () => loginViewModel.togglePasswordVisibility(),
    );
  }
}
