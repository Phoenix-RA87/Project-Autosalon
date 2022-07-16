CREATE TABLE  Reklamac (

     N_Reklam     INTEGER           NOT NULL,

     DataReklam   DATE,

     N_Dog        INTEGER           NOT NULL,

     Neisprav     CHAR(80),

     Rezult       CHAR(80),

     SummaUbit    NUMERIC(10, 2),

    CONSTRAINT PK5 PRIMARY KEY ( N_Reklam )

)

;