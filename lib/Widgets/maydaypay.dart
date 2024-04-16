import 'package:flutter/material.dart';
import 'RecargaScreen.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mayday Pay',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color.fromARGB(255, 5, 23, 50),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Logo de la wallet y Saldo de la cuenta
          Container(
            padding: EdgeInsets.all(20.0),
            color: const Color.fromARGB(255, 5, 26, 57),
            child: Column(
              children: [
                SizedBox(height: 10.0), // Espacio entre los textos
                Text(
                  'Saldo: \$100.00',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 32.0, color: Colors.white),
                ),
              ],
            ),
          ),
          // Iconos de actualizar y recarga
          Container(
            color: Color.fromARGB(255, 14, 72, 159),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    // Implementa la acción para el actualizar
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.history, color: Colors.white),
                        onPressed: () {
                          // Implementa la acción para el actualizar
                        },
                      ),
                      Text(
                        'Actualizar ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Redirecciona a la pantalla de recarga
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RecargaScreen()),
                    );
                  },
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.add, color: Colors.white),
                        onPressed: () {
                          // Redirecciona a la pantalla de recarga
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecargaScreen()),
                          );
                        },
                      ),
                      Text(
                        'Recargar',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Espacio para mostrar el historial de transacciones
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 71, 163, 228),
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
    );
  }
}
