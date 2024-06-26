import 'package:flutter/material.dart';
import 'dart:math';

import 'package:google_fonts/google_fonts.dart';

class RecargaScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF101010),
        iconTheme: IconThemeData(
          color: const Color.fromARGB(
              255, 255, 255, 255), // Cambia el color del icono de la flecha
        ),
      ),
      backgroundColor: Color(0xFF101010), // Fondo negro
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // Contenedor para MaydayPay
                alignment: Alignment
                    .topCenter, // Alineación centrada en la parte superior
                margin: EdgeInsets.only(top: 40.0), // Margen superior
                child: Badge(
                  backgroundColor: Color(0xFFEF315D),
                  label: Text(' Pay ', style: TextStyle(fontSize: 20)),
                  largeSize: 30,
                  smallSize: 30,
                  child: Text(
                    'May Day',
                    style: GoogleFonts.oleoScript(
                      fontSize: size.height * 0.05,
                      fontWeight: FontWeight.w700,
                      textStyle: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.0),
              Text(
                'Recargue de forma segura y sencilla',
                style: TextStyle(
                  fontSize: 20.0, // Tamaño reducido
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40.0),
              Text(
                'Seleccione el método de recarga que prefiera:',
                style: TextStyle(fontSize: 20.0, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 60.0),
              ElevatedButton(
                onPressed: () {
                  _mostrarDialogoRecargaTarjeta(context);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                  backgroundColor: Color(0xFFEF315D), // Color de botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.credit_card, size: 40.0, color: Colors.white),
                    SizedBox(width: 10.0),
                    Text(
                      'Recargar con tarjeta',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  _generarNumeroAleatorio(context);
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.0, horizontal: 40.0),
                  backgroundColor: Color(0xFFEF315D), // Color de botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.money, size: 40.0, color: Colors.white),
                    SizedBox(width: 10.0),
                    Text(
                      'Recargar en efectivo',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Text(
                'MaydayPay', // Texto en cursiva
                style: TextStyle(
                  fontSize: 16.0,
                  fontStyle: FontStyle.italic,
                  color: Color(0xFF6750a4),
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _mostrarDialogoRecargaTarjeta(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Recargar con tarjeta'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Para recargar con tarjeta, por favor ingrese los siguientes detalles:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: InputDecoration(labelText: 'Nombre'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Apellido'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Número de tarjeta'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Valor a recargar'),
                keyboardType: TextInputType.number,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancelar'),
            ),
            ElevatedButton(
              onPressed: () {
                // Aquí podrías procesar la recarga con tarjeta
                // Por ahora, solo cerramos el diálogo
                Navigator.of(context).pop();
              },
              child: Text('Recargar'),
            ),
          ],
        );
      },
    );
  }

  void _generarNumeroAleatorio(BuildContext context) {
    Random random = Random();
    int numeroAleatorio = random.nextInt(90000) + 10000;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Recarga en efectivo'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Diríjase a la sucursal más cercana y proporcione el siguiente código para realizar la recarga en efectivo:',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 10),
              Text(
                '$numeroAleatorio',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Aceptar'),
            ),
          ],
        );
      },
    );
  }
}
