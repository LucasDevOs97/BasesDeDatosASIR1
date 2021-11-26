/*1. Queremos diseñar una base de datos por encargo de la FOFA. A la FOFA le interesa 
guardar información acerca de las distintas federaciones de cada país. Estas federaciones, serán
las encargadas de organizar las distintas ligas, las cuales, tendrán distintas divisiones de los 
diferentes campeonatos nacionales.
Habrá torneos intercontinentales que no organizarán las federaciones nacionales, de la organización
de estos torneos se encargarán otras federaciones organizadas por continentes.
Las distintas divisiones contendrán varios equipos, como mínimo, 5 equipos. Estos equipos, jugarán
como locales en un estadio, pudiendo ser más de un equipo local en un mismo estadio (por ejemplo,
Milán e Inter de Milán). 
Es conocido por todos que cada equipo de fútbol tiene un único grupo de ultras, de los que también
interesará guardar infomación.

De las federaciones interesará guardar:
- nombre NN.
- pais NN.
- ligas (numero de ligas).

De las divisiones interesará guardar:
- nombre NN.
- numEquipos NN.

De las ligas interesará guardar:
- nombre NN
- pais NN

De los torneos internacionales interesará guardar:
- nombre NN.
- numEquipos.
- premio.

De los estadios nos interesará guardar: 
- nombre NN.
- patrocinador.
- olimpico ("si" o "no")

De los ultras:

- nombreBanda NN.
- violencia ("baja", "media", "alta").

De los equipos:

- nombre NN
- division NN
- presupuesto
- grupoUltra NN
- estadio NN*/

/*1. Crear MER.*/
/*2. Crear la BBDD que se llame futbolInternacional.*/
/*3. Crear las estructuras que creas convenientes para almacenar toda la información.*/
/*4. Inserta la siguiente información:

federaciones:
Federacion española ESPAÑA 3
The Football Association INGLATERRA 2
Federazione Italiana Giuoco Calcio ITALIA 2
UEFA
CONMEBOL*/

/*divisiones:
primera 20 -> relacionada con liga BBVA -> federacion española
segunda 22 -> liga Santader -> federacion española
segundaB 64 -> liga Federación -> federacion española
premier 20 -> premier -> The Football Association
first 22 -> EFL Championship -> The Football Association
serieA 20 -> Serie A TIM -> Federazione Italiana Giuoco Calcio
serieB 22 -> Serie B TIM -> Federazione Italiana Giuoco Calcio*/

/*ligas: 
liga BBVA
liga Santader
liga Federación
premier
EFL Championship
Serie A TIM
Serie B TIM*/

/*torneos:
UEFA ChampionsLeague 32  100 000 000.00-> UEFA
Europa League 64  25 000 000.00-> UEFA
Libertadores 32 25 000 000 00-> CONMEBOL*/

/*estadios:
Riazor ABANCA "NO"
Camp Nou RAKUTEN "NO"
Wembley NULL "SI"
San Siro NULL "NO"
Dean Court NULL "NO"*/

/*grupoUltra:
Riazor Blues "MEDIA"
Boixos Nois "ALTA"
Yid Army "ALTA"
Curva Sud "ALTA"
Curva Nod "ALTA"
Hooligans "ALTA"*/

/*Equipos:
- Deportivo de La Coruña segundaB 100 riazor blues riazor
- Barcelona primera 100 000 000.00 boixos nois camp nou
- Milán FC serieA 50 000 000.00 curva sud san siro
- Inter de Milán serieA 55 000 000.00 curva nod san siro
- Tottenham premier 500 000 000.00 yid army wembley
- Bournemouth first 50 000 000.00 hooligans dean court*/

/*5. Establece las relaciones entre las tablas creando las claves primarias y claves foráneas que creáis convenientes.*/
/*6. Muestra la información de los equipos con presupuesto entre 50 millones y 100 millones.*/
/*7. Muestra la información de los equipos con presupuesto entre 50 millones y 100 millones cuyo
nombre tenga como segunda letra "a" y penúltima letra "n".*//*
8.  Muestra la información de los equipos con presupuesto entre 50 millones y 100 millones cuyo
nombre tenga como segunda letra "a" y penúltima letra "n", o que simplemente se llame Deportivo de La Coruña.*/
/*9. Muestra la información de los estadios que NO tengan patrocinador.
/*10. Muestra la información de los estadios que tengan patrocinador.*/
/*11. Muestra la información de las ligas que tengan 20 o 22 equipos.*/
/*12. Muestra la información de los grupos ultras cuyo nombre NO contenga la palabra "CURVA".*/
/*13. Muestra la información de los grupos ultras cuyo nivel de violencia sea "BAJA".*/