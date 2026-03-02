![Neovim Setup](./assets/Image.png)

# Neovim Config

Configuración moderna de Neovim con LSP, autocompletado y soporte para desarrollo web.

## Stack

**LSP Servers:** `lua_ls` · `ts_ls` · `sqlls`
**Plugin Manager:** Lazy.nvim
**Tema:** Night Owl

## Plugins

| Plugin | Función |
|--------|---------|
| **telescope** | Fuzzy finder |
| **nvim-cmp** | Autocompletado |
| **treesitter** | Syntax highlighting |
| **mason** | LSP installer |
| **neo-tree** | File explorer |
| **lualine** | Statusline |
| **gitsigns** | Git integration |
| **trouble** | Diagnostics panel |

## Keymaps

**Leader:** `<Space>`

| Atajo | Acción |
|-------|--------|
| `<leader>e` | Toggle file explorer |
| `<leader>aa` | Dashboard |
| `gd` | Go to definition |
| `K` | Hover docs |
| `<leader>ca` | Code actions |
| `<leader>rn` | Rename symbol |
| `[d` / `]d` | Navigate diagnostics |
| `gcc` | Toggle comment |

## Instalación

```bash
git clone https://github.com/tu-usuario/nvim-config ~/.config/nvim
nvim  # Los plugins se instalarán automáticamente
```

Ejecuta `:Mason` para verificar LSP servers instalados.
