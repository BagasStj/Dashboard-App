import 'package:flutter/material.dart';

class TopProductsCard extends StatelessWidget {
  const TopProductsCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Top Products',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          _buildProductItem(
            'Product A',
            '1,234 sales',
            Colors.blue,
            0.8,
            true,
          ),
          const SizedBox(height: 16),
          _buildProductItem(
            'Product B',
            '856 sales',
            Colors.green,
            0.6,
            true,
          ),
          const SizedBox(height: 16),
          _buildProductItem(
            'Product C',
            '654 sales',
            Colors.red,
            0.4,
            false,
          ),
        ],
      ),
    );
  }

  Widget _buildProductItem(
    String name,
    String sales,
    Color color,
    double percentage,
    bool isIncreasing,
  ) {
    return Row(
      children: [
        Container(
          width: 40,
          height: 40,
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: CustomPaint(
            painter: PieChartPainter(
              percentage: percentage,
              color: color,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                sales,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Icon(
          isIncreasing ? Icons.arrow_upward : Icons.arrow_downward,
          color: isIncreasing ? Colors.green : Colors.red,
          size: 20,
        ),
      ],
    );
  }
}

class PieChartPainter extends CustomPainter {
  final double percentage;
  final Color color;

  PieChartPainter({
    required this.percentage,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2;

    // Background circle
    final backgroundPaint = Paint()
      ..color = color.withOpacity(0.2)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Foreground arc
    final foregroundPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.5708, // Start from top (90 degrees)
      percentage * 2 * 3.14159, // Convert percentage to radians
      false,
      foregroundPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
