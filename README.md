 Example usage:
     exports["rl_requirements"]:ShowRequirements({
         {
             ["Amount"] = 1,
             ["Image"] = "ox_inventory/web/images/gold_ring.png",
             ["Label"] = rl.Shared.Items["gold_ring"].label
         },
         {
             ["Amount"] = 21,
             ["Image"] = "ox_inventory/web/images/sapphire_earrings.png",
             ["Label"] = rl.Shared.Items["sapphire_earrings"].label
         },
    })

 Example remove:
     ``` exports["rl_requirements"]:HideRequirements() ```
