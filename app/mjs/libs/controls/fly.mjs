export function addFlyControls() {

  $(document).keydown(function(event) {

    if ([37, 38, 39, 40, 65, 68, 83, 87].includes(event.keyCode)) {

      let position = camera.position
      let target = camera.target

      let deltaX = Math.abs(position.x - target.x)
      let deltaY = Math.abs(position.y - target.y)
      let deltaZ = Math.abs(position.z - target.z)

      let flySpeed = settings.controls.flySpeed / 10

      let radius3 = position.distanceTo(target)
      let radius2 = side4sides(deltaZ, null, radius3)

      let horizontalAngle = angle4sides(radius2, deltaX)
      if (position.x < target.x) { horizontalAngle = 180 - horizontalAngle }
      if (position.y < target.y) { horizontalAngle = -horizontalAngle }

      let verticalAngle = angle4sides(radius3, deltaZ)
      if (position.z < target.z) { verticalAngle = 180 - verticalAngle }

      if ([37, 38, 39, 40].includes(event.keyCode)) {

        if (event.keyCode == 38) { // Up

          let inverter = -1
          if (verticalAngle > 90) { verticalAngle = 180 - verticalAngle; inverter = -inverter }

          let radius2 = side4angle(verticalAngle, flySpeed, true, null)

          let stepX = side4angle(horizontalAngle, radius2, true, null) * inverter
          let stepY = side4angle(horizontalAngle, radius2, null, true) * inverter
          let stepZ = side4angle(verticalAngle, flySpeed, null, true)

          position.x += stepX
          position.y += stepY
          position.z += stepZ

          target.x += stepX
          target.y += stepY
          target.z += stepZ

        } else if (event.keyCode == 40) { // Down

          let inverter = -1
          if (verticalAngle > 90) { verticalAngle = 180 - verticalAngle; inverter = -inverter }

          let radius2 = side4angle(verticalAngle, flySpeed, true, null)

          let stepX = side4angle(horizontalAngle, radius2, true, null) * inverter
          let stepY = side4angle(horizontalAngle, radius2, null, true) * inverter
          let stepZ = side4angle(verticalAngle, flySpeed, null, true)

          position.x -= stepX
          position.y -= stepY
          position.z -= stepZ

          target.x -= stepX
          target.y -= stepY
          target.z -= stepZ

        } else if (event.keyCode == 37) { // Left

          let newHorizontalAngle = horizontalAngle + 90
          if (newHorizontalAngle >= 180) { newHorizontalAngle = newHorizontalAngle - 360 }

          let stepX = side4angle(newHorizontalAngle, flySpeed, true, null)
          let stepY = side4angle(newHorizontalAngle, flySpeed, null, true)

          position.x -= stepX
          position.y -= stepY

          target.x -= stepX
          target.y -= stepY

        } else if (event.keyCode == 39) { // Right

          let newHorizontalAngle = horizontalAngle + 90
          if (newHorizontalAngle >= 180) { newHorizontalAngle = newHorizontalAngle - 360 }

          let stepX = side4angle(newHorizontalAngle, flySpeed, true, null)
          let stepY = side4angle(newHorizontalAngle, flySpeed, null, true)

          position.x += stepX
          position.y += stepY

          target.x += stepX
          target.y += stepY

        }

        $("#camera.panel #position-x input").val(position.x.toFixed(2))
        $("#camera.panel #position-y input").val(position.y.toFixed(2))
        $("#camera.panel #position-z input").val(position.z.toFixed(2))

        $("#camera.panel #target-x input").val(target.x.toFixed(2))
        $("#camera.panel #target-y input").val(target.y.toFixed(2))
        $("#camera.panel #target-z input").val(target.z.toFixed(2))

      }

      if ([65, 68, 83, 87].includes(event.keyCode)) {

        if (event.keyCode == 87) { // W

          let newVerticalAngle = verticalAngle + flySpeed
          if (newVerticalAngle <= 0) { newVerticalAngle = 0.000001 } else if (newVerticalAngle >= 180) { newVerticalAngle = -180 - 0.000001 }

          target.z = position.z - side4angle(newVerticalAngle, radius3, true, null)

          radius2 = side4sides(Math.abs(position.z - target.z), null, radius3)

          target.x = position.x - side4angle(horizontalAngle, radius2, true, null)
          target.y = position.y - side4angle(horizontalAngle, radius2, null, true)

        } else if (event.keyCode == 83) { // S

          let newVerticalAngle = verticalAngle - flySpeed
          if (newVerticalAngle <= 0) { newVerticalAngle = 0.000001 } else if (newVerticalAngle >= 180) { newVerticalAngle = -180 - 0.000001 }

          target.z = position.z - side4angle(newVerticalAngle, radius3, true, null)

          radius2 = side4sides(Math.abs(position.z - target.z), null, radius3)

          target.x = position.x - side4angle(horizontalAngle, radius2, true, null)
          target.y = position.y - side4angle(horizontalAngle, radius2, null, true)

        } else if (event.keyCode == 65) { // A

          let newHorizontalAngle = horizontalAngle + flySpeed
          if (newHorizontalAngle >= 180) { newHorizontalAngle = newHorizontalAngle - 360 }

          target.x = position.x - side4angle(newHorizontalAngle, radius2, true, null)
          target.y = position.y - side4angle(newHorizontalAngle, radius2, null, true)

        } else if (event.keyCode == 68) { // D

          let newHorizontalAngle = horizontalAngle - flySpeed
          if (newHorizontalAngle >= 180) { newHorizontalAngle = newHorizontalAngle - 360 }

          target.x = position.x - side4angle(newHorizontalAngle, radius2, true, null)
          target.y = position.y - side4angle(newHorizontalAngle, radius2, null, true)

        }

        $("#camera.panel #target-x input").val(target.x.toFixed(2))
        $("#camera.panel #target-y input").val(target.y.toFixed(2))
        $("#camera.panel #target-z input").val(target.z.toFixed(2))

      }

      camera.lookAt(target.x, target.y, target.z)

    }

  }).keyup(function(event) {

    updateSettings("camera", "position", camera.position)
    updateSettings("camera", "target", camera.target)

  })

}