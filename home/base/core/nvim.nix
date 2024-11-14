{lin-vim, ...}: {
home.file.".config/" = {
  source = lin-vim.outPath;
  recursive = true;
};
}
