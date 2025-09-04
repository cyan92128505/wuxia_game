import 'package:app/features/battle/domain/enum/battle_card_result.dart';
import 'package:app/features/battle/domain/enum/battle_card_type.dart';

class BattleCard {
  final BattleCardType type;
  final bool revealed;

  BattleCard(this.type, [this.revealed = false]);

  factory BattleCard.scissors() {
    return BattleCard(BattleCardType.scissors);
  }

  factory BattleCard.rock() {
    return BattleCard(BattleCardType.rock);
  }

  factory BattleCard.paper() {
    return BattleCard(BattleCardType.paper);
  }

  BattleCardResult beat(BattleCard actualB) {
    return switch (type) {
      BattleCardType.scissors => switch (actualB.type) {
        BattleCardType.scissors => BattleCardResult.draw,
        BattleCardType.rock => BattleCardResult.lose,
        BattleCardType.paper => BattleCardResult.win,
      },
      BattleCardType.rock => switch (actualB.type) {
        BattleCardType.scissors => BattleCardResult.win,
        BattleCardType.rock => BattleCardResult.draw,
        BattleCardType.paper => BattleCardResult.lose,
      },
      BattleCardType.paper => switch (actualB.type) {
        BattleCardType.scissors => BattleCardResult.lose,
        BattleCardType.rock => BattleCardResult.win,
        BattleCardType.paper => BattleCardResult.draw,
      },
    };
  }

  BattleCard setRevealed() {
    return BattleCard(type, true);
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is BattleCard &&
        other.type == type &&
        other.revealed == revealed;
  }

  @override
  int get hashCode => Object.hash(type, revealed);

  @override
  String toString() => 'BattleCard($type, $revealed)';
}
