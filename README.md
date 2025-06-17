# PracticandoBBDD
Practicando SELECTs con Sakila en MySQL.

- `select-study` es para cuestiones teórico-prácticas.
- `select-practice` es para practicar.

---

## Guía paso a paso para preparar el entorno

### 1. Instalar Dependencias: Docker (solo la primera vez)

Ejecuta el script de instalación para tener Docker listo en tu sistema:

```bash
./install-docker.sh
```
> **Nota:** Si nunca instalaste Docker, este script lo hará por vos. Solo necesitas ejecutarlo una vez (y reiniciar la PC o la sesión de usuario).

---

### 2. Inicializar lo necesario
Cada vez que quieras practicar, ejecuta:

```bash
source setup.sh
```
Este script:
- Realiza lo necesario para inicializar todo de una, ejecutá este o simplemente ejecutá sus dos componentes por separado, abordados en 2.1 y 2.2. 

> **Nota:** Usar source es necesario para que se haga efectivo el cambio de entorno (venv).

#### 2.1. Preparar Docker
```bash
./setup-docker.sh
```
Este script:
- Construye la imagen de Docker con MySQL y la base Sakila.
- Inicia el contenedor si no está corriendo.
- Te muestra los datos de conexión para MySQL.

#### 2.2. Preparar el entorno Python (virtualenv)

Para trabajar con Jupyter y SQL, activa el entorno virtual y asegúrate de tener las dependencias instaladas:

```bash
source setup-env.sh
```
Este script:
- Crea el entorno virtual `.venv` si no existe.
- Lo activa.
- Instala o actualiza las dependencias de `requirements.txt`.

> **Recomendación:** Ejecuta este script cada vez que abras una terminal nueva en el proyecto para asegurarte de que el entorno esté activo.
> **Nota:** Usar source es necesario para que se haga efectivo el cambio de entorno (venv).
---

### 3. Usar Jupyter Notebooks para practicar SQL

#### Opción A: Desde la terminal

1. Activa el entorno virtual si no se activó con los comandos de arriba:
    ```bash
    source .venv/bin/activate
    ```
2. Lanza Jupyter:
    ```bash
    jupyter notebook
    ```
3. Abrí o creá notebooks en la carpeta `select-practice`.

#### Opción B: Desde VS Code

1. Abrí el notebook que quieras estudiar (`.ipynb`) en VS Code.
2. En la barra superior del notebook, Seleccioná el kernel correspondiente a tu entorno virtual (`.venv`).

---

### 4. Conectar el notebook a MySQL

En la **primera celda** de cada notebook que quieras usar, ejecuta:

```python
%load_ext sql
%sql mysql+mysqlconnector://root:root@localhost:3306/sakila
```

Esto habilita la extensión SQL y conecta el notebook a la base de datos Sakila del contenedor Docker. Si no anda, tené en cuenta que quizás Docker no se inició. (EJEM: setup-docker.sh)

---

### 5. ¡A practicar!

Ahora puedes ejecutar consultas SQL directamente en celdas del notebook usando la sintaxis:

```sql
%%sql
SELECT * FROM actor LIMIT 5;
```

---

## Resumen rápido

1. `./install-docker.sh` (solo la primera vez)
2. `./setup.sh` (cada vez que quieras levantar la base)
3. `source setup-env.sh` (cada vez que abras una terminal)
4. Lanza Jupyter y conecta el notebook a MySQL como se indica arriba.

---

