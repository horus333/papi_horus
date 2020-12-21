/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     15/12/2020 22:09:04                          */
/*==============================================================*/


drop index CALIFICACION_SERVICIOS_FK;

drop index CLIENTE_CALIFICACION_FK;

drop index CALIFICACION_PK;

drop table CALIFICACION;

drop index CLIENTE_PK;
create table CALIFICACION (
   ID_CALIFICACION      INT4                 not null,
   CEDULA_CLIENTE       INT4                 not null,
   ID_SERVICIO          INT4                 not null,
   NUM_CALIFICACION     INT4                 null,
   DESCRIPCION_CALIFICACION VARCHAR(90)          null,
   constraint PK_CALIFICACION primary key (ID_CALIFICACION)
);


create table CLIENTE (
   CEDULA_CLIENTE       INT4                 not null,
   NOMBRE               VARCHAR(40)          null,
   TELEFONOS            INT4                 null,
   NACIONALIDAD         VARCHAR(40)          null,
   CORREO               VARCHAR(40)          null,
   FECHA_NACIMIENTO     DATE                 null,
   constraint PK_CLIENTE primary key (CEDULA_CLIENTE)
);

create table ESTANCIA (
   ID_ESTANCIA          INT4                 not null,
   CEDULA_CLIENTE       INT4                 not null,
   ID_HABITACION        INT4                 not null,
   FECH_LLEGADA         DATE                 null,
   FECH_SALIDA          DATE                 null,
   constraint PK_ESTANCIA primary key (ID_ESTANCIA)
);


create table HABITACION (
   ID_HABITACION        INT4                 not null,
   ID_TIPO              INT4                 not null,
   PISO                 INT4                 null,
   NUM_HABITACION       INT4                 null,
   constraint PK_HABITACION primary key (ID_HABITACION)
);


create table REFERENCIA (
   ID_REFERENCIA        INT4                 not null,
   CEDULA_CLIENTE       INT4                 not null,
   DESCRIPCION_REFERENCIA VARCHAR(70)          null,
   FECHA_REFERENCIA     DATE                 null,
   constraint PK_REFERENCIA primary key (ID_REFERENCIA)
);


create table SERVICIOS (
   ID_SERVICIO          INT4                 not null,
   ID_HABITACION        INT4                 not null,
   NOMBRE_SERVICIO      VARCHAR(50)          null,
   DESCRIPCION_SERVICIO VARCHAR(60)          null,
   PRECIO_SERVICIO      INT4                 null,
   constraint PK_SERVICIOS primary key (ID_SERVICIO)
);


create table T_HABITACION (
   ID_TIPO              INT4                 not null,
   DESCRIPCION          VARCHAR(50)          null,
   PRECIO               INT4                 null,
   constraint PK_T_HABITACION primary key (ID_TIPO)
);


alter table CALIFICACION
   add constraint FK_CALIFICA_CALIFICAC_SERVICIO foreign key (ID_SERVICIO)
      references SERVICIOS (ID_SERVICIO)
      on delete restrict on update restrict;

alter table CALIFICACION
   add constraint FK_CALIFICA_CLIENTE_C_CLIENTE foreign key (CEDULA_CLIENTE)
      references CLIENTE (CEDULA_CLIENTE)
      on delete restrict on update restrict;

alter table ESTANCIA
   add constraint FK_ESTANCIA_CLIENTE_E_CLIENTE foreign key (CEDULA_CLIENTE)
      references CLIENTE (CEDULA_CLIENTE)
      on delete restrict on update restrict;

alter table ESTANCIA
   add constraint FK_ESTANCIA_HABITACIO_HABITACI foreign key (ID_HABITACION)
      references HABITACION (ID_HABITACION)
      on delete restrict on update restrict;

alter table HABITACION
   add constraint FK_HABITACI_TIPO_HABI_T_HABITA foreign key (ID_TIPO)
      references T_HABITACION (ID_TIPO)
      on delete restrict on update restrict;

alter table REFERENCIA
   add constraint FK_REFERENC_CLIENTE_R_CLIENTE foreign key (CEDULA_CLIENTE)
      references CLIENTE (CEDULA_CLIENTE)
      on delete restrict on update restrict;

alter table SERVICIOS
   add constraint FK_SERVICIO_HABITACIO_HABITACI foreign key (ID_HABITACION)
      references HABITACION (ID_HABITACION)
      on delete restrict on update restrict;

