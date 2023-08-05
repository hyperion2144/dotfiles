local get_current_gomod = function()
  local file = io.open("go.mod", "r")
  if file == nil then return nil end

  local first_line = file:read()
  local mod_name = first_line:gsub("module ", "")
  file:close()
  return mod_name
end

return {
  settings = {
    gopls = {
      analyses = {
        unreachable = true,
        nilness = true,
        unusedparams = true,
        useany = true,
        unusedwrite = true,
        ST1003 = true,
        undeclaredname = true,
        fillreturns = true,
        nonewvars = true,
        fieldalignment = false,
        shadow = true,
      },
      codelenses = {
        generate = true, -- show the `go generate` lens.
        gc_details = true, -- Show a code lens toggling the display of gc's choices.
        test = true,
        tidy = true,
        vendor = true,
        regenerate_cgo = true,
        upgrade_dependency = true,
      },
      usePlaceholders = true,
      completeUnimported = true,
      staticcheck = true,
      matcher = "Fuzzy",
      diagnosticsDelay = "500ms",
      symbolMatcher = "fuzzy",
      ["local"] = get_current_gomod(),
      buildFlags = { "-tags", "integration" },
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  },
}
