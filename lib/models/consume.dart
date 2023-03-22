class Consume {
  final String day;
  final String consume;
  final String type;
  const Consume(
    this.day,
    this.consume,
    this.type,
  );

  Map toJson() => {
        'day': day,
        'consume': consume,
        'type': type,
      };
}
