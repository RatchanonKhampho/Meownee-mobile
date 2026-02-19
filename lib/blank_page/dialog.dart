// ignore_for_file: deprecated_member_use

import 'package:meownee/models/wallet_model.dart';
import 'package:meownee/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// #############################################################################
final List<Color> availableColors = [
  // Purples
  const Color(0xFF6C63FF), const Color(0xFF5352ED),
  const Color(0xFF8B5CF6), const Color(0xFFA855F7),
  const Color(0xFFD946EF), const Color(0xFF9333EA),
  // Pinks & Reds
  const Color(0xFFFF6584), const Color(0xFFF43F5E),
  const Color(0xFFEF4444), const Color(0xFFFF4757),
  const Color(0xFFE11D48), const Color(0xFFFB7185),
  // Oranges
  const Color(0xFFFF9F43), const Color(0xFFF97316),
  const Color(0xFFF59E0B), const Color(0xFFEAB308),
  const Color(0xFFFF6B35), const Color(0xFFFF8C00),
  // Greens
  const Color(0xFF43C6AC), const Color(0xFF00D2D3),
  const Color(0xFF10B981), const Color(0xFF22C55E),
  const Color(0xFF16A34A), const Color(0xFF14B8A6),
  // Blues
  const Color(0xFF3B82F6), const Color(0xFF0EA5E9),
  const Color(0xFF06B6D4), const Color(0xFF2563EB),
  const Color(0xFF1D4ED8), const Color(0xFF38BDF8),
  // Neutrals
  const Color(0xFF64748B), const Color(0xFF475569),
  const Color(0xFF334155), const Color(0xFF1E293B),
  const Color(0xFF6B7280), const Color(0xFF374151),
];

const Map<String, List<IconData>> iconCategories = {
  'การเงิน': [
    Icons.wallet_rounded,
    Icons.account_balance_wallet_rounded,
    Icons.credit_card_rounded,
    Icons.savings_rounded,
    Icons.payments_rounded,
    Icons.money_rounded,
    Icons.attach_money_rounded,
    Icons.account_balance_rounded,
    Icons.currency_exchange_rounded,
    Icons.price_check_rounded,
    Icons.monetization_on_rounded,
    Icons.receipt_long_rounded,
    Icons.receipt_rounded,
    Icons.request_quote_rounded,
    Icons.sell_rounded,
    Icons.local_atm_rounded,
    Icons.point_of_sale_rounded,
    Icons.paid_rounded,
    Icons.add_card_rounded,
    Icons.contactless_rounded,
  ],
  'บ้าน': [
    Icons.home_rounded,
    Icons.house_rounded,
    Icons.apartment_rounded,
    Icons.cottage_rounded,
    Icons.villa_rounded,
    Icons.store_rounded,
    Icons.storefront_rounded,
    Icons.business_rounded,
    Icons.location_city_rounded,
    Icons.real_estate_agent_rounded,
  ],
  'ยานพาหนะ': [
    Icons.directions_car_rounded,
    Icons.two_wheeler_rounded,
    Icons.directions_bus_rounded,
    Icons.electric_car_rounded,
    Icons.local_shipping_rounded,
    Icons.flight_rounded,
    Icons.train_rounded,
    Icons.directions_bike_rounded,
  ],
  'อาหาร': [
    Icons.restaurant_rounded,
    Icons.fastfood_rounded,
    Icons.local_cafe_rounded,
    Icons.local_bar_rounded,
    Icons.set_meal_rounded,
    Icons.bakery_dining_rounded,
    Icons.ramen_dining_rounded,
    Icons.emoji_food_beverage_rounded,
  ],
  'ช้อปปิ้ง': [
    Icons.shopping_cart_rounded,
    Icons.shopping_bag_rounded,
    Icons.local_grocery_store_rounded,
    Icons.local_mall_rounded,
    Icons.discount_rounded,
    Icons.redeem_rounded,
    Icons.loyalty_rounded,
    Icons.inventory_2_rounded,
  ],
  'สุขภาพ': [
    Icons.local_hospital_rounded,
    Icons.medical_services_rounded,
    Icons.health_and_safety_rounded,
    Icons.spa_rounded,
    Icons.self_improvement_rounded,
    Icons.fitness_center_rounded,
    Icons.sports_handball_rounded,
    Icons.sports_soccer_rounded,
  ],
  'การศึกษา': [
    Icons.school_rounded,
    Icons.menu_book_rounded,
    Icons.work_rounded,
    Icons.business_center_rounded,
    Icons.computer_rounded,
    Icons.laptop_rounded,
    Icons.headphones_rounded,
    Icons.developer_mode_rounded,
  ],
  'ท่องเที่ยว': [
    Icons.travel_explore_rounded,
    Icons.beach_access_rounded,
    Icons.landscape_rounded,
    Icons.map_rounded,
    Icons.luggage_rounded,
    Icons.hotel_rounded,
    Icons.hiking_rounded,
    Icons.photo_camera_rounded,
  ],
  'บันเทิง': [
    Icons.celebration_rounded,
    Icons.movie_rounded,
    Icons.music_note_rounded,
    Icons.sports_esports_rounded,
    Icons.casino_rounded,
    Icons.local_activity_rounded,
    Icons.theater_comedy_rounded,
    Icons.live_tv_rounded,
  ],
  'ยูทิลิตี้': [
    Icons.bolt_rounded,
    Icons.water_drop_rounded,
    Icons.wifi_rounded,
    Icons.phone_android_rounded,
    Icons.power_rounded,
    Icons.thermostat_rounded,
    Icons.light_mode_rounded,
    Icons.settings_rounded,
  ],
  'อื่นๆ': [
    Icons.star_rounded,
    Icons.favorite_rounded,
    Icons.diamond_rounded,
    Icons.auto_awesome_rounded,
    Icons.emoji_events_rounded,
    Icons.volunteer_activism_rounded,
    Icons.child_care_rounded,
    Icons.pets_rounded,
  ],
};

