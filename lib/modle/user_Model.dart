class Usermodel {
  String id, name, email, password, image;

  Usermodel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.image
  });

  Usermodel.fromjson(map):this(
    id: map['id'],
    name: map['name'],
    email: map['email'],
    password: map['password'],
    image: map['image']
  );

  Map<String, dynamic> tojson() => {
    'id': id,
    'name': name,
    'email': email,
    'password': password,
    'image': image
  };

  @override
  String toString() {
    return 'Usermodel{id: $id, name: $name, email: $email, password: $password, image: $image}';
  }
}