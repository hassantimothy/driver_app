// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:driver_app/main.dart';
import 'package:driver_app/core/providers.dart';

void main() {
  testWidgets('Driver app loads successfully', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => NavigationProvider()),
          ChangeNotifierProvider(create: (_) => WalletProvider()),
        ],
        child: const DriverApp(),
      ),
    );

    // Verify that the app loads and shows dashboard
    expect(find.text('Dashboard'), findsOneWidget);
    expect(find.text('Total Earnings'), findsOneWidget);
  });
}
