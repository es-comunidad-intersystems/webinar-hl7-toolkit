# Herramientas de Productividad HL7
En este repositorio esta el código/configuración usado en el webinar HL7 Toolkit del 29 de abril/2020. La grabación del webinar está disponible aqui [Herramientas de Productividad HL7](https://comunidadintersystems.com/webinar-interoperabilidad-herramientas-de-productividad-hl7)

## Montar la demo
1) descargar el contenido de la carpeta src a una carpeta local. En el ejemplo usaremos `$localfolder`
2) descargar la imagen del docker hub de InterSystems IRIS for Health:
```bash
docker run --name iris4health -d --publish 51773:51773 --publish 52773:52773 --volume /$localfolder:/durable store/intersystems/irishealth-community:2020.1.0.215.0
```
3) Crear un nuevo namespace con una producción estándar FHIR STU3. 
Desde el terminal:
```bash
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
```
4) Desde el terminal:
```bash
zn "DEMO1"  
do ##class(%SYSTEM.OBJ).Load("$localfolder/webinardemo.xml","cdk")  
```
5) Desde el Portal de Administración, acceder al namespace creado y iniciar la producción importada.
6) Probar con los archivos adjuntos. El ADT_A06 servirá para probar la producción HL7 - carpeta from_er. El archivo ADT_A01 permite probar la producción hl7-fhir - carpeta from_his.
