import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Presentation/Widgets/MyHomePage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserData {
  String email;
  String username;
  String password;
  bool isClient;

  UserData(
      {required this.email,
      required this.username,
      required this.password,
      required this.isClient});

  // Método para convertir los datos a un mapa
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'username': username,
      'password': password,
      'isClient': isClient,
    };
  }

  // Método para crear una instancia de UserData desde un mapa
  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      email: json['email'],
      username: json['username'],
      password: json['password'],
      isClient: json['isClient'],
    );
  }
}

class PersistenceManager {
  static const String userDataKey = 'userData';

  // Método para guardar datos de usuario en SharedPreferences
  static Future<void> saveUserData(UserData userData) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(userDataKey, jsonEncode(userData.toJson()));
  }

  // Método para cargar datos de usuario desde SharedPreferences
  static Future<UserData?> loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userDataJson = prefs.getString(userDataKey);
    if (userDataJson != null) {
      Map<String, dynamic> userDataMap = jsonDecode(userDataJson);
      return UserData.fromJson(userDataMap);
    }
    return null;
  }
}

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool isClient = true;

  @override
  void initState() {
    super.initState();
    // Cargar datos de usuario si están disponibles
    _loadUserData();
  }

  // Método para cargar datos de usuario guardados
  _loadUserData() async {
    UserData? userData = await PersistenceManager.loadUserData();
    if (userData != null) {
      setState(() {
        emailController.text = userData.email;
        usernameController.text = userData.username;
        passwordController.text = userData.password;
        confirmPasswordController.text = userData.password;
        isClient = userData.isClient;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF101010),
      appBar: AppBar(
        forceMaterialTransparency: true,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            child: Column(
              children: [
                TextField(
                  controller: emailController,
                  cursorColor: Color(0xFFEF315D),
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.grey),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFEF315D)),
                    ),
                  ),
                ),
                // Otros campos de texto y elementos omitidos para brevedad
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEF315D),
                  ),
                  onPressed: () {
                    // Guardar los datos del usuario
                    _saveUserData();
                    // Navegar a la siguiente página
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MyHomePage()),
                    );
                  },
                  child: Text(
                    'SIGN UP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Método para guardar datos de usuario
  _saveUserData() async {
    UserData userData = UserData(
      email: emailController.text,
      username: usernameController.text,
      password: passwordController.text,
      isClient: isClient,
    );
    await PersistenceManager.saveUserData(userData);
  }
}
