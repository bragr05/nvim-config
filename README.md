![My Neovim Setup](./assets/image01.png)

# My Personal Neovim Config

![Neovim Version](https://img.shields.io/badge/Neovim-v0.9.0%2B-57ADEE?style=for-the-badge&logo=neovim&logoColor=white)
![Plugin Manager](https://img.shields.io/badge/Plugin%20Manager-Lazy.nvim-073142?style=for-the-badge&logo=neovim&logoColor=white)
![Built with Lua](https://img.shields.io/badge/Built%20with-Lua-blueviolet?style=for-the-badge&logo=lua&logoColor=white)
![Theme](https://img.shields.io/badge/Theme-Night%20Owl-5B718D?style=for-the-badge&logoColor=white)
![OS Compatible](https://img.shields.io/badge/OS-Linux%20%7C%20macOS%20%7C%20Windows-informational?style=for-the-badge)

My personal Neovim configuration focused on speed, efficiency, and a clean interface for daily development. Built entirely in Lua and managed with `lazy.nvim`.

## ✨ Core Features & Plugins

*   **Plugin Management**: `lazy.nvim`
*   **Keymaps**: Custom, intuitive keybindings (`lua/core/keymaps.lua`).
*   **Options**: Sensible Neovim defaults (`lua/core/options.lua`).
*   **Theme**: `Night Owl` (`lua/core/theme.lua`, `lua/plugins/night-owl.lua`).
*   **Dashboard**: `Alpha`
*   **Statusline**: `Lualine`
*   **File Explorer**: `Neo-tree`
*   **Fuzzy Finder**: `Telescope`

## 🚀 Installation

### Prerequisites

*   Neovim (v0.9.0+)
*   `git`
*   A Nerd Font

### Steps

1.  **Clone the config:**
    ```bash
    git clone https://github.com/your_username/your_dotfiles_repo.git ~/.config/nvim
    ```
    (Remember to replace the repo URL with your own)

2.  **Launch Neovim:**
    ```bash
    nvim
    ```
    Plugins will install automatically on first launch.

## 💡 Usage

*   **Leader Key**: `<Space>`
*   Explore `lua/core/keymaps.lua` for specific keybindings.
