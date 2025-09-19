import 'package:flutter/material.dart';
import '../../../core/theme.dart';
import '../../../core/spacing.dart';

class JobsScreen extends StatelessWidget {
  const JobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Jobs')),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.md),
        children: [
          Card(
            child: ListTile(
              leading: Icon(Icons.directions_car, color: AppColors.jobActive),
              title: Text('Job #1', style: AppTextStyles.bodyMedium),
              subtitle: Text(
                'Pickup: CBD, Drop: Westlands',
                style: AppTextStyles.bodySmall,
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.jobActive.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppBorderRadius.small),
                ),
                child: Text(
                  'Active',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.jobActive,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.check_circle, color: AppColors.jobCompleted),
              title: Text('Job #2', style: AppTextStyles.bodyMedium),
              subtitle: Text(
                'Pickup: Airport, Drop: Karen',
                style: AppTextStyles.bodySmall,
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.jobCompleted.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppBorderRadius.small),
                ),
                child: Text(
                  'Completed',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.jobCompleted,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
          Card(
            child: ListTile(
              leading: Icon(Icons.schedule, color: AppColors.jobPending),
              title: Text('Job #3', style: AppTextStyles.bodyMedium),
              subtitle: Text(
                'Pickup: Parklands, Drop: CBD',
                style: AppTextStyles.bodySmall,
              ),
              trailing: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.sm,
                  vertical: AppSpacing.xs,
                ),
                decoration: BoxDecoration(
                  color: AppColors.jobPending.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(AppBorderRadius.small),
                ),
                child: Text(
                  'Pending',
                  style: AppTextStyles.caption.copyWith(
                    color: AppColors.jobPending,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
