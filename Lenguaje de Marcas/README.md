# Proyecto Intermodular - Lenguaje de Marcas

Tema elegido: **Usuarios y roles**.

## Estructura

- `xml/datos.xml`: documento XML principal
- `xml/modelo.dtd`: DTD de validación
- `xml/datos_incorrectos.xml`: XML con errores para demostrar la validación
- `xml/transform.xsl`: transformación XSLT a HTML
- `css/style.css`: estilos del reporte HTML
- `json/datos.json`: JSON equivalente

## Validación

```bash
xmllint --noout --dtdvalid xml/modelo.dtd xml/datos.xml
xmllint --noout --dtdvalid xml/modelo.dtd xml/datos_incorrectos.xml
```

## Generación HTML

```bash
xsltproc xml/transform.xsl xml/datos.xml > reporte.html
```