final List<IconData> availableIcons =
    iconCategories.values.expand((e) => e).toList();
// #############################################################################

dialogFail(
  BuildContext context, {
  String title = 'การเชื่อมต่อมีปัญหากรุณาลองใหม่อีกครั้ง',
  bool reloadApp = false,
}) {
  return WillPopScope(
    onWillPop: () => Future.value(reloadApp),
    child: Container(
      height: double.infinity,
      width: double.infinity,
      color: Colors.black54,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 30,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 28),
              Container(
                width: 56,
                height: 56,
                decoration: const BoxDecoration(
                  color: Color(0xFFFFEEE8),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.wifi_off_rounded,
                  color: Color(0xFFFF6B35),
                  size: 28,
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontFamily: 'Sarabun',
                    color: Color(0xFF1A1A2E),
                    fontWeight: FontWeight.w600,
                    height: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'กรุณาตรวจสอบการเชื่อมต่ออินเทอร์เน็ตของคุณ',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                    fontFamily: 'Sarabun',
                    color: Color(0xFF9E9E9E),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF6B35),
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14),
                      ),
                    ),
                    onPressed: () {
                      reloadApp
                          ? Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => SplashPage(),
                            ),
                            (Route<dynamic> route) => false,
                          )
                          : Navigator.pop(context, false);
                    },
                    child: const Text(
                      'ตกลง',
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Sarabun',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    ),
  );
}

// ─────────────────── Icon Picker Bottom Sheet ───────────────────

Future<IconData?> _showIconPicker(
  BuildContext context,
  IconData currentIcon,
  Color accentColor,
) {
  return showModalBottomSheet<IconData>(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder:
        (ctx) => _IconPickerSheet(
          currentIcon: currentIcon,
          accentColor: accentColor,
        ),
  );
}

class _IconPickerSheet extends StatefulWidget {
  final IconData currentIcon;
  final Color accentColor;
  const _IconPickerSheet({
    required this.currentIcon,
    required this.accentColor,
  });

  @override
  State<_IconPickerSheet> createState() => _IconPickerSheetState();
}

