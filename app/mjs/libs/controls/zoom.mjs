export function addZoomControls() {

  let zoomTimeout = null

  $("#canvas").on("wheel", function(event) {

    event.preventDefault()
    event.stopPropagation()

    clearTimeout(zoomTimeout)

    let zoomMax = settings.controls.zoomMax
    let zoomMin = settings.controls.zoomMin
    let zoomSpeed = settings.controls.zoomSpeed / 50000
    let zoomDelta = event.originalEvent.wheelDelta * zoomSpeed

    let target = camera.target
    let position = camera.position

    let stepX = position.x - target.x
    let stepY = position.y - target.y
    let stepZ = position.z - target.z

    // Zoom In
    if (zoomDelta > 0) {
      if (position.distanceTo(target) >= zoomMin) zoom()
    }

    // Zoom Out
    else if (zoomDelta < 0) {
      if (position.distanceTo(target) <= zoomMax) zoom()
    }

    function zoom() {

      position.x -= stepX * zoomDelta
      position.y -= stepY * zoomDelta
      position.z -= stepZ * zoomDelta

    }

    zoomTimeout = setTimeout(function() {

      updateSettings("camera", "position", position)

    }, 100)

  })

}