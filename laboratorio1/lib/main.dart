import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ListaAlumnosScreen(), 
    );
  }
}

//Laboratorio empieza aqui
class Alumno {
  final String nombre;
  final String carnet;
  bool estaPresente;

  Alumno({
    required this.nombre,
    required this.carnet,
    required this.estaPresente,
  });
}

class ListaAlumnosScreen extends StatefulWidget {
  const ListaAlumnosScreen({super.key});

  @override
  State<ListaAlumnosScreen> createState() => _ListaAlumnosScreenState();
}

class _ListaAlumnosScreenState extends State<ListaAlumnosScreen> {
  List<Alumno> alumnos = [
    Alumno(nombre: 'Juan Perez', carnet: '20210001', estaPresente: false),
    Alumno(nombre: 'Maria Lopez', carnet: '20210002', estaPresente: false),
    Alumno(nombre: 'Carlos Ramirez', carnet: '20210003', estaPresente: false),
    Alumno(nombre: 'Alvaro Días', carnet: '20212003', estaPresente: false),
    Alumno(nombre: 'Maria la del barrio',carnet: '20240052', estaPresente: false),
    Alumno(nombre: 'Fin el humando', carnet: '20240003', estaPresente: false),
    Alumno(nombre: 'Jake el Perro', carnet: '20240201', estaPresente: false),
    Alumno(nombre: 'Felix Ave', carnet: '20220002', estaPresente: false),
    Alumno(nombre: 'Antonio Molina', carnet: '20210034', estaPresente: false),
    Alumno(nombre: 'Mision Posible', carnet: '20200102', estaPresente: false),
    Alumno(nombre: 'Andre Chavez', carnet: '20190003', estaPresente: false),
    Alumno(nombre: 'Paco PocaSangre', carnet: '20211201', estaPresente: false),
    Alumno(nombre: 'Maria Antonieta', carnet: '20222202', estaPresente: false),
    Alumno(nombre: 'Pablo Escobar', carnet: '20211903', estaPresente: false),
    Alumno(nombre: 'Escubi Duh', carnet: '20251923', estaPresente: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Alumnos')),
      body: ListView.builder(
        itemCount: alumnos.length,
        itemBuilder: (context, index) {
          final alumno = alumnos[index];
          return ListTile(
            title: Text(alumno.nombre),
            subtitle: Text('Carnet: ${alumno.carnet}'),

            trailing: Checkbox(
              value: alumno.estaPresente,
              onChanged: (value) {
                setState(() {
                  alumno.estaPresente = value ?? false;
                });
              },
            ),
          );
        },
        padding: const EdgeInsets.only(bottom: 78),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 300,
            child: FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  for (final alumno in alumnos) {
                    if (!alumno.estaPresente) {
                      alumno.estaPresente = true;
                    }
                  }
                });
              },
              icon: const Icon(Icons.check),
              label: const Text('Marcar a todo el grupo como presente'),
            ),
          ),

          const SizedBox(height: 10),
          SizedBox(
            width: 300,
            child: FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  for (final alumno in alumnos) {
                      alumno.estaPresente = false;
                  }
                });
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Restablecer todos los registros'),
            ),
          ),
        ],
      ),
    );
  }
}
