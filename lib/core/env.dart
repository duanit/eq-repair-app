class Env {
  // Change to your API base
  static const apiBase = String.fromEnvironment('API_BASE', defaultValue: 'http://localhost:3000/api/v1');
}
