# cinemapedia
A new Flutter project.

# Dar permisos de Internet
<uses-permission android:name="android.permission.INTERNET"/>

# Dev
1. Copiar el .env.template y renombrarlo a .env
2. Cambiar las variables de entorno (The MovieDB)

# Flujo de la Arquitectura Limpia
 UI: Tiene la comunicacion con la capa de presentacion
 Presentacion: Tiene providers o gestionadores de estado q terminan llamando los casos de uso
 Casos de Uso: Se comunica con los repositorios //NO SE HACE EN ESTE PROYECTO
 Repositorios y Datasources: Los repositorios llaman los datasources
 Informacion: Y luego la informacion regresa al UI.

# Test API (The MovieDB)
 https://api.themoviedb.org/3/movie/550?api_key = Clave de la API

# Pasos para hacer primer commit
1. git init
2. git add .
3. git commit -m "first commit"
4. git remote add origin https://github.com/NOMBRE_USUARIO/NOMBRE_PROYECTO.git
5. git push -u origin master

# Crear nueva rama y movernos a ella
1. git checkout -b branch_name

# Flutter Launcher Icons
1. pubspec assist flutter_launcher_icons
2. dart run flutter_launcher_icons
    dev_dependencies:
      flutter_launcher_icons: "^0.13.1"

    flutter_launcher_icons:
      android: "launcher_icon"
      ios: true
      image_path: "assets/icon/icon.png"
      min_sdk_android: 21 # android min sdk min:16, default 21
      web:
        generate: true
        image_path: "path/to/image.png"
        background_color: "#hexcode"
        theme_color: "#hexcode"
      windows:
        generate: true
        image_path: "path/to/image.png"
        icon_size: 48 # min:48, max:256, default: 48
      macos:
        generate: true
        image_path: "path/to/image.png"

# Rename App
1. pubspec assist rename_app
2. dart run rename_app:main all="My App Name"
