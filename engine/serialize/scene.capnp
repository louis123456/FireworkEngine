@0xa5882682c48988f8;

using Cxx = import "/capnp/c++.capnp";
$Cxx.namespace("fw::capnp");

using Vec = import "vector.capnp";
using Entity = import "entity.capnp";

struct Texture
{
    union {
        path @0 :Text;
        size @1 :Vec.Vec2u;
    }
}

struct Material
{
    textures @0 :List(Text);
}

struct MeshEntry
{
    path @0 :Text;
}

struct Map(Key, Value) {
  entries @0 :List(Entry);
  struct Entry {
    key @0 :Key;
    value @1 :Value;
  }
}

struct Scene {
    name @0 :Text;

    materials @1 :Map(Text, Material);
    textures @2 :Map(Text, Texture);
    meshes @3 :Map(Text, MeshEntry);

    entities @4 :List(Entity.Entity);
}