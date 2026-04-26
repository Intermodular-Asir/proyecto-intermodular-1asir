# Gestión de usuarios y permisos

## 1. Objetivo
Organizar el acceso al sistema para que cada usuario disponga únicamente de los permisos necesarios según su función.

## 2. Usuarios propuestos
Se plantea la creación de varios usuarios para simular un entorno de trabajo real:
- `adminiso`: administrador del sistema
- `operador`: usuario con tareas normales de gestión
- `invitado`: usuario con acceso limitado

## 3. Creación de usuarios
```bash
sudo adduser adminiso
sudo adduser operador
sudo adduser invitado
```

## 4. Creación de grupos
Se crean grupos para organizar permisos:
- `administradores`
- `proyecto`

```bash
sudo groupadd administradores
sudo groupadd proyecto
```

## 5. Asignación de usuarios a grupos
```bash
sudo usermod -aG administradores adminiso
sudo usermod -aG proyecto operador
sudo usermod -aG proyecto invitado
```

## 6. Permisos administrativos
El usuario `adminiso` puede añadirse al grupo `sudo` para realizar tareas de administración:

```bash
sudo usermod -aG sudo adminiso
```

## 7. Carpetas compartidas y permisos
Se crea una carpeta de trabajo compartida:

```bash
sudo mkdir -p /srv/proyecto
sudo chown :proyecto /srv/proyecto
sudo chmod 770 /srv/proyecto
```

### Explicación
- el propietario puede gestionar los archivos
- el grupo `proyecto` tiene acceso completo
- el resto de usuarios no tiene acceso

## 8. Verificación de permisos
Para comprobar usuarios y grupos:

```bash
id adminiso
id operador
id invitado
ls -ld /srv/proyecto
```

## 9. Conclusión
La gestión de usuarios y permisos permite controlar el acceso a recursos del sistema, mejorar la seguridad y reflejar una organización coherente del entorno implantado.
