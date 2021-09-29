FROM nginx:1.19.6

# Lanzamos el renderizador de plantillas
COPY --from=hairyhenderson/gomplate:v3.8.0-slim /gomplate /bin/gomplate
# Le pasamos el fichero de configuración de nginx como plantilla, ubicado en la carpeta assets
COPY assets/ /assets
# El directorio de trabajo es el siguiente
WORKDIR /var/www/html
# Los puertos que se van a exponer
EXPOSE 80 443

# Ejecutamos el script para que nginx cargue la configuración de la plantilla
ENTRYPOINT ["/bin/bash","/assets/bin/docker-entrypoint.sh"]
# Ponemos nginx en primer plano
CMD ["nginx", "-g", "daemon off;"]