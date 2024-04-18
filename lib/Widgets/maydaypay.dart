import 'package:flutter/material.dart';
import 'RecargaScreen.dart';

class MayDayPay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            color: Color(0xFF101010),
            child: Column(
              children: [
                SizedBox(height: 10.0),
                Text(
                  'Mayday Pay\n',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
                Text(
                  'Saldo: \$100.00',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28.0, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            color: Color(0xFFEF315D),
            padding: EdgeInsets.symmetric(vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Ink(
                  decoration: ShapeDecoration(
                    color: Colors.transparent,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.history, color: Colors.white, size: 30),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Página actualizada'),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                ),
                Ink(
                  decoration: ShapeDecoration(
                    color: Colors.transparent,
                    shape: CircleBorder(),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.add, color: Colors.white, size: 30),
                    onPressed: () {
                      // Implementa la acción para recargar
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RecargaScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: Color.fromARGB(255, 255, 255, 255),
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Historial de transacciones',
                    style: TextStyle(fontSize: 24.0, color: Colors.grey),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        index += 1;
                        return ListTile(
                          title: Text(
                            'Detalle de la transacción $index',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Text(
                            '-\$10.00', // Monto de la transacción
                            style: TextStyle(color: Colors.red, fontSize: 18),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
