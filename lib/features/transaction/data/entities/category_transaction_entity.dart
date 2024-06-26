enum CategoryTransactionType { all, expanse, income }

class CategoryTransactionEntity {
  final CategoryTransactionType type;
  final String title;

  CategoryTransactionEntity({
    required this.type,
    required this.title,
  });

  static List<CategoryTransactionEntity> getCategoryTransaction = [
    CategoryTransactionEntity(
      type: CategoryTransactionType.all,
      title: "All",
    ),
    CategoryTransactionEntity(
      type: CategoryTransactionType.expanse,
      title: "Expanse",
    ),
    CategoryTransactionEntity(
      type: CategoryTransactionType.income,
      title: "Income",
    )
  ];
}
