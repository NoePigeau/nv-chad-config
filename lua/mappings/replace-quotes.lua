local replace_quotes = function()
  local row = vim.fn.line "." -- current line (1-indexed)
  local col = vim.fn.col "." -- cursor column (1-indexed)
  local line = vim.api.nvim_get_current_line()

  -- Find the opening quote before the cursor
  local start_quote_pos, quote_char
  for i = col, 1, -1 do
    local c = line:sub(i, i)
    if c == '"' or c == "'" then
      start_quote_pos = i
      quote_char = c
      break
    end
  end

  if not start_quote_pos then
    print "No opening quote found before the cursor"
    return
  end

  -- Find the closing quote after the cursor
  local end_quote_pos
  for i = col, #line do
    local c = line:sub(i, i)
    if c == quote_char then
      end_quote_pos = i
      break
    end
  end

  if not end_quote_pos then
    print "No closing quote found after the cursor"
    return
  end

  -- Reconstruct the line with backticks
  local new_line = line:sub(1, start_quote_pos - 1)
    .. "`"
    .. line:sub(start_quote_pos + 1, end_quote_pos - 1)
    .. "`"
    .. line:sub(end_quote_pos + 1)

  vim.api.nvim_set_current_line(new_line)
end

return replace_quotes
