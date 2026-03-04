# Configuración del entorno

## Bspwn

> ```bash
> sudo apt-get install bspwm sxhkd
> ```
>
> {% code lineNumbers="true" %}
> ```bash
> mkdir -p ~/.config/bspwm
> mkdir -p ~/.config/sxhkd
> mv <files> bspwm ~/.config/bspwm/
> mv <files> ~/.config/sxhkd/
> chmod +x ~/.config/bspwm/bspwmrc
> chmod +x ~/.config/sxhkd/sxhkdrc
> chmod +x /home/jose/.config/bspwm/scripts/bspwm_resize
> ```
> {% endcode %}
>
> ```bash
> ln -s -f /home/jose/.p10k.zsh /root/.p10k.zsh # Enlace simbolico
> ln -s -f /home/jose/.zshrc /root/.zshrc # Enlace simbolico
> ```

## Picom

> ```bash
> sudo apt install picom
> ```
>
> {% code lineNumbers="true" %}
> ```bash
> mkdir -p ~/.config/picom/
> mv <files> ~/.config/picom/picom.conf
> ```
> {% endcode %}

## Zsh

> ```bash
> apt-get install zsh
> ```
>
> ```bash
> git clone https://github.com/zsh-users/zsh-autosuggestions.git
> git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
> git clone https://github.com/marlonrichert/zsh-autocomplete.git
> ```
>
> ```bash
> # Agregar atajos plugins .zshrc
> # Plugins
> source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
> source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
> source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
> ```

## Fonts

> ```bash
> wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Hack.zip
> ```
>
> ```bash
> mv Hack.zip /home/jose/.local/share/fonts/
> ```
>
> ```bash
> unzip Hack.zip
> ```
>
> ```bash
> fc-cache -fv
> ```

## Powerlvl10k

> ```bash
> git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
> echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
> ```

## Brew

> ```bash
> sudo apt install build-essential curl git
> ```
>
> {% code overflow="wrap" %}
> ```bash
> /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
> ```
> {% endcode %}
>
> ```bash
> echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.zshrc
> ```
>
> ```bash
> eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
> ```
>
> ```bash
> brew doctor # Validar funcionamientoshrc
> ```

## Ranger

> ```bash
> apt-get install ranger
> ```

## FZF

> ```bash
> apt-get install fzf
> ```

## VMware

> ```bash
> /usr/bin/vmware-user-suid-wrapper & -> Añadir en bashrc
> ```
