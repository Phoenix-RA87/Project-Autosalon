CREATE TABLE AVTO(

     KodTovara          INTEGER           NOT NULL,

     Marka              CHAR(30),

     Model              CHAR(30),

     DataPostav         DATE,

     N_Sertif           INTEGER,

     BazCena            NUMERIC(10, 2),

     Moshnost           INTEGER,           

     N_Post             INTEGER             NOT NULL,

     RashodTopliva       INTEGER,

     TipKorobki         CHAR(30),
   
     Proizvod           CHAR(50),
     
     Obem               NUMERIC(10, 2),

    CONSTRAINT PK2 PRIMARY KEY ( KodTovara )

)

;
