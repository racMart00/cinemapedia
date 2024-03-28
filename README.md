# cinemapedia

A new Flutter project.

# Dev
1. Copiar el .env.template y renombrarlo a .env
2. Cambiar las variables de entorno (The MovieDB)

# Test API (The MovieDB)
>> https://api.themoviedb.org/3/movie/550?api_key=****************************

# -->Pasos para hacer primer commit<--
git init
git add .
git commit -m "first commit"
git remote add origin https://github.com/NOMBRE_USUARIO/NOMBRE_PROYECTO.git
git push -u origin master

# -->Flujo de la Arquitectura Limpia<--
UI: Tiene la comunicacion con la capa de presentacion
Presentacion: Tiene providers o gestionadores de estado q terminan llamando los casos de uso
Casos de Uso: Se comunica con los repositorios //NO SE HACE EN ESTE PROYECTO
Repositorios y Datasources: Los repositorios llaman los datasources
Informacion: Y luego la informacion regresa al UI.