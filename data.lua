-- Disables the research lab recipe if option is enabled
if settings.startup["disable-labs"].value then
  data.raw.recipe["lab"].enabled = false
  -- Disabled for now
  --data.raw.recipe["biolab"].enabled = false  
end
