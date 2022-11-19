// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Surface Triplanar/Triplanar Spherical"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Enum(Off,0,On,1)]_AlphatoCoverage("Alpha to Coverage", Float) = 0
		[Header(SURFACE OPTIONS)][Enum(Front,2,Back,1,Both,0)]_RenderFace("Render Face", Int) = 2
		[EmissionFlags]_EmissionFlags("Global Illumination Emissive", Float) = 0
		[Toggle(_RECEIVE_SHADOWS_OFF)] _RECEIVE_SHADOWS_OFF("Receive Shadows", Float) = 0
		[Toggle(_SPECULARHIGHLIGHTS_OFF)] _SPECULARHIGHLIGHTS_OFF("Receive Specular Highlights", Float) = 0
		[Toggle(_ENVIRONMENTREFLECTIONS_OFF)] _ENVIRONMENTREFLECTIONS_OFF("Receive Environment Reflections", Float) = 1
		[Header(BLEND)][DE_DrawerFloatEnum(World Space _Object Space)]_Blend_Space("UV Space", Float) = 1
		_Blend_CoverageAmount("Coverage Amount", Range( -1 , 1)) = 0
		_Blend_CoverageFalloff("Coverage Falloff", Range( 0.01 , 2)) = 0.5
		_Blend_CoverageFactor("Coverage Factor", Range( -1 , 1)) = 1
		[Header(TOP)]_Top_Color("Tint", Color) = (1,1,1,0)
		[DE_DrawerTextureSingleLine]_Top_MainTex("Albedo Map", 2D) = "white" {}
		_Top_Brightness("Brightness", Range( 0 , 2)) = 1
		_Top_TilingX("Tiling X", Float) = 1
		_Top_TilingY("Tiling Y", Float) = 1
		_Top_OffsetX("Offset X", Float) = 0
		_Top_OffsetY("Offset Y", Float) = 0
		[Normal][DE_DrawerTextureSingleLine]_Top_BumpMap("Normal Map", 2D) = "bump" {}
		_Top_NormalStrength("Normal Strength", Float) = 1
		[DE_DrawerTextureSingleLine]_Top_MetallicMap("Metallic Map", 2D) = "white" {}
		_Top_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[DE_DrawerTextureSingleLine]_Top_OcclusionMap("Occlusion Map", 2D) = "white" {}
		[DE_DrawerToggleNoKeyword]_Top_OcclusionSource("Occlusion is Baked", Float) = 0
		_Top_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		[DE_DrawerTextureSingleLine]_Top_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[DE_DrawerFloatEnum(Smoothness _Roughness _Geometric)]_Top_SmoothnessType("Smoothness Source", Float) = 0
		[DE_DrawerSliderRemap(_Top_SmoothnessMin, _Top_SmoothnessMax,0, 1)]_Top_Smoothness("Smoothness", Vector) = (0,0,0,0)
		[HideInInspector]_Top_SmoothnessMin("Smoothness Min", Range( 0 , 1)) = 0
		[HideInInspector]_Top_SmoothnessMax("Smoothness Max", Range( 0 , 1)) = 0
		[Header(BOTTOM)]_Bottom_Color("Tint", Color) = (1,1,1,0)
		[DE_DrawerTextureSingleLine]_Bottom_MainTex("Albedo Map", 2D) = "white" {}
		_Bottom_Brightness("Brightness", Range( 0 , 2)) = 1
		_Bottom_TilingX("Tiling X", Float) = 1
		_Bottom_TilingY("Tiling Y", Float) = 1
		_Bottom_OffsetX("Offset X", Float) = 0
		_Bottom_OffsetY("Offset Y", Float) = 0
		[Normal][DE_DrawerTextureSingleLine]_Bottom_BumpMap("Normal Map", 2D) = "bump" {}
		_Bottom_NormalStrength("Normal Strength", Float) = 1
		[DE_DrawerTextureSingleLine]_Bottom_MetallicMap("Metallic Map", 2D) = "white" {}
		_Bottom_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[DE_DrawerToggleNoKeyword]_Bottom_OcclusionSource("Occlusion is Baked", Float) = 0
		_Bottom_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		[DE_DrawerTextureSingleLine]_Bottom_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[DE_DrawerFloatEnum(Smoothness _Roughness _Geometric)]_Bottom_SmoothnessType("Smoothness Source", Float) = 0
		[ASEEnd][DE_DrawerSliderRemap(_Bottom_SmoothnessMin,_Bottom_SmoothnessMax,0, 1)]_Bottom_Smoothness("Smoothness", Vector) = (0,0,0,0)
		[HideInInspector]_Bottom_SmoothnessMin("Smoothness Min", Range( 0 , 1)) = 0
		[HideInInspector]_Bottom_SmoothnessMax("Smoothness Max", Range( 0 , 1)) = 0

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry-10" "NatureRendererInstancing"="True" }
		Cull [_RenderFace]
		AlphaToMask [_AlphatoCoverage]
		
		HLSLINCLUDE
		#pragma target 2.0

		#pragma prefer_hlslcc gles
		

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}
		
		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS

		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForward" "NatureRendererInstancing"="True" }
			
			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]
			

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma multi_compile _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS _ADDITIONAL_OFF
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			
			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK

			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Bottom_Color;
			float4 _Top_Color;
			float4 _Top_Smoothness;
			float4 _Bottom_Smoothness;
			half _Bottom_NormalStrength;
			half _Top_NormalStrength;
			float _Blend_CoverageAmount;
			float _Blend_CoverageFactor;
			float _Blend_CoverageFalloff;
			float _Bottom_MetallicStrength;
			float _AlphatoCoverage;
			half _Top_Brightness;
			half _Bottom_SmoothnessType;
			float _Bottom_SmoothnessMin;
			float _Bottom_SmoothnessMax;
			float _Bottom_OcclusionStrengthAO;
			float _Bottom_OcclusionSource;
			half _Top_SmoothnessType;
			float _Top_MetallicStrength;
			float _Top_OffsetY;
			float _Top_TilingY;
			float _Top_OcclusionStrengthAO;
			float _Top_TilingX;
			half _Bottom_Brightness;
			float _Bottom_OffsetY;
			float _Bottom_OffsetX;
			float _Bottom_TilingY;
			float _Bottom_TilingX;
			half _Blend_Space;
			float _Top_SmoothnessMin;
			float _Top_SmoothnessMax;
			int _ColorMask;
			half _EmissionFlags;
			int _RenderFace;
			int _ZWriteMode;
			float _Top_OffsetX;
			float _Top_OcclusionSource;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_Bottom_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_Top_MainTex);
			TEXTURE2D(_Bottom_BumpMap);
			TEXTURE2D(_Top_BumpMap);
			TEXTURE2D(_Bottom_MetallicMap);
			TEXTURE2D(_Top_MetallicMap);
			TEXTURE2D(_Bottom_SmoothnessMap);
			TEXTURE2D(_Top_OcclusionMap);
			TEXTURE2D(_Top_SmoothnessMap);


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float3 AdditionalLightsFlatMask( float3 WorldPosition, float4 ShadowMask )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
				#if ASE_SRP_VERSION >= 100000
					Light light = GetAdditionalLight(i, WorldPosition, ShadowMask);
				#else
					Light light = GetAdditionalLight(i, WorldPosition);
				#endif
					Color += light.color *(light.distanceAttenuation * light.shadowAttenuation);
					
				}
				#endif
				return Color;
			}
			
			float4 SmoothnessTypefloat4switch215_g44761( float m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else if(m_switch ==2)
					return m_Geometric;
				else
				return float4(0,0,0,0);
			}
			
			float4 SmoothnessTypefloat4switch215_g44749( float m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else if(m_switch ==2)
					return m_Geometric;
				else
				return float4(0,0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord7 = v.vertex;
				o.ase_color = v.ase_color;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag ( VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float _UV_SPACE2529_g44747 = _Blend_Space;
				float temp_output_62_0_g44772 = _UV_SPACE2529_g44747;
				float3 lerpResult99_g44775 = lerp( WorldPosition , IN.ase_texcoord7.xyz , temp_output_62_0_g44772);
				float3 break10_g44772 = lerpResult99_g44775;
				float2 appendResult13_g44772 = (float2(break10_g44772.y , break10_g44772.z));
				float2 appendResult154_g44747 = (float2(_Bottom_TilingX , _Bottom_TilingY));
				float2 BOTTOM_Tilling563_g44747 = appendResult154_g44747;
				float2 temp_output_60_0_g44772 = BOTTOM_Tilling563_g44747;
				float2 appendResult153_g44747 = (float2(_Bottom_OffsetX , _Bottom_OffsetY));
				float2 BOTTOM_Offset561_g44747 = appendResult153_g44747;
				float2 temp_output_61_0_g44772 = BOTTOM_Offset561_g44747;
				float2 UV_0121_g44772 = ( ( appendResult13_g44772 * temp_output_60_0_g44772 ) + temp_output_61_0_g44772 );
				float3 WorldNormal83_g44773 = WorldNormal;
				float3 lerpResult99_g44773 = lerp( WorldNormal83_g44773 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44773 , 0.0 ) ).xyz , temp_output_62_0_g44772);
				float3 temp_output_33_0_g44772 = abs( lerpResult99_g44773 );
				float dotResult30_g44772 = dot( temp_output_33_0_g44772 , float3(1,1,1) );
				float3 BLEND36_g44772 = ( temp_output_33_0_g44772 / dotResult30_g44772 );
				float3 break48_g44772 = BLEND36_g44772;
				float2 appendResult15_g44772 = (float2(break10_g44772.x , break10_g44772.z));
				float2 UV_0220_g44772 = ( ( appendResult15_g44772 * temp_output_60_0_g44772 ) + temp_output_61_0_g44772 );
				float2 appendResult25_g44772 = (float2(break10_g44772.x , break10_g44772.y));
				float2 UV_0327_g44772 = ( ( appendResult25_g44772 * temp_output_60_0_g44772 ) + temp_output_61_0_g44772 );
				float4 temp_output_59_0_g44772 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0121_g44772 ) * break48_g44772.x ) + ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0220_g44772 ) * break48_g44772.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0327_g44772 ) * break48_g44772.z ) );
				float4 temp_output_2592_78_g44747 = temp_output_59_0_g44772;
				float4 BOTTOM_FINAL_ALBEDO612_g44747 = temp_output_2592_78_g44747;
				float temp_output_62_0_g44766 = _UV_SPACE2529_g44747;
				float3 lerpResult99_g44769 = lerp( WorldPosition , IN.ase_texcoord7.xyz , temp_output_62_0_g44766);
				float3 break10_g44766 = lerpResult99_g44769;
				float2 appendResult13_g44766 = (float2(break10_g44766.y , break10_g44766.z));
				float2 appendResult897_g44747 = (float2(_Top_TilingX , _Top_TilingY));
				float2 TOP_Tilling892_g44747 = appendResult897_g44747;
				float2 temp_output_60_0_g44766 = TOP_Tilling892_g44747;
				float2 appendResult896_g44747 = (float2(_Top_OffsetX , _Top_OffsetY));
				float2 TOP_Offset869_g44747 = appendResult896_g44747;
				float2 temp_output_61_0_g44766 = TOP_Offset869_g44747;
				float2 UV_0121_g44766 = ( ( appendResult13_g44766 * temp_output_60_0_g44766 ) + temp_output_61_0_g44766 );
				float3 WorldNormal83_g44767 = WorldNormal;
				float3 lerpResult99_g44767 = lerp( WorldNormal83_g44767 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44767 , 0.0 ) ).xyz , temp_output_62_0_g44766);
				float3 temp_output_33_0_g44766 = abs( lerpResult99_g44767 );
				float dotResult30_g44766 = dot( temp_output_33_0_g44766 , float3(1,1,1) );
				float3 BLEND36_g44766 = ( temp_output_33_0_g44766 / dotResult30_g44766 );
				float3 break48_g44766 = BLEND36_g44766;
				float2 appendResult15_g44766 = (float2(break10_g44766.x , break10_g44766.z));
				float2 UV_0220_g44766 = ( ( appendResult15_g44766 * temp_output_60_0_g44766 ) + temp_output_61_0_g44766 );
				float2 appendResult25_g44766 = (float2(break10_g44766.x , break10_g44766.y));
				float2 UV_0327_g44766 = ( ( appendResult25_g44766 * temp_output_60_0_g44766 ) + temp_output_61_0_g44766 );
				float4 temp_output_59_0_g44766 = ( ( ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0121_g44766 ) * break48_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0220_g44766 ) * break48_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0327_g44766 ) * break48_g44766.z ) );
				float4 temp_output_2524_78_g44747 = temp_output_59_0_g44766;
				float4 TOP_FINAL_ALBEDO632_g44747 = temp_output_2524_78_g44747;
				float3 break109_g44772 = BLEND36_g44772;
				float4 temp_output_2592_71_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0121_g44772 ) * break109_g44772.x ) + ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0220_g44772 ) * break109_g44772.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0327_g44772 ) * break109_g44772.z ) );
				float4 BOTTOM_FINAL_NORMAL614_g44747 = temp_output_2592_71_g44747;
				float4 temp_output_1_0_g44751 = BOTTOM_FINAL_NORMAL614_g44747;
				float temp_output_8_0_g44751 = _Bottom_NormalStrength;
				float3 unpack52_g44751 = UnpackNormalScale( temp_output_1_0_g44751, temp_output_8_0_g44751 );
				unpack52_g44751.z = lerp( 1, unpack52_g44751.z, saturate(temp_output_8_0_g44751) );
				float3 break109_g44766 = BLEND36_g44766;
				float4 temp_output_2524_71_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0121_g44766 ) * break109_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0220_g44766 ) * break109_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0327_g44766 ) * break109_g44766.z ) );
				float4 TOP_FINAL_NORMAL641_g44747 = temp_output_2524_71_g44747;
				float4 temp_output_1_0_g44753 = TOP_FINAL_NORMAL641_g44747;
				float temp_output_8_0_g44753 = _Top_NormalStrength;
				float3 unpack52_g44753 = UnpackNormalScale( temp_output_1_0_g44753, temp_output_8_0_g44753 );
				unpack52_g44753.z = lerp( 1, unpack52_g44753.z, saturate(temp_output_8_0_g44753) );
				float3 WorldNormal83_g44778 = WorldNormal;
				float3 lerpResult99_g44778 = lerp( WorldNormal83_g44778 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44778 , 0.0 ) ).xyz , _Blend_Space);
				float temp_output_180_0_g44747 = ( 1.0 + _Blend_CoverageFactor );
				float _Coverage_Normal2553_g44747 = saturate( pow( saturate( ( lerpResult99_g44778.y * _Blend_CoverageAmount * temp_output_180_0_g44747 ) ) , _Blend_CoverageFalloff ) );
				float3 lerpResult47_g44747 = lerp( unpack52_g44751 , unpack52_g44753 , _Coverage_Normal2553_g44747);
				float3 GLOBAL_NORMAL_OUT525_g44747 = lerpResult47_g44747;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal81_g44758 = GLOBAL_NORMAL_OUT525_g44747;
				float3 worldNormal81_g44758 = float3(dot(tanToWorld0,tanNormal81_g44758), dot(tanToWorld1,tanNormal81_g44758), dot(tanToWorld2,tanNormal81_g44758));
				float3 WorldNormal83_g44758 = worldNormal81_g44758;
				float3 lerpResult99_g44758 = lerp( WorldNormal83_g44758 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44758 , 0.0 ) ).xyz , _Blend_Space);
				float _Coverage2552_g44747 = saturate( pow( saturate( ( lerpResult99_g44758.y * _Blend_CoverageAmount * temp_output_180_0_g44747 ) ) , _Blend_CoverageFalloff ) );
				float4 lerpResult1269_g44747 = lerp( ( float4( (_Bottom_Color).rgb , 0.0 ) * BOTTOM_FINAL_ALBEDO612_g44747 * _Bottom_Brightness ) , ( float4( (_Top_Color).rgb , 0.0 ) * TOP_FINAL_ALBEDO632_g44747 * _Top_Brightness ) , _Coverage2552_g44747);
				
				float3 temp_output_16_0_g44748 = GLOBAL_NORMAL_OUT525_g44747;
				float3 tanNormal134_g44748 = temp_output_16_0_g44748;
				float3 worldNormal134_g44748 = float3(dot(tanToWorld0,tanNormal134_g44748), dot(tanToWorld1,tanNormal134_g44748), dot(tanToWorld2,tanNormal134_g44748));
				float3 NORMAL_TANGENTSPACE135_g44748 = worldNormal134_g44748;
				float3 WorldPosition63_g44748 = NORMAL_TANGENTSPACE135_g44748;
				float4 shadowMaskValue77_g44748 = float4(1,1,1,1);
				float4 ShadowMask63_g44748 = shadowMaskValue77_g44748;
				float3 localAdditionalLightsFlatMask63_g44748 = AdditionalLightsFlatMask( WorldPosition63_g44748 , ShadowMask63_g44748 );
				float3 URP_ADDITIONAL_LIGHT520_g44747 = localAdditionalLightsFlatMask63_g44748;
				
				float3 break169_g44772 = BLEND36_g44772;
				float4 temp_output_2592_70_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_MetallicMap, sampler_trilinear_repeat, UV_0121_g44772 ) * break169_g44772.x ) + ( SAMPLE_TEXTURE2D( _Bottom_MetallicMap, sampler_trilinear_repeat, UV_0220_g44772 ) * break169_g44772.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_MetallicMap, sampler_trilinear_repeat, UV_0327_g44772 ) * break169_g44772.z ) );
				float4 BOTTOM_MASK_MAP_B357_g44747 = temp_output_2592_70_g44747;
				float temp_output_1_0_g44756 = _Bottom_MetallicStrength;
				float BOTTOM_FINAL_METALLIC483_g44747 = ( BOTTOM_MASK_MAP_B357_g44747.r * temp_output_1_0_g44756 );
				float3 break169_g44766 = BLEND36_g44766;
				float4 temp_output_2524_70_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Top_MetallicMap, sampler_trilinear_repeat, UV_0121_g44766 ) * break169_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_MetallicMap, sampler_trilinear_repeat, UV_0220_g44766 ) * break169_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_MetallicMap, sampler_trilinear_repeat, UV_0327_g44766 ) * break169_g44766.z ) );
				float4 TOP_MASK_MAP_B372_g44747 = temp_output_2524_70_g44747;
				float temp_output_1_0_g44754 = _Top_MetallicStrength;
				float TOP_FINAL_METALLIC482_g44747 = ( TOP_MASK_MAP_B372_g44747.r * temp_output_1_0_g44754 );
				float lerpResult364_g44747 = lerp( BOTTOM_FINAL_METALLIC483_g44747 , TOP_FINAL_METALLIC482_g44747 , _Coverage2552_g44747);
				
				float temp_output_223_0_g44761 = _Bottom_SmoothnessType;
				float m_switch215_g44761 = temp_output_223_0_g44761;
				float3 break154_g44772 = BLEND36_g44772;
				float4 temp_output_2592_72_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_SmoothnessMap, sampler_trilinear_repeat, UV_0121_g44772 ) * break154_g44772.x ) + ( SAMPLE_TEXTURE2D( _Bottom_SmoothnessMap, sampler_trilinear_repeat, UV_0220_g44772 ) * break154_g44772.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_SmoothnessMap, sampler_trilinear_repeat, UV_0327_g44772 ) * break154_g44772.z ) );
				float4 BOTTOM_MASK_MAP_G358_g44747 = temp_output_2592_72_g44747;
				float4 temp_cast_16 = (_Bottom_SmoothnessMin).xxxx;
				float4 temp_cast_17 = (_Bottom_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g44761 = (temp_cast_16 + (BOTTOM_MASK_MAP_G358_g44747 - float4( 0,0,0,0 )) * (temp_cast_17 - temp_cast_16) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g44761 = temp_output_216_0_g44761;
				float4 temp_cast_18 = (_Bottom_SmoothnessMin).xxxx;
				float4 temp_cast_19 = (_Bottom_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g44761 = ( 1.0 - temp_output_216_0_g44761 );
				float4 m_Roughness215_g44761 = temp_output_214_0_g44761;
				float4 temp_cast_20 = (_Bottom_SmoothnessMin).xxxx;
				float4 temp_cast_21 = (_Bottom_SmoothnessMax).xxxx;
				float3 tanNormal67_g44751 = unpack52_g44751;
				float3 worldNormal67_g44751 = float3(dot(tanToWorld0,tanNormal67_g44751), dot(tanToWorld1,tanNormal67_g44751), dot(tanToWorld2,tanNormal67_g44751));
				float3 BOTTOM_FINAL_NORMAL_WORLD329_g44747 = worldNormal67_g44751;
				float3 temp_output_4_0_g44761 = BOTTOM_FINAL_NORMAL_WORLD329_g44747;
				float3 temp_output_178_0_g44761 = ddx( temp_output_4_0_g44761 );
				float dotResult195_g44761 = dot( temp_output_178_0_g44761 , temp_output_178_0_g44761 );
				float3 temp_output_175_0_g44761 = ddy( temp_output_4_0_g44761 );
				float dotResult201_g44761 = dot( temp_output_175_0_g44761 , temp_output_175_0_g44761 );
				float BOTTOM_ALBEDO_R359_g44747 = temp_output_2592_78_g44747.r;
				float4 temp_cast_22 = (BOTTOM_ALBEDO_R359_g44747).xxxx;
				float4 m_Geometric215_g44761 = ( sqrt( saturate( ( temp_output_216_0_g44761 + ( ( dotResult195_g44761 + dotResult201_g44761 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_22 ) );
				float4 localSmoothnessTypefloat4switch215_g44761 = SmoothnessTypefloat4switch215_g44761( m_switch215_g44761 , m_Smoothness215_g44761 , m_Roughness215_g44761 , m_Geometric215_g44761 );
				float3 break184_g44766 = BLEND36_g44766;
				float4 temp_output_2524_76_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Top_OcclusionMap, sampler_trilinear_repeat, UV_0121_g44766 ) * break184_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_OcclusionMap, sampler_trilinear_repeat, UV_0220_g44766 ) * break184_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_OcclusionMap, sampler_trilinear_repeat, UV_0327_g44766 ) * break184_g44766.z ) );
				float4 TOP_PBR_Occlusion2835_g44747 = temp_output_2524_76_g44747;
				float temp_output_16_0_g44771 = _Bottom_OcclusionStrengthAO;
				float temp_output_65_0_g44771 = ( 1.0 - temp_output_16_0_g44771 );
				float3 appendResult69_g44771 = (float3(temp_output_65_0_g44771 , temp_output_65_0_g44771 , temp_output_65_0_g44771));
				float4 color77_g44771 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_25 = (IN.ase_color.a).xxxx;
				float4 lerpResult75_g44771 = lerp( color77_g44771 , temp_cast_25 , temp_output_16_0_g44771);
				float4 lerpResult83_g44771 = lerp( float4( ( ( ( (TOP_PBR_Occlusion2835_g44747).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g44771 ) + appendResult69_g44771 ) , 0.0 ) , lerpResult75_g44771 , _Bottom_OcclusionSource);
				float4 BOTTOM_FINAL_SMOOTHNESS485_g44747 = ( localSmoothnessTypefloat4switch215_g44761 * saturate( lerpResult83_g44771 ) );
				float temp_output_223_0_g44749 = _Top_SmoothnessType;
				float m_switch215_g44749 = temp_output_223_0_g44749;
				float3 break154_g44766 = BLEND36_g44766;
				float4 temp_output_2524_72_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Top_SmoothnessMap, sampler_trilinear_repeat, UV_0121_g44766 ) * break154_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_SmoothnessMap, sampler_trilinear_repeat, UV_0220_g44766 ) * break154_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_SmoothnessMap, sampler_trilinear_repeat, UV_0327_g44766 ) * break154_g44766.z ) );
				float4 TOP_MASK_MAP_G371_g44747 = temp_output_2524_72_g44747;
				float4 temp_cast_28 = (_Top_SmoothnessMin).xxxx;
				float4 temp_cast_29 = (_Top_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g44749 = (temp_cast_28 + (TOP_MASK_MAP_G371_g44747 - float4( 0,0,0,0 )) * (temp_cast_29 - temp_cast_28) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g44749 = temp_output_216_0_g44749;
				float4 temp_cast_30 = (_Top_SmoothnessMin).xxxx;
				float4 temp_cast_31 = (_Top_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g44749 = ( 1.0 - temp_output_216_0_g44749 );
				float4 m_Roughness215_g44749 = temp_output_214_0_g44749;
				float4 temp_cast_32 = (_Top_SmoothnessMin).xxxx;
				float4 temp_cast_33 = (_Top_SmoothnessMax).xxxx;
				float3 tanNormal67_g44753 = unpack52_g44753;
				float3 worldNormal67_g44753 = float3(dot(tanToWorld0,tanNormal67_g44753), dot(tanToWorld1,tanNormal67_g44753), dot(tanToWorld2,tanNormal67_g44753));
				float3 TOP_FINAL_NORMAL_WORLD377_g44747 = worldNormal67_g44753;
				float3 temp_output_4_0_g44749 = TOP_FINAL_NORMAL_WORLD377_g44747;
				float3 temp_output_178_0_g44749 = ddx( temp_output_4_0_g44749 );
				float dotResult195_g44749 = dot( temp_output_178_0_g44749 , temp_output_178_0_g44749 );
				float3 temp_output_175_0_g44749 = ddy( temp_output_4_0_g44749 );
				float dotResult201_g44749 = dot( temp_output_175_0_g44749 , temp_output_175_0_g44749 );
				float TOP_ALBEDO_R2629_g44747 = temp_output_2524_78_g44747.r;
				float4 temp_cast_34 = (TOP_ALBEDO_R2629_g44747).xxxx;
				float4 m_Geometric215_g44749 = ( sqrt( saturate( ( temp_output_216_0_g44749 + ( ( dotResult195_g44749 + dotResult201_g44749 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_34 ) );
				float4 localSmoothnessTypefloat4switch215_g44749 = SmoothnessTypefloat4switch215_g44749( m_switch215_g44749 , m_Smoothness215_g44749 , m_Roughness215_g44749 , m_Geometric215_g44749 );
				float temp_output_16_0_g44765 = _Top_OcclusionStrengthAO;
				float temp_output_65_0_g44765 = ( 1.0 - temp_output_16_0_g44765 );
				float3 appendResult69_g44765 = (float3(temp_output_65_0_g44765 , temp_output_65_0_g44765 , temp_output_65_0_g44765));
				float4 color77_g44765 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_37 = (IN.ase_color.a).xxxx;
				float4 lerpResult75_g44765 = lerp( color77_g44765 , temp_cast_37 , temp_output_16_0_g44765);
				float4 lerpResult83_g44765 = lerp( float4( ( ( ( (TOP_PBR_Occlusion2835_g44747).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g44765 ) + appendResult69_g44765 ) , 0.0 ) , lerpResult75_g44765 , _Top_OcclusionSource);
				float4 TOP_FINAL_SMOOTHNESS484_g44747 = ( localSmoothnessTypefloat4switch215_g44749 * saturate( lerpResult83_g44765 ) );
				float4 lerpResult365_g44747 = lerp( BOTTOM_FINAL_SMOOTHNESS485_g44747 , TOP_FINAL_SMOOTHNESS484_g44747 , _Coverage2552_g44747);
				
				float4 BOTTOM_FINAL_OCCLUSION487_g44747 = saturate( lerpResult83_g44771 );
				float4 TOP_FINAL_OCCLUSION486_g44747 = saturate( lerpResult83_g44765 );
				float4 lerpResult488_g44747 = lerp( BOTTOM_FINAL_OCCLUSION487_g44747 , TOP_FINAL_OCCLUSION486_g44747 , _Coverage2552_g44747);
				
				float3 Albedo = lerpResult1269_g44747.rgb;
				float3 Normal = ( lerpResult47_g44747 + URP_ADDITIONAL_LIGHT520_g44747 );
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = lerpResult364_g44747;
				float Smoothness = lerpResult365_g44747.x;
				float Occlusion = lerpResult488_g44747.r;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif
				
				inputData.normalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				half4 color = UniversalFragmentPBR(
					inputData, 
					Albedo, 
					Metallic, 
					Specular, 
					Smoothness, 
					Occlusion, 
					Emission, 
					Alpha);

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _TransmissionShadow;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif

				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );

					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;

					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );

							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif

				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return color;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag
#if ASE_SRP_VERSION >= 110000
			#pragma multi_compile _ _CASTING_PUNCTUAL_LIGHT_SHADOW
#endif
			#define SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Bottom_Color;
			float4 _Top_Color;
			float4 _Top_Smoothness;
			float4 _Bottom_Smoothness;
			half _Bottom_NormalStrength;
			half _Top_NormalStrength;
			float _Blend_CoverageAmount;
			float _Blend_CoverageFactor;
			float _Blend_CoverageFalloff;
			float _Bottom_MetallicStrength;
			float _AlphatoCoverage;
			half _Top_Brightness;
			half _Bottom_SmoothnessType;
			float _Bottom_SmoothnessMin;
			float _Bottom_SmoothnessMax;
			float _Bottom_OcclusionStrengthAO;
			float _Bottom_OcclusionSource;
			half _Top_SmoothnessType;
			float _Top_MetallicStrength;
			float _Top_OffsetY;
			float _Top_TilingY;
			float _Top_OcclusionStrengthAO;
			float _Top_TilingX;
			half _Bottom_Brightness;
			float _Bottom_OffsetY;
			float _Bottom_OffsetX;
			float _Bottom_TilingY;
			float _Bottom_TilingX;
			half _Blend_Space;
			float _Top_SmoothnessMin;
			float _Top_SmoothnessMax;
			int _ColorMask;
			half _EmissionFlags;
			int _RenderFace;
			int _ZWriteMode;
			float _Top_OffsetX;
			float _Top_OcclusionSource;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			

			float3 _LightDirection;
#if ASE_SRP_VERSION >= 110000 
			float3 _LightPosition;
#endif
			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif
				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

		#if ASE_SRP_VERSION >= 110000 
			#if _CASTING_PUNCTUAL_LIGHT_SHADOW
				float3 lightDirectionWS = normalize(_LightPosition - positionWS);
			#else
				float3 lightDirectionWS = _LightDirection;
			#endif
				float4 clipPos = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));
			#if UNITY_REVERSED_Z
				clipPos.z = min(clipPos.z, UNITY_NEAR_CLIP_VALUE);
			#else
				clipPos.z = max(clipPos.z, UNITY_NEAR_CLIP_VALUE);
			#endif
		#else
				float4 clipPos = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, _LightDirection));
			#if UNITY_REVERSED_Z
				clipPos.z = min(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
			#else
				clipPos.z = max(clipPos.z, clipPos.w * UNITY_NEAR_CLIP_VALUE);
			#endif
		#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = clipPos;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );
				
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif
				return 0;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Bottom_Color;
			float4 _Top_Color;
			float4 _Top_Smoothness;
			float4 _Bottom_Smoothness;
			half _Bottom_NormalStrength;
			half _Top_NormalStrength;
			float _Blend_CoverageAmount;
			float _Blend_CoverageFactor;
			float _Blend_CoverageFalloff;
			float _Bottom_MetallicStrength;
			float _AlphatoCoverage;
			half _Top_Brightness;
			half _Bottom_SmoothnessType;
			float _Bottom_SmoothnessMin;
			float _Bottom_SmoothnessMax;
			float _Bottom_OcclusionStrengthAO;
			float _Bottom_OcclusionSource;
			half _Top_SmoothnessType;
			float _Top_MetallicStrength;
			float _Top_OffsetY;
			float _Top_TilingY;
			float _Top_OcclusionStrengthAO;
			float _Top_TilingX;
			half _Bottom_Brightness;
			float _Bottom_OffsetY;
			float _Bottom_OffsetX;
			float _Bottom_TilingY;
			float _Bottom_TilingX;
			half _Blend_Space;
			float _Top_SmoothnessMin;
			float _Top_SmoothnessMax;
			int _ColorMask;
			half _EmissionFlags;
			int _RenderFace;
			int _ZWriteMode;
			float _Top_OffsetX;
			float _Top_OcclusionSource;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				#ifdef ASE_DEPTH_WRITE_ON
				outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}
		
		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Bottom_Color;
			float4 _Top_Color;
			float4 _Top_Smoothness;
			float4 _Bottom_Smoothness;
			half _Bottom_NormalStrength;
			half _Top_NormalStrength;
			float _Blend_CoverageAmount;
			float _Blend_CoverageFactor;
			float _Blend_CoverageFalloff;
			float _Bottom_MetallicStrength;
			float _AlphatoCoverage;
			half _Top_Brightness;
			half _Bottom_SmoothnessType;
			float _Bottom_SmoothnessMin;
			float _Bottom_SmoothnessMax;
			float _Bottom_OcclusionStrengthAO;
			float _Bottom_OcclusionSource;
			half _Top_SmoothnessType;
			float _Top_MetallicStrength;
			float _Top_OffsetY;
			float _Top_TilingY;
			float _Top_OcclusionStrengthAO;
			float _Top_TilingX;
			half _Bottom_Brightness;
			float _Bottom_OffsetY;
			float _Bottom_OffsetX;
			float _Bottom_TilingY;
			float _Bottom_TilingX;
			half _Blend_Space;
			float _Top_SmoothnessMin;
			float _Top_SmoothnessMax;
			int _ColorMask;
			half _EmissionFlags;
			int _RenderFace;
			int _ZWriteMode;
			float _Top_OffsetX;
			float _Top_OcclusionSource;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_Bottom_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_Top_MainTex);
			TEXTURE2D(_Bottom_BumpMap);
			TEXTURE2D(_Top_BumpMap);


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float _UV_SPACE2529_g44747 = _Blend_Space;
				float temp_output_62_0_g44772 = _UV_SPACE2529_g44747;
				float3 lerpResult99_g44775 = lerp( WorldPosition , IN.ase_texcoord2.xyz , temp_output_62_0_g44772);
				float3 break10_g44772 = lerpResult99_g44775;
				float2 appendResult13_g44772 = (float2(break10_g44772.y , break10_g44772.z));
				float2 appendResult154_g44747 = (float2(_Bottom_TilingX , _Bottom_TilingY));
				float2 BOTTOM_Tilling563_g44747 = appendResult154_g44747;
				float2 temp_output_60_0_g44772 = BOTTOM_Tilling563_g44747;
				float2 appendResult153_g44747 = (float2(_Bottom_OffsetX , _Bottom_OffsetY));
				float2 BOTTOM_Offset561_g44747 = appendResult153_g44747;
				float2 temp_output_61_0_g44772 = BOTTOM_Offset561_g44747;
				float2 UV_0121_g44772 = ( ( appendResult13_g44772 * temp_output_60_0_g44772 ) + temp_output_61_0_g44772 );
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 WorldNormal83_g44773 = ase_worldNormal;
				float3 lerpResult99_g44773 = lerp( WorldNormal83_g44773 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44773 , 0.0 ) ).xyz , temp_output_62_0_g44772);
				float3 temp_output_33_0_g44772 = abs( lerpResult99_g44773 );
				float dotResult30_g44772 = dot( temp_output_33_0_g44772 , float3(1,1,1) );
				float3 BLEND36_g44772 = ( temp_output_33_0_g44772 / dotResult30_g44772 );
				float3 break48_g44772 = BLEND36_g44772;
				float2 appendResult15_g44772 = (float2(break10_g44772.x , break10_g44772.z));
				float2 UV_0220_g44772 = ( ( appendResult15_g44772 * temp_output_60_0_g44772 ) + temp_output_61_0_g44772 );
				float2 appendResult25_g44772 = (float2(break10_g44772.x , break10_g44772.y));
				float2 UV_0327_g44772 = ( ( appendResult25_g44772 * temp_output_60_0_g44772 ) + temp_output_61_0_g44772 );
				float4 temp_output_59_0_g44772 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0121_g44772 ) * break48_g44772.x ) + ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0220_g44772 ) * break48_g44772.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0327_g44772 ) * break48_g44772.z ) );
				float4 temp_output_2592_78_g44747 = temp_output_59_0_g44772;
				float4 BOTTOM_FINAL_ALBEDO612_g44747 = temp_output_2592_78_g44747;
				float temp_output_62_0_g44766 = _UV_SPACE2529_g44747;
				float3 lerpResult99_g44769 = lerp( WorldPosition , IN.ase_texcoord2.xyz , temp_output_62_0_g44766);
				float3 break10_g44766 = lerpResult99_g44769;
				float2 appendResult13_g44766 = (float2(break10_g44766.y , break10_g44766.z));
				float2 appendResult897_g44747 = (float2(_Top_TilingX , _Top_TilingY));
				float2 TOP_Tilling892_g44747 = appendResult897_g44747;
				float2 temp_output_60_0_g44766 = TOP_Tilling892_g44747;
				float2 appendResult896_g44747 = (float2(_Top_OffsetX , _Top_OffsetY));
				float2 TOP_Offset869_g44747 = appendResult896_g44747;
				float2 temp_output_61_0_g44766 = TOP_Offset869_g44747;
				float2 UV_0121_g44766 = ( ( appendResult13_g44766 * temp_output_60_0_g44766 ) + temp_output_61_0_g44766 );
				float3 WorldNormal83_g44767 = ase_worldNormal;
				float3 lerpResult99_g44767 = lerp( WorldNormal83_g44767 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44767 , 0.0 ) ).xyz , temp_output_62_0_g44766);
				float3 temp_output_33_0_g44766 = abs( lerpResult99_g44767 );
				float dotResult30_g44766 = dot( temp_output_33_0_g44766 , float3(1,1,1) );
				float3 BLEND36_g44766 = ( temp_output_33_0_g44766 / dotResult30_g44766 );
				float3 break48_g44766 = BLEND36_g44766;
				float2 appendResult15_g44766 = (float2(break10_g44766.x , break10_g44766.z));
				float2 UV_0220_g44766 = ( ( appendResult15_g44766 * temp_output_60_0_g44766 ) + temp_output_61_0_g44766 );
				float2 appendResult25_g44766 = (float2(break10_g44766.x , break10_g44766.y));
				float2 UV_0327_g44766 = ( ( appendResult25_g44766 * temp_output_60_0_g44766 ) + temp_output_61_0_g44766 );
				float4 temp_output_59_0_g44766 = ( ( ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0121_g44766 ) * break48_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0220_g44766 ) * break48_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0327_g44766 ) * break48_g44766.z ) );
				float4 temp_output_2524_78_g44747 = temp_output_59_0_g44766;
				float4 TOP_FINAL_ALBEDO632_g44747 = temp_output_2524_78_g44747;
				float3 break109_g44772 = BLEND36_g44772;
				float4 temp_output_2592_71_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0121_g44772 ) * break109_g44772.x ) + ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0220_g44772 ) * break109_g44772.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0327_g44772 ) * break109_g44772.z ) );
				float4 BOTTOM_FINAL_NORMAL614_g44747 = temp_output_2592_71_g44747;
				float4 temp_output_1_0_g44751 = BOTTOM_FINAL_NORMAL614_g44747;
				float temp_output_8_0_g44751 = _Bottom_NormalStrength;
				float3 unpack52_g44751 = UnpackNormalScale( temp_output_1_0_g44751, temp_output_8_0_g44751 );
				unpack52_g44751.z = lerp( 1, unpack52_g44751.z, saturate(temp_output_8_0_g44751) );
				float3 break109_g44766 = BLEND36_g44766;
				float4 temp_output_2524_71_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0121_g44766 ) * break109_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0220_g44766 ) * break109_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0327_g44766 ) * break109_g44766.z ) );
				float4 TOP_FINAL_NORMAL641_g44747 = temp_output_2524_71_g44747;
				float4 temp_output_1_0_g44753 = TOP_FINAL_NORMAL641_g44747;
				float temp_output_8_0_g44753 = _Top_NormalStrength;
				float3 unpack52_g44753 = UnpackNormalScale( temp_output_1_0_g44753, temp_output_8_0_g44753 );
				unpack52_g44753.z = lerp( 1, unpack52_g44753.z, saturate(temp_output_8_0_g44753) );
				float3 WorldNormal83_g44778 = ase_worldNormal;
				float3 lerpResult99_g44778 = lerp( WorldNormal83_g44778 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44778 , 0.0 ) ).xyz , _Blend_Space);
				float temp_output_180_0_g44747 = ( 1.0 + _Blend_CoverageFactor );
				float _Coverage_Normal2553_g44747 = saturate( pow( saturate( ( lerpResult99_g44778.y * _Blend_CoverageAmount * temp_output_180_0_g44747 ) ) , _Blend_CoverageFalloff ) );
				float3 lerpResult47_g44747 = lerp( unpack52_g44751 , unpack52_g44753 , _Coverage_Normal2553_g44747);
				float3 GLOBAL_NORMAL_OUT525_g44747 = lerpResult47_g44747;
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal81_g44758 = GLOBAL_NORMAL_OUT525_g44747;
				float3 worldNormal81_g44758 = float3(dot(tanToWorld0,tanNormal81_g44758), dot(tanToWorld1,tanNormal81_g44758), dot(tanToWorld2,tanNormal81_g44758));
				float3 WorldNormal83_g44758 = worldNormal81_g44758;
				float3 lerpResult99_g44758 = lerp( WorldNormal83_g44758 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44758 , 0.0 ) ).xyz , _Blend_Space);
				float _Coverage2552_g44747 = saturate( pow( saturate( ( lerpResult99_g44758.y * _Blend_CoverageAmount * temp_output_180_0_g44747 ) ) , _Blend_CoverageFalloff ) );
				float4 lerpResult1269_g44747 = lerp( ( float4( (_Bottom_Color).rgb , 0.0 ) * BOTTOM_FINAL_ALBEDO612_g44747 * _Bottom_Brightness ) , ( float4( (_Top_Color).rgb , 0.0 ) * TOP_FINAL_ALBEDO632_g44747 * _Top_Brightness ) , _Coverage2552_g44747);
				
				
				float3 Albedo = lerpResult1269_g44747.rgb;
				float3 Emission = 0;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = Albedo;
				metaInput.Emission = Emission;
				
				return MetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			
			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON


			#pragma shader_feature _ _SMOOTHNESS_TEXTURE_ALBEDO_CHANNEL_A

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				float4 ase_texcoord3 : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				float4 ase_texcoord5 : TEXCOORD5;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Bottom_Color;
			float4 _Top_Color;
			float4 _Top_Smoothness;
			float4 _Bottom_Smoothness;
			half _Bottom_NormalStrength;
			half _Top_NormalStrength;
			float _Blend_CoverageAmount;
			float _Blend_CoverageFactor;
			float _Blend_CoverageFalloff;
			float _Bottom_MetallicStrength;
			float _AlphatoCoverage;
			half _Top_Brightness;
			half _Bottom_SmoothnessType;
			float _Bottom_SmoothnessMin;
			float _Bottom_SmoothnessMax;
			float _Bottom_OcclusionStrengthAO;
			float _Bottom_OcclusionSource;
			half _Top_SmoothnessType;
			float _Top_MetallicStrength;
			float _Top_OffsetY;
			float _Top_TilingY;
			float _Top_OcclusionStrengthAO;
			float _Top_TilingX;
			half _Bottom_Brightness;
			float _Bottom_OffsetY;
			float _Bottom_OffsetX;
			float _Bottom_TilingY;
			float _Bottom_TilingX;
			half _Blend_Space;
			float _Top_SmoothnessMin;
			float _Top_SmoothnessMax;
			int _ColorMask;
			half _EmissionFlags;
			int _RenderFace;
			int _ZWriteMode;
			float _Top_OffsetX;
			float _Top_OcclusionSource;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_Bottom_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_Top_MainTex);
			TEXTURE2D(_Bottom_BumpMap);
			TEXTURE2D(_Top_BumpMap);


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 ase_worldNormal = TransformObjectToWorldNormal(v.ase_normal);
				o.ase_texcoord3.xyz = ase_worldNormal;
				float3 ase_worldTangent = TransformObjectToWorldDir(v.ase_tangent.xyz);
				o.ase_texcoord4.xyz = ase_worldTangent;
				float ase_vertexTangentSign = v.ase_tangent.w * unity_WorldTransformParams.w;
				float3 ase_worldBitangent = cross( ase_worldNormal, ase_worldTangent ) * ase_vertexTangentSign;
				o.ase_texcoord5.xyz = ase_worldBitangent;
				
				o.ase_texcoord2 = v.vertex;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.w = 0;
				o.ase_texcoord4.w = 0;
				o.ase_texcoord5.w = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN  ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float _UV_SPACE2529_g44747 = _Blend_Space;
				float temp_output_62_0_g44772 = _UV_SPACE2529_g44747;
				float3 lerpResult99_g44775 = lerp( WorldPosition , IN.ase_texcoord2.xyz , temp_output_62_0_g44772);
				float3 break10_g44772 = lerpResult99_g44775;
				float2 appendResult13_g44772 = (float2(break10_g44772.y , break10_g44772.z));
				float2 appendResult154_g44747 = (float2(_Bottom_TilingX , _Bottom_TilingY));
				float2 BOTTOM_Tilling563_g44747 = appendResult154_g44747;
				float2 temp_output_60_0_g44772 = BOTTOM_Tilling563_g44747;
				float2 appendResult153_g44747 = (float2(_Bottom_OffsetX , _Bottom_OffsetY));
				float2 BOTTOM_Offset561_g44747 = appendResult153_g44747;
				float2 temp_output_61_0_g44772 = BOTTOM_Offset561_g44747;
				float2 UV_0121_g44772 = ( ( appendResult13_g44772 * temp_output_60_0_g44772 ) + temp_output_61_0_g44772 );
				float3 ase_worldNormal = IN.ase_texcoord3.xyz;
				float3 WorldNormal83_g44773 = ase_worldNormal;
				float3 lerpResult99_g44773 = lerp( WorldNormal83_g44773 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44773 , 0.0 ) ).xyz , temp_output_62_0_g44772);
				float3 temp_output_33_0_g44772 = abs( lerpResult99_g44773 );
				float dotResult30_g44772 = dot( temp_output_33_0_g44772 , float3(1,1,1) );
				float3 BLEND36_g44772 = ( temp_output_33_0_g44772 / dotResult30_g44772 );
				float3 break48_g44772 = BLEND36_g44772;
				float2 appendResult15_g44772 = (float2(break10_g44772.x , break10_g44772.z));
				float2 UV_0220_g44772 = ( ( appendResult15_g44772 * temp_output_60_0_g44772 ) + temp_output_61_0_g44772 );
				float2 appendResult25_g44772 = (float2(break10_g44772.x , break10_g44772.y));
				float2 UV_0327_g44772 = ( ( appendResult25_g44772 * temp_output_60_0_g44772 ) + temp_output_61_0_g44772 );
				float4 temp_output_59_0_g44772 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0121_g44772 ) * break48_g44772.x ) + ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0220_g44772 ) * break48_g44772.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0327_g44772 ) * break48_g44772.z ) );
				float4 temp_output_2592_78_g44747 = temp_output_59_0_g44772;
				float4 BOTTOM_FINAL_ALBEDO612_g44747 = temp_output_2592_78_g44747;
				float temp_output_62_0_g44766 = _UV_SPACE2529_g44747;
				float3 lerpResult99_g44769 = lerp( WorldPosition , IN.ase_texcoord2.xyz , temp_output_62_0_g44766);
				float3 break10_g44766 = lerpResult99_g44769;
				float2 appendResult13_g44766 = (float2(break10_g44766.y , break10_g44766.z));
				float2 appendResult897_g44747 = (float2(_Top_TilingX , _Top_TilingY));
				float2 TOP_Tilling892_g44747 = appendResult897_g44747;
				float2 temp_output_60_0_g44766 = TOP_Tilling892_g44747;
				float2 appendResult896_g44747 = (float2(_Top_OffsetX , _Top_OffsetY));
				float2 TOP_Offset869_g44747 = appendResult896_g44747;
				float2 temp_output_61_0_g44766 = TOP_Offset869_g44747;
				float2 UV_0121_g44766 = ( ( appendResult13_g44766 * temp_output_60_0_g44766 ) + temp_output_61_0_g44766 );
				float3 WorldNormal83_g44767 = ase_worldNormal;
				float3 lerpResult99_g44767 = lerp( WorldNormal83_g44767 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44767 , 0.0 ) ).xyz , temp_output_62_0_g44766);
				float3 temp_output_33_0_g44766 = abs( lerpResult99_g44767 );
				float dotResult30_g44766 = dot( temp_output_33_0_g44766 , float3(1,1,1) );
				float3 BLEND36_g44766 = ( temp_output_33_0_g44766 / dotResult30_g44766 );
				float3 break48_g44766 = BLEND36_g44766;
				float2 appendResult15_g44766 = (float2(break10_g44766.x , break10_g44766.z));
				float2 UV_0220_g44766 = ( ( appendResult15_g44766 * temp_output_60_0_g44766 ) + temp_output_61_0_g44766 );
				float2 appendResult25_g44766 = (float2(break10_g44766.x , break10_g44766.y));
				float2 UV_0327_g44766 = ( ( appendResult25_g44766 * temp_output_60_0_g44766 ) + temp_output_61_0_g44766 );
				float4 temp_output_59_0_g44766 = ( ( ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0121_g44766 ) * break48_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0220_g44766 ) * break48_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0327_g44766 ) * break48_g44766.z ) );
				float4 temp_output_2524_78_g44747 = temp_output_59_0_g44766;
				float4 TOP_FINAL_ALBEDO632_g44747 = temp_output_2524_78_g44747;
				float3 break109_g44772 = BLEND36_g44772;
				float4 temp_output_2592_71_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0121_g44772 ) * break109_g44772.x ) + ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0220_g44772 ) * break109_g44772.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0327_g44772 ) * break109_g44772.z ) );
				float4 BOTTOM_FINAL_NORMAL614_g44747 = temp_output_2592_71_g44747;
				float4 temp_output_1_0_g44751 = BOTTOM_FINAL_NORMAL614_g44747;
				float temp_output_8_0_g44751 = _Bottom_NormalStrength;
				float3 unpack52_g44751 = UnpackNormalScale( temp_output_1_0_g44751, temp_output_8_0_g44751 );
				unpack52_g44751.z = lerp( 1, unpack52_g44751.z, saturate(temp_output_8_0_g44751) );
				float3 break109_g44766 = BLEND36_g44766;
				float4 temp_output_2524_71_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0121_g44766 ) * break109_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0220_g44766 ) * break109_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0327_g44766 ) * break109_g44766.z ) );
				float4 TOP_FINAL_NORMAL641_g44747 = temp_output_2524_71_g44747;
				float4 temp_output_1_0_g44753 = TOP_FINAL_NORMAL641_g44747;
				float temp_output_8_0_g44753 = _Top_NormalStrength;
				float3 unpack52_g44753 = UnpackNormalScale( temp_output_1_0_g44753, temp_output_8_0_g44753 );
				unpack52_g44753.z = lerp( 1, unpack52_g44753.z, saturate(temp_output_8_0_g44753) );
				float3 WorldNormal83_g44778 = ase_worldNormal;
				float3 lerpResult99_g44778 = lerp( WorldNormal83_g44778 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44778 , 0.0 ) ).xyz , _Blend_Space);
				float temp_output_180_0_g44747 = ( 1.0 + _Blend_CoverageFactor );
				float _Coverage_Normal2553_g44747 = saturate( pow( saturate( ( lerpResult99_g44778.y * _Blend_CoverageAmount * temp_output_180_0_g44747 ) ) , _Blend_CoverageFalloff ) );
				float3 lerpResult47_g44747 = lerp( unpack52_g44751 , unpack52_g44753 , _Coverage_Normal2553_g44747);
				float3 GLOBAL_NORMAL_OUT525_g44747 = lerpResult47_g44747;
				float3 ase_worldTangent = IN.ase_texcoord4.xyz;
				float3 ase_worldBitangent = IN.ase_texcoord5.xyz;
				float3 tanToWorld0 = float3( ase_worldTangent.x, ase_worldBitangent.x, ase_worldNormal.x );
				float3 tanToWorld1 = float3( ase_worldTangent.y, ase_worldBitangent.y, ase_worldNormal.y );
				float3 tanToWorld2 = float3( ase_worldTangent.z, ase_worldBitangent.z, ase_worldNormal.z );
				float3 tanNormal81_g44758 = GLOBAL_NORMAL_OUT525_g44747;
				float3 worldNormal81_g44758 = float3(dot(tanToWorld0,tanNormal81_g44758), dot(tanToWorld1,tanNormal81_g44758), dot(tanToWorld2,tanNormal81_g44758));
				float3 WorldNormal83_g44758 = worldNormal81_g44758;
				float3 lerpResult99_g44758 = lerp( WorldNormal83_g44758 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44758 , 0.0 ) ).xyz , _Blend_Space);
				float _Coverage2552_g44747 = saturate( pow( saturate( ( lerpResult99_g44758.y * _Blend_CoverageAmount * temp_output_180_0_g44747 ) ) , _Blend_CoverageFalloff ) );
				float4 lerpResult1269_g44747 = lerp( ( float4( (_Bottom_Color).rgb , 0.0 ) * BOTTOM_FINAL_ALBEDO612_g44747 * _Bottom_Brightness ) , ( float4( (_Top_Color).rgb , 0.0 ) * TOP_FINAL_ALBEDO632_g44747 * _Top_Brightness ) , _Coverage2552_g44747);
				
				
				float3 Albedo = lerpResult1269_g44747.rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				half4 color = half4( Albedo, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
            ZTest LEqual
            ZWrite On

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"

			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float3 worldNormal : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Bottom_Color;
			float4 _Top_Color;
			float4 _Top_Smoothness;
			float4 _Bottom_Smoothness;
			half _Bottom_NormalStrength;
			half _Top_NormalStrength;
			float _Blend_CoverageAmount;
			float _Blend_CoverageFactor;
			float _Blend_CoverageFalloff;
			float _Bottom_MetallicStrength;
			float _AlphatoCoverage;
			half _Top_Brightness;
			half _Bottom_SmoothnessType;
			float _Bottom_SmoothnessMin;
			float _Bottom_SmoothnessMax;
			float _Bottom_OcclusionStrengthAO;
			float _Bottom_OcclusionSource;
			half _Top_SmoothnessType;
			float _Top_MetallicStrength;
			float _Top_OffsetY;
			float _Top_TilingY;
			float _Top_OcclusionStrengthAO;
			float _Top_TilingX;
			half _Bottom_Brightness;
			float _Bottom_OffsetY;
			float _Bottom_OffsetX;
			float _Bottom_TilingY;
			float _Bottom_TilingX;
			half _Blend_Space;
			float _Top_SmoothnessMin;
			float _Top_SmoothnessMax;
			int _ColorMask;
			half _EmissionFlags;
			int _RenderFace;
			int _ZWriteMode;
			float _Top_OffsetX;
			float _Top_OcclusionSource;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			

			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal( v.ase_normal );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				o.worldPos = positionWS;
				#endif

				o.worldNormal = normalWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				o.clipPos = positionCS;
				return o;
			}

			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			half4 frag(	VertexOutput IN 
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 WorldPosition = IN.worldPos;
				#endif
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif
				
				#ifdef ASE_DEPTH_WRITE_ON
				outputDepth = DepthValue;
				#endif
				
				return float4(PackNormalOctRectEncode(TransformWorldToViewDir(IN.worldNormal, true)), 0.0, 0.0);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }
			
			Blend One Zero, One Zero
			ZWrite [_ZWriteMode]
			ZTest LEqual
			Offset 0 , 0
			ColorMask [_ColorMask]
			

			HLSLPROGRAM
			
			#define _NORMAL_DROPOFF_TS 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 100400
			#define ASE_USING_SAMPLING_MACROS 1

			
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS
			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS_CASCADE
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile _ _SHADOWS_SOFT
			#pragma multi_compile _ _MIXED_LIGHTING_SUBTRACTIVE
			#pragma multi_compile _ _GBUFFER_NORMALS_OCT
			
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/UnityInstancing.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"

			#if ASE_SRP_VERSION <= 70108
			#define REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR
			#endif

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
			    #define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#define ASE_NEEDS_FRAG_WORLD_POSITION
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_POSITION
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
			#define ASE_NEEDS_FRAG_COLOR
			#pragma instancing_options procedural:SetupNatureRenderer forwardadd
			#pragma multi_compile GPU_FRUSTUM_ON __
			#include "Nature Renderer.cginc"
			#pragma multi_compile_local _ NATURE_RENDERER
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				float4 ase_texcoord7 : TEXCOORD7;
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Bottom_Color;
			float4 _Top_Color;
			float4 _Top_Smoothness;
			float4 _Bottom_Smoothness;
			half _Bottom_NormalStrength;
			half _Top_NormalStrength;
			float _Blend_CoverageAmount;
			float _Blend_CoverageFactor;
			float _Blend_CoverageFalloff;
			float _Bottom_MetallicStrength;
			float _AlphatoCoverage;
			half _Top_Brightness;
			half _Bottom_SmoothnessType;
			float _Bottom_SmoothnessMin;
			float _Bottom_SmoothnessMax;
			float _Bottom_OcclusionStrengthAO;
			float _Bottom_OcclusionSource;
			half _Top_SmoothnessType;
			float _Top_MetallicStrength;
			float _Top_OffsetY;
			float _Top_TilingY;
			float _Top_OcclusionStrengthAO;
			float _Top_TilingX;
			half _Bottom_Brightness;
			float _Bottom_OffsetY;
			float _Bottom_OffsetX;
			float _Bottom_TilingY;
			float _Bottom_TilingX;
			half _Blend_Space;
			float _Top_SmoothnessMin;
			float _Top_SmoothnessMax;
			int _ColorMask;
			half _EmissionFlags;
			int _RenderFace;
			int _ZWriteMode;
			float _Top_OffsetX;
			float _Top_OcclusionSource;
			#ifdef _TRANSMISSION_ASE
				float _TransmissionShadow;
			#endif
			#ifdef _TRANSLUCENCY_ASE
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef TESSELLATION_ON
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END
			TEXTURE2D(_Bottom_MainTex);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_Top_MainTex);
			TEXTURE2D(_Bottom_BumpMap);
			TEXTURE2D(_Top_BumpMap);
			TEXTURE2D(_Bottom_MetallicMap);
			TEXTURE2D(_Top_MetallicMap);
			TEXTURE2D(_Bottom_SmoothnessMap);
			TEXTURE2D(_Top_OcclusionMap);
			TEXTURE2D(_Top_SmoothnessMap);


			float4 mod289( float4 x )
			{
				return x - floor(x * (1.0 / 289.0)) * 289.0;
			}
			
			float4 perm( float4 x )
			{
				return mod289(((x * 34.0) + 1.0) * x);
			}
			
			float SimpleNoise3D( float3 p )
			{
				 float3 a = floor(p);
				    float3 d = p - a;
				    d = d * d * (3.0 - 2.0 * d);
				 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
				    float4 k1 = perm(b.xyxy);
				 float4 k2 = perm(k1.xyxy + b.zzww);
				    float4 c = k2 + a.zzzz;
				    float4 k3 = perm(c);
				    float4 k4 = perm(c + 1.0);
				    float4 o1 = frac(k3 * (1.0 / 41.0));
				 float4 o2 = frac(k4 * (1.0 / 41.0));
				    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
				    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
				    return o4.y * d.y + o4.x * (1.0 - d.y);
			}
			
			float3 AdditionalLightsFlatMask( float3 WorldPosition, float4 ShadowMask )
			{
				float3 Color = 0;
				#ifdef _ADDITIONAL_LIGHTS
				int numLights = GetAdditionalLightsCount();
				for(int i = 0; i<numLights;i++)
				{
				#if ASE_SRP_VERSION >= 100000
					Light light = GetAdditionalLight(i, WorldPosition, ShadowMask);
				#else
					Light light = GetAdditionalLight(i, WorldPosition);
				#endif
					Color += light.color *(light.distanceAttenuation * light.shadowAttenuation);
					
				}
				#endif
				return Color;
			}
			
			float4 SmoothnessTypefloat4switch215_g44761( float m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else if(m_switch ==2)
					return m_Geometric;
				else
				return float4(0,0,0,0);
			}
			
			float4 SmoothnessTypefloat4switch215_g44749( float m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
			{
				if(m_switch ==0)
					return m_Smoothness;
				else if(m_switch ==1)
					return m_Roughness;
				else if(m_switch ==2)
					return m_Geometric;
				else
				return float4(0,0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord7 = v.vertex;
				o.ase_color = v.ase_color;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = defaultVertexValue;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );
				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif
				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);
				
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				VertexPositionInputs vertexInput = (VertexPositionInputs)0;
				vertexInput.positionWS = positionWS;
				vertexInput.positionCS = positionCS;
				o.shadowCoord = GetShadowCoord( vertexInput );
				#endif
				
				o.clipPos = positionCS;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				o.screenPos = ComputeScreenPos(positionCS);
				#endif
				return o;
			}
			
			#if defined(TESSELLATION_ON)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 ase_color : COLOR;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual  
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif
			FragmentOutput frag ( VertexOutput IN 
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODDitheringTransition( IN.clipPos.xyz, unity_LODFade.x );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif
				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 ScreenPos = IN.screenPos;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif
	
				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float _UV_SPACE2529_g44747 = _Blend_Space;
				float temp_output_62_0_g44772 = _UV_SPACE2529_g44747;
				float3 lerpResult99_g44775 = lerp( WorldPosition , IN.ase_texcoord7.xyz , temp_output_62_0_g44772);
				float3 break10_g44772 = lerpResult99_g44775;
				float2 appendResult13_g44772 = (float2(break10_g44772.y , break10_g44772.z));
				float2 appendResult154_g44747 = (float2(_Bottom_TilingX , _Bottom_TilingY));
				float2 BOTTOM_Tilling563_g44747 = appendResult154_g44747;
				float2 temp_output_60_0_g44772 = BOTTOM_Tilling563_g44747;
				float2 appendResult153_g44747 = (float2(_Bottom_OffsetX , _Bottom_OffsetY));
				float2 BOTTOM_Offset561_g44747 = appendResult153_g44747;
				float2 temp_output_61_0_g44772 = BOTTOM_Offset561_g44747;
				float2 UV_0121_g44772 = ( ( appendResult13_g44772 * temp_output_60_0_g44772 ) + temp_output_61_0_g44772 );
				float3 WorldNormal83_g44773 = WorldNormal;
				float3 lerpResult99_g44773 = lerp( WorldNormal83_g44773 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44773 , 0.0 ) ).xyz , temp_output_62_0_g44772);
				float3 temp_output_33_0_g44772 = abs( lerpResult99_g44773 );
				float dotResult30_g44772 = dot( temp_output_33_0_g44772 , float3(1,1,1) );
				float3 BLEND36_g44772 = ( temp_output_33_0_g44772 / dotResult30_g44772 );
				float3 break48_g44772 = BLEND36_g44772;
				float2 appendResult15_g44772 = (float2(break10_g44772.x , break10_g44772.z));
				float2 UV_0220_g44772 = ( ( appendResult15_g44772 * temp_output_60_0_g44772 ) + temp_output_61_0_g44772 );
				float2 appendResult25_g44772 = (float2(break10_g44772.x , break10_g44772.y));
				float2 UV_0327_g44772 = ( ( appendResult25_g44772 * temp_output_60_0_g44772 ) + temp_output_61_0_g44772 );
				float4 temp_output_59_0_g44772 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0121_g44772 ) * break48_g44772.x ) + ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0220_g44772 ) * break48_g44772.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0327_g44772 ) * break48_g44772.z ) );
				float4 temp_output_2592_78_g44747 = temp_output_59_0_g44772;
				float4 BOTTOM_FINAL_ALBEDO612_g44747 = temp_output_2592_78_g44747;
				float temp_output_62_0_g44766 = _UV_SPACE2529_g44747;
				float3 lerpResult99_g44769 = lerp( WorldPosition , IN.ase_texcoord7.xyz , temp_output_62_0_g44766);
				float3 break10_g44766 = lerpResult99_g44769;
				float2 appendResult13_g44766 = (float2(break10_g44766.y , break10_g44766.z));
				float2 appendResult897_g44747 = (float2(_Top_TilingX , _Top_TilingY));
				float2 TOP_Tilling892_g44747 = appendResult897_g44747;
				float2 temp_output_60_0_g44766 = TOP_Tilling892_g44747;
				float2 appendResult896_g44747 = (float2(_Top_OffsetX , _Top_OffsetY));
				float2 TOP_Offset869_g44747 = appendResult896_g44747;
				float2 temp_output_61_0_g44766 = TOP_Offset869_g44747;
				float2 UV_0121_g44766 = ( ( appendResult13_g44766 * temp_output_60_0_g44766 ) + temp_output_61_0_g44766 );
				float3 WorldNormal83_g44767 = WorldNormal;
				float3 lerpResult99_g44767 = lerp( WorldNormal83_g44767 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44767 , 0.0 ) ).xyz , temp_output_62_0_g44766);
				float3 temp_output_33_0_g44766 = abs( lerpResult99_g44767 );
				float dotResult30_g44766 = dot( temp_output_33_0_g44766 , float3(1,1,1) );
				float3 BLEND36_g44766 = ( temp_output_33_0_g44766 / dotResult30_g44766 );
				float3 break48_g44766 = BLEND36_g44766;
				float2 appendResult15_g44766 = (float2(break10_g44766.x , break10_g44766.z));
				float2 UV_0220_g44766 = ( ( appendResult15_g44766 * temp_output_60_0_g44766 ) + temp_output_61_0_g44766 );
				float2 appendResult25_g44766 = (float2(break10_g44766.x , break10_g44766.y));
				float2 UV_0327_g44766 = ( ( appendResult25_g44766 * temp_output_60_0_g44766 ) + temp_output_61_0_g44766 );
				float4 temp_output_59_0_g44766 = ( ( ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0121_g44766 ) * break48_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0220_g44766 ) * break48_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0327_g44766 ) * break48_g44766.z ) );
				float4 temp_output_2524_78_g44747 = temp_output_59_0_g44766;
				float4 TOP_FINAL_ALBEDO632_g44747 = temp_output_2524_78_g44747;
				float3 break109_g44772 = BLEND36_g44772;
				float4 temp_output_2592_71_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0121_g44772 ) * break109_g44772.x ) + ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0220_g44772 ) * break109_g44772.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0327_g44772 ) * break109_g44772.z ) );
				float4 BOTTOM_FINAL_NORMAL614_g44747 = temp_output_2592_71_g44747;
				float4 temp_output_1_0_g44751 = BOTTOM_FINAL_NORMAL614_g44747;
				float temp_output_8_0_g44751 = _Bottom_NormalStrength;
				float3 unpack52_g44751 = UnpackNormalScale( temp_output_1_0_g44751, temp_output_8_0_g44751 );
				unpack52_g44751.z = lerp( 1, unpack52_g44751.z, saturate(temp_output_8_0_g44751) );
				float3 break109_g44766 = BLEND36_g44766;
				float4 temp_output_2524_71_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0121_g44766 ) * break109_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0220_g44766 ) * break109_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0327_g44766 ) * break109_g44766.z ) );
				float4 TOP_FINAL_NORMAL641_g44747 = temp_output_2524_71_g44747;
				float4 temp_output_1_0_g44753 = TOP_FINAL_NORMAL641_g44747;
				float temp_output_8_0_g44753 = _Top_NormalStrength;
				float3 unpack52_g44753 = UnpackNormalScale( temp_output_1_0_g44753, temp_output_8_0_g44753 );
				unpack52_g44753.z = lerp( 1, unpack52_g44753.z, saturate(temp_output_8_0_g44753) );
				float3 WorldNormal83_g44778 = WorldNormal;
				float3 lerpResult99_g44778 = lerp( WorldNormal83_g44778 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44778 , 0.0 ) ).xyz , _Blend_Space);
				float temp_output_180_0_g44747 = ( 1.0 + _Blend_CoverageFactor );
				float _Coverage_Normal2553_g44747 = saturate( pow( saturate( ( lerpResult99_g44778.y * _Blend_CoverageAmount * temp_output_180_0_g44747 ) ) , _Blend_CoverageFalloff ) );
				float3 lerpResult47_g44747 = lerp( unpack52_g44751 , unpack52_g44753 , _Coverage_Normal2553_g44747);
				float3 GLOBAL_NORMAL_OUT525_g44747 = lerpResult47_g44747;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal81_g44758 = GLOBAL_NORMAL_OUT525_g44747;
				float3 worldNormal81_g44758 = float3(dot(tanToWorld0,tanNormal81_g44758), dot(tanToWorld1,tanNormal81_g44758), dot(tanToWorld2,tanNormal81_g44758));
				float3 WorldNormal83_g44758 = worldNormal81_g44758;
				float3 lerpResult99_g44758 = lerp( WorldNormal83_g44758 , mul( GetWorldToObjectMatrix(), float4( WorldNormal83_g44758 , 0.0 ) ).xyz , _Blend_Space);
				float _Coverage2552_g44747 = saturate( pow( saturate( ( lerpResult99_g44758.y * _Blend_CoverageAmount * temp_output_180_0_g44747 ) ) , _Blend_CoverageFalloff ) );
				float4 lerpResult1269_g44747 = lerp( ( float4( (_Bottom_Color).rgb , 0.0 ) * BOTTOM_FINAL_ALBEDO612_g44747 * _Bottom_Brightness ) , ( float4( (_Top_Color).rgb , 0.0 ) * TOP_FINAL_ALBEDO632_g44747 * _Top_Brightness ) , _Coverage2552_g44747);
				
				float3 temp_output_16_0_g44748 = GLOBAL_NORMAL_OUT525_g44747;
				float3 tanNormal134_g44748 = temp_output_16_0_g44748;
				float3 worldNormal134_g44748 = float3(dot(tanToWorld0,tanNormal134_g44748), dot(tanToWorld1,tanNormal134_g44748), dot(tanToWorld2,tanNormal134_g44748));
				float3 NORMAL_TANGENTSPACE135_g44748 = worldNormal134_g44748;
				float3 WorldPosition63_g44748 = NORMAL_TANGENTSPACE135_g44748;
				float4 shadowMaskValue77_g44748 = float4(1,1,1,1);
				float4 ShadowMask63_g44748 = shadowMaskValue77_g44748;
				float3 localAdditionalLightsFlatMask63_g44748 = AdditionalLightsFlatMask( WorldPosition63_g44748 , ShadowMask63_g44748 );
				float3 URP_ADDITIONAL_LIGHT520_g44747 = localAdditionalLightsFlatMask63_g44748;
				
				float3 break169_g44772 = BLEND36_g44772;
				float4 temp_output_2592_70_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_MetallicMap, sampler_trilinear_repeat, UV_0121_g44772 ) * break169_g44772.x ) + ( SAMPLE_TEXTURE2D( _Bottom_MetallicMap, sampler_trilinear_repeat, UV_0220_g44772 ) * break169_g44772.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_MetallicMap, sampler_trilinear_repeat, UV_0327_g44772 ) * break169_g44772.z ) );
				float4 BOTTOM_MASK_MAP_B357_g44747 = temp_output_2592_70_g44747;
				float temp_output_1_0_g44756 = _Bottom_MetallicStrength;
				float BOTTOM_FINAL_METALLIC483_g44747 = ( BOTTOM_MASK_MAP_B357_g44747.r * temp_output_1_0_g44756 );
				float3 break169_g44766 = BLEND36_g44766;
				float4 temp_output_2524_70_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Top_MetallicMap, sampler_trilinear_repeat, UV_0121_g44766 ) * break169_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_MetallicMap, sampler_trilinear_repeat, UV_0220_g44766 ) * break169_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_MetallicMap, sampler_trilinear_repeat, UV_0327_g44766 ) * break169_g44766.z ) );
				float4 TOP_MASK_MAP_B372_g44747 = temp_output_2524_70_g44747;
				float temp_output_1_0_g44754 = _Top_MetallicStrength;
				float TOP_FINAL_METALLIC482_g44747 = ( TOP_MASK_MAP_B372_g44747.r * temp_output_1_0_g44754 );
				float lerpResult364_g44747 = lerp( BOTTOM_FINAL_METALLIC483_g44747 , TOP_FINAL_METALLIC482_g44747 , _Coverage2552_g44747);
				
				float temp_output_223_0_g44761 = _Bottom_SmoothnessType;
				float m_switch215_g44761 = temp_output_223_0_g44761;
				float3 break154_g44772 = BLEND36_g44772;
				float4 temp_output_2592_72_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_SmoothnessMap, sampler_trilinear_repeat, UV_0121_g44772 ) * break154_g44772.x ) + ( SAMPLE_TEXTURE2D( _Bottom_SmoothnessMap, sampler_trilinear_repeat, UV_0220_g44772 ) * break154_g44772.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_SmoothnessMap, sampler_trilinear_repeat, UV_0327_g44772 ) * break154_g44772.z ) );
				float4 BOTTOM_MASK_MAP_G358_g44747 = temp_output_2592_72_g44747;
				float4 temp_cast_16 = (_Bottom_SmoothnessMin).xxxx;
				float4 temp_cast_17 = (_Bottom_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g44761 = (temp_cast_16 + (BOTTOM_MASK_MAP_G358_g44747 - float4( 0,0,0,0 )) * (temp_cast_17 - temp_cast_16) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g44761 = temp_output_216_0_g44761;
				float4 temp_cast_18 = (_Bottom_SmoothnessMin).xxxx;
				float4 temp_cast_19 = (_Bottom_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g44761 = ( 1.0 - temp_output_216_0_g44761 );
				float4 m_Roughness215_g44761 = temp_output_214_0_g44761;
				float4 temp_cast_20 = (_Bottom_SmoothnessMin).xxxx;
				float4 temp_cast_21 = (_Bottom_SmoothnessMax).xxxx;
				float3 tanNormal67_g44751 = unpack52_g44751;
				float3 worldNormal67_g44751 = float3(dot(tanToWorld0,tanNormal67_g44751), dot(tanToWorld1,tanNormal67_g44751), dot(tanToWorld2,tanNormal67_g44751));
				float3 BOTTOM_FINAL_NORMAL_WORLD329_g44747 = worldNormal67_g44751;
				float3 temp_output_4_0_g44761 = BOTTOM_FINAL_NORMAL_WORLD329_g44747;
				float3 temp_output_178_0_g44761 = ddx( temp_output_4_0_g44761 );
				float dotResult195_g44761 = dot( temp_output_178_0_g44761 , temp_output_178_0_g44761 );
				float3 temp_output_175_0_g44761 = ddy( temp_output_4_0_g44761 );
				float dotResult201_g44761 = dot( temp_output_175_0_g44761 , temp_output_175_0_g44761 );
				float BOTTOM_ALBEDO_R359_g44747 = temp_output_2592_78_g44747.r;
				float4 temp_cast_22 = (BOTTOM_ALBEDO_R359_g44747).xxxx;
				float4 m_Geometric215_g44761 = ( sqrt( saturate( ( temp_output_216_0_g44761 + ( ( dotResult195_g44761 + dotResult201_g44761 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_22 ) );
				float4 localSmoothnessTypefloat4switch215_g44761 = SmoothnessTypefloat4switch215_g44761( m_switch215_g44761 , m_Smoothness215_g44761 , m_Roughness215_g44761 , m_Geometric215_g44761 );
				float3 break184_g44766 = BLEND36_g44766;
				float4 temp_output_2524_76_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Top_OcclusionMap, sampler_trilinear_repeat, UV_0121_g44766 ) * break184_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_OcclusionMap, sampler_trilinear_repeat, UV_0220_g44766 ) * break184_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_OcclusionMap, sampler_trilinear_repeat, UV_0327_g44766 ) * break184_g44766.z ) );
				float4 TOP_PBR_Occlusion2835_g44747 = temp_output_2524_76_g44747;
				float temp_output_16_0_g44771 = _Bottom_OcclusionStrengthAO;
				float temp_output_65_0_g44771 = ( 1.0 - temp_output_16_0_g44771 );
				float3 appendResult69_g44771 = (float3(temp_output_65_0_g44771 , temp_output_65_0_g44771 , temp_output_65_0_g44771));
				float4 color77_g44771 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_25 = (IN.ase_color.a).xxxx;
				float4 lerpResult75_g44771 = lerp( color77_g44771 , temp_cast_25 , temp_output_16_0_g44771);
				float4 lerpResult83_g44771 = lerp( float4( ( ( ( (TOP_PBR_Occlusion2835_g44747).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g44771 ) + appendResult69_g44771 ) , 0.0 ) , lerpResult75_g44771 , _Bottom_OcclusionSource);
				float4 BOTTOM_FINAL_SMOOTHNESS485_g44747 = ( localSmoothnessTypefloat4switch215_g44761 * saturate( lerpResult83_g44771 ) );
				float temp_output_223_0_g44749 = _Top_SmoothnessType;
				float m_switch215_g44749 = temp_output_223_0_g44749;
				float3 break154_g44766 = BLEND36_g44766;
				float4 temp_output_2524_72_g44747 = ( ( ( SAMPLE_TEXTURE2D( _Top_SmoothnessMap, sampler_trilinear_repeat, UV_0121_g44766 ) * break154_g44766.x ) + ( SAMPLE_TEXTURE2D( _Top_SmoothnessMap, sampler_trilinear_repeat, UV_0220_g44766 ) * break154_g44766.y ) ) + ( SAMPLE_TEXTURE2D( _Top_SmoothnessMap, sampler_trilinear_repeat, UV_0327_g44766 ) * break154_g44766.z ) );
				float4 TOP_MASK_MAP_G371_g44747 = temp_output_2524_72_g44747;
				float4 temp_cast_28 = (_Top_SmoothnessMin).xxxx;
				float4 temp_cast_29 = (_Top_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g44749 = (temp_cast_28 + (TOP_MASK_MAP_G371_g44747 - float4( 0,0,0,0 )) * (temp_cast_29 - temp_cast_28) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g44749 = temp_output_216_0_g44749;
				float4 temp_cast_30 = (_Top_SmoothnessMin).xxxx;
				float4 temp_cast_31 = (_Top_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g44749 = ( 1.0 - temp_output_216_0_g44749 );
				float4 m_Roughness215_g44749 = temp_output_214_0_g44749;
				float4 temp_cast_32 = (_Top_SmoothnessMin).xxxx;
				float4 temp_cast_33 = (_Top_SmoothnessMax).xxxx;
				float3 tanNormal67_g44753 = unpack52_g44753;
				float3 worldNormal67_g44753 = float3(dot(tanToWorld0,tanNormal67_g44753), dot(tanToWorld1,tanNormal67_g44753), dot(tanToWorld2,tanNormal67_g44753));
				float3 TOP_FINAL_NORMAL_WORLD377_g44747 = worldNormal67_g44753;
				float3 temp_output_4_0_g44749 = TOP_FINAL_NORMAL_WORLD377_g44747;
				float3 temp_output_178_0_g44749 = ddx( temp_output_4_0_g44749 );
				float dotResult195_g44749 = dot( temp_output_178_0_g44749 , temp_output_178_0_g44749 );
				float3 temp_output_175_0_g44749 = ddy( temp_output_4_0_g44749 );
				float dotResult201_g44749 = dot( temp_output_175_0_g44749 , temp_output_175_0_g44749 );
				float TOP_ALBEDO_R2629_g44747 = temp_output_2524_78_g44747.r;
				float4 temp_cast_34 = (TOP_ALBEDO_R2629_g44747).xxxx;
				float4 m_Geometric215_g44749 = ( sqrt( saturate( ( temp_output_216_0_g44749 + ( ( dotResult195_g44749 + dotResult201_g44749 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_34 ) );
				float4 localSmoothnessTypefloat4switch215_g44749 = SmoothnessTypefloat4switch215_g44749( m_switch215_g44749 , m_Smoothness215_g44749 , m_Roughness215_g44749 , m_Geometric215_g44749 );
				float temp_output_16_0_g44765 = _Top_OcclusionStrengthAO;
				float temp_output_65_0_g44765 = ( 1.0 - temp_output_16_0_g44765 );
				float3 appendResult69_g44765 = (float3(temp_output_65_0_g44765 , temp_output_65_0_g44765 , temp_output_65_0_g44765));
				float4 color77_g44765 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_37 = (IN.ase_color.a).xxxx;
				float4 lerpResult75_g44765 = lerp( color77_g44765 , temp_cast_37 , temp_output_16_0_g44765);
				float4 lerpResult83_g44765 = lerp( float4( ( ( ( (TOP_PBR_Occlusion2835_g44747).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g44765 ) + appendResult69_g44765 ) , 0.0 ) , lerpResult75_g44765 , _Top_OcclusionSource);
				float4 TOP_FINAL_SMOOTHNESS484_g44747 = ( localSmoothnessTypefloat4switch215_g44749 * saturate( lerpResult83_g44765 ) );
				float4 lerpResult365_g44747 = lerp( BOTTOM_FINAL_SMOOTHNESS485_g44747 , TOP_FINAL_SMOOTHNESS484_g44747 , _Coverage2552_g44747);
				
				float4 BOTTOM_FINAL_OCCLUSION487_g44747 = saturate( lerpResult83_g44771 );
				float4 TOP_FINAL_OCCLUSION486_g44747 = saturate( lerpResult83_g44765 );
				float4 lerpResult488_g44747 = lerp( BOTTOM_FINAL_OCCLUSION487_g44747 , TOP_FINAL_OCCLUSION486_g44747 , _Coverage2552_g44747);
				
				float3 Albedo = lerpResult1269_g44747.rgb;
				float3 Normal = ( lerpResult47_g44747 + URP_ADDITIONAL_LIGHT520_g44747 );
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = lerpResult364_g44747;
				float Smoothness = lerpResult365_g44747.x;
				float Occlusion = lerpResult488_g44747.r;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = 1;
				float3 Translucency = 1;
				#ifdef ASE_DEPTH_WRITE_ON
				float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
					inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
					inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
					inputData.normalWS = Normal;
					#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;
				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
				#ifdef _ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				BRDFData brdfData;
				InitializeBRDFData( Albedo, Metallic, Specular, Smoothness, Alpha, brdfData);
				half4 color;
				color.rgb = GlobalIllumination( brdfData, inputData.bakedGI, Occlusion, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef _TRANSMISSION_ASE
				{
					float shadow = _TransmissionShadow;
				
					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
					half3 mainTransmission = max(0 , -dot(inputData.normalWS, mainLight.direction)) * mainAtten * Transmission;
					color.rgb += Albedo * mainTransmission;
				
					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );
				
							half3 transmission = max(0 , -dot(inputData.normalWS, light.direction)) * atten * Transmission;
							color.rgb += Albedo * transmission;
						}
					#endif
				}
				#endif
				
				#ifdef _TRANSLUCENCY_ASE
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;
				
					Light mainLight = GetMainLight( inputData.shadowCoord );
					float3 mainAtten = mainLight.color * mainLight.distanceAttenuation;
					mainAtten = lerp( mainAtten, mainAtten * mainLight.shadowAttenuation, shadow );
				
					half3 mainLightDir = mainLight.direction + inputData.normalWS * normal;
					half mainVdotL = pow( saturate( dot( inputData.viewDirectionWS, -mainLightDir ) ), scattering );
					half3 mainTranslucency = mainAtten * ( mainVdotL * direct + inputData.bakedGI * ambient ) * Translucency;
					color.rgb += Albedo * mainTranslucency * strength;
				
					#ifdef _ADDITIONAL_LIGHTS
						int transPixelLightCount = GetAdditionalLightsCount();
						for (int i = 0; i < transPixelLightCount; ++i)
						{
							Light light = GetAdditionalLight(i, inputData.positionWS);
							float3 atten = light.color * light.distanceAttenuation;
							atten = lerp( atten, atten * light.shadowAttenuation, shadow );
				
							half3 lightDir = light.direction + inputData.normalWS * normal;
							half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );
							half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;
							color.rgb += Albedo * translucency * strength;
						}
					#endif
				}
				#endif
				
				#ifdef _REFRACTION_ASE
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal, 0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif
				
				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif
				
				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif
				
				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif
				
				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb);
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "DE_ShaderGUI"
	Fallback " "
	
}
/*ASEBEGIN
Version=18934
71;29.5;1654.5;850.5;-602.8247;953.5516;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;390;1380.371,-375.9673;Inherit;False;292.6667;106;DESF Utility ASE Compile Shaders;1;391;;0,0.2047877,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;439;1713.844,-1054.493;Inherit;False;255.6026;356.7736;DEBUG SETTINGS ;1;445;;0,0,0,1;0;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1742.301,-871.1666;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;291;1744.058,-940.5589;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;446;1399.574,-931.3848;Inherit;False;DESF GUI URP Surface 10x;4;;44746;06c8ac62791f7a845bbafd8ecdb1912b;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;433;994.239,-688.519;Inherit;False;DESF Core Surface Triplanar Spherical;9;;44747;790fb642c24decb4ebda2614061db534;30,524,2,513,2,518,1,2055,1,2614,1,2056,1,2603,1,2609,1,2057,1,1416,0,2604,0,2605,0,2617,0,2615,0,2616,0,2610,0,2543,0,2611,0,2547,0,2549,0,2545,0,1418,0,1417,0,2832,0,2807,0,2804,0,2511,0,2512,0,2510,0,2516,0;0;7;COLOR;0;FLOAT3;122;FLOAT;489;FLOAT4;351;COLOR;352;FLOAT;2818;FLOAT3;2446
Node;AmplifyShaderEditor.FunctionNode;391;1390.371,-338.9673;Inherit;False;DESF Utility ASE Compile Shaders;-1;;44745;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;293;1743.564,-1009.27;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;445;1742.42,-796.6651;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;False;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;447;1403.075,-1009.885;Inherit;False;Property;_RenderFace;Render Face;3;2;[Header];[Enum];Create;False;1;SURFACE OPTIONS;0;1;Front,2,Back,1,Both,0;True;0;False;2;1;False;0;1;INT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;376;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;375;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;385;1374.904,-620.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;373;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;377;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;378;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;False;False;False;False;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;386;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;374;1374.904,-680.6909;Float;False;True;-1;2;DE_ShaderGUI;0;2;DEC/Surface Triplanar/Triplanar Spherical;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;18;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;445;True;True;2;True;447;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=-10;NatureRendererInstancing=True;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;2;LightMode=UniversalForward;NatureRendererInstancing=True;False;False;5;Include;;False;;Native;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;ed9205546b797304ea7576ba0b32877e;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom; ;0;0;Standard;38;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;0;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,-1;0;Translucency;0;0;  Translucency Strength;1,False,-1;0;  Normal Distortion;0.5,False,-1;0;  Scattering;2,False,-1;0;  Direct;0.9,False,-1;0;  Ambient;0.1,False,-1;0;  Shadow;0.5,False,-1;0;Cast Shadows;1;0;  Use Shadow Threshold;0;637772048342110936;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,True,388;0;  Type;0;0;  Tess;16,True,386;0;  Min;10,True,387;0;  Max;25,True,385;0;  Edge Length;16,False,-1;0;  Max Displacement;25,False,-1;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;0;8;False;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.CommentaryNode;438;1379.744,-1056.596;Inherit;False;328.6918;357.9233;GLOBAL SETTINGS ;0;;0,0,0,1;0;0
WireConnection;374;0;433;0
WireConnection;374;1;433;122
WireConnection;374;3;433;489
WireConnection;374;4;433;351
WireConnection;374;5;433;352
ASEEND*/
//CHKSM=2E8225700E3C0E053A50BE5077EA052EBE97D2A5