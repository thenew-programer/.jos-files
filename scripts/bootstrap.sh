#!/bin/sh

echo "Setting up your system..."

# Array of config directories
config_dirs=("~/.config/zap" "~/.config/picom" "~/.config/alacritty" "~/.config/zsh" "~/.config/i3" "~/.config/nvim" ".git")
config_files=(".bashrc" ".zshrc" ".profile" ".xinitrc" ".Xresources" ".p10K.zsh" ".gitconfig")
# Backup directory
backup_dir="$HOME/.config_backup"

# Create backup directory if it doesn't exist
mkdir -p "$backup_dir"

# Function to move existing config directories/files to backup
move_to_backup() {
    for dir in "${config_dirs[@]}"; do
        if [ -d "$HOME/$dir" ]; then
            echo "Moving $dir to $backup_dir/$dir.old"
            mv "$HOME/$dir" "$backup_dir/$dir.old"
        fi
    done
    for file in "${config_files[@]}"; do
        if [ -f "$HOME/$file" ]; then
            echo "Moving $file to $backup_dir/$file.old"
            mv "$HOME/$file" "$backup_dir/$file.old"
        fi
    echo "Existing config files/directories moved to $backup_dir"
}

# Move existing config files/directories to backup
move_to_backup

# Function to install packages using Homebrew
install_with_brew() {
    # Check for Homebrew and install if we don't have it
    if test ! $(which brew); then
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ../.profile
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi

    # Update Homebrew recipes
    brew update

    # Install all our dependencies with bundle (See Brewfile)
    brew tap homebrew/bundle
    brew bundle --file ./Brewfile
}

# Function to install packages using pacman
install_with_pacman() {
    # Check if .pacman.list exists
    if [ -f .pacman.list ]; then
        echo "Installing packages with pacman..."
        # Read packages from .pacman.list and install
        while IFS= read -r package; do
            sudo pacman -S --noconfirm "$package"
        done <.pacman.list
    else
        echo "Error: .pacman.list file not found."
    fi
}

# Function to reprompt user for selection
reprompt() {
    read -p "Invalid choice. Please choose an option (1/2): " install_option
}

# Check for Zap and install if we don't have it
if test ! $(which zap); then
  /bin/bash -c "$(curl -s https://raw.githubusercontent.com/zap-zsh/zap/master/install.zsh)"
fi

# Prompt the user to choose installation method
echo "(1) Brew"
echo "(2) pacman"
read -p "Please choose an option (1/2): " install_option

# Process the choice
while true; do
    case $install_option in
    1)
        install_with_brew
        break
        ;;
    2)
        install_with_pacman
        break
        ;;
    *)
        reprompt
        ;;
    esac
done

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'root'; FLUSH PRIVILEGES;"

# Create a projects directory
mkdir $HOME/Code
stow .
