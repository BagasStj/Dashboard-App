import 'package:flutter/material.dart';

class SummarySection extends StatelessWidget {
  final int crossAxisCount;

  const SummarySection({
    Key? key,
    this.crossAxisCount = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: crossAxisCount,
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 1.4,
      children: const [
        SummaryCard(
          title: 'Total Users',
          value: '1,234',
          icon: Icons.group_outlined,
          color: Colors.blue,
          trend: '+12%',
          isPositive: true,
          gradientColors: [Color(0xFFE7F0FF), Colors.white],
        ),
        SummaryCard(
          title: 'Revenue',
          value: '\$12,345',
          icon: Icons.attach_money,
          color: Colors.green,
          trend: '+8%',
          isPositive: true,
          gradientColors: [Color(0xFFE6F7EC), Colors.white],
        ),
        SummaryCard(
          title: 'Orders',
          value: '856',
          icon: Icons.shopping_cart_outlined,
          color: Colors.orange,
          trend: '-3%',
          isPositive: false,
          gradientColors: [Color(0xFFFFF3E0), Colors.white],
        ),
        SummaryCard(
          title: 'Conversion',
          value: '3.2%',
          icon: Icons.trending_up,
          color: Colors.purple,
          trend: '+2%',
          isPositive: true,
          gradientColors: [Color(0xFFF3E5F5), Colors.white],
        ),
      ],
    );
  }
}

class SummaryCard extends StatefulWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;
  final String trend;
  final bool isPositive;
  final List<Color> gradientColors;

  const SummaryCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    required this.trend,
    required this.isPositive,
    required this.gradientColors,
  }) : super(key: key);

  @override
  State<SummaryCard> createState() => _SummaryCardState();
}

class _SummaryCardState extends State<SummaryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: widget.gradientColors,
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    widget.icon,
                    color: widget.color,
                    size: 22,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: widget.isPositive
                          ? Colors.green.withOpacity(0.1)
                          : Colors.red.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          widget.isPositive
                              ? Icons.trending_up
                              : Icons.trending_down,
                          color: widget.isPositive ? Colors.green : Colors.red,
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          widget.trend,
                          style: TextStyle(
                            color:
                                widget.isPositive ? Colors.green : Colors.red,
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          Text(
            widget.value,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[900],
                ),
          ),
        ],
      ),
    );
  }
}
