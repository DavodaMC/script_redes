#!/bin/bash

#
# SCRIPT COMPLETO PARA UN ADMINISTRADOR DE REDES
#
# Scripted by: Davoda
#

#
# PRIMERO LOS SUBMENÚS PARA QUE BASH LOS PUEDA LEER ANTES, LUEGO VA EL MENÚ PRINCIPAL
#

#
# SUBMENÚ PING
#
ping_menu() {
clear
echo "#######################################################"
echo "#                                                     #"
echo "#                     SUBMENÚ PING                    #"
echo "#                                                     #"
echo "#######################################################"
echo ""
echo "1. Ping normal."
echo "2. Ping silencioso."
echo "3. Ping flood."
echo "4. Ping con marcatiempo."
echo "5. Ping con cantidad de bytes."
echo "6. Ping con cantidad de paquetes."
echo "7. Volver al menú principal de opciones."
echo "8. Salir del script."
echo ""
echo "#######################################################"
read -p "Selecciona la opción del submenú ping: " opping
case $opping in 
1)
clear
echo "#####################"
echo "#     PING NORMAL   #"
echo "#####################"
# LE PEDIMOS CTRL + C + ENTER PORQUE LOS PINGS EN LINUX SON RECURSIVOS, DE MANERA QUE CANCELAS EL COMANDO DE PING Y LUEGO SE EJECUTA EL READ HACIENDO ASÍ QUE PUEDAS LUEGO ENVIARLO AL MENÚ PRINCIPAL
echo "# CTRL + C + ENTER  #"
echo "# PARA VOLVER ATRÁS #"
echo "#####################"
read -p "Introduce la dirección IP para hacer el ping normal:" ippingnormal
# COMANDO PING NORMAL
ping $ippingnormal
read
ping_menu
;;
2)
clear
echo "#####################"
echo "#  PING SILENCIOSO  #"
echo "#####################"
echo "# CTRL + C + ENTER  #"
echo "# PARA VOLVER ATRÁS #"
echo "#####################"
read -p "Introduce la dirección IP para hacer el ping silencioso: " ippingsilencioso
# OPCIÓN -q -> QUIET (SILENCIOSO)
ping -q $ippingsilencioso
read
ping_menu
;;
3)
clear
echo "#####################"
echo "#     PING FLOOD    #"
echo "#####################"
echo "# CTRL + C + ENTER  #"
echo "# PARA VOLVER ATRÁS #"
echo "#####################"
read -p "Introduce la dirección IP para hacer el ping flood: " ippingflood
# OPCIÓN -f -> FLOOD (INUNDAR)
ping -f $ippingflood
read
ping_menu
;;
4)
clear
echo "#####################"
echo "#  PING MARCATIEMPO #"
echo "#####################"
echo "# CTRL + C + ENTER  #"
echo "# PARA VOLVER ATRÁS #"
echo "#####################"
read -p "Introduce la dirección IP para hacer el ping marcatiempo: " ippingmt
# OPCIÓN -D -> TIMESTAMPS (MARCAS DE TIEMPO)
ping -D $ippingmt
read
ping_menu
;;
5)
clear
echo "#####################"
echo "#     PING BYTES    #"
echo "#####################"
echo "# CTRL + C + ENTER  #"
echo "# PARA VOLVER ATRÁS #"
echo "#####################"
read -p "Introduce la dirección IP para hacer el ping con cantidad de bytes: " ippingbytes
# AQUÍ LE PEDIMOS TAMBIÉN LA CANTIDAD DE BYTES QUE QUIERE ENVIAR PORQUE NECESITAMOS 2 ARGUMENTOS (NO SOLO LA IP)
read -p "Introduce la cantidad de bytes a enviar: " bytesping
ping -s $bytesping $ippingbytes
read# OPCIÓN -s -> BYTES

