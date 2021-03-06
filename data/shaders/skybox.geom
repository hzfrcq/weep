layout (triangles) in;
layout (triangle_strip, max_vertices=18) out;

in VertexData {
	vec3 texcoord;
} inData[];

out VertexData {
	vec3 texcoord;
} outData;

void main()
{
	for (int face = 0; face < 6; ++face) {
		gl_Layer = face;
		for (int i = 0; i < 3; ++i) {
			outData.texcoord = inData[i].texcoord;
			vec4 pos = cubeMatrices[face] * gl_in[i].gl_Position;
			gl_Position = pos.xyww;
			EmitVertex();
		}
		EndPrimitive();
	}
}
