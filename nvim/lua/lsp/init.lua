-- TODO Add more
local LSPs = {
  'python',
}

for _, lsp in ipairs(LSPs) do
  require('lsp.'..lsp)
end