ping_menu
;;
6)
clear
echo "#####################"
echo "#   PING PAQUETES   #"
echo "#####################"
echo "#       ENTER       #"
echo "# PARA VOLVER ATRÁS #"
echo "#####################"
read -p "Introduce la dirección IP para hacer el ping con cantidad de paquetes: " ippingpackets
# AQUÍ LE PEDIMOS TAMBIÉN LA CANTIDAD DE PAQUETES QUE QUIERE ENVIAR PORQUE NECESITAMOS 2 ARGUMENTOS (NO SOLO LA IP)
read -p "Introduce la cantidad de paquetes a enviar: " cantidadping
# OPCIÓN -c -> CANTIDAD DE PAQUETES
ping -c $cantidadping $ippingpackets
read
ping_menu
;;
7)
clear
menu_principal
;;
8)
clear
exit
;;
*)
clear
echo "################################"
echo ""
echo "BOBO, ESTA OPCIÓN NO EXISTE:"
echo "PRESIONA ENTER PARA VOLVER ANDA"
echo ""
echo "################################"
read
ping_menu
;;
esac
}
#

#
# SUBMENÚ IFCONFIG / INTERFAZ DE RED
#
ifconfig_menu() {
clear
echo "#######################################################"
echo "#                                                     #"
echo "#                   SUBMENÚ IFCONFIG                  #"
echo "#                                                     #"
echo "#######################################################"
echo ""
echo "1. Ifconfig normal."
echo "2. Obtener IPs del equipo."
echo "3. Obtener IPs broadcast."
echo "4. Obtener máscara de subred."
echo "5. Guardar ifconfig en un archivo de texto."
echo "6. Volver al menú principal de opciones."
echo "7. Salir del script."
echo ""
echo "#######################################################"
read -p "Selecciona la opción del submenú ifconfig: " opifconfig

case $opifconfig in 
1)
clear
echo "#####################"
echo "#      IFCONFIG     #"
echo "#####################"
echo "# CTRL + C + ENTER  #"
echo "# PARA VOLVER ATRÁS #"
echo "#####################"
# COMANDO PARA MOSTRAR LA INTERFAZ DE RED
ifconfig
read
ifconfig_menu
;;
2)
clear
echo "#####################"
echo "#     OBTENER IPs   #"
echo "#####################"
echo "#       ENTER       #"
echo "# PARA VOLVER ATRÁS #"
echo "#####################"
# COMANDO PARA MOSTRAR LA INTERFAZ DE RED Y A TRAVÉS DE LA TUBERÍA (|) CONCATENAMOS 2 COMANDOS, DE FORMA QUE BUSCAMOS "INET" DENTRO DEL IFCONFIG
ifconfig | grep inet
read
ifconfig_menu
;;
3)
clear
echo "#####################"
echo "#   OBTENER IPs BC  #"
echo "#####################"
echo "#       ENTER       #"
echo "# PARA VOLVER ATRÁS #"
echo "#####################"
ifconfig | grep broadcast
read
ifconfig_menu
;;
4)
clear
echo "#####################"
echo "#  OBTENER NETMASK  #"
echo "#####################"
echo "#       ENTER       #"
echo "# PARA VOLVER ATRÁS #"
echo "#####################"
ifconfig | grep netmask
read
ifconfig_menu
;;
5)
clear
echo "#####################"
echo "#  IFCONFIG -> TXT  #"
echo "#####################"
echo "#       ENTER       #"
echo "# PARA VOLVER ATRÁS #"
echo "#####################"
echo ""
echo "(Introduce: d -> para hacerlo en la carpeta del script)"
read -p "Introduce la ruta donde quieres que se guarde: " rutaifconfigtxt

case $rutaifconfigtxt in
d)
# GUARDA EL RESULTADO DEL COMANDO "IFCONFIG" DENTRO DE UN ARCHIVO TXT
ifconfig > ifconfig.txt
;;
*)
# SE METE DENTRO DE LA RUTA QUE HA ESTABLECIDO EL USUARIO
cd $rutaifconfigtxt
ifconfig > ifconfig.txt
;;
esac

read
clear
ifconfig_menu
;;
6)
clear
menu_principal
;;
7)
clear
exit
;;
*)
clear
echo "################################"
echo ""
echo "BOBO, ESTA OPCIÓN NO EXISTE:"
echo "PRESIONA ENTER PARA VOLVER ANDA"
echo ""
echo "################################"
read
ifconfig_menu
;;
esac
}
#

