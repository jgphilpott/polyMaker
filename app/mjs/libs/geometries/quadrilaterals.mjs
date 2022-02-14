import {black} from "../colors/three/grayscale.mjs"
import {meshMaterial} from "../materials/mesh.mjs"

export function newQuadrilateral(v1=[0, 0, 10], v2=[0, 10, 10], v3=[0, 10, 0], v4=[0, 0, 0], material="normal", color=black) {

  let geometry = new THREE.Geometry()

  geometry.vertices.push(new THREE.Vector3(v1[0], v1[1], v1[2]))
  geometry.vertices.push(new THREE.Vector3(v2[0], v2[1], v2[2]))
  geometry.vertices.push(new THREE.Vector3(v3[0], v3[1], v3[2]))
  geometry.vertices.push(new THREE.Vector3(v4[0], v4[1], v4[2]))

  geometry.faces.push(new THREE.Face3(0, 1, 2))
  geometry.faces.push(new THREE.Face3(2, 3, 0))

  let quadrilateral = new THREE.Mesh(geometry, meshMaterial(material, color))

  return quadrilateral

}

export function addQuadrilateral(v1=[0, 0, 10], v2=[0, 10, 10], v3=[0, 10, 0], v4=[0, 0, 0], material="normal", color=black) {

  let quadrilateral = newQuadrilateral(v1, v2, v3, v4, material, color)

  data.scene.add(quadrilateral)

  return quadrilateral

}
