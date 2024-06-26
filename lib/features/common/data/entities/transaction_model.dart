enum TransactionType { income, expanses, loan }

class TransactionModel {
  final TransactionType type;
  final String title;
  final String description;
  final String amount;

  TransactionModel({
    required this.type,
    required this.title,
    required this.description,
    required this.amount,
  });

  static List<TransactionModel> getTransactionList = [
    TransactionModel(
      type: TransactionType.expanses,
      title: "Sent",
      description: "Sending Payment to Clients",
      amount: "\$150",
    ),
    TransactionModel(
      type: TransactionType.income,
      title: "Receive",
      description: "Receive Payment from company",
      amount: "\$250",
    ),
    TransactionModel(
      type: TransactionType.loan,
      title: "Loan",
      description: "Loan for the Card",
      amount: "\$550",
    ),
  ];
}

enum RecentTransactionType { all, income, expanses }

class RecentTransactionModel {
  final RecentTransactionType type;
  final String title;
  final String description;
  final String amount;

  RecentTransactionModel({
    required this.type,
    required this.title,
    required this.description,
    required this.amount,
  });

  static List<RecentTransactionModel> getRecentTransactionList = [
    RecentTransactionModel(
      type: RecentTransactionType.all,
      title: "Payment",
      description: "Payment from Andrea",
      amount: "\$30.00",
    ),
  ];
}
