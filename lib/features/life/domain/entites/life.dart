import 'package:app/features/journey/domain/value_objects/money.dart';

class Life {
  final Money money;
  final int journeyCount;

  Life({Money? money, this.journeyCount = 0}) : money = money ?? Money(10);

  Life copyWith({Money? money, int? journeyCount}) {
    return Life(
      money: money ?? this.money,
      journeyCount: journeyCount ?? this.journeyCount,
    );
  }

  Life nextJourney() => copyWith(journeyCount: journeyCount + 1);
  Life updateMoney(Money newMoney) => copyWith(money: newMoney);

  @override
  String toString() => 'Life(money: $money, journeyCount: $journeyCount)';

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Life &&
          runtimeType == other.runtimeType &&
          money == other.money &&
          journeyCount == other.journeyCount;

  @override
  int get hashCode => money.hashCode ^ journeyCount.hashCode;
}
