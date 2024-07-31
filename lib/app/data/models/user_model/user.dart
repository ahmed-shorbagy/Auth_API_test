import 'dart:convert';

import 'package:collection/collection.dart';

class User {
	int? id;
	String? createdBy;
	DateTime? createdAt;
	dynamic updatedBy;
	dynamic updatedAt;
	String? email;
	String? password;
	String? username;
	bool? activated;
	dynamic imageUrl;
	String? role;

	User({
		this.id, 
		this.createdBy, 
		this.createdAt, 
		this.updatedBy, 
		this.updatedAt, 
		this.email, 
		this.password, 
		this.username, 
		this.activated, 
		this.imageUrl, 
		this.role, 
	});

	factory User.fromMap(Map<String, dynamic> data) => User(
				id: data['id'] as int?,
				createdBy: data['createdBy'] as String?,
				createdAt: data['createdAt'] == null
						? null
						: DateTime.parse(data['createdAt'] as String),
				updatedBy: data['updatedBy'] as dynamic,
				updatedAt: data['updatedAt'] as dynamic,
				email: data['email'] as String?,
				password: data['password'] as String?,
				username: data['username'] as String?,
				activated: data['activated'] as bool?,
				imageUrl: data['imageUrl'] as dynamic,
				role: data['role'] as String?,
			);

	Map<String, dynamic> toMap() => {
				'id': id,
				'createdBy': createdBy,
				'createdAt': createdAt?.toIso8601String(),
				'updatedBy': updatedBy,
				'updatedAt': updatedAt,
				'email': email,
				'password': password,
				'username': username,
				'activated': activated,
				'imageUrl': imageUrl,
				'role': role,
			};

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [User].
	factory User.fromJson(String data) {
		return User.fromMap(json.decode(data) as Map<String, dynamic>);
	}
  /// `dart:convert`
  ///
  /// Converts [User] to a JSON string.
	String toJson() => json.encode(toMap());

	@override
	bool operator ==(Object other) {
		if (identical(other, this)) return true;
		if (other is! User) return false;
		final mapEquals = const DeepCollectionEquality().equals;
		return mapEquals(other.toMap(), toMap());
	}

	@override
	int get hashCode =>
			id.hashCode ^
			createdBy.hashCode ^
			createdAt.hashCode ^
			updatedBy.hashCode ^
			updatedAt.hashCode ^
			email.hashCode ^
			password.hashCode ^
			username.hashCode ^
			activated.hashCode ^
			imageUrl.hashCode ^
			role.hashCode;
}
