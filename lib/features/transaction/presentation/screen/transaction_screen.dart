import 'package:finance_ui/features/features.dart';
import 'package:finance_ui/lib.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});

  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final List<CategoryTransactionEntity> _categoryTransaction =
      CategoryTransactionEntity.getCategoryTransaction;

  int _indexActived = 0;

  void _onCategoryTap(int index) {
    setState(() {
      _indexActived = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            RowPadding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 25,
              ),
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.back),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(CupertinoIcons.search),
                )
              ],
            ),
            RowPadding(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                Text(
                  "Recent Transaction",
                  style: AppTextStyle.semiBold.copyWith(
                    fontSize: AppFontSize.large,
                    color: AppColors.mainFontColor,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "See all",
                    style: AppTextStyle.semiBold.copyWith(
                      fontSize: AppFontSize.small,
                      color: AppColors.mainFontColor,
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _categoryTransaction.asMap().entries.map((entry) {
                int index = entry.key;
                CategoryTransactionEntity category = entry.value;
                return GestureDetector(
                  onTap: () => _onCategoryTap(index),
                  child: _TransactionScreenWrapper(
                    category: category,
                    isActived: index == _indexActived,
                  ),
                );
              }).toList(),
            ),
            Expanded(
              child: IndexedStack(
                index: _indexActived,
                children: [
                  AllTransactionPage(),
                  ExpanseTransactionPage(),
                  IncomeTransactionPage(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _TransactionScreenWrapper extends StatelessWidget {
  final CategoryTransactionEntity _category;
  final bool _isActiced;
  const _TransactionScreenWrapper({
    Key? key,
    required CategoryTransactionEntity category,
    required bool isActived,
  })  : _category = category,
        _isActiced = isActived,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    String getCategory() {
      switch (_category.type) {
        case CategoryTransactionType.all:
          return "All";
        case CategoryTransactionType.expanse:
          return "Expanse";
        case CategoryTransactionType.income:
          return "income";
      }
    }

    return Column(
      children: [
        RowPadding(
          padding: const EdgeInsets.only(
            top: 5,
            left: 25,
            right: 25,
            bottom: 10,
          ),
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                color: _isActiced ? AppColors.mainFontColor : AppColors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                getCategory(),
                style: AppTextStyle.semiBold.copyWith(
                  fontSize: AppFontSize.small,
                  color: _isActiced ? AppColors.white : AppColors.black,
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
