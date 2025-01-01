if mods['space-age'] then
  if settings.startup["disable-lab"].value then
    data:extend({
      {
        type = "recipe",
        name = "biolab",
        energy_required = 10,
        ingredients =
        {
          {type = "item", name = "biter-egg", amount = 10},
          {type = "item", name = "refined-concrete", amount = 25},
          {type = "item", name = "capture-robot-rocket", amount = 2},
          {type = "item", name = "uranium-235", amount = 3}
        },
        results = {type="item", name="biolab", amount=1},
        enabled = false
      }
    })
  end
end
