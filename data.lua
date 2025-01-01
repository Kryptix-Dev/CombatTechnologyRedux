-- Disables the lab recipe if option is enabled
if settings.startup["disable-lab"].value then
  data.raw.recipe["lab"].enabled = false
  data.raw.recipe["lab"].hidden = true
  data.raw.recipe["lab"].hidden_in_factoriopedia = true
  data.raw.technology["research-speed-1"].hidden = true
  data.raw.technology["research-speed-2"].hidden = true
  data.raw.technology["research-speed-3"].hidden = true
  data.raw.technology["research-speed-4"].hidden = true
  data.raw.technology["research-speed-5"].hidden = true
  data.raw.technology["research-speed-6"].hidden = true
end
