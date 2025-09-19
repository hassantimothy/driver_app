import 'package:flutter/material.dart';
import '../../../core/theme.dart';
import '../../../core/spacing.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            // Profile Picture Section
            Center(
              child: CircleAvatar(
                radius: 50, // Reduced from 60 to save space
                backgroundColor: AppColors.primaryLight,
                child: Icon(
                  Icons.person,
                  size: 60, // Reduced from 80
                  color: AppColors.primary,
                ),
              ),
            ),
            SizedBox(height: AppSpacing.xs), // Reduced spacing
            TextButton(
              onPressed: () {
                // TODO: Implement image picker
              },
              child: Text('Change Photo', style: AppTextStyles.link),
            ),
            SizedBox(height: AppSpacing.md), // Reduced spacing
            // Personal Information Section
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, color: AppColors.primary),
                    title: Text('Full Name', style: AppTextStyles.bodyMedium),
                    subtitle: Text('John Doe', style: AppTextStyles.bodySmall),
                    trailing: Icon(Icons.edit, color: AppColors.textSecondary),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.phone, color: AppColors.primary),
                    title: Text(
                      'Phone Number',
                      style: AppTextStyles.bodyMedium,
                    ),
                    subtitle: Text(
                      '+254 712 345 678',
                      style: AppTextStyles.bodySmall,
                    ),
                    trailing: Icon(Icons.edit, color: AppColors.textSecondary),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.email, color: AppColors.primary),
                    title: Text('Email', style: AppTextStyles.bodyMedium),
                    subtitle: Text(
                      'john.doe@example.com',
                      style: AppTextStyles.bodySmall,
                    ),
                    trailing: Icon(Icons.edit, color: AppColors.textSecondary),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(
                      Icons.directions_car,
                      color: AppColors.primary,
                    ),
                    title: Text(
                      'Vehicle Details',
                      style: AppTextStyles.bodyMedium,
                    ),
                    subtitle: Text(
                      'Toyota Corolla - KDA 123X',
                      style: AppTextStyles.bodySmall,
                    ),
                    trailing: Icon(Icons.edit, color: AppColors.textSecondary),
                  ),
                ],
              ),
            ),
            SizedBox(height: AppSpacing.md), // Reduced spacing
            // Settings Section
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.lock, color: AppColors.primary),
                    title: Text(
                      'Change Password',
                      style: AppTextStyles.bodyMedium,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.textSecondary,
                    ),
                    onTap: () {
                      // TODO: Navigate to change password screen
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: Icon(
                      Icons.notifications,
                      color: AppColors.primary,
                    ),
                    title: Text(
                      'Notifications',
                      style: AppTextStyles.bodyMedium,
                    ),
                    trailing: Switch(
                      value: true,
                      activeColor: AppColors.primary,
                      onChanged: (value) {
                        // TODO: Handle notification toggle
                      },
                    ),
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.help, color: AppColors.primary),
                    title: Text(
                      'Help & Support',
                      style: AppTextStyles.bodyMedium,
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      color: AppColors.textSecondary,
                    ),
                    onTap: () {
                      // TODO: Navigate to help screen
                    },
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.logout, color: AppColors.error),
                    title: Text(
                      'Log Out',
                      style: AppTextStyles.bodyMedium.copyWith(
                        color: AppColors.error,
                      ),
                    ),
                    onTap: () {
                      // TODO: Implement logout
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text(
                            'Confirm Logout',
                            style: AppTextStyles.h5,
                          ),
                          content: Text(
                            'Are you sure you want to log out?',
                            style: AppTextStyles.bodyMedium,
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text(
                                'Cancel',
                                style: AppTextStyles.button.copyWith(
                                  color: AppColors.textSecondary,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                // TODO: Implement actual logout logic
                              },
                              child: Text(
                                'Log Out',
                                style: AppTextStyles.button.copyWith(
                                  color: AppColors.error,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            // Add bottom spacing for better scrolling experience
            SizedBox(height: AppSpacing.xl),
          ],
        ),
      ),
    );
  }
}
