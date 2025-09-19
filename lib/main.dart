import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'core/theme.dart';
import 'core/providers.dart';
import 'features/dashboard/screens/dashboard_screen.dart';
import 'features/jobs/screens/jobs_screen.dart';
import 'features/wallet/screens/wallet_screen.dart';
import 'features/profile/screens/profile_screen.dart';

void main() {
  // Performance optimizations
  WidgetsFlutterBinding.ensureInitialized();

  // Set preferred orientations for better performance
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NavigationProvider()),
        ChangeNotifierProvider(create: (_) => WalletProvider()),
      ],
      child: const DriverApp(),
    ),
  );
}

class DriverApp extends StatelessWidget {
  const DriverApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Driver App',
      theme: AppTheme.lightTheme,
      home: const MainNavigation(),
      // Performance optimizations
      debugShowCheckedModeBanner: false,
      showPerformanceOverlay: false, // Set to true for performance debugging
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  // Use const screens to avoid recreating widgets
  static const List<Widget> _screens = [
    DashboardScreen(),
    JobsScreen(),
    WalletScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<NavigationProvider>(
      builder: (context, navigationProvider, child) {
        return Scaffold(
          // Use IndexedStack to maintain state and avoid rebuilds
          body: IndexedStack(
            index: navigationProvider.selectedIndex,
            children: _screens,
          ),
          bottomNavigationBar: child,
        );
      },
      // Cache the bottom navigation bar as it never changes
      child: Consumer<NavigationProvider>(
        builder: (context, navigationProvider, _) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: navigationProvider.selectedIndex,
            onTap: navigationProvider.setSelectedIndex,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Dashboard',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Jobs'),
              BottomNavigationBarItem(
                icon: Icon(Icons.account_balance_wallet),
                label: 'Wallet',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
            ],
          );
        },
      ),
    );
  }
}
