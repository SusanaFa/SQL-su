DROP DATABASE IF EXISTS inscripciones_cursos; -- Eliminar bd en caso de existir
CREATE DATABASE inscripciones_cursos; -- Crear bd
USE inscripciones_cursos; -- Usar bd

--creacion de tablas varias
CREATE TABLE student (
    id_student INT AUTO_INCREMENT PRIMARY KEY,
    name_student VARCHAR(100) NOT NULL,
    age_student INT NOT NULL
);

CREATE TABLE course (
    id_course INT AUTO_INCREMENT PRIMARY KEY,
    name_course VARCHAR(100) NOT NULL,
    duration_course INT NOT NULL 
);

CREATE TABLE enrollment (
    student_id INT NOT NULL,
    course_id INT NOT NULL,
   PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES student(id_student),
    FOREIGN KEY (course_id) REFERENCES course(id_course)
);

--insercion de datos a las tablas
INSERT INTO student (name_student, age_student)
VALUES
('Carlos Méndez', 22),
('Sofía Ramírez', 19),
('Javier López', 25),
('Lucía Fernández', 21),
('Miguel Torres', 23);

INSERT INTO course (name_course, duration_course)
VALUES
('Introducción a la Programación', 40),
('Bases de Datos', 50),
('Desarrollo Web', 60),
('Inteligencia Artificial', 70),
('Seguridad Informática', 45);

INSERT INTO enrollment (student_id, course_id)
VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 3),
(3, 4),
(4, 2),
(4, 5),
(5, 3),
(5, 4);

--consultas de todos los estudiates y sus respectivos cursos
SELECT s.name_student AS Estudiante,
c.name_course AS Curso
FROM enrollment AS e
JOIN student AS s 
ON e.student_id = s.id_student
JOIN course AS c 
ON e.course_id = c.id_course
ORDER BY s.name_student;

--consultar a los estudiantes que estan inscritos en un curso especifico, utilizando nombre como riterio
SELECT s.name_student AS Estudiante,
c.name_course AS Curso
FROM enrollment AS e
JOIN student AS s 
ON e.student_id = s.id_student
JOIN course AS c 
ON e.course_id = c.id_course
WHERE LOWER(c.name_course) LIKE LOWER('%desarrollo web%');


--consultar todos los cursos en los que está inscrito un estudiante específico, utilizando el nombre como criterio
SELECT s.name_student AS Estudiante,
c.name_course AS Curso
FROM enrollment AS e
JOIN student AS s 
ON e.student_id = s.id_student
JOIN course AS c 
ON e.course_id = c.id_course
WHERE LOWER(s.name_student) LIKE LOWER('%Javier%');

--Contar el umero de estudiantes inscritos en cada curso, mostrar el nombre del curso y el conteo de estudiantes
SELECT 
c.name_course AS Curso,
COUNT(e.student_id) AS Numero_Estudiantes
FROM course AS c
LEFT JOIN enrollment AS e
ON c.id_course = e.course_id
GROUP BY c.id_course, c.name_course;


--mostras los estdiantes que no estan inscritos en ningun curso
SELECT
s.name_student AS Estudiante
FROM student AS s
LEFT JOIN enrollment AS e
ON s.id_student = e.student_id
WHERE e.course_id IS NULL;

--Susana Farías
--ejecutado en consola con: mysql -u root -p 
--ingresar la contrasea
--consultar BD disponibles
-- SHOW DATABASES;
--creo bd y comienzo a ejecutar cada una de las consultas

