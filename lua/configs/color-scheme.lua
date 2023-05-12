local color = 'nightfox'

require('nightfox').load(color)

function noBg() 

    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, 'Normal', { bg= 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg= 'none' })

end

-- noBg()

