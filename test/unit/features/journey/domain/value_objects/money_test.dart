import 'package:app/core/exceptions/domain_exception.dart';
import 'package:app/features/journey/domain/value_objects/money.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Money Value Object', () {
    test('should create valid money amount', () {
      final actual = Money(0);

      expect(actual.amount, 0);
    });

    test('should reject negative money', () {
      expect(() => Money(-1), throwsA(isA<DomainException>()));
    });

    test('should correctly perform addition operation', () {
      final actual = Money(0).add(1);

      expect(actual.amount, 1);
    });

    test('should correctly perform subtraction operation', () {
      final actual = Money(1).subtract(1);

      expect(actual.amount, 0);
    });

    test('subtraction resulting in negative should throw exception', () {
      expect(() => Money(0).subtract(1), throwsA(isA<DomainException>()));
    });

    test('should correctly compare money amounts', () {
      final actualA = Money(0);
      final actualB = Money(1);

      expect(actualA.compare(actualB), -1);
    });

    test('should determine if amount is sufficient for payment', () {
      final actual = Money(1);

      final payment = 1;

      expect(actual.sufficient(payment), isTrue);
    });

    test('should determine if bankrupt (0)', () {
      final actual = Money(0);

      expect(actual.isBankrupt(), isTrue);
    });

    test('should determine if victory condition reached (100)', () {
      final actual = Money(100);

      expect(actual.isVictory(), isTrue);
    });
  });
}
