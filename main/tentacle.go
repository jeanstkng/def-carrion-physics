components {
  id: "tentacle"
  component: "/main/tentacle.script"
}
embedded_components {
  id: "mesh"
  type: "mesh"
  data: "material: \"/render/model/model.material\"\n"
  "vertices: \"/main/tentacle.buffer\"\n"
  "textures: \"/assets/pixel.png\"\n"
  "primitive_type: PRIMITIVE_TRIANGLE_STRIP\n"
  ""
}
