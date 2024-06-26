import 'package:flutter/material.dart';
import '../../../../lib.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel _transaction;

  const TransactionCard({
    Key? key,
    required TransactionModel transaction,
  })  : _transaction = transaction,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    IconData getIcon() {
      switch (_transaction.type) {
        case TransactionType.income:
          return Icons.arrow_upward_rounded;
        case TransactionType.expanses:
          return Icons.arrow_downward_rounded;
        case TransactionType.loan:
          return Icons.attach_money;
      }
    }

    Color getColor() {
      switch (_transaction.type) {
        case TransactionType.income:
          return Colors.green;
        case TransactionType.expanses:
          return Colors.red;
        case TransactionType.loan:
          return Colors.red;
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: RowPadding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.arrowBgColor,
              ),
              child: Icon(
                getIcon(),
                color: getColor(),
              )),
          const Gap(width: 15),
          Expanded(
              child: SizedBox(
            width: (ResponsiveUtils(context).getMediaQueryWidth() - 90) * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _transaction.title,
                  style: AppTextStyle.bold.copyWith(
                    fontSize: AppFontSize.normal,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  _transaction.description,
                  style: AppTextStyle.semiBold.copyWith(
                    fontSize: AppFontSize.extraSmall,
                    color: AppColors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  _transaction.amount,
                  style: AppTextStyle.bold.copyWith(
                    fontSize: AppFontSize.normal,
                    color: getColor(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class RecentTransactionCard extends StatelessWidget {
  final RecentTransactionModel _transaction;

  const RecentTransactionCard({
    Key? key,
    required RecentTransactionModel transaction,
  })  : _transaction = transaction,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // IconData getIcon() {
    //   switch (_transaction.type) {
    //     case RecentTransactionType.all:
    //       return Icons.arrow_upward_rounded;
    //     case RecentTransactionType.expanses:
    //       return Icons.arrow_downward_rounded;
    //     case RecentTransactionType.income:
    //       return Icons.attach_money;
    //   }
    // }

    Color getColor() {
      switch (_transaction.type) {
        case RecentTransactionType.all:
          return AppColors.mainFontColor;
        case RecentTransactionType.expanses:
          return Colors.red;
        case RecentTransactionType.income:
          return Colors.green;
      }
    }

    return Container(
      margin: const EdgeInsets.only(top: 20, left: 25, right: 25),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: RowPadding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: [
          Icon(
            Icons.payment,
            color: getColor(),
          ),
          const Gap(width: 15),
          Expanded(
              child: SizedBox(
            width: (ResponsiveUtils(context).getMediaQueryWidth() - 90) * 0.7,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _transaction.title,
                  style: AppTextStyle.bold.copyWith(
                    fontSize: AppFontSize.normal,
                    color: AppColors.black,
                  ),
                ),
                Text(
                  _transaction.description,
                  style: AppTextStyle.semiBold.copyWith(
                    fontSize: AppFontSize.extraSmall,
                    color: AppColors.black.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          )),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  _transaction.amount,
                  style: AppTextStyle.bold.copyWith(
                    fontSize: AppFontSize.normal,
                    color: getColor(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
