# Link: https://threejs.org/docs/#api/en/materials/MeshNormalMaterial

class NormalMeshMaterial extends MeshMaterial

    constructor: (params = {}) ->

        super "normal", params

class POLY.NormalMeshMaterial extends THREE.MeshNormalMaterial

    constructor: (params = {}) ->

        params.metalness = if params.metalness then params.metalness / 100 else 0.5
        params.roughness = if params.roughness then params.roughness / 100 else 0.5
        params.opacity = if params.opacity then params.opacity / 100 else 1

        params.side ?= THREE.DoubleSide
        params.color ?= blackThree

        super params
