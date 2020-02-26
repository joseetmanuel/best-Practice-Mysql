# Mejores prácticas para MYSQL (Best Practice Mysql)

## Introducción
El presente pretende ser una guía / recoratorio de las mejores practicas para MYSQL

### Nomenclatura
* utilizar camelCase 
* nombres en inglés una o dos palabras de preferencia
* nombres en singular
* descriptivos no importa si son largos no mas de 64 caracteres
* para SP, Funciones y Triggers usar postfojo _sp, _fn, y _tg  respectivamente
* para las keys elNombreTablaId

#### Evitar!!
* especios
* subfijos 
* palabras reservads 
* nombre iguales para tablas y campos

### Uso
* Todas las tablas deben de tener un Primary Key (PK) y debe de ser el primer campo de la tabla y debe de ser único e irrepetiblem, de preferencia un entero.
* Tipos de datos en base a la naturaleza de los datos
* Utiliza CHAR(1) en lugar de VARCHAR(1) porque VARCHAR(1) se llevará un byte adicional para almacenar información
* Tipo CHAR para almacenar solo los datos de longitud fija
* Formato AAAA-MM-DD o el formato de fecha ISO que se adapte a su motor de SQL
* Usa LIMIT 1 Cuando sólo quieras una única fila
* Indexa, y utiliza el mismo tipo de columna para los Join
* Usa NOT NULL y default
* Los campos de ESTATUS deben de estar comentados con valores, tratar de usar strings de 10 caracteres e indexados, por ejemplo 'ACTIVO' en luegar de claves
* Procurar tablas de tamaño fijo
* Almacena las direcciones IP como UNSIGNED INT
* El uso de transacciones es obligatorio cuando se inserta, actualiza o se elimina
* Separa toda la lógica de negocio de la base. La base de datos es eso, un lugar en donde se almacenan y se consultan datos.
* Trata de normalizar tu base de datos a una forma normal 5, de no ser posible por lo menos llega a una forma nivel 3

#### Evitar!!
* En lo posible el uso de llaves compuestas 
* En lo posible el uso de Identity
* Uso de “SELECT *” en consultas
* Abusar del order by
* Campos varchar, text y blob o nulos

#### Sugerencia
* Todas las tablas tengan los siguientes campos: Estatus, Fecha Ultima Modificación y Usuario Modificación 
* Para las tablas con identity pensar si debe indexarse decendente por el uso

## Motor
* Si desarrollas una aplicación que lee los datos con más frecuencia que la de escritura, selecciona el motor de almacenamiento MyISAM.
 
* Si desarrollas una aplicación que escribe datos con más frecuencia que la de lectura, elegir el motor de almacenamiento InnoDB.

## Tips

* La opción SQL_SMALL_RESULT, puede usarse con GROUP BY o DISTINCT para indicar que el conjunto de resultados es pequeño. En este caso, MySQL utiliza tablas temporales muy rápidas para almacenar la tabla resultante en lugar de usar ordenación.

* COUNT(*) esta optimizado para devolver un SELECT de manera mucho más rápida, siempre y cuando sea a una tabla y sin usar WHERE.

## Formas
* Primera forma normal: Una tabla está en 1FN si y solo si es "isomorfa a alguna relación", lo que significa, específicamente, que satisface las siguientes cinco condiciones:
  1. No hay orden de arriba-a-abajo en las filas.
  2. No hay orden de izquierda-a-derecha en las columnas.
  3. No hay filas duplicadas.
  4. Cada intersección de fila-y-columna contiene exactamente un valor del dominio aplicable (y nada más).
  5. Todas las columnas son regulares es decir, las filas no tienen componentes como IDs de fila, IDs de objeto, o timestamps ocultos.
* Segunda forma normal: Cada columna de una tabla está relacionada con todas las columnas de la clave primaria y no solo por una combinación de parte de la clave primaria
* Tercera forma normal: Cada columna de una tabla está relacionada directamente con las columnas de la clave primaria, no de forma transitiva a través de otro campo
* Forma normal de Boyce-Codd, BCNF: Una tabla está en BCNF y está en 3FN y todos los campos tienen como deteminante (dependen) la clave primaria.
* Cuarta forma normal: No existen dos o más relaciones independientes en una misma tabla
* Quinta forma normal: 
* Sexta forma normal:
* Forma normal de dominio/clave, DNFN

