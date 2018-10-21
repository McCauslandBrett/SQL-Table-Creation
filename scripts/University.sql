CREATE TABLE Professor ( ssn INTEGER NOT NULL,
  prof_name text,
  age INTEGER,
  pno INTEGER, -- FOREIGN
  rank INTEGER,
  specialty text,
  PRIMARY KEY(ssn),
  --Professor == <Manage> <==Project
  FOREIGN KEY(pno) REFERENCES Project(pno)
 );

CREATE TABLE Project ( pno INTEGER NOT NULL,
  sponsor text ,
  start_date text,
  end_date text,
  budget float,
  ssn INTEGER ,--FOREIGN
  PRIMARY KEY(pno),
  -- Professor== <Manage> <==Project
  FOREIGN KEY(ssn) REFERENCES Professor(ssn),
  ON DELETE NO ACTION
 );


CREATE TABLE Work_in(ssn INTEGER NOT NULL,
  pno INTEGER NOT NULL,
  PRIMARY KEY (ssn,pno),
  FOREIGN KEY (ssn) REFERENCES Professor(ssn),
  FOREIGN KEY (pno) REFERENCES Project(pno);




  CREATE TABLE Dept ( dno INTEGER NOT NULL,
    dname text,
    office text,
    PRIMARY KEY(dno),
    ssn INTEGER,
    FOREIGN KEY(ssn) REFERENCES Professor(ssn) -- Runs Relation
    ON DELETE NO ACTION
   );

  CREATE TABLE Graduate ( ssn INTEGER NOT NULL,
    name text,
    age INTEGER,
    deg_pg text,
    PRIMARY KEY (ssn),

    FOREIGN KEY(dno) REFERENCES Dept(dno)--major Relation
    ON DELETE NO ACTION

    FOREIGN KEY(Advisor)REFERENCES Graduate(ssn)-- Advisor Relation
    ON DELETE NO ACTION);
   );
   CREATE TABLE Work_dept(time_pc text,
     ssn numeric NOT NULL,
     dno numeric NOT NULL,
     PRIMARY KEY (ssn,dno),
     FOREIGN KEY (ssn) REFERENCES Professor(ssn),
     FOREIGN KEY (dno) REFERENCES Project(dno);

  CREATE TABLE Work_proj(since text,
    ssn numeric NOT NULL,
    pno numeric NOT NULL,
    PRIMARY KEY (ssn,pno),
    --
    FOREIGN KEY (ssn) REFERENCES Graduate(ssn),
    FOREIGN KEY (pno) REFERENCES Project(pno);
    --
    FOREIGN KEY (ssn) REFERENCES Professor(ssn),
