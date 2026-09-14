import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de Asistencia',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const ListaAlumnosScreen(),
    );
  }
}

// Modelo de datos
class Alumno {
  final String nombre;
  final String carnet;
  final bool estadoInicial;
  bool estaPresente;

  Alumno({
    required this.nombre,
    required this.carnet,
    required this.estadoInicial,
  }) : estaPresente = estadoInicial;
}

// Datos de los alumnos
final List<Alumno> alumnos = [
  Alumno(nombre: 'Juan Perez', carnet: '20210001', estadoInicial: false),
  Alumno(nombre: 'Maria Lopez', carnet: '20210002', estadoInicial: false),
  Alumno(nombre: 'Carlos Ramirez', carnet: '20210003', estadoInicial: false),
  Alumno(nombre: 'Alvaro Días', carnet: '20212003', estadoInicial: false),
  Alumno(nombre: 'Maria la del barrio', carnet: '20240052', estadoInicial: false),
  Alumno(nombre: 'Ronald Weasley', carnet: '20240003', estadoInicial: false),
  Alumno(nombre: 'Jake el Perro', carnet: '20240201', estadoInicial: false),
  Alumno(nombre: 'Felix Ave', carnet: '20220002', estadoInicial: false),
  Alumno(nombre: 'Antonio Molina', carnet: '20210034', estadoInicial: false),
  Alumno(nombre: 'Mision Posible', carnet: '20200102', estadoInicial: false),
  Alumno(nombre: 'Andre Chavez', carnet: '20190003', estadoInicial: false),
  Alumno(nombre: 'Paco PocaSangre', carnet: '20211201', estadoInicial: false),
  Alumno(nombre: 'Maria Antonieta', carnet: '20222202', estadoInicial: false),
  Alumno(nombre: 'Pablo Escobar', carnet: '20211903', estadoInicial: false),
  Alumno(nombre: 'Harry Potter', carnet: '20251923', estadoInicial: false),
];

// Widget independiente para cada alumno
class AlumnoTile extends StatelessWidget {
  final Alumno alumno;
  final ValueChanged<bool?> onChanged;

  const AlumnoTile({super.key, required this.alumno, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(alumno.nombre),
      subtitle: Text('Carnet: ${alumno.carnet}'),
      trailing: Checkbox(value: alumno.estaPresente, onChanged: onChanged),
    );
  }
}

// Pantalla principal
class ListaAlumnosScreen extends StatefulWidget {
  const ListaAlumnosScreen({super.key});
  @override
  State<ListaAlumnosScreen> createState() => _ListaAlumnosScreenState();
}

class _ListaAlumnosScreenState extends State<ListaAlumnosScreen> {
  @override
  Widget build(BuildContext context) {
    final int presentes = alumnos.where((alumno) => alumno.estaPresente).length;
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Alumnos')),
      body: Column(
        children: [
          //Encabezado
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 12.0,
            ),
            color: Theme.of(context).colorScheme.primaryContainer,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Flexible(
                  child: Text(
                    'Nosé.js',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  'Presentes: $presentes / ${alumnos.length}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Lista de alumnos
          Expanded(
            child: ListView.builder(
              itemCount: alumnos.length,
              itemBuilder: (context, index) {
                final alumno = alumnos[index];
                return AlumnoTile(
                  alumno: alumno,
                  onChanged: (value) {
                    setState(() {
                      alumno.estaPresente = value ?? false;
                    });
                  },
                );
              },
              padding: const EdgeInsets.only(bottom: 78),
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  for (final alumno in alumnos) {
                    if (!alumno.estaPresente) {
                      alumno.estaPresente = true;
                    }
                  }
                });
              },
              icon: const Icon(Icons.check, size: 18),
              label: const Text('Marcar a todos'),
            ),

          const SizedBox(height: 10),

            FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  for (final alumno in alumnos) {
                    alumno.estaPresente = alumno.estadoInicial;
                  }
                });
              },
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Restablecer'),
            ),
        ],
      ),
    );
  }
}
