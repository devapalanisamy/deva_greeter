class Result<T> {
  Result(this.value, {this.isAwaiting = false});

  factory Result.awaiting({Result<T> previousResult}) {
    return Result<T>(previousResult?.value, isAwaiting: true);
  }

  final T value;
  final bool isAwaiting;
}
