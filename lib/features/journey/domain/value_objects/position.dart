import 'package:app/core/exceptions/domain_exception.dart';

class Position {
  final int column;
  final int row;

  Position(this.column, this.row) {
    if (column < 0 || row < 0) {
      throw const DomainException(
        'Position coordinates must be non-negative',
        'INVALID_POSITION',
      );
    } else if (column >= maxColumn || row >= maxRow) {
      throw const DomainException(
        'Position coordinates must be small than max',
        'INVALID_POSITION',
      );
    }
  }

  List<Position> getAdjacentPositionList() {
    List<Position> list = [];
    if (column + 1 < maxColumn) {
      list.add(Position(column + 1, row));
    }

    if (row + 1 < maxRow) {
      list.add(Position(column, row + 1));
    }

    if (row - 1 >= 0) {
      list.add(Position(column, row - 1));
    }

    if (column - 1 >= 0) {
      list.add(Position(column - 1, row));
    }

    return list;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Position && other.column == column && other.row == row;
  }

  @override
  int get hashCode => Object.hash(column, row);

  @override
  String toString() => 'Position($column, $row)';

  static int get maxColumn => 4;
  static int get maxRow => 8;
}
