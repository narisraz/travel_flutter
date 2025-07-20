import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:travel_flutter/modules/core/shared/widgets/custom_text_field.dart';
import 'package:travel_flutter/pages/auth/login/login_view_model.dart';

class EmailField extends ConsumerWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final email = ref.watch(loginViewModelProvider.select((vm) => vm.email));
    final emailError = ref.watch(
      loginViewModelProvider.select((vm) => vm.emailError),
    );

    return CustomTextField(
      labelText: 'Email',
      prefixIcon: Icons.email_outlined,
      initialValue: email,
      keyboardType: TextInputType.emailAddress,
      errorText: emailError.fold(() => null, (error) => error),
      onChanged: (value) =>
          ref.read(loginViewModelProvider.notifier).updateEmail(value),
    );
  }
}
