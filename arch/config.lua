local order = {
	"fonts",
	"devtools",
	"ohmyposh",
	"nu",
	"wezterm",
	"tmux",
	"neovim",
}

local packages = {
	devtools = {
		configure = {},
		install = {
			commands = {
				"sudo pacman -S git base-devel cmake ninja curl wget less nodejs npm go php composer postgresql php-pgsql --noconfirm --needed",
				"yay -S lazydocker lazygit --needed --noconfirm --answerclean=None --answerdiff=None --answeredit=None",
				"sudo pacman -S docker docker-compose --noconfirm --needed",
				"sudo systemctl enable docker.service",
				"sudo usermod -aG docker $USER",
			},
		},
		remove = {},
	},
	hypr = {
		configure = {
			{
				source = "./hypr",
				destination = "~/.config/hypr",
			},
		},
		install = {
			commands = { "sudo pacman -S hypridle hyprlock --noconfirm --needed" },
		},
		remove = {
			commands = { "sudo pacman -R hypridle hyprlock" },
		},
	},
	fonts = {
		configure = {},
		install = {
			commands = {
				"sudo pacman -S ttf-font-awesome --noconfirm --needed",
				"sudo pacman -S ttf-jetbrains-mono-nerd --noconfirm --needed",
				"sudo pacman -S ttf-nerd-fonts-symbols-mono --noconfirm --needed",
			},
		},
		remove = {
			commands = {
				"sudo pacman -R ttf-font-awesome",
				"sudo pacman -R ttf-jetbrains-mono-nerd",
				"sudo pacman -R ttf-nerd-fonts-symbols-mono",
			},
		},
	},
	ohmyposh = {
		configure = {
			{
				source = "./oh-my-posh/.poshthemes",
				destination = "~/.poshthemes",
			},
			{
				source = "./oh-my-posh/.oh-my-posh.nu",
				destination = "~/.oh-my-posh.nu",
			},
		},
		install = {
			commands = { "curl -s https://ohmyposh.dev/install.sh | bash -s -- -d ~/.local/bin" },
		},
		remove = {
			commands = { "rm ~/.local/bin/oh-my-posh" },
		},
	},
	nu = {
		configure = {
			{
				source = "./nushell",
				destination = "~/.config/nushell/",
			},
		},
		install = {
			commands = { "sudo pacman -S nushell --noconfirm --needed" },
		},
		remove = {
			commands = { "sudo pacman -R nushell" },
		},
	},
	wezterm = {
		configure = {
			{
				source = "./wezterm",
				destination = "~/.config/wezterm/",
			},
		},
		install = {
			commands = {
				"yay -S wezterm-git --needed --noconfirm --answerclean=None --answerdiff=None --answeredit=None",
			},
		},
		remove = {
			commands = {
				"yay -R wezterm-git ",
			},
		},
	},
	tmux = {
		configure = {
			{
				source = "tmux",
				destination = "~/.config/tmux/",
			},
		},
		install = {
			commands = { "sudo pacman -S tmux --noconfirm --needed" },
		},
		remove = {
			commands = {
				"sudo pacman -R tmux",
				"rm -r ~/.config/tmux/",
			},
		},
	},
	neovim = {
		configure = {
			{
				source = "neovim/nvim",
				destination = "~/.config/nvim/",
			},
		},
		install = {
			commands = { "./neovim/install.sh" },
		},
		remove = {
			commands = {
				"rm ~/.local/bin/nvim",
				"rm -r ~/.config/nvim/",
				"./neovim/uninstall.sh",
			},
		},
	},
}

return {
	order = order,
	packages = packages,
}
