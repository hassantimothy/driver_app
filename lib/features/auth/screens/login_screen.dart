import 'package:flutter/material.dart';
import '../../../core/theme.dart';
import '../../../core/spacing.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Phone or Email',
                labelStyle: AppTextStyles.bodyMedium,
              ),
            ),
            SizedBox(height: AppSpacing.md),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: AppTextStyles.bodyMedium,
              ),
              obscureText: true,
            ),
            SizedBox(height: AppSpacing.lg),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Log In', style: AppTextStyles.button),
              ),
            ),
            SizedBox(height: AppSpacing.sm),
            TextButton(
              onPressed: () {},
              child: Text('Forgot Password?', style: AppTextStyles.link),
            ),
          ],
        ),
      ),
    );
  }
}
