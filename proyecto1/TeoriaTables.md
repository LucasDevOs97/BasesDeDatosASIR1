# Tablas

## Relaciones De Tablas

### Relaciones 1:N

Para relaciones 1:N siempre usaremos la PK de la tabla con cardinalidad 1 y la proyectaremos en la tabla de cardinalidad N.   
Esa PK será la FK en la otra tabla.

Para eliminar la tabla de la que procede la FK, primero habría que hacer un DROP de la tabla de la FK que referencia a la PK.   
   
> ON DELETE y ON UPDATE no es para estructuras, es para datos.