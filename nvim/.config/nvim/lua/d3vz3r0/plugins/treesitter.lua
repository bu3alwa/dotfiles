local function init()
    require'nvim-treesitter.configs'.setup {
        -- A list of parser names, or "all"
        ensure_installed = {
            'bash',
            'css',
            'dockerfile',
            'go',
            'gomod',
            'graphql',
            'html',
            'javascript',
            'jsdoc',
            'json',
            'lua',
            'python',
            'rust',
            'svelte',
            'tsx',
            'typescript',
            'yaml',
        },
        throttle = true, -- Throttles plugin updates (may improve performance)

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- List of parsers to ignore installing (for "all")
        ignore_install = {},
        max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
        highlight = {
            -- `false` will disable the whole extension
            enable = true,

            -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
            -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
            -- the name of the parser)
            -- list of language that will be disabled
            disable = { },

            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
        patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
            -- For all filetypes
            -- Note that setting an entry here replaces all other patterns for this entry.
            -- By setting the 'default' entry below, you can control which nodes you want to
            -- appear in the context window.
            default = {
                "function",
                "method",
                "for",
                "while",
                "if",
                "switch",
                "case",
            },

            rust = {
                "loop_expression",
                "impl_item",
            },

            typescript = {
                "class_declaration",
                "abstract_class_declaration",
                "else_clause",
            },
        },
    }


end

return {
    init = init 
}
