class Transaction {
  final String type;
  final int? amount;
  final String phoneNumber;
  final DateTime created;
  final int? balance;

  Transaction({
    required this.type,
    required dynamic amount,
    required this.phoneNumber,
    required this.created,
    required dynamic balance,
  })  : amount =
            (amount is int) ? (amount is int ? amount : amount.toInt()) : null,
        balance = (balance != null)
            ? (balance is int ? balance : balance.toInt())
            : null;
}