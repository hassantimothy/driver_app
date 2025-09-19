import 'package:flutter/material.dart';
import '../../../core/theme.dart';
import '../../../core/spacing.dart';

// ------------------ Models ------------------ //
class WalletType {
  final String id;
  final String name;
  final String description;
  final double amount;
  final IconData icon;
  final Color color;

  const WalletType({
    required this.id,
    required this.name,
    required this.description,
    required this.amount,
    required this.icon,
    required this.color,
  });
}

class Transaction {
  final String id;
  final String title;
  final double amount;
  final bool isCredit;
  final DateTime date;
  final IconData icon;
  final Color iconColor;

  const Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.isCredit,
    required this.date,
    required this.icon,
    required this.iconColor,
  });
}

// ------------------ Screen ------------------ //
class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  WalletType _selectedWalletType = _defaultWalletTypes.first;

  // Main wallet types data
  static const List<WalletType> _defaultWalletTypes = [
    WalletType(
      id: 'driver',
      name: 'Driver Wallet',
      description: 'Your earnings and trip payments',
      amount: 10500.00,
      icon: Icons.drive_eta,
      color: AppColors.wallet,
    ),
    WalletType(
      id: 'escrow',
      name: 'Escrow Wallet',
      description: 'Security deposits and vehicle payments',
      amount: 15000.00,
      icon: Icons.shield,
      color: AppColors.escrow,
    ),
  ];

  // Sample transactions by wallet type
  List<Transaction> get _currentTransactions {
    switch (_selectedWalletType.id) {
      case 'driver':
        return _driverTransactions;
      case 'escrow':
        return _escrowTransactions;
      default:
        return _driverTransactions;
    }
  }

  double get totalAmount =>
      _defaultWalletTypes.fold(0.0, (sum, wallet) => sum + wallet.amount);

  // Driver transactions
  List<Transaction> get _driverTransactions => [
    Transaction(
      id: '1',
      title: 'Trip Payment Received',
      amount: 850.00,
      isCredit: true,
      date: DateTime.now().subtract(const Duration(minutes: 30)),
      icon: Icons.add_circle_outline_rounded,
      iconColor: AppColors.success,
    ),
    Transaction(
      id: '2',
      title: 'Fuel Purchase',
      amount: 1200.00,
      isCredit: false,
      date: DateTime.now().subtract(const Duration(hours: 2)),
      icon: Icons.local_gas_station_rounded,
      iconColor: AppColors.warning,
    ),
    Transaction(
      id: '3',
      title: 'Weekly Bonus',
      amount: 500.00,
      isCredit: true,
      date: DateTime.now().subtract(const Duration(hours: 5)),
      icon: Icons.trending_up_rounded,
      iconColor: AppColors.success,
    ),
  ];

  // Escrow transactions
  List<Transaction> get _escrowTransactions => [
    Transaction(
      id: '4',
      title: 'Trip Escrow Hold',
      amount: 750.00,
      isCredit: true,
      date: DateTime.now().subtract(const Duration(minutes: 45)),
      icon: Icons.shield_rounded,
      iconColor: AppColors.escrow,
    ),
    Transaction(
      id: '5',
      title: 'Payment to Vehicle Owner',
      amount: 1500.00,
      isCredit: false,
      date: DateTime.now().subtract(const Duration(hours: 3)),
      icon: Icons.send_rounded,
      iconColor: AppColors.primary,
    ),
  ];

  // ------------------ Build ------------------ //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          _buildTopSection(),
          Expanded(
            child: Container(
              color: AppColors.background,
              child: Column(
                children: [
                  const SizedBox(height: AppSpacing.sm),
                  // Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.lg,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          'Recent Transactions',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'View All',
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  // List
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSpacing.lg,
                      ),
                      itemCount: _currentTransactions.length,
                      itemBuilder: (context, index) {
                        final transaction = _currentTransactions[index];
                        return _buildTransactionItem(transaction);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: _buildSplitWalletButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  // ------------------ Widgets ------------------ //
  Widget _buildTopSection() {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: AppColors.primaryGradient,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).padding.top),
              // App bar
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.sm,
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    const Text(
                      'My Wallet',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      icon: const Icon(
                        Icons.more_vert_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              // Balance + Wallets
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg,
                  vertical: AppSpacing.md,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Total Balance',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs),
                    Text(
                      'KSh ${totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    // Wallet selector row
                    Row(
                      children: _defaultWalletTypes.map((walletType) {
                        final isSelected =
                            walletType.id == _selectedWalletType.id;
                        return Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedWalletType = walletType;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(
                                right: AppSpacing.sm,
                              ),
                              padding: const EdgeInsets.all(AppSpacing.lg),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white.withValues(alpha: 0.12)
                                    : Colors.white.withValues(alpha: 0.06),
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: Colors.white.withValues(
                                    alpha: isSelected ? 0.28 : 0.08,
                                  ),
                                  width: isSelected ? 2 : 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.08),
                                    blurRadius: 8,
                                    offset: const Offset(0, 4),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withValues(
                                        alpha: isSelected ? 0.22 : 0.12,
                                      ),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(
                                      walletType.icon,
                                      color: Colors.white,
                                      size: 28,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.sm),
                                  Text(
                                    walletType.name.split(' ').first,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: AppSpacing.xs),
                                  Text(
                                    'KSh ${walletType.amount.toStringAsFixed(0)}',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Container(height: 30, color: AppColors.background),
      ],
    );
  }

  Widget _buildTransactionItem(Transaction transaction) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: AppColors.textSecondary.withValues(alpha: 0.1),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: transaction.iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              transaction.icon,
              color: transaction.iconColor,
              size: 20,
            ),
          ),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _formatTransactionDate(transaction.date),
                  style: TextStyle(
                    fontSize: 12,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '${transaction.isCredit ? '+' : '-'}KSh ${transaction.amount.toStringAsFixed(0)}',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: transaction.isCredit ? AppColors.success : AppColors.error,
            ),
          ),
        ],
      ),
    );
  }

  String _formatTransactionDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes > 1 ? 's' : ''} ago';
    } else {
      return 'Just now';
    }
  }

  Widget _buildSplitWalletButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
      height: 105,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.2),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (_selectedWalletType.id != 'driver') {
                  setState(() {
                    _selectedWalletType = _defaultWalletTypes.firstWhere(
                      (w) => w.id == 'driver',
                    );
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: _selectedWalletType.id == 'driver'
                      ? AppColors.wallet
                      : AppColors.surface.withValues(alpha: 0.8),
                  borderRadius: _selectedWalletType.id == 'driver'
                      ? BorderRadius.circular(32.5) // 🔥 full oval when active
                      : const BorderRadius.only(
                          topLeft: Radius.circular(32.5),
                          bottomLeft: Radius.circular(32.5),
                        ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.drive_eta,
                      color: _selectedWalletType.id == 'driver'
                          ? Colors.white
                          : AppColors.textSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Driver',
                      style: TextStyle(
                        color: _selectedWalletType.id == 'driver'
                            ? Colors.white
                            : AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                if (_selectedWalletType.id != 'escrow') {
                  setState(() {
                    _selectedWalletType = _defaultWalletTypes.firstWhere(
                      (w) => w.id == 'escrow',
                    );
                  });
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                  color: _selectedWalletType.id == 'escrow'
                      ? AppColors.escrow
                      : AppColors.surface.withValues(alpha: 0.8),
                  borderRadius: _selectedWalletType.id == 'escrow'
                      ? BorderRadius.circular(32.5) // 🔥 full oval when active
                      : const BorderRadius.only(
                          topRight: Radius.circular(32.5),
                          bottomRight: Radius.circular(32.5),
                        ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shield,
                      color: _selectedWalletType.id == 'escrow'
                          ? Colors.white
                          : AppColors.textSecondary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Escrow',
                      style: TextStyle(
                        color: _selectedWalletType.id == 'escrow'
                            ? Colors.white
                            : AppColors.textSecondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
