import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../../lib.dart';

class AllTransactionPage extends StatefulWidget {
  const AllTransactionPage({super.key});

  @override
  State<AllTransactionPage> createState() => _AllTransactionPageState();
}

class _AllTransactionPageState extends State<AllTransactionPage> {
  final List<RecentTransactionModel> _getRecentTransactionList =
      RecentTransactionModel.getRecentTransactionList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom:
                      ResponsiveUtils(context).getMediaQueryPaddingBottom() +
                          50,
                ),
                child: CustomImageWrapper(
                  image: AppImageAssets.backgrounds,
                  width: ResponsiveUtils(context).getMediaQueryWidth() * 0.8,
                  isNetworkImage: false,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      "Today",
                      style: AppTextStyle.semiBold.copyWith(
                        fontSize: AppFontSize.medium,
                        color: AppColors.mainFontColor,
                      ),
                    ),
                  ),
                  Column(
                    children: _getRecentTransactionList
                        .map((transaction) =>
                            RecentTransactionCard(transaction: transaction))
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
