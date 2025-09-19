import 'package:flutter/material.dart';
import 'theme.dart';
import 'spacing.dart';

/// Performance-optimized widgets and reusable components
class AppWidgets {
  // Cached spacing widgets to avoid repeated SizedBox creation
  static const Widget spacingXS = SizedBox(height: AppSpacing.xs);
  static const Widget spacingSM = SizedBox(height: AppSpacing.sm);
  static const Widget spacingMD = SizedBox(height: AppSpacing.md);
  static const Widget spacingLG = SizedBox(height: AppSpacing.lg);
  static const Widget spacingXL = SizedBox(height: AppSpacing.xl);
  static const Widget spacingXXL = SizedBox(height: AppSpacing.xxl);

  // Cached horizontal spacing widgets
  static const Widget spacingHorizontalXS = SizedBox(width: AppSpacing.xs);
  static const Widget spacingHorizontalSM = SizedBox(width: AppSpacing.sm);
  static const Widget spacingHorizontalMD = SizedBox(width: AppSpacing.md);
  static const Widget spacingHorizontalLG = SizedBox(width: AppSpacing.lg);
  static const Widget spacingHorizontalXL = SizedBox(width: AppSpacing.xl);
  static const Widget spacingHorizontalXXL = SizedBox(width: AppSpacing.xxl);

  // Common divider widgets
  static const Widget divider = Divider(
    color: AppColors.cardBorder,
    thickness: 1,
    height: 1,
  );

  static const Widget verticalDivider = VerticalDivider(
    color: AppColors.cardBorder,
    thickness: 1,
    width: 1,
  );

  // Loading indicator
  static const Widget loadingIndicator = Center(
    child: CircularProgressIndicator(color: AppColors.primary),
  );

  // Empty state widget
  static Widget emptyState({
    required String title,
    required String subtitle,
    IconData? icon,
    Widget? action,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 64, color: AppColors.textTertiary),
            spacingMD,
          ],
          Text(
            title,
            style: AppTextStyles.h5.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          spacingSM,
          Text(
            subtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
            textAlign: TextAlign.center,
          ),
          if (action != null) ...[spacingLG, action],
        ],
      ),
    );
  }

  // App Bar with consistent styling
  static AppBar appBar({
    required String title,
    List<Widget>? actions,
    bool centerTitle = false,
    Widget? leading,
    Color? backgroundColor,
  }) {
    return AppBar(
      title: Text(
        title,
        style: AppTextStyles.h5.copyWith(
          color: AppColors.textPrimary,
          fontWeight: FontWeight.w600,
        ),
      ),
      centerTitle: centerTitle,
      elevation: 0,
      backgroundColor: backgroundColor ?? AppColors.surface,
      leading: leading,
      actions: actions,
      iconTheme: const IconThemeData(color: AppColors.textPrimary),
    );
  }

  // Error state widget
  static Widget errorState({
    required String title,
    required String subtitle,
    VoidCallback? onRetry,
  }) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: AppColors.error),
          spacingMD,
          Text(
            title,
            style: AppTextStyles.h5.copyWith(color: AppColors.textSecondary),
            textAlign: TextAlign.center,
          ),
          spacingSM,
          Text(
            subtitle,
            style: AppTextStyles.bodyMedium.copyWith(
              color: AppColors.textTertiary,
            ),
            textAlign: TextAlign.center,
          ),
          if (onRetry != null) ...[
            spacingLG,
            ElevatedButton(onPressed: onRetry, child: const Text('Retry')),
          ],
        ],
      ),
    );
  }
}
