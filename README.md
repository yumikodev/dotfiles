# Nelly Dark theme

![](https://raw.githubusercontent.com/Yumiko0828/dotfiles/main/screenshots/hyprland_nelly-dark.png)

## Tabla de contenido

- [Tabla de contenido](#tabla-de-contenido)
- [Instalación](#instalación)
  - [Hyprland](#hyprland)
  - [Dependencias](#dependencias)
  - [Fuentes](#fuentes-tipografías)
  - [Configuración](#configuración)
- [Terminal](#terminal)

# Instalación

Antes de empezar a instalar las dependencias, hay que tener en cuenta que esta guia esta hecha en base a una distro Arch.

## Hyprland

Primero, hay que instalar la versión estable de Hyprland.

```bash
sudo pacman -S hyprland
```

## Dependencias

Las siguientes dependencias son para las capturas de pantalla, terminal y otros:

```bash
sudo pacman -S wl-clipboard slurp grim zsh ranger neovim waybar inotify-tools alacritty
```

Paquetes indispensables para un correcto funcionamiento:

```bash
yay -S rofi dunst swaybg swaylock-fancy-git swayidle pamixer light brillo
```

## Fuentes (Tipografías)

- [JetBrainsMono Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.2.2/JetBrainsMono.zip)
- [Iosevka Nerd Font](https://github.com/ryanoasis/nerd-fonts/releases/download/v2.3.3/Iosevka.zip)
- [Font Awesome](https://archlinux.org/packages/community/any/ttf-font-awesome/)
  ```bash
  yay -S ttf-font-awesome
  ```

Una vez descargadas las fuentes (comprimidas), descompimalas y coloquelas en `~/.fonts` o `~/.local/share/fonts`.

> [!NOTE]
> Si la carpeta no existe, creala con `mkdir <PATH>`.
> Reemplace `<PATH>` por `~/.fonts` o `~/.local/share/fonts` (escoge uno).

Luego ejecuta este comando para que su sistema reconozca las fuentes.

```bash
fc-cache -fv
```

## Configuración

Ahora, hay que copiar los archivos de configuración

```bash
git clone -b nelly-dark https://github.com/Yumiko0828/dotfiles.git
cd dotfiles
cp -r configs/* ~/.config
```

### Wallpaper

Antes de terminar, hay que configurar el wallpaper (fondo de pantalla). Abrimos el script de bash `~/.config/hypr/scripts/wallpaper.sh`, luego buscaremos el siguiente código:

```sh
changeBg() {
  if [ $HOUR -gt 18 ]; then
    swaybg -o \* -i <PATH_TO_NIGHT_WALLPAPER> -m fill
  else
    swaybg -o \* -i <PATH_TO_DAY_WALLPAPER> -m fill
  fi
}
```

De manera simple, si la hora es mayor a 18 (6 P.M.), se establecerá un wallpaper para la noche, caso contrario se establecerá otro para el día.

> Debo aclarar que la otra función `setInterval` es para ejecutar la función cada cierto tiempo y cambiar el wallpaper dinámicamente, pero no funciona.
>
> Cualquier aporte con un PR es bienvenida.

## Terminal

Para configurar la terminal (zsh), vamos a instalar [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH). Para el prompt instalamos [StarShip](https://starship.rs/guide/#%F0%9F%9A%80-installation) (revise la documentación) y nos aseguramos copiar el archivo `starship.toml` en `~/.config`.

```bash
cp .config/starship.toml ~/.config
```

Volvemos a lanzar la terminal y ya debe estar listo.
