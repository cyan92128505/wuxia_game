class DomainException implements Exception {
  final String message;
  final String? code;

  const DomainException(this.message, [this.code]);

  @override
  String toString() => 'DomainException: $message';
}
