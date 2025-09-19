import 'package:flutter/material.dart';

/// App color palette and theme configuration
class AppColors {
  // Primary Colors - Dark Blue
  static const Color primary = Color(0xFF1A237E);
  static const Color primaryDark = Color(0xFF0D1B5E);
  static const Color primaryLight = Color(0xFF3949AB);

  // Secondary Colors - Dark Green
  static const Color secondary = Color(0xFF1B5E20);
  static const Color secondaryDark = Color(0xFF0E3311);
  static const Color secondaryLight = Color(0xFF2E7D32);

  // Functional Colors
  static const Color success = Color(0xFF2E7D32);
  static const Color warning = Color(0xFF1565C0);
  static const Color error = Color(0xFF1A237E);
  static const Color info = Color(0xFF1A237E);

  // Neutral Colors
  static const Color background = Color.fromARGB(255, 255, 255, 255);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF8F9FA);

  // Text ColorsR
  static const Color textPrimary = Color(0xFF0D1B2A);
  static const Color textSecondary = Color(0xFF1A237E);
  static const Color textTertiary = Color(0xFF3949AB);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // Wallet Specific Colors
  static const Color wallet = Color.fromARGB(255, 90, 88, 88);
  static const Color escrow = Color.fromARGB(255, 90, 88, 88);
  static const Color earnings = Color.fromARGB(255, 90, 88, 88);
  static const Color expenses = Color.fromARGB(255, 90, 88, 88);

  // Job Status Colors
  static const Color jobActive = Color(0xFF2E7D32);
  static const Color jobPending = Color(0xFF1565C0);
  static const Color jobCompleted = Color(0xFF1A237E);
  static const Color jobCancelled = Color(0xFF0D1B5E);

  // Additional UI Colors
  static const Color cardBorder = Color(0xFF3949AB);
  static const Color cardShadow = Color(0x0A000000);
  static const Color tabBackground = Color(0xFF0D1B2A);
  static const Color transactionContainer = Color(0xFFF8F9FA);

  // Pre-calculated opacity colors for performance
  static const Color warningLight = Color(0x1A1565C0);
  static const Color successLight = Color(0x1A2E7D32);
  static const Color primaryLight10 = Color(0x1A1A237E);
  static const Color textOnPrimaryLight = Color(0xE6FFFFFF);
  static const Color textOnPrimaryMedium = Color(0x33FFFFFF);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, primaryDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient earningsGradient = LinearGradient(
    colors: [success, Color(0xFF388E3C)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient walletGradient = LinearGradient(
    colors: [wallet, Color(0xFF303F9F)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    colors: [background, Color(0xFF1A237E), primaryLight],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.5, 1.0],
  );
}

/// App text styles for consistent typography
class AppTextStyles {
  // Headings
  static const TextStyle h1 = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: Color.fromARGB(255, 255, 255, 255),
    height: 1.2,
  );

  static const TextStyle h2 = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle h3 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.3,
  );

  static const TextStyle h4 = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle h5 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  static const TextStyle h6 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Body Text
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimary,
    height: 1.5,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
    height: 1.4,
  );

  // Special Text Styles
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    color: AppColors.textTertiary,
    height: 1.3,
  );

  static const TextStyle button = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textOnPrimary,
    height: 1.2,
  );

  static const TextStyle link = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
    height: 1.4,
  );

  // App-specific styles
  static const TextStyle earningsAmount = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.bold,
    color: AppColors.earnings,
    height: 1.2,
  );

  static const TextStyle walletBalance = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: Color.fromARGB(255, 255, 255, 255),
    height: 1.2,
  );
}

/// Main app theme configuration
class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 235, 136, 136),
        brightness: Brightness.light,
        primary: const Color.fromARGB(255, 142, 151, 245),
        secondary: AppColors.secondary,
        surface: const Color.fromARGB(255, 255, 255, 255),
        error: const Color.fromARGB(255, 235, 64, 34),
      ),
      scaffoldBackgroundColor: AppColors.background,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 255, 255, 255),
        brightness: Brightness.dark,
      ),
    );
  }
}
