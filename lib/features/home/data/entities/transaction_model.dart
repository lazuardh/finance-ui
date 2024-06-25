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
