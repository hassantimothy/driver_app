import 'package:flutter/material.dart';

/// Navigation provider to manage bottom navigation state
class NavigationProvider extends ChangeNotifier {
  int _selectedIndex = 0;

  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int index) {
    if (_selectedIndex != index) {
      _selectedIndex = index;
      notifyListeners();
    }
  }
}

/// Wallet provider to manage wallet tab state and data
class WalletProvider extends ChangeNotifier {
  int _selectedWalletTab = 0;

  int get selectedWalletTab => _selectedWalletTab;

  void setSelectedWalletTab(int index) {
    if (_selectedWalletTab != index) {
      _selectedWalletTab = index;
      notifyListeners();
    }
  }
}
