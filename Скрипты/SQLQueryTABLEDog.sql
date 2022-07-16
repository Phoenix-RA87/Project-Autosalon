CREATE TABLE  Dog (

     N_Dog          INTEGER           NOT NULL,

     FIOPokup       CHAR(30),

     AdresKlienta   CHAR(50),

     Cena           NUMERIC(10, 2),

     DataZakluch    DATE,

     N_Dvig         INTEGER,

     KodTovara      INTEGER           NOT NULL,
   
     N_kuzova        INTEGER,

    CONSTRAINT PK3 PRIMARY KEY ( N_Dog )

)

;   
