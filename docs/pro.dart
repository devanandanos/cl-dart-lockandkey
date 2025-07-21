import 'dart:math';

class PasswordManager {
  final Random _random = Random();

  String validateStrength(String password) {
    final hasUpper = password.contains(RegExp(r'[A-Z]'));
    final hasLower = password.contains(RegExp(r'[a-z]'));
    final hasDigit = password.contains(RegExp(r'[0-9]'));
    final hasSpecial = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));
    final length = password.length;

    if (length >= 12 && hasUpper && hasLower && hasDigit && hasSpecial) {
      return 'Strong';
    } else if (length >= 8 && hasLower && hasDigit) {
      return 'Intermediate';
    } else {
      return 'Low';
    }
  }

  String _generatePassword(int length, String charSet) {
    return List.generate(length, (_) => charSet[_random.nextInt(charSet.length)]).join();
  }

  String generateStrongPassword() {
    const upper = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const lower = 'abcdefghijklmnopqrstuvwxyz';
    const digits = '0123456789';
    const special = '!@#\$%^&*()_+[]{}<>?';
    final allChars = upper + lower + digits + special;
    return _generatePassword(_random.nextInt(5) + 12, allChars);
  }

  String generateIntermediatePassword() {
    const chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    return _generatePassword(_random.nextInt(3) + 8, chars);
  }

  String generateLowPassword() {
    const chars = 'abcdefghijklmnopqrstuvwxyz';
    return _generatePassword(_random.nextInt(4) + 4, chars);
  }
}

void main() {
  final manager = PasswordManager();

  print("Generated Strong Password: ${manager.generateStrongPassword()}");
  print("Generated Intermediate Password: ${manager.generateIntermediatePassword()}");
  print("Generated Low Password: ${manager.generateLowPassword()}");

  print("\nPassword Strength Checks:");
  print("Strength of 'Abc123!@#xyz': ${manager.validateStrength('Abc123!@#xyz')}");
  print("Strength of 'abc12345': ${manager.validateStrength('abc12345')}");
  print("Strength of 'pass': ${manager.validateStrength('pass')}");
}
