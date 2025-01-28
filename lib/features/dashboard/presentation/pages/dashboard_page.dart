import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import '../widgets/header_widget.dart';
import '../widgets/summary_card.dart';
import '../widgets/chart_card.dart';
import '../widgets/table_card.dart';
import '../widgets/top_worst_card.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWideScreen = screenWidth > 1200;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.0, 0.3, 0.7],
            colors: [
              Colors.amber.shade100.withOpacity(0.3),
              Theme.of(context).colorScheme.primary.withOpacity(0.05),
              Theme.of(context).colorScheme.secondary.withOpacity(0.05),
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isWideScreen ? screenWidth * 0.1 : 16.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const HeaderWidget(),
                  const SizedBox(height: 24),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      return SummarySection(
                        crossAxisCount: constraints.maxWidth > 900 ? 4 : 2,
                      );
                    },
                  ),
                  const SizedBox(height: 24),
                  if (isWideScreen)
                    IntrinsicHeight(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: const [
                                ChartCard(),
                                SizedBox(height: 24),
                                TableCard(),
                              ],
                            ),
                          ),
                          const SizedBox(width: 24),
                          const Expanded(
                            child: TopWorstCard(),
                          ),
                        ],
                      ),
                    )
                  else
                    Column(
                      children: const [
                        ChartCard(),
                        SizedBox(height: 24),
                        TableCard(),
                        SizedBox(height: 24),
                        TopWorstCard(),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
