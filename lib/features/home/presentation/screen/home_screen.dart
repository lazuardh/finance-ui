import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../lib.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<TransactionModel> _getTransactionList =
      TransactionModel.getTransactionList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const _FinancialSummaryCard(
                image: AppImageAssets.profile,
                name: "Khalid Watson",
                position: "Mobile Developer",
              ),
              RowPadding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Overview",
                    style: AppTextStyle.semiBold.copyWith(
                      fontSize: 20,
                      color: AppColors.mainFontColor,
                    ),
                  ),
                  Text(
                    "June 06, 2024",
                    style: AppTextStyle.semiBold.copyWith(
                      fontSize: AppFontSize.small,
                      color: AppColors.mainFontColor,
                    ),
                  ),
                ],
              ),
              Column(
                children: _getTransactionList
                    .map((transaction) =>
                        TransactionCard(transaction: transaction))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _FinancialSummaryCard extends StatelessWidget {
  final String _image;
  final String _name;
  final String _position;
  const _FinancialSummaryCard({
    Key? key,
    required String image,
    required String name,
    required String position,
  })  : _image = image,
        _name = name,
        _position = position,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 15,
        left: 25,
        right: 25,
        bottom: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.white,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: const Icon(CupertinoIcons.chart_bar_alt_fill),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          ),
          CustomImageWrapper(
            image: _image,
            width: 60,
            height: 60,
            borderRadius: AppBorderRadius.big,
            fit: BoxFit.cover,
            isNetworkImage: false,
          ),
          const Gap(height: 20),
          Text(
            _name,
            style: AppTextStyle.semiBold.copyWith(
              color: AppColors.mainFontColor,
              fontSize: AppFontSize.large,
            ),
          ),
          Text(
            _position,
            style: AppTextStyle.semiBold.copyWith(
              color: AppColors.black,
              fontSize: AppFontSize.small,
            ),
          ),
          const Gap(height: 30),
          RowPadding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const _FinancialStatusItem(
                price: "\$8900",
                title: "Income",
              ),
              _verticalDivider(),
              const _FinancialStatusItem(
                price: "\$5500",
                title: "Expanses",
              ),
              _verticalDivider(),
              const _FinancialStatusItem(
                price: "\$890",
                title: "Loan",
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _verticalDivider() {
    return Container(
      width: 0.5,
      height: 40,
      color: AppColors.black.withOpacity(0.3),
    );
  }
}

class _FinancialStatusItem extends StatelessWidget {
  final String _price;
  final String _title;
  const _FinancialStatusItem({
    Key? key,
    required String price,
    required String title,
  })  : _price = price,
        _title = title,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _price,
          style: AppTextStyle.semiBold.copyWith(
            color: AppColors.mainFontColor,
            fontSize: AppFontSize.medium,
          ),
        ),
        const Gap(height: 5),
        Text(
          _title,
          style: AppTextStyle.semiBold.copyWith(
            color: AppColors.black,
            fontSize: AppFontSize.small,
          ),
        ),
      ],
    );
  }
}
