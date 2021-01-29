class PaymentHistory {
  String image;
  String storeName;
  DateTime time;
  double amount;
  PaymentHistory(this.image, this.storeName, this.time, this.amount);
}

List<PaymentHistory> getPaymentHistory() {
  return [
    PaymentHistory(
        'assets/logos/starbucks.png', 'Starbucks', DateTime.now(), 1.2),
    PaymentHistory('assets/logos/nike.png', 'Nike',
        DateTime.now().subtract(Duration(days: 1)), 1.2),
    PaymentHistory('assets/logos/adidas.png', 'Adidas',
        DateTime.now().subtract(Duration(days: 3)), 1.2),
    PaymentHistory('assets/logos/vas-icon.jpg', 'Vietnam Australia School',
        DateTime.now().subtract(Duration(days: 4)), 1.2),
    PaymentHistory('assets/logos/okuro-icon.png', 'Okuro',
        DateTime.now().subtract(Duration(days: 5)), 1.2),
  ];
}
