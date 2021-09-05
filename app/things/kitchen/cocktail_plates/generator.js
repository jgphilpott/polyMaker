function generator(sides=3, size=75) {

  let thickness = 2
  let lipSize = 10
  let angle, holderDistance, slotDistance = null

  let plate = newCylinder(thickness + lipSize, size + lipSize, size, [0, 0, 0], black, sides).rotateX(tools.degree2radian(90))
  let lip = newCylinder(thickness + lipSize, size + lipSize - thickness, size - thickness, [0, thickness, 0], black, sides).rotateX(tools.degree2radian(90))

  switch (sides) {

    case 3:
      angle = 60
      holderDistance = 50
      slotDistance = 75
      break

    case 4:
      angle = 0
      holderDistance = 55
      slotDistance = 80
      break

  }

  let glass_holder = newCylinder(lipSize * 2, lipSize, lipSize, [trig.side4angle(angle, holderDistance, null, true), 0, -trig.side4angle(angle, holderDistance, true, null)], black, 42).rotateX(tools.degree2radian(90))
  let glass_slot = newBox(lipSize + 1, lipSize * 4, lipSize * 2, [0, slotDistance, 0], black).rotateZ(tools.degree2radian(-angle))

  let cocktail_plate = cutMesh(cutMesh(cutMesh(plate, lip), glass_holder), glass_slot)

  data.scene.add(cocktail_plate)

}
