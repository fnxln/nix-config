{lin-vim, ...}: {
home.file.".config/nvim/" = {
  source = lin-vim.outPath;
  recursive = true;
};
}
