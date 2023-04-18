local function init()
    require('telescope').setup{
        defaults = {
            file_ignore_patterns = { "node%_modules/.*" },
        }
    }
end 

return {
    init = init
}
