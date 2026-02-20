![My Neovim Setup](./assets/image01.png)

# Plugins Instalados

| Nombre del Plugin | Descripción | Propósito |
|-------------------|-------------|-----------|
| **lazy.nvim** | Gestor de plugins moderno | Administrar e instalar plugins automáticamente |
| **alpha-nvim** | Dashboard de inicio personalizable | Pantalla de bienvenida con atajos rápidos |
| **lualine.nvim** | Statusline elegante y configurable | Mostrar información del editor en la barra de estado |
| **neo-tree.nvim** | Explorador de archivos en árbol | Navegar, crear, editar y mover archivos/carpetas |
| **telescope.nvim** | Buscador fuzzy potente | Buscar archivos, texto, comandos, etc. |
| **night-owl.nvim** | Tema de colores Night Owl | Esquema de colores oscuro y moderno |
| **nvim-treesitter** | Resaltado de sintaxis avanzado | Mejor highlighting y navegación de código |
| **render-markdown.nvim** | Renderizado de Markdown | Visualizar Markdown con formato en el editor |
| **mason.nvim** | Instalador de LSP/DAP/linters | Gestionar servidores de lenguaje y herramientas |
| **mason-lspconfig.nvim** | Puente Mason + LSP | Integrar Mason con configuración LSP |
| **nvim-cmp** | Motor de autocompletado | Autocompletado inteligente mientras escribes |
| **cmp-nvim-lsp** | Source LSP para nvim-cmp | Sugerencias desde el servidor de lenguaje |
| **cmp-buffer** | Source buffer para nvim-cmp | Autocompletado desde el buffer actual |
| **cmp-path** | Source path para nvim-cmp | Autocompletado de rutas de archivos |
| **LuaSnip** | Motor de snippets | Expandir plantillas de código rápidamente |
| **cmp_luasnip** | Integración snippets + cmp | Mostrar snippets en autocompletado |
| **friendly-snippets** | Colección de snippets | Snippets predefinidos para múltiples lenguajes |
| **gitsigns.nvim** | Integración Git | Mostrar cambios, blame, y navegar hunks |
| **Comment.nvim** | Comentarios inteligentes | Comentar/descomentar código rápidamente |
| **nvim-autopairs** | Cierre automático de pares | Cerrar automáticamente paréntesis, comillas, etc. |
| **which-key.nvim** | Guía de atajos de teclado | Mostrar atajos disponibles mientras escribes |
| **indent-blankline.nvim** | Guías de indentación | Visualizar niveles de indentación |
| **trouble.nvim** | Lista de diagnósticos | Ver errores, warnings y referencias |
| **nvim-colorizer.lua** | Visualizador de colores | Mostrar colores en códigos hex/rgb |

## Plugins Removidos

Los siguientes plugins fueron removidos de la configuración para mantenerla más minimalista:

| Plugin | Razón de Eliminación |
|--------|---------------------|
| **toggleterm.nvim** | Terminal flotante - Se puede usar el terminal nativo de Neovim con `:terminal` |
| **nvim-surround** | Manipulación de pares - Funcionalidad no esencial para el flujo de trabajo actual |

---

# Atajos de Teclado

## 📖 Notación de Teclas

| Notación | Significado (Mac) |
|----------|-------------------|
| `<leader>` | Tecla Espacio |
| `Ctrl+n` | Control (⌃) + n |
| `Enter` | Tecla Enter/Return |
| `Esc` | Tecla Escape |

> **Leader Key configurada:** `Espacio`

## 📋 Dashboard (Alpha)

### Atajo Global

| Atajo | Acción |
|-------|--------|
| `Espacio + a + a` | Volver al Dashboard |

### Atajos en el Dashboard

Atajos disponibles al abrir Neovim o al volver al dashboard:

| Tecla | Acción |
|-------|--------|
| `f` | 🔍 Buscar Archivo |
| `r` | 🕒 Recientes |
| `g` | 📝 Buscar Texto |
| `e` | 📁 Explorador |
| `q` | 🚪 Salir |

## 🗂️ Neo-tree (Explorador de Archivos)

### Atajos Globales

