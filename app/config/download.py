from os import makedirs
from os.path import exists

from requests import get
from urllib.request import urlretrieve

def get_libs(libs_dir):

    js_libs_dir = libs_dir + "/js"
    css_libs_dir = libs_dir + "/css"

    if not exists(libs_dir): makedirs(libs_dir)

    if not exists(js_libs_dir): makedirs(js_libs_dir)
    if not exists(css_libs_dir): makedirs(css_libs_dir)

    if not exists(js_libs_dir + "/exporters"): makedirs(js_libs_dir + "/exporters")
    if not exists(js_libs_dir + "/importers"): makedirs(js_libs_dir + "/importers")

    if not exists(js_libs_dir + "/sha256.js"): urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/js-sha256/0.9.0/sha256.min.js", js_libs_dir + "/sha256.js")
    if not exists(js_libs_dir + "/socket.js"): urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.4.0/socket.io.min.js", js_libs_dir + "/socket.js")

    if not exists(js_libs_dir + "/lodash.js"): urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/lodash.js/4.17.21/lodash.min.js", js_libs_dir + "/lodash.js")
    if not exists(js_libs_dir + "/jQuery.js"): urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.3/jquery.min.js", js_libs_dir + "/jQuery.js")
    if not exists(js_libs_dir + "/jQueryUI.js"): urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js", js_libs_dir + "/jQueryUI.js")

    if not exists(js_libs_dir + "/three.js"): urlretrieve("https://cdnjs.cloudflare.com/ajax/libs/three.js/r124/three.min.js", js_libs_dir + "/three.js")
    if not exists(js_libs_dir + "/threeX.js"): urlretrieve("https://raw.githubusercontent.com/jgphilpott/threex.domevents/master/threex.domevents.js", js_libs_dir + "/threeX.js")

    if not exists(js_libs_dir + "/FileSaver.js"): urlretrieve("https://raw.githubusercontent.com/eligrey/FileSaver.js/cea522bc41bfadc364837293d0c4dc585a65ac46/src/FileSaver.js", js_libs_dir + "/FileSaver.js")

    if not exists(js_libs_dir + "/csgWrapper.js"): urlretrieve("https://gist.githubusercontent.com/jgphilpott/03df747c3047504480e6dbeeddd27d68/raw/43325a9262bac33d5285a8e1c5a14ec4beeae014/csgWrapper.js", js_libs_dir + "/csgWrapper.js")
    if not exists(js_libs_dir + "/morph.js"): urlretrieve("https://gist.githubusercontent.com/jgphilpott/59ad8432ba8567e91176e669454b9afa/raw/5eb7306b165594b257bd3cb0aade98c380082015/morph.js", js_libs_dir + "/morph.js")

    if not exists(js_libs_dir + "/BufferGeometryUtils.js"): urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/670b1e9e85356d98efa4c702e93c85dd52f01e1e/examples/js/utils/BufferGeometryUtils.js", js_libs_dir + "/BufferGeometryUtils.js")
    if not exists(js_libs_dir + "/LineThickSegmentsGeometry.js"): urlretrieve("https://gist.githubusercontent.com/jgphilpott/77709de890b806426089de1ff4e78758/raw/207b228608657317820cdb855b4b034a34630fe0/LineThickSegmentsGeometry.js", js_libs_dir + "/LineThickSegmentsGeometry.js")
    if not exists(js_libs_dir + "/LineThickGeometry.js"): urlretrieve("https://gist.githubusercontent.com/jgphilpott/ec71d7abcf504f85e01ffe9e297a682c/raw/4adde47c8085ab297f5f4ee061dc343208559088/LineThickGeometry.js", js_libs_dir + "/LineThickGeometry.js")
    if not exists(js_libs_dir + "/LineThickMaterial.js"): urlretrieve("https://gist.githubusercontent.com/jgphilpott/9e1cf7758b8d7cf02537bb15aacdba6a/raw/7fc7619209c14166e4ef2cf71f787b3c2aa19626/LineThickMaterial.js", js_libs_dir + "/LineThickMaterial.js")
    if not exists(js_libs_dir + "/LineThickSegments.js"): urlretrieve("https://gist.githubusercontent.com/jgphilpott/605923031deec863802ca6f61ca9e688/raw/5808ab9cecb36a246a593e88bcbf5839299e4157/LineThickSegments.js", js_libs_dir + "/LineThickSegments.js")
    if not exists(js_libs_dir + "/LineThickMesh.js"): urlretrieve("https://gist.githubusercontent.com/jgphilpott/ec6e0b40dbdd02c9d4cfae0dd2166c5e/raw/4d2b02b32166361c3225ef109f15af65db0787cd/LineThickMesh.js", js_libs_dir + "/LineThickMesh.js")

    if not exists(js_libs_dir + "/EffectComposer.js"): urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/f9d1f8495f2ca581b2b695288b97c97e030c5407/examples/js/postprocessing/EffectComposer.js", js_libs_dir + "/EffectComposer.js")
    if not exists(js_libs_dir + "/OutlinePass.js"): urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/f9d1f8495f2ca581b2b695288b97c97e030c5407/examples/js/postprocessing/OutlinePass.js", js_libs_dir + "/OutlinePass.js")
    if not exists(js_libs_dir + "/RenderPass.js"): urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/f9d1f8495f2ca581b2b695288b97c97e030c5407/examples/js/postprocessing/RenderPass.js", js_libs_dir + "/RenderPass.js")
    if not exists(js_libs_dir + "/ShaderPass.js"): urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/f9d1f8495f2ca581b2b695288b97c97e030c5407/examples/js/postprocessing/ShaderPass.js", js_libs_dir + "/ShaderPass.js")
    if not exists(js_libs_dir + "/CopyShader.js"): urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/f9d1f8495f2ca581b2b695288b97c97e030c5407/examples/js/shaders/CopyShader.js", js_libs_dir + "/CopyShader.js")

    if not exists(css_libs_dir + "/abbreviations.css"): urlretrieve("https://gist.githubusercontent.com/jgphilpott/12783015d68e056e54252355d75b41a9/raw/3c1e6931cdad0006570e7c68ed3de8ac5746213c/abbreviations.css", css_libs_dir + "/abbreviations.css")
    if not exists(css_libs_dir + "/jQuery-UI.css"): urlretrieve("https://code.jquery.com/ui/1.13.1/themes/base/jquery-ui.min.css", css_libs_dir + "/jQuery-UI.css")

    commit = "309b00afb6dcbc5e6c58e72f10eaa8d2e8888c83"
    exporters = ["Collada", "DRACO", "GLTF", "MMD", "OBJ", "PLY", "STL"]
    importers = ["3MF", "AMF", "Collada", "DRACO", "FBX", "GCode", "GLTF", "MMD", "OBJ", "PLY", "STL", "SVG", "VRML"]

    for exporter in exporters:

        if not exists(js_libs_dir + "/exporters/" + exporter + "Exporter.js"): urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/" + commit + "/examples/js/exporters/" + exporter + "Exporter.js", js_libs_dir + "/exporters/" + exporter + "Exporter.js")

    for importer in importers:

        if not exists(js_libs_dir + "/importers/" + importer + "Loader.js"): urlretrieve("https://raw.githubusercontent.com/mrdoob/three.js/" + commit + "/examples/js/loaders/" + importer + "Loader.js", js_libs_dir + "/importers/" + importer + "Loader.js")

    if not exists(js_libs_dir + "/math.js"):

        with open(js_libs_dir + "/math.js", "w") as file:

            numeric = get("https://raw.githubusercontent.com/sloisel/numeric/656fa1254be540f428710738ca9c1539625777f1/src/numeric.js").content.decode("utf-8")
            calc = get("https://gist.githubusercontent.com/jgphilpott/4276345a5b7c96fc010afa28cc5d38b6/raw/1005b9c02b1697d974b33b4b64d956d8f29838b7/calculus.js").content.decode("utf-8")
            regr = get("https://gist.githubusercontent.com/jgphilpott/d38279e8fac9af31054e10b7363bf17e/raw/3555aab46e57a9ccf367d00d336e526349aa0f42/regression.js").content.decode("utf-8")
            roots = get("https://gist.githubusercontent.com/jgphilpott/e483b5fbe52a7233c292f35737e5a682/raw/4dee678d7c8f7577305aa30058a39ffd3502ae0c/roots.js").content.decode("utf-8")
            trig = get("https://gist.githubusercontent.com/jgphilpott/1378cc2cccde6d65c5fb2b6111b5a98f/raw/4ca9d6644932bef8a61b5ed9805fc124b020f2c5/trigonometry.js").content.decode("utf-8")
            limits = get("https://gist.githubusercontent.com/jgphilpott/6332dc7f5636db9ba455e1575407c496/raw/09cedcb3640f1428422ebe39959877e67830db03/limits.js").content.decode("utf-8")

            math = numeric + "\n" + calc + "\n" + regr + "\n" + roots + "\n" + trig + "\n" + limits

            file.write(math)

    if not exists(js_libs_dir + "/tools.js"):

        with open(js_libs_dir + "/tools.js", "w") as file:

            convert = get("https://raw.githubusercontent.com/jgphilpott/convert/20ede7ba169f82f09f94741ca247c1118c4a430a/convert.js").content.decode("utf-8")
            abbreviations = get("https://gist.githubusercontent.com/jgphilpott/12783015d68e056e54252355d75b41a9/raw/3c1e6931cdad0006570e7c68ed3de8ac5746213c/abbreviations.js").content.decode("utf-8")
            formatting = get("https://gist.githubusercontent.com/jgphilpott/787659ac4ea57a9971da58a76191079b/raw/cbea41bf2d74b5ce4d1d0629d168fc799a6c48cc/format.js").content.decode("utf-8")
            casefy = get("https://gist.githubusercontent.com/jgphilpott/19e7a94cdf6d6d4cd868cc18e628026c/raw/7aad9d31135124f4d845a9e9d01b026a39e125a1/casefy.js").content.decode("utf-8")
            rotation = get("https://gist.githubusercontent.com/jgphilpott/1bc17b82063f14fabb8f3e38825f6f10/raw/651521fa07f41d2ac1ef058c23babb3a99f8374b/rotation.js").content.decode("utf-8")
            cookies = get("https://gist.githubusercontent.com/jgphilpott/b9ce64b9ef8b04c5ac58902b133b1a28/raw/5a8c863d59be464289bcee3e6363c0d025b050dd/cookies.js").content.decode("utf-8")
            localStorage = get("https://gist.githubusercontent.com/jgphilpott/e26b92eb41b64e9565032d5c4d3c2878/raw/7fe4d19aad1e765f134a45e128dbfe1cad1141aa/localStorage.js").content.decode("utf-8")
            email = get("https://gist.githubusercontent.com/jgphilpott/a1ffedea1d1a70320b8075597df1943a/raw/a91ee941914fedcafd12d892ed98f7ee43cb9bba/email.js").content.decode("utf-8")
            favicon = get("https://gist.githubusercontent.com/jgphilpott/efdec642fc8bbaaae8115bd4fc49bd05/raw/89f07b3019e286e5039accf01221c0c2f101d80f/faviconScheme.js").content.decode("utf-8")

            tools = convert + "\n" + abbreviations + "\n" + formatting + "\n" + casefy + "\n" + rotation + "\n" + cookies + "\n" + localStorage + "\n" + email + "\n" + favicon

            file.write(tools)