#
# SUBMENÚ PERMISOS
#
permisos_menu() {
clear
echo "#######################################################"
echo "#                                                     #"
echo "#                   SUBMENÚ PERMISOS                  #"
echo "#                                                     #"
echo "#######################################################"
echo ""
echo "1. Usuario propietario."
echo "2. Grupo."
echo "3. Otros."
echo "4. Todos."
echo ""
echo "5. Volver al menú principal."
echo "6. Salir del script."
echo ""
echo "#######################################################"
read -p "Selecciona la opción: " opperm
case $opperm in
1)
menu_permisos_usuario
;;
2)
clear
menu_permisos_grupo
;;
3)
clear
menu_permisos_otros
;;
4)
menu_permisos_todos
;;
5)
clear
menu_principal
;;
6)
clear
exit
;;
*)
clear
echo "################################"
echo ""
echo "BOBO, ESTA OPCIÓN NO EXISTE:"
echo "PRESIONA ENTER PARA VOLVER ANDA"
echo ""
echo "################################"
read
permisos_menu
;;
esac
}
#

#
# SUBMENÚ PERMISOS USUARIO PROPIETARIO
#
menu_permisos_usuario() {
clear
echo "#######################################################"
echo "#                                                     #"
echo "#      SUBMENÚ PERMISOS -> USUARIO PROPIETARIO        #"
echo "#                                                     #"
echo "#######################################################"
echo ""
echo "1. Cambiar permisos a solo lectura."
echo "2. Cambiar permisos a solo escritura."
echo "3. Cambiar permisos a solo ejecución."
echo ""
echo "4. Cambiar permisos a lectura-escritura."
echo "5. Cambiar permisos a lectura-ejecución."
echo "6. Cambiar permisos a escritura-ejecución."
echo ""
echo "7. Cambiar permisos a lectura-escritura-ejecución."
echo ""
echo "8. Volver al submenú de permisos."
echo "9. Salir del script."
echo "#######################################################"
read -p "Introduce la opción que quieras seleccionar: " opsmuser
case $opsmuser in
1)
# LE PEDIMOS LA RUTA DEL ARCHIVO JUNTO AL ARCHIVO Y SU EXTENSIÓN PARA CAMBIAR LOS PERMISOS FÁCILMENTE
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
# DEPENDIENDO DE A QUIÉN QUERAMOS DARLE LOS PERMISOS Y QUÉ PERMISOS QUERAMOS DARLE CAMBIA EL NÚMERO, EL PRIMER NÚMERO ES PARA EL USUARIO, EL SEGUNDO PARA EL GRUPO Y EL TERCERO PARA OTROS USUARIOS
chmod 400 $rutaarchivo
;;
2)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 200 $rutaarchivo
;;
3)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 100 $rutaarchivo
;;
4)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 600 $rutaarchivo
;;
5)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 500 $rutaarchivo
;;
6)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 300 $rutaarchivo
;;
7)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 700 $rutaarchivo
;;
8)
clear
permisos_menu
;;
9)
clear
exit
;;
*)
clear
echo "################################"
echo ""
echo "BOBO, ESTA OPCIÓN NO EXISTE:"
echo "PRESIONA ENTER PARA VOLVER ANDA"
echo ""
echo "################################"
read
menu_permisos_usuario
;;
esac
}
#

#
# SUBMENÚ PERMISOS GRUPO
#
menu_permisos_grupo() {
clear
echo "#######################################################"
echo "#                                                     #"
echo "#             SUBMENÚ PERMISOS -> GRUPO               #"
echo "#                                                     #"
echo "#######################################################"
echo ""
echo "1. Cambiar permisos a solo lectura."
echo "2. Cambiar permisos a solo escritura."
echo "3. Cambiar permisos a solo ejecución."
echo ""
echo "4. Cambiar permisos a lectura-escritura."
echo "5. Cambiar permisos a lectura-ejecución."
echo "6. Cambiar permisos a escritura-ejecución."
echo ""
echo "7. Cambiar permisos a lectura-escritura-ejecución."
echo ""
echo "8. Volver al submenú de permisos."
echo "9. Salir del script."
echo "#######################################################"
read -p "Introduce la opción que quieras seleccionar: " opsmuser
case $opsmuser in
1)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 040 $rutaarchivo
;;
2)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 020 $rutaarchivo
;;
3)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 010 $rutaarchivo
;;
4)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 060 $rutaarchivo
;;
5)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 050 $rutaarchivo
;;
6)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 030 $rutaarchivo
;;
7)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 070 $rutaarchivo
;;
8)
clear
permisos_menu
;;
9)
clear
exit
;;
*)
clear
echo "################################"
echo ""
echo "BOBO, ESTA OPCIÓN NO EXISTE:"
echo "PRESIONA ENTER PARA VOLVER ANDA"
echo ""
echo "################################"
read
menu_permisos_grupo
;;
esac
}
#

