export function focus(obj, duration=1000, steps=100) {

  let target = camera.target
  let position = camera.position

  if (obj.x != target.x || obj.y != target.y || obj.z != target.z) {

    let stepX = (obj.x - target.x) / steps
    let stepY = (obj.y - target.y) / steps
    let stepZ = (obj.z - target.z) / steps

    for (let i = 1; i <= steps; i++) {

      setTimeout(updateCameraTarget, (duration / steps) * i)

    }

    function updateCameraTarget() {

      target.x += stepX
      target.y += stepY
      target.z += stepZ

      camera.lookAt(target.x, target.y, target.z)

    }

    updateSettings("camera", "target", {x: obj.x, y: obj.y, z: obj.z})

    return true

  } else {

    return false

  }

}