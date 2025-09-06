import 'package:app/core/exceptions/domain_exception.dart';
import 'package:app/features/life/domain/entites/life.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Life Entity', () {
    test('should create new life with starting money 10', () {
      final actual = Life();
      expect(actual.money.amount, 10);
    });

    test('should correctly record journey count', () {
      final actual = Life();
      expect(actual.journeyCount, 0);
    });

    test('should correctly increase money', () {
      final life = Life();
      final actual = life.updateMoney(life.money.add(1));
      expect(actual.money.amount, 11);
    });

    test('should correctly decrease money', () {
      final life = Life();
      final actual = life.updateMoney(life.money.subtract(1));
      expect(actual.money.amount, 9);
    });

    test('should correctly increase journey count', () {
      final actual = Life().nextJourney();
      expect(actual.journeyCount, 1);
    });

    test('decreasing money when insufficient should fail', () {
      final life = Life();
      expect(
        () => life.updateMoney(life.money.subtract(11)),
        throwsA(isA<DomainException>()),
      );
    });

    test('should determine if bankrupt', () {
      final life = Life();
      final actual = life.updateMoney(life.money.subtract(10));

      expect(actual.money.isBankrupt(), isTrue);
    });

    test('should determine if victory condition achieved', () {
      final life = Life();
      final actual = life.updateMoney(life.money.add(90));

      expect(actual.money.isVictory(), isTrue);
    });
  });
}
