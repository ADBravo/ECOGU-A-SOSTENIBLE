# Proyecto Huella de Carbono - Flutter Multiplataforma

La aplicación **Huella de Carbono** permite calcular las emisiones de CO₂ generadas por proyectos digitales, considerando infraestructura cloud, ciclo de desarrollo y ejecución en tiempo real.  
Está desarrollada en **Flutter**, con arquitectura modular tipo servidor, persistencia local mediante **SQLite**, y soporte para escritorio (Windows) y móvil (Android).

---

## 1. Características principales

- Cálculo de emisiones por infraestructura, desarrollo y runtime.
- Equivalencias ambientales (árboles, km en auto, cargas móviles, horas de laptop).
- Recomendaciones automáticas para reducir huella digital.
- Persistencia local con **SQLite**.
- Contador de visitas integrado como prueba de backend.
- Arquitectura modular tipo MVC con rutas simuladas (`/api/calculate`, `/api/visits`).

---

## 2. Requisitos previos

- **Flutter 3.9.2** o superior  
- **Dart SDK**  
- Editor recomendado: Android Studio o Visual Studio Code  
- Sistema operativo: Android o Windows (compatible con escritorio)

---

## 3. Proceso de instalación

1. **Clonar el repositorio**

```bash
git clone https://github.com/tuusuario/ECOGU-A-SOSTENIBLE.git
cd huella_carbono
```

2. **Instalar dependencias**

```bash
flutter pub get
```

3. **Inicializar configuración multiplataforma**

```bash
flutter create .
```

---

## 4. Compilación

### 📱 Android (APK)

```bash
flutter build apk --release
```

Archivo generado en:

```
build/app/outputs/flutter-apk/app-release.apk
```

### 💻 Windows (ejecutable)

```bash
flutter build windows
```

Archivo generado en:

```
build/windows/x64/runner/Release/huella_carbono.exe
```

---

## 5. Estructura del proyecto

```
lib/
├── controllers/       # Lógica de negocio (carbono, visitas)
├── models/            # Modelos de cálculo y base de datos
├── routes/            # Routers tipo servidor
├── services/          # Servicio SQLite
├── views/             # Interfaces gráficas y formularios
```

---

## 6. Lineamientos de ejecución

1. Instalar Flutter y clonar el repositorio.
2. Ejecutar `flutter pub get` para instalar dependencias.
3. Compilar para Android o Windows según el entorno.
4. Ejecutar la app y llenar el formulario para calcular emisiones.
5. Validar resultados y recomendaciones generadas automáticamente.

---

## 7. Notas técnicas

- La base de datos se inicializa automáticamente en `DBService`.
- El contador de visitas se actualiza en cada ejecución como prueba de backend.
- Las rutas simuladas (`/api/calculate`, `/api/visits`) están integradas en `AppRouter`.
- El cálculo de emisiones aplica fórmulas matemáticas precisas por categoría.
- El formulario está dividido por secciones: infraestructura, desarrollo, runtime.