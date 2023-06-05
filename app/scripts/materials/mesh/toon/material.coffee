# Link: https://threejs.org/docs/#api/en/materials/MeshToonMaterial

class ToonMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "toon", params

class POLY.ToonMeshMaterial extends THREE.MeshToonMaterial

    constructor: (params = {}) ->

        params.metalness = if params.metalness then params.metalness / 100 else 0.5
        params.roughness = if params.roughness then params.roughness / 100 else 0.5
        params.opacity = if params.opacity then params.opacity / 100 else 1

        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params