class _IconPickerSheetState extends State<_IconPickerSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final _searchCtrl = TextEditingController();
  String _query = '';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: iconCategories.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _searchCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isSearching = _query.isNotEmpty;

    return DraggableScrollableSheet(
      initialChildSize: 0.75,
      minChildSize: 0.5,
      maxChildSize: 0.92,
      expand: false,
      builder:
          (_, __) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
            ),
            child: Column(
              children: [
                // Handle bar
                const SizedBox(height: 12),
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 16),

                // Title row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Text(
                        'เลือกไอคอน',
                        style: TextStyle(
                          fontFamily: 'Sarabun',
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1A1A2E),
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(
                          Icons.close_rounded,
                          color: Colors.grey.shade400,
                        ),
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.grey.shade100,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 12),

                // Search bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    controller: _searchCtrl,
                    onChanged: (v) => setState(() => _query = v.toLowerCase()),
                    style: const TextStyle(fontFamily: 'Sarabun', fontSize: 14),
                    decoration: InputDecoration(
                      hintText: 'ค้นหาไอคอน...',
                      hintStyle: TextStyle(
                        fontFamily: 'Sarabun',
                        color: Colors.grey.shade400,
                        fontSize: 14,
                      ),
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: widget.accentColor,
                        size: 20,
                      ),
                      suffixIcon:
                          _query.isNotEmpty
                              ? IconButton(
                                icon: const Icon(Icons.clear_rounded, size: 18),
                                onPressed:
                                    () => setState(() {
                                      _query = '';
                                      _searchCtrl.clear();
                                    }),
                              )
                              : null,
                      filled: true,
                      fillColor: const Color(0xFFF8F8F8),
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(
                          color: widget.accentColor,
                          width: 1.5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14),
                        borderSide: BorderSide(color: Colors.grey.shade200),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                if (!isSearching) ...[
                  // Category tab bar
                  TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelColor: widget.accentColor,
                    unselectedLabelColor: Colors.grey.shade400,
                    indicatorColor: widget.accentColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    dividerColor: Colors.transparent,
                    labelStyle: const TextStyle(
                      fontFamily: 'Sarabun',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontFamily: 'Sarabun',
                      fontSize: 13,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    tabs: iconCategories.keys.map((c) => Tab(text: c)).toList(),
                  ),
                  Divider(height: 1, color: Colors.grey.shade100),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children:
                          iconCategories.entries.map((entry) {
                            return _IconGrid(
                              icons: entry.value,
                              selectedIcon: widget.currentIcon,
                              accentColor: widget.accentColor,
                              onSelect: (icon) => Navigator.pop(context, icon),
                            );
                          }).toList(),
                    ),
                  ),
                ] else ...[
                  // Search result — show all icons
                  Expanded(
                    child: _IconGrid(
                      icons: availableIcons,
                      selectedIcon: widget.currentIcon,
                      accentColor: widget.accentColor,
                      onSelect: (icon) => Navigator.pop(context, icon),
                    ),
                  ),
                ],
              ],
            ),
          ),
    );
  }
}

class _IconGrid extends StatelessWidget {
  final List<IconData> icons;
  final IconData selectedIcon;
  final Color accentColor;
  final ValueChanged<IconData> onSelect;

  const _IconGrid({
    required this.icons,
    required this.selectedIcon,
    required this.accentColor,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      itemCount: icons.length,
      itemBuilder: (_, i) {
        final icon = icons[i];
        final isSel = icon == selectedIcon;
        return GestureDetector(
          onTap: () => onSelect(icon),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 180),
            decoration: BoxDecoration(
              color: isSel ? accentColor : Colors.grey.shade100,
              borderRadius: BorderRadius.circular(12),
              boxShadow:
                  isSel
                      ? [
                        BoxShadow(
                          color: accentColor.withOpacity(0.35),
                          blurRadius: 8,
                          offset: const Offset(0, 3),
                        ),
                      ]
                      : null,
            ),
            child: Icon(
              icon,
              size: 22,
              color: isSel ? Colors.white : Colors.grey.shade500,
            ),
          ),
        );
      },
    );
  }
}

// ─────────────────── Main Dialog ───────────────────

