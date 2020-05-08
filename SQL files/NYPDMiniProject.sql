--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      Model-NYPDDIMMODEL.DM1
--
-- Date Created : Thursday, April 02, 2020 23:26:34
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: DIM_AGE_GROUPS 
--

CREATE TABLE DIM_AGE_GROUPS(
    AGE_SK          INT          NOT NULL,
    AGE_GROUP       LONGTEXT,
    DI_PID          LONGTEXT,
    DI_CREATE_DT    TIMESTAMP,
    PRIMARY KEY (AGE_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_BOROUGH 
--

CREATE TABLE DIM_BOROUGH(
    BORO_SK             INT               NOT NULL,
    BORO_CODE           LONGTEXT,
    BOROUGH             LONGTEXT,
    PATROL_BORO_CODE    DECIMAL(10, 0),
    PATROL_BORO         LONGTEXT,
    DI_PID              LONGTEXT,
    DI_CREATE_DT        TIMESTAMP,
    PRIMARY KEY (BORO_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_KY_CODE 
--

CREATE TABLE DIM_KY_CODE(
    KY_SK           INT          NOT NULL,
    KY_CD           LONGTEXT,
    OFNS_DESC       LONGTEXT,
    DI_PID          LONGTEXT,
    DI_CREATE_DT    TIMESTAMP,
    PRIMARY KEY (KY_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_LAW 
--

CREATE TABLE DIM_LAW(
    LAW_SK                INT          NOT NULL,
    LAW_DESC              LONGTEXT,
    LAW_SECTION_NUMBER    LONGTEXT,
    DI_PID                LONGTEXT     NOT NULL,
    DI_CREATE_DT          TIMESTAMP,
    PRIMARY KEY (LAW_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_PD_CODE 
--

CREATE TABLE DIM_PD_CODE(
    PD_SK           INT          NOT NULL,
    PD_CD           LONGTEXT,
    PD_DESC         LONGTEXT,
    DI_PID          LONGTEXT,
    DI_CREATE_DT    TIMESTAMP,
    PRIMARY KEY (PD_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_RACE 
--

CREATE TABLE DIM_RACE(
    RACE_SK           INT          NOT NULL,
    PERP_RACE_CODE    LONGTEXT,
    PERP_RACE         LONGTEXT,
    VIC_RACE_CODE     LONGTEXT,
    VIC_RACE          LONGTEXT,
    DI_PID            LONGTEXT,
    DI_CREATE_DT      TIMESTAMP,
    PRIMARY KEY (RACE_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: DIM_TRANSIT 
--

CREATE TABLE DIM_TRANSIT(
    STATION_SK          CHAR(10)     NOT NULL,
    STATION_NAME        LONGTEXT,
    TRANSIT_DISTRICT    LONGTEXT,
    DI_PID              TEXT         NOT NULL,
    DI_CREATE_DT        TIMESTAMP,
    PRIMARY KEY (STATION_SK)
)ENGINE=MYISAM
;



-- 
-- TABLE: FACT_COMPLAINT 
--

CREATE TABLE FACT_COMPLAINT(
    CMPLNT_NUM           INT          NOT NULL,
    CMPLNT_FR_DT         LONGTEXT,
    CMPLNT_FR_TM         LONGTEXT,
    CMPLNT_TO_DT         LONGTEXT,
    CMPLNT_TO_TM         LONGTEXT,
    ADDR_PCT_CD          LONGTEXT,
    CRM_ATPT_CPTD_CD     LONGTEXT,
    HADDEVELOPT          LONGTEXT,
    HOUSING_SPA          LONGTEXT,
    JURISDICTION_CODE    LONGTEXT,
    JURIS_DESC           LONGTEXT,
    LA_CAT_CD            LONGTEXT,
    LOC_OF_OCCUR_DESC    LONGTEXT,
    PARKS_NM             LONGTEXT,
    PREM_TYP_DESC        LONGTEXT,
    DI_PID               LONGTEXT,
    DI_CREATE_DT         TIMESTAMP,
    RACE_SK              INT,
    AGE_SK               INT,
    KY_SK                INT,
    PD_SK                INT,
    STATION_SK           CHAR(10),
    BORO_SK              INT,
    PRIMARY KEY (CMPLNT_NUM)
)ENGINE=MYISAM
;



-- 
-- TABLE: FACT_INCIDENT 
--

CREATE TABLE FACT_INCIDENT(
    INCIDENT_SK_KEY            INT          NOT NULL,
    OCCUR_DATE                 DATE,
    OCCUR_TIME                 TIME,
    PRECINCT                   LONGTEXT,
    JURISDICTION_CODE          INT,
    LOCATION_DESC              LONGTEXT,
    STATISTICAL_MURDER_FLAG    LONGTEXT,
    PREP_SEX                   LONGTEXT,
    VIC_SEX                    LONGTEXT,
    X_COORDINATE               INT,
    Y_COORDINATE_CD            INT,
    LATTITUDE                  LONGTEXT,
    LONGTITUDE                 LONGTEXT,
    DI_PID                     LONGTEXT,
    DI_CREATE_DT               TIMESTAMP,
    RACE_SK                    INT,
    AGE_SK                     INT,
    PRIMARY KEY (INCIDENT_SK_KEY)
)ENGINE=MYISAM
;



-- 
-- TABLE: FACT_SUMMONS 
--

CREATE TABLE FACT_SUMMONS(
    SUMMONS_KEY              INT          NOT NULL,
    SUMMONS_DATE             DATETIME,
    SUMMONS_CATEGORY_TYPE    LONGTEXT,
    SEX                      LONGTEXT,
    JURISDICTION_CODE        LONGTEXT,
    PRECINCT_OF_OCCUR        LONGTEXT,
    X_COORDINATE_CD          INT,
    Y_COORDINATE_CD          INT,
    LATTITUDE                LONGTEXT,
    LONGITUDE                LONGTEXT,
    DI_PID                   LONGTEXT,
    DI_CREATE_DT             TIMESTAMP,
    LAW_SK                   INT,
    BORO_SK                  INT,
    RACE_SK                  INT,
    AGE_SK                   INT,
    PRIMARY KEY (SUMMONS_KEY)
)ENGINE=MYISAM
;



-- 
-- TABLE: FACT_COMPLAINT 
--

ALTER TABLE FACT_COMPLAINT ADD CONSTRAINT RefDIM_RACE1 
    FOREIGN KEY (RACE_SK)
    REFERENCES DIM_RACE(RACE_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE FACT_COMPLAINT ADD CONSTRAINT RefDIM_AGE_GROUPS3 
    FOREIGN KEY (AGE_SK)
    REFERENCES DIM_AGE_GROUPS(AGE_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE FACT_COMPLAINT ADD CONSTRAINT RefDIM_KY_CODE5 
    FOREIGN KEY (KY_SK)
    REFERENCES DIM_KY_CODE(KY_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE FACT_COMPLAINT ADD CONSTRAINT RefDIM_PD_CODE6 
    FOREIGN KEY (PD_SK)
    REFERENCES DIM_PD_CODE(PD_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE FACT_COMPLAINT ADD CONSTRAINT RefDIM_TRANSIT8 
    FOREIGN KEY (STATION_SK)
    REFERENCES DIM_TRANSIT(STATION_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE FACT_COMPLAINT ADD CONSTRAINT RefDIM_BOROUGH9 
    FOREIGN KEY (BORO_SK)
    REFERENCES DIM_BOROUGH(BORO_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: FACT_INCIDENT 
--

ALTER TABLE FACT_INCIDENT ADD CONSTRAINT RefDIM_RACE11 
    FOREIGN KEY (RACE_SK)
    REFERENCES DIM_RACE(RACE_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE FACT_INCIDENT ADD CONSTRAINT RefDIM_AGE_GROUPS12 
    FOREIGN KEY (AGE_SK)
    REFERENCES DIM_AGE_GROUPS(AGE_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


-- 
-- TABLE: FACT_SUMMONS 
--

ALTER TABLE FACT_SUMMONS ADD CONSTRAINT RefDIM_LAW7 
    FOREIGN KEY (LAW_SK)
    REFERENCES DIM_LAW(LAW_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE FACT_SUMMONS ADD CONSTRAINT RefDIM_BOROUGH10 
    FOREIGN KEY (BORO_SK)
    REFERENCES DIM_BOROUGH(BORO_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE FACT_SUMMONS ADD CONSTRAINT RefDIM_RACE13 
    FOREIGN KEY (RACE_SK)
    REFERENCES DIM_RACE(RACE_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;

ALTER TABLE FACT_SUMMONS ADD CONSTRAINT RefDIM_AGE_GROUPS14 
    FOREIGN KEY (AGE_SK)
    REFERENCES DIM_AGE_GROUPS(AGE_SK) ON DELETE RESTRICT ON UPDATE RESTRICT
;


