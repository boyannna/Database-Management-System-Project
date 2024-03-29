SET SCHEMA FN72047;

CREATE TABLE VETERINARY_CLINIC
(
    NAME_VC    VARCHAR(20) NOT NULL PRIMARY KEY,
    ADDRESS_VC VARCHAR(100)
);

CREATE TABLE STAFF
(
    NAME_S                 VARCHAR(50) NOT NULL PRIMARY KEY,
    PHONE_S                CHAR(11)    NOT NULL,
    POSITION_S             VARCHAR(30),
    SALARY                 DECIMAL(6, 2),
    NAME_VETERINARY_CLINIC VARCHAR(20) REFERENCES VETERINARY_CLINIC (NAME_VC)
);

CREATE TABLE OWNER
(
    PHONE_O CHAR(10)    NOT NULL PRIMARY KEY,
    NAME_O  VARCHAR(50) NOT NULL,
    REGION  VARCHAR(20),
    EMAIL   VARCHAR(20) CHECK (EMAIL LIKE '%_@_%.__%')
);

CREATE TABLE PATIENT
(
    NAME_P                 VARCHAR(50) NOT NULL PRIMARY KEY,
    PHONE_OWNER            CHAR(11)    NOT NULL REFERENCES OWNER (PHONE_O),
    BREED                  VARCHAR(20),
    GENDER                 CHAR(1)     NOT NULL CHECK (GENDER IN ('M', 'F')),
    PRESENCE_OF_CASTRATION VARCHAR(3)  NOT NULL CHECK (PRESENCE_OF_CASTRATION IN ('YES', 'NO')),
    AGE_P                  INT         NOT NULL,
    WEIGHT                 DECIMAL(3, 1),
    No_MICROCHIP           CHAR(10),
    NAME_VETERINARY_CLINIC CHAR(20) REFERENCES VETERINARY_CLINIC (NAME_VC)
);

CREATE TABLE MANIPULATIONS
(
    NAME_M        VARCHAR(20) NOT NULL PRIMARY KEY,
    PRICE         DECIMAL(3, 0),
    TYPE_M        VARCHAR(20),
    DOCUMENTATION VARCHAR(200),
    NAME_PATIENT  VARCHAR(50) REFERENCES PATIENT (NAME_P),
    PHONE_OWNER   CHAR(11) REFERENCES OWNER (PHONE_O)
);