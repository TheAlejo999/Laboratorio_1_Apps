# Defensa técnica — [Nosé.js]

## 1- Estado y ubicación

El estado vive en _ListaAlumnosScreenState, porque ahi es donde esta el setState que controla todos el listado de  alumnos. Además si ese esatdo viviera dentro de cada AlumnoTile en vez de en la pantalla, cada checkbox cambiaria por su cuenta, pero la pantalla nunca se enteraria del cambio (como si fuera una caja de fusibles, solo sabe que existe, deque este encendido o no el swich no lo sabe), porque el setState solo avisa a la clase donde se llama, no a las demás partes de la app (como un amigo que solo habla con otro amigo y no con los demás del grupo).

## 2- Reconstrucción de widgets

Se reconstruye la pantalla completa, incluyendo todos los AlumnoTile de la lista, cada vez que se marca un checkbox no solo el del alumno que cambió. Para reducir el gasto de recursos que esto implica, usé const en los elementos que nunca cambian (como los íconos de los botones), para que esos no se vuelvan a crear en cada reconstrucción. Es como si cada vez que vendes un producto se reimprime todo el catálogo, pero el logo de la tienda (que no cambia) no se vuelve a imprimir.

## 3- Extracción de componente

AlumnoTile es una clase que extrae para representar la fila de un alumno. Se extrajo porque esa misma fila se repite en todo el listado por alumno y asi solo se escribe el diseño una vez y se reutiliza con datos distintos en cada caso, en vez de repetir el mismo bloque de código  para alumno. Además al ser una clase independiente, no puede acceder directamente a la lista de alumnos ni a nada del estado de pantalla, para eso se necesita el constructor para recibir todo, lo cual obliga a mantener separados los datos y la presentación.

Si en vez de una clase se hubiera utilizado un método ese metodo sí se podria acceder dirtectamente a la lista de alumnos y a otras variables de la pantalla sin que se las pasara explisitamente, porque estaria "dentro" de esa misma clase. Esto romperia la separación entre datos y presentación, ya que todo quedaria mezclado en un mismo lugar (como cuando se come entra diferente comida y todo se mezcla en el estomago)

## Flutter analyze

C:\Users\rober\OneDrive\Desktop\web\guia 3\devsecops-pipeline-lab3\Laboratorio_1_Apps\laboratorio1>flutter analyze
Resolving dependencies...
Downloading packages...
  material_color_utilities 0.13.0 (0.13.1 available)
  meta 1.18.3 (1.19.0 available)
  test_api 0.7.12 (0.7.14 available)
  vector_math 2.4.0 (2.4.2 available)
Got dependencies!
4 packages have newer versions incompatible with dependency constraints.
Try `flutter pub outdated` for more information.
Analyzing laboratorio1...
No issues found! (ran in 1.7s)

## Registro de consultas a IA

Se consultó a una IA (Claude) durante la sesión, únicamente sobre 
explicación de comportamiento de conceptos ya presentes en el código 
(no se solicitó código, estructura ni se pegó el enunciado):

1. Por qué el estado debe vivir en _ListaAlumnosScreenState y no dentro 
   de AlumnoTile, y qué pasaría con la pantalla si el checkbox manejara 
   su propio estado local en vez de avisarle a la pantalla.
2. Qué widgets se reconstruyen cuando se llama setState, y el rol de 
   const para evitar reconstrucciones innecesarias.
3. Diferencia entre extraer un componente como clase (AlumnoTile) versus 
   como método, y por qué un método rompería la separación de datos y 
   presentación.
4. Revisión de si las respuestas ya redactadas por mí sonaban 
   suficientemente técnicas o vagas.