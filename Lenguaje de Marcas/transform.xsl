<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:output method="html" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html lang="es">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Reporte de usuarios y roles</title>
        <link rel="stylesheet" href="../css/style.css"/>
      </head>
      <body>
        <div class="container">
          <header class="hero">
            <h1>Reporte de usuarios y roles</h1>
            <p>
              Panel de control del sistema de usuarios de
              <strong><xsl:value-of select="sistema_usuarios/@empresa"/></strong>
              </p>
            <p>
              <strong>Fecha de generación:</strong>
              <xsl:value-of select="sistema_usuarios/@fecha_generacion"/>
            </p>
          </header>
<section class="stats-grid">
            <article class="stat-card">
              <span class="label">Usuarios totales</span>
              <span class="value">
                <xsl:value-of select="count(sistema_usuarios/usuarios/usuario)"/>
              </span>
            </article>

            <article class="stat-card">
              <span class="label">Activos</span>
              <span class="value">
                <xsl:value-of select="count(sistema_usuarios/usuarios/usuario[@estado='activo'])"/>
              </span>
            </article>

            <article class="stat-card">
              <span class="label">Inactivos</span>
              <span class="value">
                <xsl:value-of select="count(sistema_usuarios/usuarios/usuario[@estado='inactivo'])"/>
              </span>
            </article>

            <article class="stat-card">
              <span class="label">Bloqueados</span>
              <span class="value">
                <xsl:value-of select="count(sistema_usuarios/usuarios/usuario[@estado='bloqueado'])"/>
              </span>
            </article>
          </section>

          <nav class="nav-box">
            <a href="#roles">Roles</a>
            <a href="#usuarios-activos">Usuarios activos</a>
            <a href="#usuarios-bloqueados">Usuarios bloqueados</a>
            <a href="#todos">Todos los usuarios</a>
          </nav>

          <section id="roles">
            <h2>Listado de roles</h2>
            <div class="cards">
              <xsl:for-each select="sistema_usuarios/roles/rol">
                <article class="card">
                  <h3><xsl:value-of select="@nombre"/></h3>
                  <p><strong>ID:</strong> <xsl:value-of select="@id"/></p>
                  <p><strong>Nivel:</strong> <xsl:value-of select="@nivel"/></p>
                  <p><xsl:value-of select="descripcion"/></p>
                </article>
              </xsl:for-each>
            </div>
          </section>

          <section id="usuarios-activos">
            <h2>Usuarios activos</h2>
            <table>
              <thead>
                <tr>
                  <th>ID</th>
                  <th>Nombre</th>
                  <th>Departamento</th>
                  <th>Rol</th>
                  <th>Estado</th>
                  <th>Último acceso</th>
                </tr>
              </thead>
              <tbody>
                <xsl:for-each select="sistema_usuarios/usuarios/usuario[@estado='activo']">
                  <tr>
                    <td data-label="ID">
                      <xsl:value-of select="@id"/>
                    </td>
                    <td data-label="Nombre">
                      <xsl:value-of select="concat(nombre, ' ', apellidos)"/>
                    </td>
                    <td data-label="Departamento">
                      <xsl:value-of select="departamento"/>
                    </td>
                    <td data-label="Rol">
                      <xsl:variable name="rolActual" select="@rol"/>
                      <xsl:value-of select="/sistema_usuarios/roles/rol[@id=$rolActual]/@nombre"/>
                    </td>
                    <td data-label="Estado">
                      <span class="status-badge status-activo">Activo</span>
                    </td>
                     <td data-label="Último acceso">
                      <xsl:value-of select="ultimo_acceso"/>
                    </td>
                  </tr>
                </xsl:for-each>
              </tbody>
            </table>
          </section>

          <section id="usuarios-bloqueados">
            <h2>Usuarios bloqueados</h2>
            <xsl:choose>
              <xsl:when test="count(sistema_usuarios/usuarios/usuario[@estado='bloqueado']) &gt; 0">
                <div class="cards">
                  <xsl:for-each select="sistema_usuarios/usuarios/usuario[@estado='bloqueado']">
                    <article class="user-box">
<h3><xsl:value-of select="concat(nombre, ' ', apellidos)"/></h3>
                      <p><strong>Correo:</strong> <xsl:value-of select="email"/></p>
                      <p><strong>Departamento:</strong> <xsl:value-of select="departamento"/></p>
                      <p>
                        <span class="status-badge status-bloqueado">Bloqueado</span>
                      </p>
                    </article>
                  </xsl:for-each>
                </div>
              </xsl:when>
              <xsl:otherwise>
                <p>No hay usuarios bloqueados.</p>
              </xsl:otherwise>
            </xsl:choose>
          </section>

          <section id="todos">
            <h2>Todos los usuarios</h2>
            <div class="cards">
              <xsl:for-each select="sistema_usuarios/usuarios/usuario">
                <article class="user-box">
                  <h3><xsl:value-of select="concat(nombre, ' ', apellidos)"/></h3>

                  <p>
                    <strong>Estado:</strong>
                    <xsl:text> </xsl:text>
                    <xsl:choose>
                      <xsl:when test="@estado='activo'">
                        <span class="status-badge status-activo">Activo</span>
                      </xsl:when>
                      <xsl:when test="@estado='inactivo'">
                        <span class="status-badge status-inactivo">Inactivo</span>
                      </xsl:when>
                      <xsl:otherwise>
                        <span class="status-badge status-bloqueado">Bloqueado</span>
                      </xsl:otherwise>
                    </xsl:choose>
                  </p>

                  <p><strong>Correo:</strong> <xsl:value-of select="email"/></p>
                  <p><strong>Departamento:</strong> <xsl:value-of select="departamento"/></p>

                  <p>
                    <strong>Rol:</strong>
                    <xsl:text> </xsl:text>
                    <xsl:variable name="rolUsuario" select="@rol"/>
                    <span class="role-tag">
                      <xsl:value-of select="/sistema_usuarios/roles/rol[@id=$rolUsuario]/@nombre"/>
                    </span>
                  </p>

                  <p><strong>Permisos:</strong></p>
                  <ul>
                    <xsl:for-each select="permisos/permiso">
                      <li>
                        <xsl:value-of select="@tipo"/>:
                        <xsl:value-of select="."/>
                      </li>
                    </xsl:for-each>
                  </ul>
                </article>
              </xsl:for-each>
            </div>
          </section>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