Future<Wallet?> showWalletDialog(BuildContext context, {Wallet? wallet}) async {
  final isEdit = wallet != null;
  final nameController = TextEditingController(text: wallet?.name ?? '');
  final balanceController = TextEditingController(
    text: wallet != null ? wallet.balance.toString() : '',
  );
  Color selectedColor = wallet?.color ?? availableColors.first;
  IconData selectedIcon = wallet?.icon ?? availableIcons.first;

  return showDialog<Wallet>(
    context: context,
    builder:
        (context) => StatefulBuilder(
          builder:
              (context, setDialogState) => Dialog(
                backgroundColor: Colors.transparent,
                insetPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 24,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(28),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.12),
                        blurRadius: 40,
                        offset: const Offset(0, 16),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // ── Header ──
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 20, 14, 18),
                        decoration: BoxDecoration(
                          color: selectedColor.withOpacity(0.06),
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(28),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              width: 44,
                              height: 44,
                              decoration: BoxDecoration(
                                color: selectedColor.withOpacity(0.15),
                                borderRadius: BorderRadius.circular(14),
                              ),
                              child: Icon(
                                selectedIcon,
                                color: selectedColor,
                                size: 22,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    isEdit
                                        ? 'แก้ไขกระเป๋า'
                                        : 'เพิ่มกระเป๋าใหม่',
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontFamily: 'Sarabun',
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF1A1A2E),
                                    ),
                                  ),
                                  Text(
                                    isEdit
                                        ? 'แก้ไขข้อมูลกระเป๋าเงิน'
                                        : 'ตั้งค่ากระเป๋าเงินของคุณ',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Sarabun',
                                      color: Colors.grey.shade500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () => Navigator.pop(context),
                              icon: Icon(
                                Icons.close_rounded,
                                color: Colors.grey.shade400,
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor: Colors.grey.shade100,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // ── Body ──
                      Flexible(
                        child: SingleChildScrollView(
                          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _SectionLabel(label: 'ชื่อกระเป๋า'),
                              const SizedBox(height: 8),
                              _StyledTextField(
                                controller: nameController,
                                hint: 'เช่น กระเป๋าหลัก, เก็บเงิน...',
                                icon: Icons.label_outline_rounded,
                                accentColor: selectedColor,
                              ),
                              const SizedBox(height: 16),

                              _SectionLabel(label: 'ยอดเงิน (บาท)'),
                              const SizedBox(height: 8),
                              _StyledTextField(
                                controller: balanceController,
                                hint: '0.00',
                                icon: Icons.account_balance_wallet_outlined,
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                      decimal: true,
                                    ),
                                accentColor: selectedColor,
                              ),
                              const SizedBox(height: 20),

                              // ── สีธีม (horizontal scroll) ──
                              _SectionLabel(label: 'สีธีม'),
                              const SizedBox(height: 10),
                              SizedBox(
                                height: 44,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: availableColors.length,
                                  separatorBuilder:
                                      (_, __) => const SizedBox(width: 8),
                                  itemBuilder: (_, i) {
                                    final color = availableColors[i];
                                    final isSel = selectedColor == color;
                                    return GestureDetector(
                                      onTap:
                                          () => setDialogState(
                                            () => selectedColor = color,
                                          ),
                                      child: AnimatedContainer(
                                        duration: const Duration(
                                          milliseconds: 180,
                                        ),
                                        width: isSel ? 40 : 36,
                                        height: isSel ? 40 : 36,
                                        margin:
                                            isSel
                                                ? EdgeInsets.zero
                                                : const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: color,
                                          shape: BoxShape.circle,
                                          border:
                                              isSel
                                                  ? Border.all(
                                                    color: Colors.white,
                                                    width: 2.5,
                                                  )
                                                  : null,
                                          boxShadow:
                                              isSel
                                                  ? [
                                                    BoxShadow(
                                                      color: color.withOpacity(
                                                        0.5,
                                                      ),
                                                      blurRadius: 8,
                                                      offset: const Offset(
                                                        0,
                                                        2,
                                                      ),
                                                    ),
                                                  ]
                                                  : null,
                                        ),
                                        child:
                                            isSel
                                                ? const Icon(
                                                  Icons.check_rounded,
                                                  color: Colors.white,
                                                  size: 16,
                                                )
                                                : null,
                                      ),
                                    );
                                  },
                                ),
                              ),

                              const SizedBox(height: 20),

                              // ── ไอคอน ──
                              Row(
                                children: [
                                  _SectionLabel(label: 'ไอคอน'),
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () async {
                                      final picked = await _showIconPicker(
                                        context,
                                        selectedIcon,
                                        selectedColor,
                                      );
                                      if (picked != null) {
                                        setDialogState(
                                          () => selectedIcon = picked,
                                        );
                                      }
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 10,
                                        vertical: 5,
                                      ),
                                      decoration: BoxDecoration(
                                        color: selectedColor.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.grid_view_rounded,
                                            size: 13,
                                            color: selectedColor,
                                          ),
                                          const SizedBox(width: 4),
                                          Text(
                                            'เปลี่ยน',
                                            style: TextStyle(
                                              fontFamily: 'Sarabun',
                                              fontSize: 12,
                                              color: selectedColor,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),

                              // Icon preview tap target
                              GestureDetector(
                                onTap: () async {
                                  final picked = await _showIconPicker(
                                    context,
                                    selectedIcon,
                                    selectedColor,
                                  );
                                  if (picked != null) {
                                    setDialogState(() => selectedIcon = picked);
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 16,
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF8F8F8),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: selectedColor,
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: selectedColor.withOpacity(
                                                0.35,
                                              ),
                                              blurRadius: 8,
                                              offset: const Offset(0, 3),
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          selectedIcon,
                                          color: Colors.white,
                                          size: 22,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
                                      Text(
                                        'แตะเพื่อเปลี่ยนไอคอน',
                                        style: TextStyle(
                                          fontFamily: 'Sarabun',
                                          fontSize: 13,
                                          color: Colors.grey.shade500,
                                        ),
                                      ),
                                      const Spacer(),
                                      Icon(
                                        Icons.chevron_right_rounded,
                                        color: Colors.grey.shade400,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),

                      // ── Actions ──
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () => Navigator.pop(context),
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                    side: BorderSide(
                                      color: Colors.grey.shade200,
                                    ),
                                  ),
                                ),
                                child: const Text(
                                  'ยกเลิก',
                                  style: TextStyle(
                                    fontFamily: 'Sarabun',
                                    color: Color(0xFF9E9E9E),
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (nameController.text.isEmpty) return;
                                  final balance =
                                      double.tryParse(balanceController.text) ??
                                      0;
                                  Navigator.pop(
                                    context,
                                    Wallet(
                                      id:
                                          wallet?.id ??
                                          DateTime.now().millisecondsSinceEpoch
                                              .toString(),
                                      name: nameController.text,
                                      icon: selectedIcon,
                                      color: selectedColor,
                                      balance: balance,
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: selectedColor,
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 14,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                ),
                                child: Text(
                                  isEdit
                                      ? 'บันทึกการเปลี่ยนแปลง'
                                      : 'เพิ่มกระเป๋า',
                                  style: const TextStyle(
                                    fontFamily: 'Sarabun',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        ),
  );
}

Future<bool?> showDeleteWalletDialog(BuildContext context, Wallet wallet) {
  return showDialog<bool>(
    context: context,
    builder:
        (context) => Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.symmetric(horizontal: 32),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.12),
                  blurRadius: 40,
                  offset: const Offset(0, 16),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 28),
                Container(
                  width: 72,
                  height: 72,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFEEEE),
                    shape: BoxShape.circle,
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: wallet.color.withOpacity(0.15),
                        child: Icon(wallet.icon, color: wallet.color, size: 22),
                      ),
                      Positioned(
                        right: 8,
                        bottom: 8,
                        child: Container(
                          width: 22,
                          height: 22,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF4757),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.remove_rounded,
                            color: Colors.white,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                const Text(
                  'ลบกระเป๋า?',
                  style: TextStyle(
                    fontFamily: 'Sarabun',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF1A1A2E),
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(
                        fontFamily: 'Sarabun',
                        fontSize: 14,
                        color: Color(0xFF9E9E9E),
                        height: 1.6,
                      ),
                      children: [
                        const TextSpan(text: 'คุณกำลังจะลบกระเป๋า '),
                        TextSpan(
                          text: '"${wallet.name}"',
                          style: TextStyle(
                            color: wallet.color,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const TextSpan(
                          text: '\nการกระทำนี้ไม่สามารถย้อนกลับได้',
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F8F8),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: const Color(0xFFEEEEEE)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          color: wallet.color.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(wallet.icon, color: wallet.color, size: 20),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              wallet.name,
                              style: const TextStyle(
                                fontFamily: 'Sarabun',
                                fontWeight: FontWeight.w700,
                                fontSize: 14,
                                color: Color(0xFF1A1A2E),
                              ),
                            ),
                            Text(
                              '฿ ${wallet.balance.toStringAsFixed(2)}',
                              style: const TextStyle(
                                fontFamily: 'Sarabun',
                                fontSize: 13,
                                color: Color(0xFF9E9E9E),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context, false),
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                              side: BorderSide(color: Colors.grey.shade200),
                            ),
                          ),
                          child: const Text(
                            'ยกเลิก',
                            style: TextStyle(
                              fontFamily: 'Sarabun',
                              color: Color(0xFF9E9E9E),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFF4757),
                            foregroundColor: Colors.white,
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),
                          onPressed: () => Navigator.pop(context, true),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.delete_outline_rounded, size: 18),
                              SizedBox(width: 6),
                              Text(
                                'ลบเลย',
                                style: TextStyle(
                                  fontFamily: 'Sarabun',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
  );
}

// ─────────────────── Helper Widgets ───────────────────

class _SectionLabel extends StatelessWidget {
  final String label;
  const _SectionLabel({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: 'Sarabun',
        fontSize: 13,
        fontWeight: FontWeight.w700,
        color: Color(0xFF6B7280),
        letterSpacing: 0.3,
      ),
    );
  }
}

class _StyledTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final Color accentColor;
  final TextInputType? keyboardType;

  const _StyledTextField({
    required this.controller,
    required this.hint,
    required this.icon,
    required this.accentColor,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        fontFamily: 'Sarabun',
        fontSize: 15,
        color: Color(0xFF1A1A2E),
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'Sarabun',
          color: Colors.grey.shade400,
          fontSize: 14,
        ),
        prefixIcon: Icon(icon, color: accentColor, size: 20),
        filled: true,
        fillColor: const Color(0xFFF8F8F8),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: accentColor, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
      ),
    );
  }
}
