CREATE TABLE Estudiantes (
    id_estudiante INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    email VARCHAR(100)
);

-- Crear tabla de Cursos
CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY,
    nombre_curso VARCHAR(100),
    descripcion VARCHAR(255),
    cupo_maximo INT
);

-- Crear tabla de Matriculas
CREATE TABLE Matriculas (
    id_matricula INT PRIMARY KEY,
    id_estudiante INT,
    fecha_matricula DATE,
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante)
);

-- Crear tabla intermedia para relacionar Estudiantes con Cursos
CREATE TABLE Estudiantes_Cursos (
    id_estudiante INT,
    id_curso INT,
    PRIMARY KEY (id_estudiante, id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso)
);
-- Insertar datos de ejemplo
INSERT INTO Estudiantes (id_estudiante, nombre, apellido, email)
VALUES (1, 'Juan', 'Perez', 'juan@example.com');

INSERT INTO Cursos (id_curso, nombre_curso, descripcion, cupo_maximo)
VALUES (1, 'Programación', 'Introducción a la programación', 20),
       (2, 'Matemáticas', 'Álgebra y cálculo', 25);

INSERT INTO Matriculas (id_matricula, id_estudiante, fecha_matricula)
VALUES (1, 1, '2024-02-06');

INSERT INTO Estudiantes_Cursos (id_estudiante, id_curso)
VALUES (1, 1), -- Juan se matricula en Programación
       (1, 2); -- Juan se matricula en Matemáticas