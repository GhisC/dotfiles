-- Prints parameters in a readable format
_G.dump = function(...)
  local objects = vim.tbl_map(vim.inspect, {...})
  print(unpack(objects))
end
