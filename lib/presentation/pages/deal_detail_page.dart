import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/constants.dart';
import '../../domain/entities/deal.dart';
import '../providers/deal_provider.dart';

class DealDetailPage extends StatefulWidget {
  final String dealId;
  const DealDetailPage({super.key, required this.dealId});

  @override
  State<DealDetailPage> createState() => _DealDetailPageState();
}

class _DealDetailPageState extends State<DealDetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<DealProvider>().fetchDealDetails(widget.dealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Darker background for details
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Consumer<DealProvider>(
          builder: (context, provider, _) {
            return Text(
              provider.selectedDeal?.title ?? "Deal Details",
              style: const TextStyle(color: Colors.white),
            );
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFFEB7B7), // Light red/pink
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              "Expiring soon",
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Consumer<DealProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }
          final deal = provider.selectedDeal;
          if (deal == null) {
            return const Center(
              child: Text(
                "Deal not found",
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          return Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Image
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(
                          image: AssetImage(deal.imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "Reimagine your self-care routine with these exclusive offers",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Valid till ${deal.expiryDate}",
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "PROMOTION ID : ${deal.promotionId}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      "Location : Available at all VLCC outlets in Qatar.",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    const SizedBox(height: 24),
                    // Bullets
                    _buildBulletPoint("Redeem at all VLCC Outlets in Qatar"),
                    _buildBulletPoint("Applicable for all users"),
                    _buildBulletPoint(
                      "Coupon code is applicable once per customer",
                    ),
                    _buildBulletPoint(
                      "Not valid with any other discounts and promotions",
                    ),
                    _buildBulletPoint(
                      "50% Off: Slimming treatments, Beauty & hair treatments, Laser hair removal",
                    ),
                    _buildBulletPoint(
                      "30% Off: Dermatology treatments, including fillers, botox & facial laser",
                    ),

                    const SizedBox(height: 24),

                    // Outlet Info
                    const Divider(color: Colors.grey),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Text(
                          deal.subTitle.substring(0, 1),
                          style: const TextStyle(color: Colors.black),
                        ), // Logo placeholder
                      ),
                      title: Text(
                        deal.subTitle,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                      title: const Text(
                        "Al Darwish Road, Street No.123 , Near Alwafa road, Doha-Qatar",
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      trailing: const Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      "Get In Touch With Us",
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        _buildSocialIcon(Icons.language),
                        _buildSocialIcon(Icons.phone),
                        _buildSocialIcon(Icons.facebook),
                        // Add more as needed
                      ],
                    ),

                    const SizedBox(height: 160), // Space for button
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            "Redeem Now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        "*Terms and Conditions Apply",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        "How It Works ?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(color: Colors.grey, fontSize: 14)),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Icon(icon, color: AppColors.primary, size: 24),
    );
  }
}
