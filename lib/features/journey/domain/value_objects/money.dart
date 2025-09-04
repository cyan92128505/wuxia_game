import 'package:app/core/exceptions/domain_exception.dart';

class Money {
  final int amount;
  Money(this.amount) {
    if (amount < 0) {
      throw const DomainException(
        'Money amount must be non-negative',
        'INVALID_MONEY',
      );
    }
  }

  Money add(int i) {
    return Money(amount + i);
  }

  Money subtract(int i) {
    if (amount - i < 0) {
      throw const DomainException(
        'Money amount must be non-negative',
        'INVALID_MONEY',
      );
    }

    return Money(amount - i);
  }

  bool sufficient(int payment) {
    return amount >= payment;
  }

  int compare(Money actualB) {
    return amount.compareTo(actualB.amount);
  }

  bool isBankrupt() {
    return amount == 0;
  }

  bool isVictory() {
    return amount == 100;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Money && other.amount == amount;
  }

  @override
  int get hashCode => amount.hashCode;

  @override
  String toString() => 'Money($amount)';
}
