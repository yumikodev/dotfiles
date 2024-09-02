# Yuki theme

![](https://raw.githubusercontent.com/Yumiko0828/dotfiles/main/screenshots/hyprland_nelly-dark.png)

## Tabla de contenido

- [Tabla de contenido](#tabla-de-contenido)
- [Instalación](#instalación)
  - [BSPWM](#bspwm)
  - [Dependencias](#dependencias)
- [Configuración](#configuración)
- [Fuentes](#fuentes-tipografías)
- [Terminal](#terminal)

# Instalación

Antes de empezar a instalar las dependencias, hay que tener en cuenta que esta guia esta hecha en base a una distro Arch.

## Bspwm

Primero, hay que instalar bspwm y sxhkd.

```bash
sudo pacman -S bspwm sxhkd
```

## Dependencias

Las siguientes dependencias son para las capturas de pantalla, terminal y otros:

```bash
sudo pacman -S amixer zsh ranger neovim alacritty dunst thunar rofi polybar brightnessctl
```

Paquetes en AUR:

```bash
yay -S betterlockscreen
```

## Configuración

Ahora, hay que copiar los archivos de configuración

```bash
git clone -b nelly-dark https://github.com/Yumiko0828/dotfiles.git ; cd dotfiles ; cp -r .config/* ~/.config; cp .xinitrc ~ ; echo "Listo!"
```

## Fuentes (Tipografías)

Creamos el directorio de las fuentes y las copiamos.

```bash
sudo mkdir /usr/local/share/fonts ; sudo cp fonts/* /usr/local/share/fonts
```

Luego ejecuta este comando para que su sistema reconozca las fuentes.

```bash
fc-cache -fv
```

## Terminal

Para configurar la terminal (zsh), vamos a instalar [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH). Para el prompt instalamos [StarShip](https://starship.rs/guide/#%F0%9F%9A%80-installation) (revise la documentación).

### Plugins:

- autosuggesions plugin

  ```bash
  git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
  ```

- zsh-syntax-highlighting plugin

  ```bash
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
  ```

### ZSHRC

```bash
cp .zshrc ~ ; source ~/.zshrc
```

Volvemos a lanzar la terminal y ya debe estar listo.
