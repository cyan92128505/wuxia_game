import 'package:app/core/exceptions/domain_exception.dart';
import 'package:app/features/journey/domain/value_objects/position.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Position Value Object', () {
    test('should create valid Position(0, 0)', () {
      final actual = Position(0, 0);

      expect(actual.column, 0);
      expect(actual.row, 0);
    });

    test('should create valid Position(3, 7)', () {
      final actual = Position(3, 7);

      expect(actual.column, 3);
      expect(actual.row, 7);
    });

    test('should throw exception for non-negative Position', () {
      expect(() => Position(-1, 0), throwsA(isA<DomainException>()));
    });

    test('should throw exception for columns that are out of bounds', () {
      expect(
        () => Position(Position.maxColumn, 0),
        throwsA(isA<DomainException>()),
      );
    });

    test('should throw exception for rows that are out of bounds', () {
      expect(
        () => Position(0, Position.maxRow),
        throwsA(isA<DomainException>()),
      );
    });

    test('should equal same coordinates', () {
      final actual = Position(0, 0);

      expect(actual, Position(0, 0));
    });

    test('should not equal different position', () {
      final actual = Position(0, 0);

      expect(actual == Position(1, 0), isFalse);
    });

    test('should be obtained correctly adjacent position list', () {
      final postion = Position(1, 1);

      final actual = postion.getAdjacentPositionList();

      expect(actual.contains(Position(1, 0)), isTrue);
      expect(actual.contains(Position(0, 1)), isTrue);
      expect(actual.contains(Position(1, 2)), isTrue);
      expect(actual.contains(Position(2, 1)), isTrue);
    });

    test(
      'should be obtained correctly adjacent position list when on bounds',
      () {
        final postion = Position(0, 0);

        final actual = postion.getAdjacentPositionList();

        expect(actual.contains(Position(1, 0)), isTrue);
        expect(actual.contains(Position(0, 1)), isTrue);
      },
    );
  });
}
