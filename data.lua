-- Disables the research lab recipe if option is enabled
if settings.startup["disable-labs"].value then
  data.raw.recipe["lab"].enabled = false
end
