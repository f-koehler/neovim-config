local function get_cmakelists(opts)
  return vim.fs.find("CMakeLists.txt", { upward = true, type = "file", path = opts.dir })[1]
end

-- A build dir only counts as "configured" once cmake has generated a cache in it.
local function get_configured_build_dir(opts)
  local cmakelists = get_cmakelists(opts)
  if not cmakelists then
    return nil
  end
  local root = vim.fs.dirname(cmakelists)
  if vim.fn.filereadable(root .. "/build/CMakeCache.txt") == 1 then
    return root
  end
  return nil
end

---@type overseer.TemplateFileProvider
return {
  cache_key = function(opts)
    return get_cmakelists(opts)
  end,
  generator = function(opts)
    local root = get_configured_build_dir(opts)
    if not root then
      return "No configured 'build' directory found (needs CMakeLists.txt and build/CMakeCache.txt)"
    end
    return {
      {
        name = "cmake build",
        builder = function()
          return {
            cmd = "nice -n 19 cmake --build build --parallel $(nproc --all)",
            cwd = root,
            components = { "default" },
          }
        end,
      },
    }
  end,
}
