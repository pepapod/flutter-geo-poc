/// [ServiceException] wraps all the exceptions that
/// are expected to happen inside the services level.
class ServiceException implements Exception {
}

/// [ConsistencyException] defines the occurrence of
/// exception that makes the system inconsistent but
/// still usable for some operations.
/// (e.g. The system could not save the profile
/// correctly on cloud)
class ConsistencyException extends ServiceException{
}

/// [SevereException] defines the occurrence of a
/// exception that makes the system not usable anymore
/// and if caught, the system should finish.
/// (e.g. The system could not fetch the token)
class SevereException implements Exception{
  dynamic throwable;

  SevereException(dynamic throwable) {
    this.throwable = throwable;
  }

  String toString() {
    String message = throwable?.toString();
    return "Exception: $message";
  }
}

/// [ConnectionException] defines the situation
/// where there is no connection to the internet
class ConnectionException implements Exception {
}
