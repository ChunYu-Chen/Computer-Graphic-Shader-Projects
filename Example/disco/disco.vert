varying vec3 ECpos;
varying vec4 Color;
varying float LightIntensity; 

void
main( void )
{
	const vec3 LightPos = vec3( 0., 0., 10. );

	ECpos = vec3( gl_ModelViewMatrix * gl_Vertex );

	vec3 tnorm = normalize( vec3( gl_NormalMatrix * gl_Normal ) );
	ECpos = vec3( gl_ModelViewMatrix * gl_Vertex );
	LightIntensity  = dot( normalize(LightPos - ECpos), tnorm );
	LightIntensity = abs( LightIntensity );
	LightIntensity = .5 * LightIntensity;

	Color = gl_Color;
	gl_TexCoord[0] = gl_MultiTexCoord0;
	gl_Position = gl_ModelViewProjectionMatrix * gl_Vertex;
}
