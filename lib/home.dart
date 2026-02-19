import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:meownee/blank_page/dialog.dart';
import 'package:meownee/mock_data/wallet_mock.dart';
import 'package:meownee/models/wallet_model.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final RefreshController _refreshController = RefreshController(
    initialRefresh: false,
  );

  late List<Wallet> wallets;

  @override
  void initState() {
    super.initState();
    wallets = List.from(mockWallets);
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(seconds: 1));
    _refreshController.refreshCompleted();
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
          // color: Color.fromARGB(255, 245, 246, 249),
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
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
            padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Summary Card ──
                _buildSummaryCard(),
                const SizedBox(height: 28),

                // ── Section Header ──
                Row(
                  children: [
                    const Text(
                      'กระเป๋าของฉัน',
                      style: TextStyle(
                        fontFamily: 'Sarabun',
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF1A1A2E),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '${wallets.length} กระเป๋า',
                        style: TextStyle(
                          fontFamily: 'Sarabun',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // ── Wallet Grid ──
                _buildWalletGrid(),
                const SizedBox(height: 16),
                Text(
                  'ธุระกรรมล่าสุด',
                  style: TextStyle(
                    fontFamily: 'Sarabun',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 16),
                _buildTransaction(),
                const SizedBox(height: 80),
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
      toolbarHeight: 80,
      title: Row(
        children: [
          // Profile Avatar
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.15),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(3),
              child: ClipOval(
                child: Image.asset(
                  'assets/icons/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(width: 14),

          // Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Welcome back 👋',
                style: TextStyle(
                  fontFamily: 'Sarabun',
                  fontSize: 13,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 2),
              Text(
                'Ratchanon',
                style: TextStyle(
                  fontFamily: 'Sarabun',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ],
          ),

          const Spacer(),

          // Notification bell
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.notifications_outlined,
              color: Colors.white,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF0FDF4),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.circle, color: Color(0xFF22C55E), size: 8),
                    SizedBox(width: 5),
                    Text(
                      'ยอดรวมทั้งหมด',
                      style: TextStyle(
                        fontFamily: 'Sarabun',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF16A34A),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '฿ ${totalBalance.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontFamily: 'Sarabun',
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF1A1A2E),
                  height: 1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Divider(color: Colors.grey.shade100, height: 1),
          const SizedBox(height: 14),
          Row(
            children: [
              _buildStatChip(
                icon: Icons.account_balance_wallet_rounded,
                label: '${wallets.length} กระเป๋า',
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(width: 10),
              _buildStatChip(
                icon: Icons.trending_up_rounded,
                label: 'อัปเดตล่าสุด',
                color: const Color(0xFF10B981),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatChip({
    required IconData icon,
    required String label,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Sarabun',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWalletGrid() {
    return GridView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: wallets.length + 1,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1 / 1.15,
      ),
      itemBuilder: (context, index) {
        if (index == wallets.length) return _buildAddButton();
        return _buildWalletItem(wallets[index]);
      },
    );
  }

  Widget _buildWalletItem(Wallet wallet) {
    return GestureDetector(
      onTap: () => _editWallet(wallet),
      onLongPress: () => _deleteWallet(wallet.id),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: wallet.color.withOpacity(0.12),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Icon bubble
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: wallet.color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(wallet.icon, size: 24, color: wallet.color),
            ),
            const SizedBox(height: 10),

            // Name
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                wallet.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Sarabun',
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                  color: Color(0xFF1A1A2E),
                ),
              ),
            ),
            const SizedBox(height: 4),

            // Balance
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: Text(
                '฿${wallet.balance.toStringAsFixed(0)}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontFamily: 'Sarabun',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: wallet.color,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddButton() {
    return GestureDetector(
      onTap: _addWallet,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade200,
            width: 1.5,
            strokeAlign: BorderSide.strokeAlignInside,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                Icons.add_rounded,
                size: 24,
                color: Colors.grey.shade400,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'เพิ่มใหม่',
              style: TextStyle(
                fontFamily: 'Sarabun',
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.grey.shade400,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ── Actions ──
  void _addWallet() async {
    final newWallet = await showWalletDialog(context);
    if (!mounted) return;
    if (newWallet != null) setState(() => wallets.add(newWallet));
  }

  void _editWallet(Wallet wallet) async {
    final updated = await showWalletDialog(context, wallet: wallet);
    if (!mounted) return;
    if (updated != null) {
      setState(() {
        final i = wallets.indexWhere((w) => w.id == wallet.id);
        wallets[i] = updated;
      });
    }
  }

  void _deleteWallet(String id) async {
    final wallet = wallets.firstWhere((w) => w.id == id);
    final confirm = await showDeleteWalletDialog(context, wallet);
    if (!mounted) return;
    if (confirm == true) setState(() => wallets.removeWhere((w) => w.id == id));
  }

  double get totalBalance =>
      wallets.fold(0, (sum, wallet) => sum + wallet.balance);

  Widget _buildTransaction() {
    return Container(
      // padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Column(
        children: [
          Row(
            children: [
              // ไอคอน
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.food_bank, color: Colors.orange),
              ),

              const SizedBox(width: 12),

              // รายละเอียด
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'อาหาร',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('บัญชีธนาคาร', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              // จำนวนเงิน + วันที่
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '100 บาท',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('12 ก.พ. 2026', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          SizedBox(height: 12),
          Row(
            children: [
              // ไอคอน
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.orange.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(Icons.food_bank, color: Colors.orange),
              ),

              const SizedBox(width: 12),

              // รายละเอียด
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'อาหาร',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('บัญชีธนาคาร', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ),

              // จำนวนเงิน + วันที่
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    '100 บาท',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text('12 ก.พ. 2026', style: TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
