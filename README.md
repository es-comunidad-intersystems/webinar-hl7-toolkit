# hl7webinar
En este repositorio esta el codigo/configuracion usada en el webinar del 29 de abirl/2020. 

# montar la demo
1) bajar el contenido de la carpeta src para una carpeta local
2) bajar del docker hub un imagen de InterSystems IRIS for Health:
docker run --name iris4health -d --publish 51773:51773 --publish 52773:52773 --volume /"mi carpet local donde me he bajado el contenido de src":/durable store/intersystems/irishealth-community:2020.1.0.215.0
3) Crear un nuevo namespace con una producción estandar FHIR STU3. Desde el terminal:
~~~    
zn "HSLIB"  
do ##class(HS.HC.Util.Installer.FHIR).Install()  
Namespace : DEMO1  
Install DSTU2? (Y/N) N  
Install STU3? (Y/N) Y  
STU3 CSP App //Press Enter to accept default  
STU3 CSP Open ID Connect (OAuth 2.0) app //Press Enter to accept default  
Install STU3 resource repository? (Y/N) Y  
Install STU3 PIXm (Y/N) N  
Install STU3 PDQm? (Y/N) N  
Install STU3 MHD? (Y/N) N  
Continue with Installation? (Y/N) Y
~~~
4) Desde el terminal:
~~~    
zn "DEMO1"  
do ##class(%SYSTEM.OBJ).Load("carpet local donde me he bajado el contenido de src/webinardemo.xml","cdk")  
~~~
5) Desde el Portal de Administración, acceder al namespace creado y iniciar la producción imortada.
6) Probar con los archivos de la carpeta IN.
