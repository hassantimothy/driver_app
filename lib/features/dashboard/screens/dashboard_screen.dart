import 'package:flutter/material.dart';
import '../../../core/theme.dart';
import '../../../core/spacing.dart';
import '../../../core/widgets.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  // Cache text styles to avoid repeated copyWith() calls
  static final TextStyle _earningsTitleStyle = AppTextStyles.h6.copyWith(
    color: AppColors.textOnPrimary,
  );

  static final TextStyle _earningsAmountStyle = AppTextStyles.earningsAmount
      .copyWith(color: AppColors.textOnPrimary);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dashboard')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Optimized earnings card
            Card(
              elevation: AppElevation.medium,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.earningsGradient,
                  borderRadius: AppBorderRadiusValues.medium,
                ),
                child: ListTile(
                  leading: const Icon(
                    Icons.attach_money,
                    size: 40,
                    color: AppColors.textOnPrimary,
                  ),
                  title: Text("Today's Earnings", style: _earningsTitleStyle),
                  subtitle: Text('Ksh 2,500', style: _earningsAmountStyle),
                ),
              ),
            ),
            AppWidgets.spacingLG,
            Text('Recent Trips/Payments', style: AppTextStyles.h5),
            Expanded(
              child: ListView.builder(
                itemCount: _tripData.length,
                itemBuilder: (context, index) {
                  final trip = _tripData[index];
                  return Card(
                    child: ListTile(
                      title: Text(trip.title, style: AppTextStyles.bodyMedium),
                      subtitle: Text(
                        trip.subtitle,
                        style: AppTextStyles.bodySmall,
                      ),
                      trailing: Text(trip.time, style: AppTextStyles.caption),
                    ),
                  );
                },
              ),
            ),
            AppWidgets.spacingMD,
            Text('Notifications', style: AppTextStyles.h5),
            Card(
              color: AppColors.warningLight,
              child: const ListTile(
                leading: Icon(Icons.notifications, color: AppColors.warning),
                title: Text(
                  'Weekly payment due tomorrow!',
                  style: AppTextStyles.bodyMedium,
                ),
                subtitle: Text(
                  'Please ensure you pay the car owner.',
                  style: AppTextStyles.bodySmall,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Trip data model for better performance
class _TripData {
  final String title;
  final String subtitle;
  final String time;

  const _TripData(this.title, this.subtitle, this.time);
}

// Static data to avoid recreating on every build
const List<_TripData> _tripData = [
  _TripData('Trip to CBD', 'Paid: Ksh 500', '09:30 AM'),
  _TripData('Trip to Westlands', 'Paid: Ksh 700', '11:00 AM'),
  _TripData('Trip to Airport', 'Paid: Ksh 1,300', '01:15 PM'),
];
