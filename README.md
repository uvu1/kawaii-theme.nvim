# kawaii-theme.nvim
A sweet, pink neovim colorscheme inspired by [diff001a/KawaiiTheme](https://github.com/diff001a/KawaiiTheme)

## Installation
### lazy.nvim
```lua
{
    "uvu1/kawaii-theme.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("kawaii-theme").setup({
                transparent = true -- optional
        })
        vim.cmd.colorscheme("kawaii-theme")
    end,
}
```

## Credits
Inspired by [diff001a/KawaiiTheme](https://github.com/diff001a/KawaiiTheme).

## License
MIT
