DROP TABLE IF EXISTS Musicians ;
DROP TABLE IF EXISTS Instrument;
DROP TABLE IF EXISTS Plays;
DROP TABLE IF EXISTS Songs;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Perform;
DROP TABLE IF EXISTS Lives;
DROP TABLE IF EXISTS Place;
DROP TABLE IF EXISTS Telephone;


CREATE TABLE Musicians ( ssn INTEGER NOT NULL,
  name Char(10),PRIMARY KEY(ssn)
 );
--
 CREATE TABLE Instrument ( instrid INTEGER NOT NULL,
   dname Char(10), key Char(10),
   PRIMARY KEY(instrid)
  );

CREATE TABLE Plays(ssn INTEGER NOT NULL,
  instrid INTEGER NOT NULL,
  PRIMARY KEY (ssn,instrid),
  FOREIGN KEY (ssn) REFERENCES Musicians(ssn),
  FOREIGN KEY (instrid) REFERENCES Instrument(instrid)
  );



CREATE TABLE Songs( songid INTEGER NOT NULL,
    author Char(10), title Char(10),
    albumid INTEGER NOT NULL, --FOREIGN KEY
    PRIMARY KEY(songid),
    --Album -- <Appears> <== Songs
    FOREIGN KEY(albumid) REFERENCES Album(albumid)
   );

CREATE TABLE Perform(ssn INTEGER NOT NULL,
  songid INTEGER NOT NULL,
  PRIMARY KEY (ssn,songid),
  FOREIGN KEY (ssn) REFERENCES Musicians(ssn),
  FOREIGN KEY (songid) REFERENCES Songs(songid)
  );

CREATE TABLE Album( albumid INTEGER NOT NULL,
  speed INTEGER, title Char(10),copyrightDate Char(10),
  PRIMARY KEY(albumid),
  ssn INTEGER,   --FOREIGN KEY
  --Musicians == <Producer> <== Album
  FOREIGN KEY(ssn) REFERENCES Musicians(ssn)
 );

-- CREATE TABLE Lives(
--  ssn INTEGER NOT NULL,
--  phone_num INTEGER,
--  address INTEGER,
--
--  PRIMARY KEY (ssn,phone_num,address ),
--  FOREIGN KEY (ssn) REFERENCES Musicians(ssn),
--  FOREIGN KEY (phone_num) REFERENCES Telephone(phone_num),
--  FOREIGN KEY (address) REFERENCES Place (address)
--  );
CREATE TABLE Place ( address INTEGER NOT NULL,
  PRIMARY KEY(address)
 );
CREATE TABLE Telephone ( phone_num INTEGER NOT NULL,
	address INTEGER,
  --Place == <Home> <== Telephone
   FOREIGN KEY(address) REFERENCES Place(address) ON DELETE CASCADE
);
