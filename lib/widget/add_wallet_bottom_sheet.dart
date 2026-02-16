import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/wallet.dart';

class AddWalletBottomSheet extends StatefulWidget {
  final Wallet? wallet;
  final Function(Wallet) onWalletAdded;

  const AddWalletBottomSheet({
    super.key,
    this.wallet,
    required this.onWalletAdded,
  });

  @override
  State<AddWalletBottomSheet> createState() => _AddWalletBottomSheetState();
}

class _AddWalletBottomSheetState extends State<AddWalletBottomSheet> {
  late TextEditingController _nameController;
  late TextEditingController _balanceController;

  Color _selectedColor = const Color(0xFF64748B);
  IconData _selectedIcon = Icons.account_balance_wallet_outlined;

  // Muted color palette
  final List<Color> _colors = [
    const Color(0xFF64748B), // Slate
    const Color(0xFF6366F1), // Indigo
    const Color(0xFF8B5CF6), // Purple
    const Color(0xFFEC4899), // Pink
    const Color(0xFFEF4444), // Red
    const Color(0xFFF59E0B), // Amber
    const Color(0xFF10B981), // Emerald
    const Color(0xFF06B6D4), // Cyan
    const Color(0xFF3B82F6), // Blue
    const Color(0xFF78716C), // Stone
  ];

  final List<IconData> _icons = [
    Icons.account_balance_wallet_outlined,
    Icons.credit_card_outlined,
    Icons.savings_outlined,
    Icons.account_balance_outlined,
    Icons.paid_outlined,
    Icons.wallet_outlined,
    Icons.payments_outlined,
    Icons.shopping_bag_outlined,
    Icons.redeem_outlined,
    Icons.card_giftcard_outlined,
  ];

  @override
  void initState() {
    super.initState();

    _nameController = TextEditingController(text: widget.wallet?.name ?? '');
    _balanceController = TextEditingController(
      text: widget.wallet?.balance.toString() ?? '',
    );

    if (widget.wallet != null) {
      _selectedColor = widget.wallet!.color;
      _selectedIcon = widget.wallet!.icon;
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _balanceController.dispose();
    super.dispose();
  }

  void _saveWallet() {
    if (_nameController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.info_outline, color: Colors.white),
              const SizedBox(width: 12),
              const Text('กรุณาใส่ชื่อกระเป๋า'),
            ],
          ),
          backgroundColor: const Color(0xFF64748B),
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          margin: const EdgeInsets.all(16),
        ),
      );
      return;
    }

    final name = _nameController.text;
    final balance = double.tryParse(_balanceController.text) ?? 0;

    final wallet = Wallet(
      id: widget.wallet?.id ?? DateTime.now().toString(),
      name: name,
      balance: balance,
      icon: _selectedIcon,
      color: _selectedColor,
    );

    widget.onWalletAdded(wallet);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Handle bar
              Container(
                margin: const EdgeInsets.only(top: 12, bottom: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with icon preview
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: _selectedColor.withOpacity(0.12),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: _selectedColor.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: Icon(
                            _selectedIcon,
                            color: _selectedColor,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.wallet == null
                                    ? 'เพิ่มกระเป๋าใหม่'
                                    : 'แก้ไขกระเป๋า',
                                style: const TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF1E293B),
                                  letterSpacing: -0.4,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'กรอกข้อมูลด้านล่าง',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // Name field
                    _buildLabel('ชื่อกระเป๋า'),
                    const SizedBox(height: 10),
                    _buildTextField(
                      controller: _nameController,
                      hint: 'เช่น กระเป๋าหลัก, เงินออม',
                      prefixIcon: Icons.edit_outlined,
                    ),

                    const SizedBox(height: 20),

                    // Balance field
                    _buildLabel('ยอดเงิน'),
                    const SizedBox(height: 10),
                    _buildTextField(
                      controller: _balanceController,
                      hint: '0.00',
                      prefixIcon: Icons.currency_exchange_outlined,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                          RegExp(r'^\d+\.?\d{0,2}'),
                        ),
                      ],
                    ),

                    const SizedBox(height: 28),

                    // Divider
                    Divider(color: Colors.grey.shade200, height: 1),

                    const SizedBox(height: 24),

                    // Icon selection
                    _buildLabel('ไอคอน'),
                    const SizedBox(height: 12),
                    SizedBox(
                      height: 64,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _icons.length,
                        itemBuilder: (context, index) {
                          final icon = _icons[index];
                          final isSelected = icon == _selectedIcon;

                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedIcon = icon;
                              });
                            },
                            child: Container(
                              width: 64,
                              height: 64,
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                color:
                                    isSelected
                                        ? _selectedColor.withOpacity(0.12)
                                        : const Color(0xFFF8FAFC),
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  color:
                                      isSelected
                                          ? _selectedColor.withOpacity(0.4)
                                          : Colors.grey.shade300,
                                  width: isSelected ? 2 : 1,
                                ),
                              ),
                              child: Icon(
                                icon,
                                color:
                                    isSelected
                                        ? _selectedColor
                                        : Colors.grey.shade600,
                                size: 26,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(height: 24),

                    // Color selection
                    _buildLabel('สี'),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children:
                          _colors.map((color) {
                            final isSelected = color == _selectedColor;

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedColor = color;
                                });
                              },
                              child: Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: color,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color:
                                        isSelected
                                            ? const Color(0xFF1E293B)
                                            : Colors.transparent,
                                    width: 3,
                                  ),
                                  boxShadow:
                                      isSelected
                                          ? [
                                            BoxShadow(
                                              color: color.withOpacity(0.3),
                                              blurRadius: 8,
                                              offset: const Offset(0, 4),
                                            ),
                                          ]
                                          : null,
                                ),
                                child:
                                    isSelected
                                        ? const Icon(
                                          Icons.check_rounded,
                                          color: Colors.white,
                                          size: 24,
                                        )
                                        : null,
                              ),
                            );
                          }).toList(),
                    ),

                    const SizedBox(height: 32),

                    // Save button
                    SizedBox(
                      width: double.infinity,
                      height: 54,
                      child: ElevatedButton(
                        onPressed: _saveWallet,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _selectedColor,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shadowColor: _selectedColor.withOpacity(0.3),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              widget.wallet == null
                                  ? Icons.add_rounded
                                  : Icons.check_rounded,
                              size: 22,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              widget.wallet == null
                                  ? 'เพิ่มกระเป๋า'
                                  : 'บันทึกการเปลี่ยนแปลง',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.3,
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

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: Color(0xFF475569),
        letterSpacing: -0.2,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData prefixIcon,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.grey.shade300, width: 1),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF1E293B),
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
            fontWeight: FontWeight.w400,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: _selectedColor.withOpacity(0.7),
            size: 22,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
        ),
      ),
    );
  }
}
