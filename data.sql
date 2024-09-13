
/*Data for the table `libros` */

insert  into `libros`(`titulo`,`autor`,`genero`,`editorial`,`isbn`,`sinopsis`) values ('el gato','rodolfo','novela','el raton',123456784,'ejriejrie'),('rayuela','julio cortazar','novela','sudamericana',123456787,'ell nsnsosnoss'),('el sapo','pepe','infantil','luna',123456789,'habia un sapo'),('vivir para contarla','gabriel garcia marquez','autobiografia','sudamericana',950072298,'vida de garcia marquez'),('encuentor','gabriel rolon','autoayuda','planeta',978950492,'allaala'),('chocolate','jimena monteverde','recetas','laaaa',1234567845,'recetas de todo tipo de chocolate'),('martin fierro','jose hernandez','poema épico','Ediciones Colihue ',2147483647,'trata de un gaucho'),('ciega a citas','lucia gonzales','autoayuda','aguilar',97898711185,'lalalallalalala');


/*Data for the table `personas` */

insert  into `personas`(`nombre`,`apellido`,`dni`,`usuario`,`password`,`telefono`) values ('feder','alvarez',56555434,'federc88','defede',5467777),('luna','sol',11111111,'lunasol','nube',989876525),('Monica','Galindo',33846789,'monica','galindo',4455689),('nazareno','defede',12345678,'nazo','denazo',3402499684),('Pepe','Luis',33846883,'pepelui','hola',9887760);


/*Data for the table `reservas` */

insert  into `reservas`(`nroreserva`,`usuario`,`isbn`,`fecha_desde`,`fecha_hasta`) values (8,'pepelui',123456787,'2013-05-28','2013-06-12'),(9,'pepelui',2147483647,'2013-05-29','2013-06-13'),(11,'pepelui',123456789,'2013-05-29','2013-06-13'),(28,'pepelui',1234567845,'2013-06-05','2013-06-20'),(29,'pepelui',123456784,'2013-06-05','2013-06-20'),(30,'pepelui',950072298,'2013-06-09','2013-06-24'),(31,'lunasol',97898711185,'2013-06-12','2013-06-27'),(36,'federc88',123456784,'2013-08-28','2013-09-12'),(37,'federc88',978950492,'2013-08-28','2013-09-12'),(38,'federc88',2147483647,'2013-08-28','2013-09-12'),(39,'monica',123456789,'2013-08-28','2013-09-12');
