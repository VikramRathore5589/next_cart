class UserModel {
  String uid;
  String username;
  String email;
  String phone;
  String userImg;
  String userDeviceToken;
  String country;
  String userAddress;
  String street;
  bool isAdmin;
  bool isActive;
  dynamic createdOn;
  String city;

  // Constructor
  UserModel(
      {required this.uid,
      required this.username,
      required this.email,
      required this.phone,
      required this.userImg,
      required this.userDeviceToken,
      required this.country,
      required this.userAddress,
      required this.street,
      required this.isAdmin,
      required this.isActive,
      required this.createdOn,
      required this.city});

  // Factory method to create a UserModel from a Map (for Firebase or other API responses)
  static UserModel fromJson(Map<String, dynamic> map) {
    return UserModel(
        uid: map['uid'],
        username: map['username'],
        email: map['email'],
        phone: map['phone'],
        userImg: map['userImg'],
        userDeviceToken: map['userDeviceToken'],
        country: map['country'],
        userAddress: map['userAddress'],
        street: map['street'],
        isAdmin: map['isAdmin'],
        isActive: map['isActive'],
        createdOn: map['createdOn'].toString(),
        city: map['city']);
  }

  // Method to convert a UserModel to a Map (for saving to Firebase or other API)
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'username': username,
      'email': email,
      'phone': phone,
      'userImg': userImg,
      'userDeviceToken': userDeviceToken,
      'country': country,
      'userAddress': userAddress,
      'street': street,
      'isAdmin': isAdmin,
      'isActive': isActive,
      'createdOn': createdOn,
      'city': city
    };
  }

  // Optional: Override toString method for easier debugging
  @override
  String toString() {
    return 'UserModel(uid: $uid, username: $username, '
        'email: $email, phone: $phone, userImg: $userImg, '
        'userDeviceToken: $userDeviceToken, country: $country, '
        'userAddress: $userAddress, street: $street, isAdmin: $isAdmin, '
        'isActive: $isActive, createdOn: $createdOn)';
  }
}