#
# SUBMENÚ PERMISOS OTROS
#
menu_permisos_otros() {
clear
echo "#######################################################"
echo "#                                                     #"
echo "#              SUBMENÚ PERMISOS -> OTROS              #"
echo "#                                                     #"
echo "#######################################################"
echo ""
echo "1. Cambiar permisos a solo lectura."
echo "2. Cambiar permisos a solo escritura."
echo "3. Cambiar permisos a solo ejecución."
echo ""
echo "4. Cambiar permisos a lectura-escritura."
echo "5. Cambiar permisos a lectura-ejecución."
echo "6. Cambiar permisos a escritura-ejecución."
echo ""
echo "7. Cambiar permisos a lectura-escritura-ejecución."
echo ""
echo "8. Volver al submenú de permisos."
echo "9. Salir del script."
echo "#######################################################"
read -p "Introduce la opción que quieras seleccionar: " opsmuser
case $opsmuser in
1)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 004 $rutaarchivo
;;
2)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 002 $rutaarchivo
;;
3)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 001 $rutaarchivo
;;
4)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 006 $rutaarchivo
;;
5)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 005 $rutaarchivo
;;
6)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 003 $rutaarchivo
;;
7)
read -p "Introduce la ruta del archivo con la extensión correspondiente: " rutaarchivo
chmod 007 $rutaarchivo
;;
8)
clear
permisos_menu
;;
9)
clear
exit
;;
*)
clear
echo "################################"
echo ""
echo "BOBO, ESTA OPCIÓN NO EXISTE:"
echo "PRESIONA ENTER PARA VOLVER ANDA"
echo ""
echo "################################"
read
menu_permisos_otros
;;
esac
}
#

#
# SUBMENÚ ADMINISTRAR USUARIOS /  GRUPOS
#
usuarios_menu() {
clear
echo "#######################################################"
echo "#                                                     #"
echo "#                   SUBMENÚ USUARIOS                  #"
echo "#                                                     #"
echo "#######################################################"
echo ""
echo "1. Crear un usuario."
echo "2. Crear un usuario con contraseña."
echo "3. Crear un usuario con fecha de expiración."
echo "4. Borrar un usuario."
echo "5. Volver al menú principal de opciones."
echo "6. Salir del script."
echo ""
echo "#######################################################"
read -p "Selecciona la opción del submenú usuarios: " opsmusuario

case $opsmusuario in 
1)
clear
read -p "Introduce el nombre del nuevo usuario: " nombreusuario
# COMANDO PARA AÑADIR UN USUARIO
sudo useradd $nombreusuario
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE USUARIO"
echo ""
read
usuarios_menu
;;
2)
clear
read -p "Introduce el nombre del nuevo usuario con contraseña: " nombreusuario
useradd $nombreusuario
# COMANDO PARA ESTABLECER UNA CONTRASEÑA AL USUARIO
passwd $nombreusuario
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE USUARIO"
echo ""
read
usuarios_menu
;;
3)
clear
read -p "Introduce el nombre del nuevo usuario con fecha de expiración: " nombreusuario
read -p "Introduce la fecha de expiración del nuevo usuario en el formato YYYY-MM-DD: " fechaeusuario
# OPCIÓN -e FUERZA AL USUARIO A PONER UNA FECHA DE EXPIRACIÓN DEL USUARIO
sudo useradd -e $fechaeusuario $nombreusuario
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE USUARIO"
echo ""
read
usuarios_menu
;;
4)
clear
read -p "Introduce el nombre del usuario a borrar: " nombreusuarioborrar
sudo userdel $nombreusuarioborrar
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE USUARIO"
echo ""
read
usuarios_menu
;;
5)
menu_principal
;;
6)
clear
exit
;;
*)
clear
echo "################################"
echo ""
echo "BOBO, ESTA OPCIÓN NO EXISTE:"
echo "PRESIONA ENTER PARA VOLVER ANDA"
echo ""
echo "################################"
read
ifconfig_menu
;;
esac
}
#

