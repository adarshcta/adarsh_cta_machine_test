import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../core/utils/constants.dart';
import '../providers/deal_provider.dart';
import '../widgets/custom_card.dart';

class DealsPage extends StatefulWidget {
  const DealsPage({super.key});

  @override
  State<DealsPage> createState() => _DealsPageState();
}

class _DealsPageState extends State<DealsPage> {
  // Use post frame callback to fetch data if not already fetched,
  // but since reusing provider, data might be there.
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (context.read<DealProvider>().deals.isEmpty) {
        context.read<DealProvider>().fetchDeals();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: Container(
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF3B3B3B),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const TextField(
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search, color: Colors.grey),
              hintText: "Search",
              hintStyle: TextStyle(color: Colors.grey),
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 8),
            ),
          ),
        ),
        leading: const SizedBox(), // Hide back button if any
        leadingWidth: 0,
      ),
      body: Consumer<DealProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            );
          }

          final deals = provider.deals;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Featured Offers",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Top brands bringing you the best deals",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 16),

                // Horizontal Featured List (Mocking different design for "Featured")
                SizedBox(
                  height: 140,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemCount: 3, // Mock count
                    separatorBuilder: (_, __) => const SizedBox(width: 12),
                    itemBuilder: (context, index) {
                      return _buildFeaturedCard(index);
                    },
                  ),
                ),

                const SizedBox(height: 24),
                const Text(
                  "Deals For You",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Top brands bringing you the best deals",
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 16),

                // Categories Chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildChip("Near by deals", true),
                      const SizedBox(width: 8),
                      _buildChip("Lifestyle", false),
                      const SizedBox(width: 8),
                      _buildChip("Hotels & Travel", false),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: deals.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 16),
                  itemBuilder: (context, index) {
                    return DealCard(deal: deals[index]);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? AppColors.primary
            : const Color(0xFFFBF4DC), // Light beige for unselected
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          // Icon placeholder if needed
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeaturedCard(int index) {
    // Hardcoded simple cards for top section
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFD6B579), // Light Gold
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 10,
                backgroundColor: Colors.white,
                child: Icon(Icons.fastfood, size: 12, color: Colors.green),
              ), // Logo placeholder
              const SizedBox(width: 4),
              const Expanded(
                child: Text(
                  "Papa Johns",
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            "Flat 40% OFF on Family Feast",
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          Container(height: 1, color: Colors.black12),
          const SizedBox(height: 4),
          const Text("Valid till Oct 30", style: TextStyle(fontSize: 10)),
        ],
      ),
    );
  }
}
