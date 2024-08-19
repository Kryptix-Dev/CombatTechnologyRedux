local function onInit()
  -- For loop to enable early military research on map start
  if settings.startup["research-quick-start"].value then
    for index, force in pairs(game.forces) do
    force.technologies["automation"].researched = true
    force.technologies["gun_turret"].researched = true
    force.technologies["logistics"].researched = true
    force.technologies["military"].researched = true
    force.technologies["stone_wall"].researched = true
    end
  end
end

function onDeathHandler(event)
  local entity = event.entity
  local player = event.force

  -- Check status on player's target and current research
  if (player == nil) then
    return
  end
  if (entity.force == player or entity.force.name == "neutral") then
    return
  end
  if (player.current_research == nil) then
    return
  end

  -- Check research status
  local researchIngredientCount = 0
  for index, ingredient in pairs(player.current_research.research_unit_ingredients) do
    researchIngredientCount = researchIngredientCount + ingredient.amount
  end

  -- Calculations for research completed based on damage done and the effect scale variable
  -- damageEffectScale with the 400 divisor primarily effects the calculation 
  local researchUnitCost = researchIngredientCount * (player.current_research.research_unit_energy / 60)
  local researchTotalCost = researchUnitCost * player.current_research.research_unit_count
  local damageEffectScale = settings.startup["damage-effect-scale"].value / 400
  local researchDelta = (entity.prototype.max_health / researchTotalCost) * damageEffectScale
  local researchProgress = player.research_progress + researchDelta

  -- Check current research task and mark completed if true, or continue research
  if (researchProgress >= 1) then
    player.research_progress = 0
    player.current_research.researched = true
  else
    player.research_progress = researchProgress
  end
end

script.on_init(onInit)
script.on_event(defines.events.on_entity_died, onDeathHandler)