#
# SUBMENÚ GRUPOS
#
grupos_menu() {
clear
echo "#######################################################"
echo "#                                                     #"
echo "#                    SUBMENÚ GRUPOS                   #"
echo "#                                                     #"
echo "#######################################################"
echo ""
echo "1. Ver todos los grupos."
echo "2. Ver los miembros de un grupo."
echo "3. Crear un nuevo grupo."
echo "4. Añadir un usuario a un grupo."
echo "5. Eliminar un usuario de un grupo."
echo "6. Eliminar un grupo."
echo "7. Volver al menú principal de opciones."
echo "8. Salir del script."
echo ""
echo "#######################################################"
read -p "Selecciona la opción del submenú usuarios: " opsmgrupo

case $opsmgrupo in
1)
clear
cut -d: -f1 /etc/group
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE GRUPOS"
echo ""
read
grupo_menu
;;
2)
clear
read -p "Introduce el nombre del grupo del que quieras ver los miembros: " nombredelgrupo
echo "Miembros del grupo" $nombredelgrupo
# COMANDO PARA OBTENER LOS USUARIOS DE UN GRUPO CONCATENADOS CON COMANDOS QUE MUESTRA LA INFORMACIÓN QUE DESEAMOS
getent group $nombredelgrupo | cut -d: -f4 | tr ',' ' '
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE GRUPOS"
echo ""
read
grupo_menu
;;
3)
clear
read -p "Introduce el nombre del nuevo grupo: " nuevogrupo
# COMANDO PARA AÑADIR UN NUEVO GRUPO
sudo groupadd $nuevogrupo
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE GRUPOS"
echo ""
read
grupo_menu
;;
4)
clear
read -p "Introduce el nombre del usuario que quieras añadir: " nombreusuario
read -p "Introduce el nombre del grupo al que quieras añadir el usuario: " nombregrupo
# COMANDO PARA AÑADIR UN USUARIO A UN GRUPO
sudo usermod -aG $nombregrupo $nombreusuario
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE GRUPOS"
echo ""
read
grupo_menu
;;
5)
clear
read -p "Introduce el nombre del usuario que quieres eliminar: " nombreusuariodelete
read -p "Introduce el nombre del grupo del que quieres eliminaral usuario: " nombregrupodelete
# COMANDO PARA ELIMINAR EL USUARIO DE UN GRUPO
sudo gpasswd -d $nombreusuariodelete $nombregrupodelete
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE GRUPOS"
echo ""
read
grupo_menu
;;
6)
clear
read -p "Introduce el nombre del grupo que quieres eliminar: " nombredelgrupoeliminar
# COMANDO PARA ELIMINAR UN GRUPO
sudo groupdel $nombredelgrupoeliminar
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE GRUPOS"
echo ""
read
grupo_menu
;;
7)
clear
menu_principal
;;
8)
clear
exit
;;
esac
}
#

#
# SUBMENÚ HISTORIAL
#
historial_menu() {
clear
echo "#######################################################"
echo "#                                                     #"
echo "#                  SUBMENÚ HISTORIAL                  #"
echo "#                                                     #"
echo "#######################################################"
echo ""
echo "1. Ver historial."
echo "2. Ver historial con fecha y hora."
echo "3. Buscar algo en concreto en el historial."
echo "4. Mostrar lo no leído del historial."
echo "5. Borrar el historial."
echo "6. Volver al menú principal de opciones."
echo "7. Salir del script."
echo ""
echo "#######################################################"
read -p "Selecciona la opción del submenú historial: " opsmhistorial

case $opsmhistorial in 
1)
export HISTTIMEFORMAT=''
clear
history
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE HISTORIAL"
echo ""
read
historial_menu
;;
2)
export HISTTIMEFORMAT='%F %T : '
clear
history
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE HISTORIAL"
echo ""
read
historial_menu
;;
3)
clear
read -p "Introduce lo que quieras buscar en el historial: " buscarhistorial
history | grep $buscarhistorial
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE HISTORIAL"
echo ""
read
historial_menu
;;
4)
clear
history -n
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE HISTORIAL"
echo ""
read
historial_menu
;;
5)
clear
history -c
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE HISTORIAL"
echo ""
read
historial_menu
;;
6)
clear
menu_principal
;;
7)
clear
exit
;;
esac
}
#

