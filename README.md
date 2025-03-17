# Dotfiles & Development Environment Setup

A collection of configuration files and setup scripts for my development environment across macOS and Linux systems.

## 🗂 Structure

```
.
├── linux/          # Linux-specific configurations
│   ├── .aliases    # Linux shell aliases
│   ├── .vimrc      # Vim configuration
│   └── .vimrc-toys # Additional Vim plugins and settings
├── macos/          # macOS-specific configurations
│   ├── .aliases    # macOS shell aliases
│   ├── .vimrc      # Vim configuration
│   └── nvim/       # Neovim configuration with LazyVim
```

## ⚡️ Key Features

### Shell Aliases
- Comprehensive set of aliases for:
  - Docker and container management
  - Git operations
  - Package managers (npm, yarn, pnpm)
  - Python development
  - Kubernetes (kubectl, minikube)
  - System utilities

### Vim/Neovim Configuration
- Modern Neovim setup using LazyVim
- Extensive plugin collections for:
  - Code completion and LSP support
  - File navigation (NERDTree)
  - Git integration
  - Syntax highlighting
  - TypeScript/JavaScript development
  - Code formatting and linting
- Integration with productivity tools like WakaTime
- AI-powered coding assistance with Augment

### Development Tools
- Docker workflow optimization
- Kubernetes tools configuration
- Database management utilities
- Development environment helpers

## 🚀 Getting Started

1. Clone this repository:
```bash
git clone [repository-url] dotfiles
```

2. Choose your platform (macOS or Linux) and copy the relevant configuration files:
```bash
# For macOS
cp -r macos/* ~/

# For Linux
cp -r linux/* ~/
```

3. Install Neovim plugins (if using Neovim):
```bash
# For LazyVim setup
git clone https://github.com/LazyVim/LazyVim ~/.config/nvim
```

4. Source your new configurations:
```bash
source ~/.zshrc  # or ~/.bashrc
```

## 🔧 Customization

- Shell aliases can be modified in the respective `.aliases` files
- Vim/Neovim configurations can be customized in:
  - `.vimrc` for Vim
  - `nvim/init.lua` for Neovim
- LazyVim plugins can be managed in `nvim/lua/config/lazy.lua`

## 📝 License

This project is open-source and available under the MIT License.

## 🤝 Contributing

Feel free to submit issues and enhancement requests!