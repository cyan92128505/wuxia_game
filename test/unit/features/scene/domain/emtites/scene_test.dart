import 'package:app/features/scene/domain/entites/scene.dart';
import 'package:app/features/scene/domain/enum/scene_type.dart';
import 'package:app/features/scene/domain/value_objects/character.dart';
import 'package:app/features/scene/domain/value_objects/facility.dart';
import 'package:app/features/scene/domain/value_objects/treasure.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Scene Entity', () {
    test('should create empty scene', () {
      final actual = Scene();
      expect(actual.type, SceneType.empty);
    });

    test('should create character scene with character data', () {
      final character = Character(
        name: '',
        maxHp: 1,
        currentHp: 1,
        rewardMoney: 1,
      );
      final actual = Scene.createFromCharacter(character);
      expect(actual.type, SceneType.character);
      expect(actual.character != null, isTrue);
    });

    test('should create facility scene with cost', () {
      final facility = Facility(name: '', cost: 1);
      final actual = Scene.createFromFacility(facility);
      expect(actual.type, SceneType.facility);
      expect(actual.facility != null, isTrue);
    });

    test('should create treasure scene with reward', () {
      final treasure = Treasure(name: '', reward: 1);
      final actual = Scene.createFromTreasure(treasure);
      expect(actual.type, SceneType.treasure);
      expect(actual.treasure != null, isTrue);
    });
  });
}
