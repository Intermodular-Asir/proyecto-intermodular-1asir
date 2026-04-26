# Validación del proyecto

## Comandos previstos

```bash
xmllint --noout --dtdvalid xml/modelo.dtd xml/datos.xml
xmllint --noout --dtdvalid xml/modelo.dtd xml/datos_incorrectos.xml
xsltproc xml/transform.xsl xml/datos.xml > reporte.html
```

## Resultado esperado

- `datos.xml` debe validar correctamente contra `modelo.dtd`.
- `datos_incorrectos.xml` debe fallar porque:
  - usa `estado="pendiente"`, que no está permitido por la enumeración del DTD,
  - referencia `rol="r_inexistente"`, que no existe.
- `transform.xsl` genera `reporte.html` con portada, navegación, secciones y tablas.
