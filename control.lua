local function onInit()
  -- for-loop to enable early military research on map start
  if settings.startup["research-quick-start"].value then
    for index, force in pairs(game.forces) do
    force.technologies["automation"].researched = true
    force.technologies["automation-science-pack"].researched = true
    force.technologies["electronics"].researched = true
    force.technologies["gun-turret"].researched = true
    force.technologies["logistics"].researched = true
    force.technologies["military"].researched = true
    force.technologies["steam-power"].researched = true
    force.technologies["stone-wall"].researched = true
    end
  end
end

function onDeathHandler(event)
  local entity = event.entity
  local player = event.force

  -- Check killed target's force to filter out non-enemy targets
  if (player == nil) then
    return
  end
  if (entity.force == player or entity.force.name == "neutral") then
    return
  end
  if (player.current_research == nil) then
    return
  end

  -- Pull current research cost
  local researchIngredientCount = 0
  for index, ingredient in pairs(player.current_research.research_unit_ingredients) do
    researchIngredientCount = researchIngredientCount + ingredient.amount
  end

  -- Calculations for research completed based on damage done and the effect scale variable
  local researchUnitCost = researchIngredientCount * (player.current_research.research_unit_energy / 60)
  local researchTotalCost = researchUnitCost * player.current_research.research_unit_count
  -- Primarily calculation to effect scale of research completed based on damage done to valid target
  local damageEffectScale = settings.startup["damage-scale"].value / 400
  local researchDelta = 0

  -- if-else check of killed entity to adjust for Demolishers in Space Age DLC
  if (prototypes.entity == "small-demolisher") then
    researchDelta = ((entity.max_health / ("demolisher-damage-scale" * 0.3)) / researchTotalCost) * damageEffectScale
  elseif (prototypes.entity == "medium-demolisher") then
    researchDelta = ((entity.max_health / ("demolisher-damage-scale" * 0.5)) / researchTotalCost) * damageEffectScale
  elseif (prototypes.entity == "big-demolisher") then
    researchDelta = ((entity.max_health / "demolisher-damage-scale") / researchTotalCost) * damageEffectScale
  else
    researchDelta = (entity.max_health / researchTotalCost) * damageEffectScale
  end
  
  -- Return above calculations to update technology research progress
  local researchProgress = player.research_progress + researchDelta

  -- Check current research task and mark completed if true, or continue research
  if (researchProgress >= 1) then
    player.research_progress = 1
  else
    player.research_progress = researchProgress
  end
end

script.on_init(onInit)
script.on_event(defines.events.on_entity_died, onDeathHandler)
