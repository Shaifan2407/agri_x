class LogInWithEmailAndPasswordFailure {
  final String message;

  const LogInWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occurred."]);

  factory LogInWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const LogInWithEmailAndPasswordFailure(
            'Please enter a stronger password.');
      case 'invalid-email':
        return const LogInWithEmailAndPasswordFailure('Email is not valid.');
      case 'email-already-in-use':
        return const LogInWithEmailAndPasswordFailure(
            'An account already exist for that email.');
      case 'operation-not-allowed':
        return const LogInWithEmailAndPasswordFailure(
            'Operation is not Valid. Please Contact');
      case 'user-disabled':
        return const LogInWithEmailAndPasswordFailure(
            'The user has been disabled. Please contact');
      default:
        return const LogInWithEmailAndPasswordFailure();
    }
  }
}
