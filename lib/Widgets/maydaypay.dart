import 'package:flutter/material.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mayday Pay',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(
            255, 5, 23, 50), // Color azul oscuro para la AppBar
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo de la wallet y Saldo de la cuenta
          Container(
            padding: EdgeInsets.all(20.0),
            color: const Color.fromARGB(
                255, 5, 26, 57), // Color azul oscuro para el Container
            child: Column(
              children: [
                Text(
                  'Mayday Pay',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24.0, color: Colors.white),
                ),
                SizedBox(height: 10.0), // Espacio entre los textos
                Text(
                  'Saldo: \$100.00',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32.0, color: Colors.white),
                ),
              ],
            ),
          ),
          // Iconos de historial y recarga
          Container(
            color: Colors.blue[900], // Color azul oscuro para el fondo del Row
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.history, color: Colors.white),
                  onPressed: () {
                    // Implementa la acción para el historial
                  },
                ),
                IconButton(
                  icon: Icon(Icons.add, color: Colors.white),
                  onPressed: () {
                    // Redirecciona a la pantalla de recarga
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecargaScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          // Espacio para mostrar el historial de transacciones
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 28, 72, 184),
              child: Center(
                child: Text(
                  'Historial de transacciones',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }
}

class RecargaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recargar'),
      ),
      body: Center(
        child: Text('Pantalla de recarga'),
      ),
    );
  }
}
