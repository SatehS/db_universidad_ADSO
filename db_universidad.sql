create database db_universidad;
use db_universidad;

create table departamento(
	id_departamento int(10) primary key not null,
    nom_departamento varchar(50) not null
);

insert into departamento (id_departamento, nom_departamento) values
(1, 'Antioquia'),
(2, 'Bogotá, D.C.'),
(3, 'Valle del Cauca'),
(4, 'Atlántico'),
(5, 'Santander');

select * from departamento;


create table alumno(
	id_alumno int(10) primary key not null,
	nif varchar(9),
    nom_alumno varchar (25) not null,
    apellido1 varchar (50) not null,
    apellido2 varchar (50)not null,
    ciudad varchar (25)not null,
    dirección varchar (50) not null,
    telefono varchar (9) not null,
    fecha_nacimiento date,
    sexo enum('H', 'M'),
    id_departamento int not null
);

insert into alumno (id_alumno, nif, nom_alumno, apellido1, apellido2, ciudad, dirección, telefono, fecha_nacimiento, sexo) values 
(1, 123459879, 'Santiago', 'Aguiree', 'Avila', 'Armenia', 'Avenida 1', 3135785497, '2006-04-26', 'Masculino'),
(2, 987654321, 'María', 'López', 'García', 'Bogotá', 'Calle 7', 3104567890, '2005-09-15', 'Femenino'),
(3, 876543210, 'Carlos', 'Ramírez', 'Vargas', 'Medellín', 'Carrera 12', 3151234567, '2003-11-03', 'Masculino'),
(4, 543216789, 'Laura', 'Pérez', 'Martínez', 'Cali', 'Avenida 5', 3189876543, '2004-07-20', 'Femenino'),
(5, 987612345, 'Andrés', 'González', 'Rodríguez', 'Barranquilla', 'Calle 25', 3009876123, '2002-02-10', 'Masculino'),
(6, 654312789, 'Isabella', 'Fernández', 'Luna', 'Bucaramanga', 'Carrera 8', 3176543128, '2007-08-18', 'Femenino');
alter table alumno drop column id_departamento;
select * from alumno;


create table grado(
	id_grado int(10) primary key not null,
    nom_grado varchar(100) not null
);

insert into grado (id_grado, nom_grado) values
 (1, '1ºA'),
(2, '2ºB'),
(3, '3ºC'),
(4, '4ºD'),
(5, '5ºE');
select * from grado;

create table curso_escolar(
	id_curso_escolar int(10) primary key not null,
    anyo_inicio year(4) not null,
    anyo_fin year(4) not null
);
insert into curso_escolar (id_curso_escolar, anyo_inicio, anyo_fin) values 
(1, 2020, 2025),
(2, 2022, 2027),
(3, 2021, 2026),
(4, 2023, 2028),
(5, 2024, 2029);
select * from curso_escolar;


create table profesor(
	id_profesor int(10) primary key not null,
	nif varchar(9),
    nom_profesor varchar (25) not null,
    apellido1 varchar (50) not null,
    apellido2 varchar (50) not null,
    ciudad varchar (25) not null,
    dirección varchar (50) not null,
    telefono varchar (9) not null,
    fecha_nacimiento date not null,
    sexo enum('H', 'M'),
    id_departamento int not null,
	foreign key (id_departamento) references departamento (id_departamento)
);
insert into profesor (id_profesor, nif, nom_profesor, apellido1, apellido2, ciudad, dirección, telefono, fecha_nacimiento, sexo, id_departamento) values 
(2, 987654321, 'María', 'López', 'García', 'Bogotá', 'Calle 7', 3104567890, '2005-09-15', 'Femenino', 1),
(3, 876543210, 'Carlos', 'Ramírez', 'Vargas', 'Medellín', 'Carrera 12', 3151234567, '2003-11-03', 'Masculino', 2),
(4, 543216789, 'Laura', 'Pérez', 'Martínez', 'Cali', 'Avenida 5', 3189876543, '2004-07-20', 'Femenino', 3),
(5, 987612345, 'Andrés', 'González', 'Rodríguez', 'Barranquilla', 'Calle 25', 3009876123, '2002-02-10', 'Masculino', 4),
(6, 654312789, 'Isabella', 'Fernández', 'Luna', 'Bucaramanga', 'Carrera 8', 3176543128, '2007-08-18', 'Femenino', 5);
select * from profesor;


create table asignatura(
	id_asignatura int(10) primary key not null,
    nom_asignatura varchar (100) not null,
    creditos float,
    tipo enum ('Básico', 'Avanzado', 'Especializado'),
    curso TINYINT(3),
    id_profesor int not null,
    id_grado int not null,
    foreign key (id_profesor) references profesor (id_profesor),
	foreign key (id_grado) references grado (id_grado)
);

insert into asignatura (id_asignatura, nom_asignatura, creditos, tipo, curso, id_profesor, id_grado) values 
(1, 'Matemáticas', 4.0, 'Básico', 1, 2, 1),
(2, 'Historia', 3.5, 'Avanzado', 2, 3, 2),
(3, 'Biología', 3.0, 'Especializado', 3, 4, 3),
(4, 'Física', 4.5, 'Avanzado', 4, 5, 4),
(5, 'Literatura', 3.0, 'Básico', 5, 6, 5);

create table alumno_se_matricula_asignatura(
	id_alumno int not null,
    id_asignatura int not null,
    id_curso_escolar int not null,
    foreign key (id_alumno) references alumno(id_alumno),
    foreign key (id_asignatura) references asignatura (id_asignatura),
    foreign key (id_curso_escolar) references curso_escolar (id_curso_escolar)
);
insert into  alumno_se_matricula_asignatura (id_alumno, id_asignatura, id_curso_escolar) values 
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5);
select * from  alumno_se_matricula_asignatura;