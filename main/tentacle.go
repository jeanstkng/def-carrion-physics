components {
  id: "tentacle"
  component: "/main/tentacle.script"
}
embedded_components {
  id: "mesh"
  type: "mesh"
  data: "material: \"/builtins/materials/model.material\"\n"
  "vertices: \"/main/tentacle.buffer\"\n"
  "primitive_type: PRIMITIVE_TRIANGLE_STRIP\n"
  ""
}
