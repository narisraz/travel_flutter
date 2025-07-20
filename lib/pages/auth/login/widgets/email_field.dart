import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_flutter/pages/auth/login/login_view_model.dart';

class EmailField extends ConsumerWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(loginViewModelProvider.select((vm) => vm.email));
    final emailError = ref.watch(
      loginViewModelProvider.select((vm) => vm.emailError),
    );

    return TextFormField(
      initialValue: email,
      keyboardType: TextInputType.emailAddress,
      onChanged: (value) =>
          ref.read(loginViewModelProvider.notifier).updateEmail(value),
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email_outlined),
        errorText: emailError.fold(() => null, (error) => error),
      ),
    );
  }
}
