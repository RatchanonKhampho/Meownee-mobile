import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meownee/widget/add_wallet_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'package:meownee/models/wallet.dart';
import 'package:meownee/mock_data/wallet_mock.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  List<Wallet> _wallets = [];

  @override
  void initState() {
    super.initState();
    _loadWallets();
  }

  void _loadWallets() {
    _wallets = List.from(wallets);
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    _refreshController.refreshCompleted();
  }

  void _addWallet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => AddWalletBottomSheet(
            onWalletAdded: (wallet) {
              setState(() {
                _wallets.add(wallet);
              });
            },
          ),
    );
  }

  void _editWallet(int index) {
    final oldWallet = _wallets[index];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder:
          (context) => AddWalletBottomSheet(
            wallet: oldWallet,
            onWalletAdded: (updatedWallet) {
              setState(() {
                _wallets[index] = updatedWallet;
              });
            },
          ),
    );
  }

  void _deleteWallet(int index) {
    showDialog(
      context: context,
      builder:
          (_) => AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: const Text('ยืนยันการลบ'),
            content: const Text('คุณต้องการลบกระเป๋านี้หรือไม่?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text(
                  'ยกเลิก',
                  style: TextStyle(color: Colors.grey.shade700),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _wallets.removeAt(index);
                  });
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF64748B),
                  elevation: 0,
                ),
                child: const Text('ลบ', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
    );
  }

  double get _totalBalance {
    return _wallets.fold(0, (sum, wallet) => sum + wallet.balance);
  }

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: _buildAppBar(context),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF8FAFC),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: _onRefresh,
          header: CustomHeader(
            height: 80,
            builder:
                (_, __) => Center(
                  child: Lottie.asset(
                    'assets/lotties/Loading Cat.json',
                    width: 60,
                    height: 60,
                  ),
                ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('กระเป๋า'),
                const SizedBox(height: 12),
                _buildWalletSection(context),
                const SizedBox(height: 24),
                _buildSectionTitle('รายการล่าสุด'),
                const SizedBox(height: 12),
                _buildRecentItems(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).primaryColor,
      elevation: 0,
      // title: const Text(
      //   'Home',
      //   style: TextStyle(fontWeight: FontWeight.w600, letterSpacing: -0.3),
      // ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: Color(0xFF334155),
        letterSpacing: -0.3,
      ),
    );
  }

  Widget _buildWalletSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildWalletHeader(context),
          Padding(padding: const EdgeInsets.all(16), child: _buildWalletGrid()),
        ],
      ),
    );
  }

  Widget _buildWalletHeader(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Color(0xFF475569), // Muted slate
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'ยอดคงเหลือ',
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '${_totalBalance.toStringAsFixed(0)} บาท',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              letterSpacing: -0.3,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _wallets.length + 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemBuilder: (context, index) {
        if (index == _wallets.length) {
          return _buildAddWalletButton();
        }

        final wallet = _wallets[index];
        return _buildWalletItem(wallet, index);
      },
    );
  }

  Widget _buildAddWalletButton() {
    return GestureDetector(
      onTap: _addWallet,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: const Color(0xFFF1F5F9),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
        ),
        child: Center(
          child: Icon(Icons.add, color: Colors.grey.shade600, size: 28),
        ),
      ),
    );
  }

  Widget _buildWalletItem(Wallet wallet, int index) {
    // Mute the color
    final mutedColor = Color.lerp(wallet.color, Colors.grey.shade600, 0.3)!;

    return GestureDetector(
      onTap: () => _editWallet(index),
      onLongPress: () => _deleteWallet(index),
      child: Container(
        decoration: BoxDecoration(
          color: mutedColor.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: mutedColor.withOpacity(0.2), width: 1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(wallet.icon, color: mutedColor, size: 26),
            const SizedBox(height: 6),
            Text(
              wallet.name,
              style: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Color(0xFF334155),
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              '${wallet.balance.toStringAsFixed(0)} ฿',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: mutedColor,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentItems(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.receipt_long_outlined,
              size: 40,
              color: Colors.grey.shade400,
            ),
            const SizedBox(height: 12),
            Text(
              'ยังไม่มีรายการ',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade600,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
