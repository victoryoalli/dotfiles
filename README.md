# Dotfiles

Configuración personal de shell para macOS con herramientas CLI modernas.

## Instalación

```bash
git clone git@github.com:victoryoalli/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

## Estructura

```
.dotfiles/
├── shell/
│   ├── .zshrc          # Configuración principal de Zsh
│   ├── .aliases        # Aliases de comandos
│   ├── .exports        # Variables de entorno
│   ├── .functions      # Funciones útiles
│   ├── .gitconfig      # Configuración de Git (con delta)
│   ├── .ripgreprc      # Configuración de ripgrep
│   ├── .vimrc          # Configuración de Vim
│   └── .ackrc          # Configuración de ack
├── macos/
│   └── brewinstall.sh  # Instalación de Homebrew packages
├── vscode/             # Configuración de VS Code
└── install.sh          # Script de instalación
```

## Herramientas CLI configuradas

| Herramienta | Descripción | Alias |
|-------------|-------------|-------|
| **eza** | Reemplazo moderno de `ls` | `ls`, `ll`, `lt` |
| **bat** | Reemplazo de `cat` con syntax highlighting | `cat`, `c`, `cc` |
| **fd** | Reemplazo rápido de `find` | Integrado con fzf |
| **ripgrep** | Búsqueda ultrarrápida | `rg` |
| **fzf** | Fuzzy finder | `Ctrl+R`, `Ctrl+T` |
| **zoxide** | Navegación inteligente de directorios | `z` |
| **git-delta** | Diffs bonitos | Automático en git |
| **bottom** | Monitor de sistema moderno | `top`, `htop` |
| **ncdu** | Uso de disco interactivo | `du` |
| **glow** | Renderizar markdown | `readme` |
| **yt-dlp** | Descargar videos | `yt`, `yta`, `ytv` |
| **gh** | GitHub CLI | `pr`, `issue`, `repo` |
| **ollama** | LLMs locales | `ai`, `aic` |

## Atajos de teclado (fzf)

| Atajo | Acción |
|-------|--------|
| `Ctrl+R` | Buscar en historial de comandos |
| `Ctrl+T` | Buscar archivos con preview |
| `Alt+C` | Navegar a directorio |

## Aliases útiles

### Git
```bash
g       # git
gs      # git status
ga      # git add .
gc      # git checkout
gcb     # git checkout -b
gpo     # git push -u origin
gplo    # git pull origin
glog    # git log con gráfico bonito
nah     # git reset --hard && git clean -df
wip     # commit rápido "wip"
```

### Laravel/PHP
```bash
art     # php artisan
artmf   # php artisan migrate:fresh --seed
tinker  # php artisan tinker
p       # phpunit
pe      # pest
pint    # pint (code style)
```

### Composer
```bash
co      # composer
ci      # composer install
cu      # composer update
cr      # composer require
```

---

## Manejo seguro de secretos y tokens

### El problema

Los tokens, API keys y credenciales **NUNCA** deben estar en archivos que se suben a Git porque:
- El historial de Git es permanente (aunque borres el archivo, queda en commits anteriores)
- Bots escanean GitHub constantemente buscando tokens expuestos
- Un token expuesto puede comprometer tus cuentas en minutos

### La solución: archivo `~/.secrets`

Este repositorio está configurado para cargar automáticamente un archivo `~/.secrets` que **NO está en Git**.

#### 1. Crear el archivo de secretos

```bash
# Crear el archivo
touch ~/.secrets

# Hacerlo privado (solo tú puedes leerlo)
chmod 600 ~/.secrets
```

#### 2. Agregar tus tokens

Edita `~/.secrets` con tu editor favorito:

```bash
# ~/.secrets - Este archivo NO debe estar en git

# GitHub
export GITHUB_TOKEN="ghp_xxxxxxxxxxxxxxxxxxxx"
export GITHUB_PACKAGE_REGISTRY_TOKEN="ghp_xxxxxxxxxxxxxxxxxxxx"

# NPM
export NPM_TOKEN="npm_xxxxxxxxxxxxxxxxxxxx"

# AWS
export AWS_ACCESS_KEY_ID="AKIA..."
export AWS_SECRET_ACCESS_KEY="..."

# OpenAI
export OPENAI_API_KEY="sk-..."

# Otros
export ANTHROPIC_API_KEY="sk-ant-..."
```

#### 3. Verificar que funciona

```bash
# Recargar shell
source ~/.zshrc

# Verificar que la variable existe (sin mostrar el valor)
echo ${GITHUB_TOKEN:+Token configurado}
```

### Si ya expusiste un token

**¡Actúa inmediatamente!**

1. **Revoca el token** en la plataforma correspondiente:
   - GitHub: [Settings → Developer settings → Personal access tokens](https://github.com/settings/tokens)
   - NPM: [Access Tokens](https://www.npmjs.com/settings/~/tokens)
   - AWS: IAM Console → Security credentials

2. **Genera un nuevo token** y guárdalo en `~/.secrets`

3. **Limpia el historial de Git** (si el token estaba en un commit):
   ```bash
   # Opción 1: Si fue el último commit
   git reset --soft HEAD~1
   # Editar el archivo para quitar el token
   git commit -m "Remove sensitive data"

   # Opción 2: Si está en commits antiguos (más complejo)
   # Usa git-filter-repo o BFG Repo-Cleaner
   brew install git-filter-repo
   git filter-repo --invert-paths --path archivo-con-token.sh
   ```

4. **Forzar push** (si ya habías subido):
   ```bash
   git push --force-with-lease
   ```

### Buenas prácticas

| Hacer | No hacer |
|-------|----------|
| Usar `~/.secrets` para tokens | Poner tokens en `.zshrc` o `.bashrc` |
| Usar variables de entorno | Hardcodear tokens en código |
| Rotar tokens regularmente | Usar el mismo token por años |
| Usar tokens con permisos mínimos | Crear tokens con todos los permisos |
| Revisar `.gitignore` antes de commit | Hacer `git add .` sin revisar |

### Verificar antes de hacer commit

```bash
# Buscar posibles secretos en archivos staged
git diff --cached | grep -iE "(token|key|secret|password|api_key)"

# O usa herramientas especializadas
brew install gitleaks
gitleaks detect --source . --verbose
```

---

## Funciones útiles

```bash
mkd <dir>      # Crear directorio y entrar
server [port]  # Servidor HTTP en puerto (default: 9000)
phpserver      # Servidor PHP
db create|drop|refresh|list <name>  # Gestión de MySQL
weather [city] # Ver clima
digga <domain> # Info DNS completa
commit [msg]   # git add . && git commit (default: "wip")
```

## Requisitos

- macOS
- [Homebrew](https://brew.sh/)
- Zsh (default en macOS moderno)
- [Oh My Zsh](https://ohmyz.sh/)

## Instalación de herramientas CLI

```bash
brew install eza bat fd ripgrep fzf zoxide git-delta bottom ncdu glow yt-dlp gh ollama zsh-autosuggestions
```
