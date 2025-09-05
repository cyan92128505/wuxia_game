import 'package:app/features/scene/domain/enum/scene_type.dart';
import 'package:app/features/scene/domain/value_objects/character.dart';
import 'package:app/features/scene/domain/value_objects/facility.dart';
import 'package:app/features/scene/domain/value_objects/treasure.dart';

class Scene {
  final SceneType type;
  Character? character;
  Facility? facility;
  Treasure? treasure;
  Scene({
    this.type = SceneType.empty,
    this.character,
    this.facility,
    this.treasure,
  });

  factory Scene.createFromCharacter(Character character) {
    return Scene(type: SceneType.character, character: character);
  }

  factory Scene.createFromFacility(Facility facility) {
    return Scene(type: SceneType.facility, facility: facility);
  }

  factory Scene.createFromTreasure(Treasure treasure) {
    return Scene(type: SceneType.treasure, treasure: treasure);
  }
}
