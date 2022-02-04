import {contextMenu} from "./context.mjs"
import {dragable} from "../libs/etc/events.mjs"

import {addBox} from "../libs/geometries/boxes.mjs"
import {addCylinder} from "../libs/geometries/cylinders.mjs"
import {addSphere} from "../libs/geometries/spheres.mjs"

export function addMeshPanel(mesh) {

  $("body").append("<div id='mesh' class='panel " + mesh.uuid + "'><h3>Mesh</h3></div>")

  let panel = $("#mesh." + mesh.uuid + "")

  let coordinates = world2screenCoordinates(mesh.position.x, mesh.position.y, mesh.position.z)

  panel.css({top: coordinates.y, left: coordinates.x})

  panel.append("<p><b>Type:</b> " + mesh.class.replace(/\b\w/g, function(char) { return char.toUpperCase() }) + "</p>")
  panel.append("<p><b>Surface:</b> " + mesh.surface.toFixed(2) + "</p>")
  panel.append("<p><b>Volume:</b> " + mesh.volume.toFixed(2) + "</p>")

  panel.append("<h4><b>Position</b></h4>")
  panel.append("<span id='position-x'><label><b>X</b> <input type=number step=1 min=" + -(data.scale * 2) + " max=" + data.scale * 2 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
  panel.append("<span id='position-y'><label><b>Y</b> <input type=number step=1 min=" + -(data.scale * 2) + " max=" + data.scale * 2 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")
  panel.append("<span id='position-z'><label><b>Z</b> <input type=number step=1 min=" + -(data.scale * 2) + " max=" + data.scale * 2 + "><button id='plus'>+</button><button id='minus'>-</button></label></span>")

  panel.append("<h4><b>Rotation</b></h4>")
  panel.append("<span id='rotation-x'><label><b>X</b> <input type=number step=1 min=-360 max=360><button id='plus'>+</button><button id='minus'>-</button></label></span>")
  panel.append("<span id='rotation-y'><label><b>Y</b> <input type=number step=1 min=-360 max=360><button id='plus'>+</button><button id='minus'>-</button></label></span>")
  panel.append("<span id='rotation-z'><label><b>Z</b> <input type=number step=1 min=-360 max=360><button id='plus'>+</button><button id='minus'>-</button></label></span>")

  $("#mesh." + mesh.uuid + " #position-x input").val(mesh.position.x.toFixed(2))
  $("#mesh." + mesh.uuid + " #position-y input").val(mesh.position.y.toFixed(2))
  $("#mesh." + mesh.uuid + " #position-z input").val(mesh.position.z.toFixed(2))

  $("#mesh." + mesh.uuid + " #rotation-x input").val(radian2degree(mesh.rotation.x).toFixed(2))
  $("#mesh." + mesh.uuid + " #rotation-y input").val(radian2degree(mesh.rotation.y).toFixed(2))
  $("#mesh." + mesh.uuid + " #rotation-z input").val(radian2degree(mesh.rotation.z).toFixed(2))

  $("#mesh." + mesh.uuid + " input").mousedown(function(event) {
    event.stopPropagation()
  })

  $("#mesh." + mesh.uuid + " input").keydown(function(event) {
    event.stopPropagation()
  })

  $("#mesh." + mesh.uuid + " input").keyup(function(event) {

    let selection = $(this).parent().parent().attr("id").split("-")

    updateMesh(mesh, selection[0], selection[1], Number($(this).val()))

  })

  $("#mesh." + mesh.uuid + " input").on("change", function(event) {

    let selection = $(this).parent().parent().attr("id").split("-")

    updateMesh(mesh, selection[0], selection[1], Number($(this).val()))

  })

  $("#mesh." + mesh.uuid + " button").mousedown(function(event) {

    event.stopPropagation()

    let operation = $(this).attr("id")
    let selection = $(this).parent().parent().attr("id")
    let value = Number($("#mesh." + mesh.uuid + " #" + selection + " input").val())
    let step = Number($("#mesh." + mesh.uuid + " #" + selection + " input").attr("step"))

    if (operation == "plus") {
      value += step
    } else if (operation == "minus") {
      value -= step
    }

    updateMesh(mesh, selection.split("-")[0], selection.split("-")[1], value)

  })

  panel.mouseover(function() { $("#context-menu.panel").remove() })

  dragable(panel)

}

export function addMesh(type, position=[0, 0, 0]) {

  let mesh = null

  switch (type) {

    case "box":
      mesh = addBox()
      break

    case "cylinder":
      mesh = addCylinder()
      mesh.rotation.x = degree2radian(90)
      break

    case "sphere":
      mesh = addSphere()
      break

  }

  data.events.addEventListener(mesh, "contextmenu", function(event) { contextMenu("mesh", mesh, event.origDomEvent) })

  mesh.position.x = position[0]
  mesh.position.y = position[1]
  mesh.position.z = position[2]

  mesh.surface = getSurfaceArea(mesh)
  mesh.volume = getVolume(mesh)
  mesh.class = type

  return mesh

}

export function updateMesh(mesh, type, key, value) {

  console.log(mesh)
  console.log(type)
  console.log(key)
  console.log(value)

}

export function removeMesh(mesh) {

  $("#mesh." + mesh.uuid + "").remove()

  data.events.removeEventListener(mesh, "contextmenu")
  data.scene.remove(mesh)

}
