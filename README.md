# CreativAI
![](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)

### Aplicación desarrollada en Flutter y Python - Desafío Firebase Cloud Functions
El desafío consiste en crear un proyecto sencillo que cumpla con las siguientes consignas:

- Dar de alta un proyecto de flutter, montar una sola pantalla.
- Dar de alta una cloud function utilizando Python
- Conectar Firebase Firestore a flutter

## Tecnologías utilizadas
![](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![](https://img.shields.io/badge/Python-14354C?style=for-the-badge&logo=python&logoColor=white)
![](https://img.shields.io/badge/Firebase-F24E1E?style=for-the-badge&logo=firebase&logoColor=white)
![](https://img.shields.io/badge/VSCode-0078D4?style=for-the-badge&logo=visual%20studio%20code&logoColor=white)
![](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white)

## Propuesta
CreativAI: Textos creativos a partir de palabras claves. Esta aplicación utiliza las siguientes tecnologías
- Flutter
- Python
- Firebase Cloud Functions
- Firebase Cloud Firestore

## Prueba local
Para realizar una prueba local de la aplicación Flutter, dirigirse a la carpeta creativai y ejecutar
`flutter run`

Para realizar una prueba local de las Cloud Functions, dirigirse a la carpeta cloud_functions, instalar Local Emulators de Firebase y ejecutar
`firebase emulators:start`

## Resolución
A continuación se presenta la resolución final de la aplicación. Se muestran la pantalla principal de la aplicación y el funcionamiento base de la misma.
<p float="left">
  <img src="https://media.giphy.com/media/v1.Y2lkPTc5MGI3NjExc2dkcHdhaHh3enYzOXY3OWNwNzMzZDJ4cG5qNWhpZXNvZ3EyamVtOCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/qOkgLNCh7bKSAxZTq0/giphy.gif" width="200px">
</p>

## Roadmap
`14/07/2024` - Creación de repositorio<br>
`14/07/2024` - Se realiza el diseño base visual teniendo en cuenta los requerimientos establecidos. Se utiliza *Figma* como herramienta para bosquejar las pantallas principales de la aplicación<br>
`14/07/2024` - Creación de proyecto utilizando comando de línea Flutter create creativai. Creación de estructura base del proyecto.<br>
`14/07/2024` - Configuración de firebase, functions y emulators. Creación de una función python que genera una historia a partir de una palabra clave. Se crea un documento en Firestore para guardar la historia.<br>
`15/07/2024` - Creación de aplicación Flutter de una sola pantalla utilizando arquitectura limpia. Se utiliza Riverpod como gestor de estados. La aplicación permite al usuario enviar un mensaje con una palabra clave, y en respuesta a este evento (mensaje) la aplicación responde a través de la Cloud Functions con una historia basada en esta palabra. Se utiliza una función básica para la generación de estas historias que simularía una consulta real a ChatGPT o Gemini en un proyecto real<br>
`19/07/2024` - Se define la estructura final del proyecto, separando la Cloud Functions de la aplicación Flutter. Se finaliza el proyecto de ejemplo