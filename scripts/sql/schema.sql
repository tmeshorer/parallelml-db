delete from studies;
select * from studies;

select * from s_columns;
delete from s_columns;

DROP TABLE IF EXISTS clusters;

CREATE TABLE clusters (
    id serial primary key,
    cid integer,
    name VARCHAR(50),
    ip VARCHAR(50),
    port integer,
    created timestamp without time zone,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    deleted timestamp without time zone
);

ALTER TABLE clusters OWNER TO postgres;

commit;

DROP TABLE IF EXISTS nodes;

CREATE TABLE nodes (
    id serial primary key,
    cid integer,
    cluster_id integer ,
    name VARCHAR(50),
    ip VARCHAR(50),
    port integer,
    created timestamp without time zone,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    deleted timestamp without time zone


);

DROP TABLE IF EXISTS volumes;

CREATE TABLE volumes (
    id serial primary key,
    cid integer,
    cluster_id integer ,
    name VARCHAR(50),
    ip VARCHAR(50),
    port integer,
    size NUMERIC,
    protocol VARCHAR(150),
    tid integer,
    created timestamp without time zone,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    deleted timestamp without time zone
);

ALTER TABLE volumes OWNER TO postgres;

commit;

//---

DROP TABLE IF EXISTS datasets;

CREATE TABLE datasets (
        id serial primary key,
        cid integer,
        name VARCHAR(50),
        path VARCHAR(150),
        created timestamp without time zone,
        updated timestamp without time zone DEFAULT now() NOT NULL,
        deleted timestamp without time zone
);

ALTER TABLE datasets OWNER TO postgres;

commit;

DROP TABLE IF EXISTS d_columns;


CREATE TABLE d_columns (
        id serial primary key,
        data_set_id integer,
        name VARCHAR(100),
        dt VARCHAR(15),
        ignore boolean,
        created timestamp without time zone,
        updated timestamp without time zone DEFAULT now() NOT NULL,
        deleted timestamp without time zone

);

ALTER TABLE d_columns OWNER TO postgres;

commit;

DROP TABLE IF EXISTS customers;


CREATE TABLE customers (
    id serial primary key,
    user_name VARCHAR(50),
    password VARCHAR(50),
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    phone VARCHAR(50),
    address VARCHAR(255),
    email VARCHAR(150),
    company VARCHAR(150),
    admin boolean,
    active boolean,
    gid integer,
    tid integer,
    last_login  timestamp without time zone,
    last_activity timestamp without time zone,
    created timestamp without time zone,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    deleted timestamp without time zone
);

ALTER TABLE customers OWNER TO postgres;

commit;


DROP TABLE IF EXISTS pipelines;

CREATE TABLE pipelines (
      id serial primary key,
      study_id integer,
      uuid VARCHAR(100),
      study_uuid VARCHAR(100),
      status integer,
      dag TEXT,
      f1 NUMERIC(8,3),
      accuracy NUMERIC(8,3),
      prec NUMERIC(8,3),
      recall NUMERIC(8,3),
      auc NUMERIC(8,3),
      fp  INTEGER,
      fn  INTEGER,
      tn  INTEGER,
      tp  INTEGER,
      configuration json,
      started Timestamp without time zone,
      ended Timestamp without time zone,
      created timestamp without time zone,
      updated timestamp without time zone DEFAULT now() NOT NULL,
      deleted timestamp without time zone
);

ALTER TABLE pipelines OWNER TO postgres;
commit;

--- stage
DROP TABLE IF EXISTS stages;

CREATE TABLE stages (
   id serial primary key,
   pipeline_id integer,
   uuid VARCHAR(100),
   next VARCHAR(100),
   configuration TEXT,
   started Timestamp without time zone,
   ended   Timestamp without time zone

);

ALTER TABLE stages OWNER TO postgres;
commit;



DROP TABLE IF EXISTS studies;

CREATE TABLE studies (
    id serial primary key,
    cid integer,
    uuid VARCHAR(50),
    name VARCHAR(255),
    dataset_id integer,
    state  integer,
    eval_len integer,
    pipelines_planned integer,
    pipelines_done integer,
    objective VARCHAR(100),
    estimator_type VARCHAR(20),
    workers integer,
    pct_train  FLOAT,
    pct_tune   FLOAT,
    pct_test   FLOAT,
    use_cv BOOLEAN,
    folds integer,
    started timestamp without time zone,
    ended timestamp without time zone,
    created timestamp without time zone,
    updated timestamp without time zone DEFAULT now() NOT NULL,
    deleted timestamp without time zone
);

ALTER TABLE studies OWNER TO postgres;

commit;

DROP TABLE IF EXISTS s_columns;

CREATE TABLE s_columns (
        id serial primary key,
        study_id integer,
        d_column_id integer,
        name  VARCHAR(100),
        dt VARCHAR(15),
        role integer,
        created timestamp without time zone,
        updated timestamp without time zone DEFAULT now() NOT NULL,
        deleted timestamp without time zone

);

ALTER TABLE s_columns OWNER TO postgres;

commit

