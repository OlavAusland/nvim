function ColorMyPencils(color)
	color = color or "cyberdream"
	vim.cmd.colorscheme(color)
	
	vim.api.nvim_set_hl(0, "Normal", { background = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { background = "none" })
end

ColorMyPencils()