| Atajo | Acción |
|-------|--------|
| `<leader>e` | Toggle Neo-tree |
| `<leader>o` | Enfocar Neo-tree |
| `<leader>bf` | Ver Buffers |

### Atajos Internos (dentro de Neo-tree)

| Tecla | Acción |
|-------|--------|
| `a` | Crear archivo/carpeta (agregar `/` al final para carpeta) |
| `d` | Eliminar |
| `r` | Renombrar |
| `c` | Copiar |
| `x` | Cortar |
| `p` | Pegar |
| `m` | Mover |
| `?` | Ver todos los atajos disponibles |

## 🔭 Telescope (Buscador)

### Atajos Internos (dentro de Telescope)

| Atajo | Acción |
|-------|--------|
| `Ctrl+n` o `↓` | Siguiente resultado |
| `Ctrl+p` o `↑` | Resultado anterior |
| `Ctrl+c` o `Esc` | Cerrar |
| `Enter` | Abrir archivo seleccionado |
| `Ctrl+x` | Abrir en split horizontal |
| `Ctrl+v` | Abrir en split vertical |
| `Ctrl+t` | Abrir en nueva pestaña |
| `Ctrl+u` | Scroll preview arriba |
| `Ctrl+d` | Scroll preview abajo |

## ⚡ Lazy.nvim (Gestor de Plugins)

| Comando | Acción |
|---------|--------|
| `:Lazy` | Abrir panel de Lazy |
| `:Lazy update` | Actualizar plugins |
| `:Lazy sync` | Sincronizar plugins |
| `:Lazy clean` | Limpiar plugins no usados |

## 🌳 Treesitter

| Comando | Acción |
|---------|--------|
| `:TSUpdate` | Actualizar parsers |
| `:TSInstall <lang>` | Instalar parser de lenguaje |

## 🔧 LSP (Language Server Protocol)

### Atajos Globales

| Atajo | Acción |
|-------|--------|
| `gd` | Ir a definición |
| `K` | Mostrar documentación hover |
| `<leader>ca` | Ver code actions disponibles |
| `<leader>rn` | Renombrar símbolo |
| `[d` | Diagnóstico anterior |
| `]d` | Diagnóstico siguiente |

### Comandos

| Comando | Acción |
|---------|--------|
| `:Mason` | Abrir panel de Mason |
| `:LspInfo` | Información del LSP activo |
| `:LspInstall <server>` | Instalar servidor LSP |

## 💬 Autocompletado (nvim-cmp)

### Atajos en Modo Insert

| Atajo | Acción |
|-------|--------|
| `Ctrl+Space` | Activar autocompletado |
| `Tab` | Siguiente sugerencia / expandir snippet |
| `Shift+Tab` | Sugerencia anterior |
| `Enter` | Confirmar selección |
| `Ctrl+e` | Cancelar autocompletado |
| `Ctrl+b` | Scroll documentación arriba |
| `Ctrl+f` | Scroll documentación abajo |

## 🌿 Git (Gitsigns)

| Atajo | Acción |
|-------|--------|
| `<leader>gb` | Git blame de la línea actual |
| `<leader>gp` | Preview del cambio (hunk) |
| `<leader>gr` | Revertir cambio (hunk) |
| `]c` | Siguiente cambio |
| `[c` | Cambio anterior |

## 💬 Comentarios (Comment.nvim)

| Atajo | Acción |
|-------|--------|
| `gcc` | Comentar/descomentar línea actual |
| `gbc` | Comentar/descomentar bloque |
| `gc` | Comentar selección (modo visual) |

## 🔍 Trouble (Diagnósticos)

| Atajo | Acción |
|-------|--------|
| `<leader>xx` | Toggle Trouble (todos los diagnósticos) |
| `<leader>xd` | Diagnósticos del buffer actual |
| `<leader>xl` | Location List |
| `<leader>xq` | Quickfix List |

## 🎨 Extras

- **Autopairs**: Cierra automáticamente paréntesis, llaves y comillas
- **Indent Blankline**: Muestra líneas de indentación
- **Colorizer**: Muestra colores en códigos hexadecimales (#ff0000)
- **Which-Key**: Muestra atajos disponibles al presionar `<leader>`