#
# SUBMENÚ ADMINISTRAR EQUIPO / APAGAR, REINICIAR, SUSPENDER
#
administrarequipo_menu() {
clear
echo "#######################################################"
echo "#                                                     #"
echo "#         SUBMENÚ ADMINISTRACIÓN DEL EQUIPO           #"
echo "#                                                     #"
echo "#######################################################"
echo ""
echo "1. Apagar el equipo."
echo "2. Apagar el equipo en un tiempo."
echo "3. Reiniciar el equipo."
echo "4. Reiniciar el equipo en un tiempo."
echo "5. Suspender el equipo."
echo "6. Volver al menú principal de opciones."
echo "7. Salir del script."
echo ""
echo "#######################################################"
read -p "Selecciona la opción del submenú administración del equipo: " opsmadministrar
case $opsmadministrar in
1)
clear
# COMANDO PARA APAGAR EL ORDENADOR DE FORMA INSTANTÁNEA
sudo shutdown -h now
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE ADMINISTRACIÓN"
echo ""
read
administrarequipo_menu
;;
2)
clear
read -p "Introduce el tiempo en minutos para apagar el ordenador: " tiempoapagar
# COMANDO PARA APAGAR EL ORDENADOR EN UN TIEMPO
sudo shutdown -h +$tiempoapagar
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE ADMINISTRACIÓN"
echo ""
read
administrarequipo_menu
;;
3)
clear
# COMANDO PARA REINICIAR EL ORDENADOR DE FORMA INSTANTÁNEA
sudo shutdown -r now
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE ADMINISTRACIÓN"
echo ""
read
administrarequipo_menu
;;
4)
clear
read -p "Introduce el tiempo en minutos para reiniciar el ordenador: " tiempoapagar
# COMANDO PARA REINICIAR EL ORDENADOR EN UN TIEMPO
sudo shutdown -r +$tiempoapagar
echo ""
echo "PRESIONA ENTER PARA VOLVER AL SUBMENÚ DE ADMINISTRACIÓN"
echo ""
read
administrarequipo_menu
;;
5)
# COMANDO PARA SUSPENDER EL ORDENADOR
sudo systemctl suspend
;;
6)
clear
menu_principal
;;
7)
clear
exit
;;
esac
}
#

