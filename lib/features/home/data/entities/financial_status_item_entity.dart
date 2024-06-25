class FinancialStatusItemEntity {
  final String price;
  final String title;

  FinancialStatusItemEntity({
    required this.price,
    required this.title,
  });

  static List<FinancialStatusItemEntity> financialStatusItemList = [
    FinancialStatusItemEntity(price: "\$8900", title: "Income"),
    FinancialStatusItemEntity(price: "\$5500", title: "Expanses"),
    FinancialStatusItemEntity(price: "\$890", title: "Loan"),
  ];
}
