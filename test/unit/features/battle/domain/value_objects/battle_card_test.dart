import 'package:app/features/battle/domain/enum/battle_card_result.dart';
import 'package:app/features/battle/domain/enum/battle_card_type.dart';
import 'package:app/features/battle/domain/value_objects/battle_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('BattleCard Value Object', () {
    test('should create scissors card', () {
      final actual = BattleCard(BattleCardType.scissors);
      expect(actual.type, BattleCardType.scissors);
    });

    test('should create rock card', () {
      final actual = BattleCard(BattleCardType.rock);
      expect(actual.type, BattleCardType.rock);
    });

    test('should create paper card', () {
      final actual = BattleCard(BattleCardType.paper);
      expect(actual.type, BattleCardType.paper);
    });

    test('should correctly determine scissors beats paper', () {
      final actualA = BattleCard.scissors();
      final actualB = BattleCard.paper();

      expect(actualA.beat(actualB), BattleCardResult.win);
    });

    test('should correctly determine scissors beats rock', () {
      final actualA = BattleCard.scissors();
      final actualB = BattleCard.rock();

      expect(actualA.beat(actualB), BattleCardResult.lose);
    });

    test('should correctly determine scissors beats scissors', () {
      final actualA = BattleCard.scissors();
      final actualB = BattleCard.scissors();

      expect(actualA.beat(actualB), BattleCardResult.draw);
    });

    test('should correctly determine rock beats scissors', () {
      final actualA = BattleCard.rock();
      final actualB = BattleCard.scissors();

      expect(actualA.beat(actualB), BattleCardResult.win);
    });

    test('should correctly determine rock beats paper', () {
      final actualA = BattleCard.rock();
      final actualB = BattleCard.paper();

      expect(actualA.beat(actualB), BattleCardResult.lose);
    });

    test('should correctly determine rock beats rock', () {
      final actualA = BattleCard.rock();
      final actualB = BattleCard.rock();

      expect(actualA.beat(actualB), BattleCardResult.draw);
    });

    test('should correctly determine paper beats rock', () {
      final actualA = BattleCard.paper();
      final actualB = BattleCard.rock();

      expect(actualA.beat(actualB), BattleCardResult.win);
    });

    test('should correctly determine paper beats scissors', () {
      final actualA = BattleCard.paper();
      final actualB = BattleCard.scissors();

      expect(actualA.beat(actualB), BattleCardResult.lose);
    });

    test('should correctly determine paper beats paper', () {
      final actualA = BattleCard.paper();
      final actualB = BattleCard.paper();

      expect(actualA.beat(actualB), BattleCardResult.draw);
    });

    test('should correctly set revealed state', () {
      final actual = BattleCard.scissors().setRevealed();

      expect(actual.revealed, isTrue);
    });
  });
}
