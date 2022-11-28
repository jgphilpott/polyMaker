class TriangularPrism extends Mesh

    constructor : (params = {}) ->

        super "triangular-prism", params

class POLY.TriangularPrismMesh extends THREE.Mesh

    constructor : (params = {}) ->

        params.material ?= "normal"

        geometry = new TriangularPrismGeometry params
        material = new MeshMaterial params.material, params

        super geometry, material

        this.class = "triangular-prism"
        this.name = "Triangular Prism"

        return this
