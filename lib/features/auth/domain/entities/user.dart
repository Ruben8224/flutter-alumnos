class User {
  String id;
  String name;
  String email;
  String password;
  String matricula;
  String carrera;

  User(this.id, this.name, this.email,  this.password, this.matricula, this.carrera);

  @override
  String toString() {
    return 'User{name: $name, email: $email, password: $password, matricula: $matricula, carrera: $carrera}';
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is User &&
              runtimeType == other.runtimeType &&
              id == other.id &&
              name == other.name &&
              email == other.email &&
              password == other.password;

  @override
  int get hashCode => Object.hash(id, name);
}