#
# FUNCIÓN MENÚ PRINCIPAL (SE EFECTÚA CUANDO SE EJECUTA EL SCRIPT)
#
menu_principal() {
# LIMPIAMOS PARA QUE QUEDE TODO MÁS BONITO
clear
# MOSTRAMOS EL MENÚ
echo "#######################################################"
echo "#                                                     #"
echo "#                  OPCIONES DE REDES                  #"
# GUARDAMOS LA FECHA EN UNA VARIABLE CON UN FORMATO PARA MOSTRARLA EN UN SITIO ESPECÍFICO (QUEDE CENTRADA Y MÁS ESTÉTICA)
fecha_actual=$(date +%F)
echo "#                     " $fecha_actual "                    #"
echo "#                                                     #"
echo "#######################################################"
echo ""
echo "1. Hacer ping a una IP (submenú)."
echo "2. Información de la interfaz de red (submenú)."
echo "3. Permisos (submenú)."
echo "4. Crear usuarios (submenú)."
echo "5. Administrar grupos (submenú)."
echo "6. Historial (submenú)."
echo "7. Administrar el estado del equipo (submenú)."
echo "8. Mostrar direcciones IP en uso en la red local."
echo "9. Mostrar tabla de enrutamiento."
echo "10. Configurar IP, máscara y puerta de enlace."
echo "11. Habilitar una dirección IP específica."
echo "12. Bloquear una dirección IP específica."
echo "13. Abrir un puerto."
echo "14. Cerrar un puerto."
echo "15. Mostrar estado del UFW."
echo "16. Configurar DNS primario y secundario."
echo "17. Instalar paquete."
echo "18. Actualizar paquete."
echo "19. Actualizar todos los paquetes."
echo "20. Buscar algo en Google."
echo "21. Buscar algo en Youtube."
echo "22. Ayuda comandos (web)."
echo "23. Abrir otra terminal."
echo "24. Abrir el gedit."
echo "25. Abrir la calculadora."
echo "26. Abrir el explorador de archivos."
echo "27. Abrir la papelera."
echo "28. Abrir las descargas."
echo "29. Ver los últimos 10 archivos recientes."
echo "30. Salir del script."
echo ""
echo "#######################################################"
# LEER VARIABLE
read -p "Selecciona la opción: " op
# DETECTAR OPCIÓN SELECCIONADA
case $op in 
1)
clear
ping_menu
;;
2)
clear
ifconfig_menu
;;
3)
clear
permisos_menu
;;
4)
clear
usuarios_menu
;;
5)
grupos_menu
;;
6)
historial_menu
;;
7)
administrarequipo_menu
;;
8)
clear
echo "Direcciones IP en uso en la red local:"
# COMANDO PARA MOSTRAR LAS DIRECCIONES IP
arp -an
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
9)
clear
echo "Tabla de enrutamiento:"
# COMANDO PARA MOSTRAR LA TABLA DE ENRUTAMIENTO
route -n
# LE MOSTRAMOS UN MENSAJE PARA QUE PRESIONE UNA TECLA Y VUELVA HACIA ATRÁS, ASÍ NO SE SALE DEL MENÚ
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
# CON EL READ PAUSAMOS Y AL PRESIONAR UNA TECLA, CONTINÚA PERO NO GUARDA NADA PORQUE NO HAY NINGUNA VARIABLE DETRÁS. POR ÚLTIMO, LE VOLVIMOS A ABRIR EL MENÚ PRINCIPAL
read
menu_principal
;;
10)
clear
# LE PEDIMOS LAS 4 COSAS QUE NECESITAMOS (INTERFAZ DE RED, NUEVA DIRECCIÓN IP, MÁSCARA DE SUBRED Y PUERTA DE ENLACE)
read -p "Introduce el nombre de la interfaz: " interfaz
read -p "Introduce la dirección IP: " direccion_ip
read -p "Introduce la máscara de subred: " mascara
read -p "Introduce la dirección de la puerta de enlace: " puerta_de_enlace
# COMANDO PARA CAMBIAR LA DIRECCIÓN IP Y LA MÁSCARA TENIENDO EL NOMBRE DE LA INTERFAZ DE RED (IMPORTANTE)
sudo ifconfig $interfaz $direccion_ip netmask $mascara
# COMANDO PARA CAMBIAR LA PUERTA DE ENLACE TENIENDO EL NOMBRE DE LA INTERFAZ DE RED (IMPORTANTE)
sudo route add default gw $puerta_de_enlace $interfaz
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
11)
clear
# LE PEDIMOS LA IP QUE QUIERE HABILITAR
read -p "Introduce la dirección IP a habilitar: " ip_a_habilitar
# COMANDO DE IPTABLES PARA HABILITAR UNA DIRECCIÓN IP
sudo iptables -I INPUT -s $ip_a_habilitar -j ACCEPT
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
12)
clear
# LE PEDIMOS LA IP QUE QUIERE BLOQUEAR
read -p "Introduce la dirección IP a bloquear: " ip_a_bloquear
# COMANDO DE IPTABLES PARA BLOQUEAR UNA DIRECCIÓN IP
sudo iptables -A INPUT -s $ip_a_bloquear -j DROP
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
13)
clear
# LE PEDIMOS EL PUERTO QUE QUIERE ABRIR
read -p "Introduce el puerto a abrir: " puertoabrir
# COMANDO DE UNCOMPLICATED FIREWALL (UFW) PARA ABRIR UN PUERTO
sudo ufw allow $puertoabrir
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
14)
clear
read -p "Introduce el puerto a cerrar: " puertocerrar
# COMANDO DE UNCOMPLICATED FIREWALL (UFW) PARA CERRAR UN PUERTO
sudo ufw deny $puertocerrar
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
15)
clear
echo "Estado del UFW:"
# COMANDO DE UNCOMPLICATED FIREWALL (UFW) PARA VER EL ESTADO DEL FIREWALL Y COMPROBAR PUERTOS, IPS...
sudo ufw status
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
16)
clear
# LE MOSTRAMOS UN MENSAJE DE QUE SE LE VA A ABRIR UNA CONFIGURACIÓN
echo "####################################"
echo ""
echo "ABRIENDO ARCHIVO PARA CAMBIAR DNS..."
echo "       MODIFÍCALO Y GUÁRDALO        "
echo ""
echo "PARA VOLVER AL MENÚ PRINCIPAL PULSA:"
echo "               ENTER                "
echo " (Una vez hayas guardado el archivo)"
echo "####################################"
# PONEMOS 4 SEGUNDITOS DE ESPERA PARA QUE LE DÉ TIEMPO A LEER EL MENSAJE
sleep 4
# LE ABRIMOS EL ARCHIVO EN DONDE SE CONFIGURAN LAS DNS
nano /etc/resolv.conf
read
menu_principal
;;
17)
clear
read -p "Introduce el nombre del paquete a instalar: " paqueteainstalar
# COMANDO PARA INSTALAR UN PAQUETE
apt-get install $paqueteainstalar
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
18)
clear
read -p "Introduce el nombre del paquete a actualizar: " paqueteaactualizar
# COMANDO PARA ACTUALIZAR UN PAQUETE
apt-get update $paqueteaactualizar
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
19)
# COMANDO PARA ACTUALIZAR TODOS LOS PAQUETES
sudo apt update&&upgrade
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
20)
read -p "Introduce lo que quieras buscar en Google: " searchgoogle
# BUSCAR EN GOOGLE LO QUE PONGAS
xdg-open "https://www.google.com/search?q=$searchgoogle"
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
21)
read -p "Introduce lo que quieras buscar en Youtube: " searchyt
# BUSCAR EN YOUTUBE LO QUE PONGAS
xdg-open "https://www.youtube.com/results?search_query=$searchyt"
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
22)
# BUSCAR EN GOOGLE LA PÁGINA WEB DE LOS COMANDOS
xdg-open "https://blog.desdelinux.net/mas-de-400-comandos-para-gnulinux-que-deberias-conocer/"
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
23)
echo ""
echo "ABRIENDO UNA TERMINAL NUEVA..."
echo ""
# EL SLEEP SI LO HACEMOS ASÍ, SE HACE DE MEDIO SEGUNDO SOLO. OTRO EJEMPLO -> .7 (SERÍA DE 0,7 SEGUNDOS)
sleep .5
# COMANDO PARA ABRIR UNA TERMINAL
gnome-terminal
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
24)
clear
echo ""
echo "ABRIENDO EL GEDIT..."
echo ""
sleep .5
# COMANDO PARA ABRIR EL GEDIT
gedit
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
25)
clear
echo ""
echo "ABRIENDO LA CALCULADORA..."
echo ""
sleep .5
# COMANDO PARA ABRIR LA CALCULADORA
gnome-calculator
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
26)
clear
echo ""
echo "ABRIENDO EL EXPLORADOR DE ARCHIVOS..."
echo ""
sleep .5
# COMANDO PARA ABRIR EL EXPLORADOR DE ARCHIVOS
nautilus
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
27)
clear
echo ""
echo "ABRIENDO LA PAPELERA..."
echo ""
sleep .5
# COMANDO PARA ABRIR LA PAPELERA
nautilus trash://
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
28)
clear
echo ""
echo "ABRIENDO LAS DESCARGAS..."
echo ""
sleep .5
# COMANDO PARA ABRIR LAS DESCARGAS
nautilus Descargas
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
29)
clear
read -p "Introduce tu nombre de usuario: " usuario
cd /home/$usuario
# COMANDO PARA LISTAR LOS ARCHIVOS RECIENTES
ls -lt | head
echo ""
echo "PRESIONA ENTER PARA VOLVER AL MENÚ PRINCIPAL"
echo ""
read
menu_principal
;;
30)
clear
exit
;;
*)
clear
echo "################################"
echo ""
echo "BOBO, ESTA OPCIÓN NO EXISTE:"
echo "PRESIONA ENTER PARA VOLVER ANDA"
echo ""
echo "################################"
read
menu_principal
;;
# CIERRE DEL CASE (EN BASH SIEMPRE QUE SE ABRE SE TIENE QUE CERRAR) EJEMPLO -> IF -> FI
esac
}
menu_principal
