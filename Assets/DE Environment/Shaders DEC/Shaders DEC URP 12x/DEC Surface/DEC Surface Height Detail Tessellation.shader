// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Surface/Surface Height Detail Tessellation"
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
		[Header(MAIN MAPS)]_Color("Tint", Color) = (1,1,1,0)
		[DE_DrawerTextureSingleLine]_MainTex("Albedo Map", 2D) = "white" {}
		_Brightness("Brightness", Range( 0 , 2)) = 1
		_TilingX("Tiling X", Float) = 1
		_TilingY("Tiling Y", Float) = 1
		_OffsetX("Offset X", Float) = 0
		_OffsetY("Offset Y", Float) = 0
		[Normal][DE_DrawerTextureSingleLine]_BumpMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Float) = 1
		[DE_DrawerTextureSingleLine]_MetallicGlossMap("Metallic Map", 2D) = "white" {}
		_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[DE_DrawerTextureSingleLine]_OcclusionMap("Occlusion Map", 2D) = "white" {}
		[DE_DrawerToggleNoKeyword]_OcclusionSource("Occlusion is Baked", Float) = 0
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0
		[DE_DrawerTextureSingleLine]_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[DE_DrawerFloatEnum(Smoothness _Roughness _Geometric)]_SmoothnessSource("Smoothness Source", Float) = 0
		[DE_DrawerSliderRemap(_SmoothnessMin, _SmoothnessMax,0, 1)]_Smoothness("Smoothness", Vector) = (0,0,0,0)
		[HideInInspector]_SmoothnessMin("Smoothness Min", Range( 0 , 1)) = 0
		[HideInInspector]_SmoothnessMax("Smoothness Max", Range( 0 , 1)) = 0
		[Header(DISPLACEMENT)][DE_DrawerFloatEnum(Off _Active _Active Reconstructed)]_DisplacementReconstructMode("Mode", Float) = 0
		[DE_DrawerTextureSingleLine]_ParallaxMap("Displacement Map", 2D) = "black" {}
		_DisplacementReconstructStrength("Strength", Range( 0 , 1)) = 0
		[Header(TESSELLATION URP)]_TessellationStrength("Tessellation Strength", Range( 0.001 , 100)) = 6
		_TessellationPhong("Tessellation Phong", Range( 0 , 1)) = 0.5
		_TessellationDistanceMin("Tessellation Distance Min", Float) = 0
		_TessellationDistanceMax("Tessellation Distance Max ", Float) = 5
		[Header(DETAIL)][DE_DrawerToggleNoKeyword]_EnableDetailMap("Enable", Float) = 0
		_ColorDetail("Tint", Color) = (1,1,1,0)
		[DE_DrawerTextureSingleLine]_DetailAlbedoMap("Albedo Map", 2D) = "white" {}
		_DetailTilingXDetail("Tiling X", Float) = 1
		_DetailTilingYDetail("Tiling Y", Float) = 1
		_DetailOffsetXDetail("Offset X", Float) = 0
		_DetailOffsetYDetail("Offset Y", Float) = 0
		[Normal][DE_DrawerTextureSingleLine]_DetailNormalMap("Normal Map", 2D) = "bump" {}
		_DetailNormalMapScale("Normal Strength", Float) = 1
		_DetailBlendInfluence("Blend Influence", Range( 0 , 3)) = 0
		[Enum(Red,0,Green,1,Blue,2)]_BlendColor("Blend Vertex Color", Int) = 0
		_BlendHeight("Blend Height", Range( 0 , 1.25)) = 1
		_DetailBlendSmooth("Blend Smooth", Range( 0.01 , 0.5)) = 0.35
		[Header(DETAIL MASK)][DE_DrawerFloatEnum(Off _Enable _Enable Inverted)]_EnableDetailMask("Enable Detail Mask", Float) = 0
		[DE_DrawerTextureSingleLine]_DetailMaskMap("Mask Map", 2D) = "white" {}
		_Detail_BlendAmountMask("Blend Amount", Range( 0.001 , 1)) = 0.5
		_Detail_BlendHardnessMask("Blend Hardness", Range( 0.001 , 5)) = 1
		_Detail_BlendFalloffMask("Blend Falloff", Range( 0.001 , 0.999)) = 0.5
		_DetailTilingXDetailMask("Tiling X", Float) = 1
		_DetailTilingYDetailMask("Tiling Y", Float) = 1
		_DetailOffsetXDetailMask("Offset X", Float) = 0
		[ASEEnd]_DetailOffsetYDetailMask("Offset Y", Float) = 0

		//_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		//_TransStrength( "Trans Strength", Range( 0, 50 ) ) = 1
		//_TransNormal( "Trans Normal Distortion", Range( 0, 1 ) ) = 0.5
		//_TransScattering( "Trans Scattering", Range( 1, 50 ) ) = 2
		//_TransDirect( "Trans Direct", Range( 0, 1 ) ) = 0.9
		//_TransAmbient( "Trans Ambient", Range( 0, 1 ) ) = 0.1
		//_TransShadow( "Trans Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Phong Tess Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Max Tessellation", Range( 1, 32 ) ) = 16
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
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
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
			float4 _Smoothness;
			float4 _Color;
			float4 _ParallaxMap_TexelSize;
			half4 _ColorDetail;
			half _DetailOffsetXDetail;
			half _DetailOffsetYDetail;
			float _DetailTilingXDetailMask;
			float _DetailTilingYDetailMask;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			float _MetallicStrength;
			half _SmoothnessSource;
			half _DetailBlendInfluence;
			float _DetailTilingYDetail;
			float _DetailTilingXDetail;
			half _EnableDetailMask;
			float _SmoothnessMin;
			float _SmoothnessMax;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ZWriteMode;
			half _TessellationDistanceMax;
			half _TessellationPhong;
			int _ColorMask;
			float _OcclusionStrengthAO;
			half _EmissionFlags;
			float _AlphatoCoverage;
			half _DisplacementReconstructMode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _DisplacementReconstructStrength;
			half _Brightness;
			int _RenderFace;
			float _OcclusionSource;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_MetallicGlossMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);


			float3 _Displacement_ModeCfloat3switch( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			
			float4 Detail_Maskfloat4switch226_g43398( float m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float4(0,0,0,0);
			}
			
			float Detail_BlendVCfloatswitch319_g43398( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			
			void CalculateUVsSmooth19_g43206( float2 UV, float4 TexelSize, out float2 UV0, out float2 UV1, out float2 UV2, out float2 UV3, out float2 UV4, out float2 UV5, out float2 UV6, out float2 UV7, out float2 UV8 )
			{
				{
				 float3 pos = float3( TexelSize.xy, 0 );
				    float3 neg = float3( -pos.xy, 0 );
				 UV0 = UV + neg.xy;
				    UV1 = UV + neg.zy;
				    UV2 = UV + float2( pos.x, neg.y );
				    UV3 = UV + neg.xz;
				    UV4 = UV;
				    UV5 = UV + pos.xz;
				    UV6 = UV + float2( neg.x, pos.y );
				    UV7 = UV + pos.zy;
				    UV8 = UV + pos.xy;
				    return;
				}
			}
			
			float3 CombineSamplesSmooth31_g43206( float Strength, float S0, float S1, float S2, float S3, float S4, float S5, float S6, float S7, float S8 )
			{
				{
				 float3 normal;
				    normal.x = Strength * ( S0 - S2 + 2 * S3 - 2 * S5 + S6 - S8 );
				    normal.y = Strength * ( S0 + 2 * S1 + S2 - S6 - 2 * S7 - S8 );
				    normal.z = 1.0;
				    return normalize( normal );
				}
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
			
			float3 Detail_Maskfloat3switch221_g43398( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float3(0,0,0);
			}
			
			float4 SmoothnessTypefloat4switch215_g43215( float m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
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

				float3 temp_output_309_0_g38539 = float3(0,0,0);
				float temp_output_62_0_g43218 = _DisplacementReconstructMode;
				float m_switch74_g43218 = temp_output_62_0_g43218;
				float3 _Vector3 = float3(0,0,0);
				float3 m_Off74_g43218 = _Vector3;
				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = v.texcoord.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 OUT_DISPLAC1180_g38539 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g43212, 0.0 );
				float3 temp_output_190_0_g43218 = (OUT_DISPLAC1180_g38539).xyz;
				float temp_output_61_0_g43218 = _DisplacementReconstructStrength;
				float3 temp_output_200_0_g43218 = ( v.ase_normal * ( temp_output_190_0_g43218 * temp_output_61_0_g43218 ) );
				float3 m_Active74_g43218 = temp_output_200_0_g43218;
				float3 m_ActiveReconstructed74_g43218 = temp_output_200_0_g43218;
				float3 local_Displacement_ModeCfloat3switch74_g43218 = _Displacement_ModeCfloat3switch( m_switch74_g43218 , m_Off74_g43218 , m_Active74_g43218 , m_ActiveReconstructed74_g43218 );
				
				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38539 + local_Displacement_ModeCfloat3switch74_g43218 );
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
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				float phongStrength = _TessellationPhong;
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

				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = IN.ase_texcoord7.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 tex2DNode63_g43212 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43212 );
				float4 OUT_ALBEDO_RGBA1177_g38539 = tex2DNode63_g43212;
				float3 temp_output_7_0_g38539 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38539).rgb * _Brightness );
				float4 temp_output_39_0_g43398 = float4( temp_output_7_0_g38539 , 0.0 );
				float4 Albedo_RGBA40_g43398 = temp_output_39_0_g43398;
				float m_switch226_g43398 = _EnableDetailMask;
				float2 appendResult132_g43398 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g43398 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g43398 = IN.ase_texcoord7.xy * appendResult132_g43398 + appendResult114_g43398;
				float4 tex2DNode45_g43398 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord67_g43398 );
				float4 ALBEDO_OUT255_g43398 = ( _ColorDetail * tex2DNode45_g43398 * _Brightness );
				float4 m_Off226_g43398 = ALBEDO_OUT255_g43398;
				float2 appendResult219_g43398 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g43398 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g43398 = IN.ase_texcoord7.xy * appendResult219_g43398 + appendResult206_g43398;
				float temp_output_15_0_g43399 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g43398 ).r );
				float temp_output_26_0_g43399 = _Detail_BlendAmountMask;
				float temp_output_24_0_g43399 = _Detail_BlendHardnessMask;
				float saferPower2_g43399 = abs( max( saturate( (0.0 + (temp_output_15_0_g43399 - ( 1.0 - temp_output_26_0_g43399 )) * (temp_output_24_0_g43399 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g43399 ))) ) , 0.0 ) );
				float temp_output_22_0_g43399 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g43398 = saturate( pow( saferPower2_g43399 , ( 1.0 - temp_output_22_0_g43399 ) ) );
				float4 lerpResult225_g43398 = lerp( Albedo_RGBA40_g43398 , ALBEDO_OUT255_g43398 , temp_output_403_0_g43398);
				float4 m_Active226_g43398 = lerpResult225_g43398;
				float saferPower11_g43399 = abs( max( saturate( (1.0 + (temp_output_15_0_g43399 - temp_output_26_0_g43399) * (( 1.0 - temp_output_24_0_g43399 ) - 1.0) / (0.0 - temp_output_26_0_g43399)) ) , 0.0 ) );
				float temp_output_403_21_g43398 = saturate( pow( saferPower11_g43399 , temp_output_22_0_g43399 ) );
				float4 lerpResult408_g43398 = lerp( ALBEDO_OUT255_g43398 , Albedo_RGBA40_g43398 , temp_output_403_21_g43398);
				float4 m_ActiveInverted226_g43398 = lerpResult408_g43398;
				float4 localDetail_Maskfloat4switch226_g43398 = Detail_Maskfloat4switch226_g43398( m_switch226_g43398 , m_Off226_g43398 , m_Active226_g43398 , m_ActiveInverted226_g43398 );
				float4 Mask_Albedo258_g43398 = localDetail_Maskfloat4switch226_g43398;
				float4 break48_g43398 = temp_output_39_0_g43398;
				float Albedo_RGB300_g43398 = ( break48_g43398.x + break48_g43398.y + break48_g43398.z );
				int m_switch319_g43398 = _BlendColor;
				float m_Red319_g43398 = IN.ase_color.r;
				float m_Green319_g43398 = IN.ase_color.g;
				float m_Blue319_g43398 = IN.ase_color.b;
				float localDetail_BlendVCfloatswitch319_g43398 = Detail_BlendVCfloatswitch319_g43398( m_switch319_g43398 , m_Red319_g43398 , m_Green319_g43398 , m_Blue319_g43398 );
				float clampResult47_g43398 = clamp( ( ( ( ( Albedo_RGB300_g43398 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localDetail_BlendVCfloatswitch319_g43398 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DetailBlend43_g43398 = clampResult47_g43398;
				float4 lerpResult58_g43398 = lerp( Mask_Albedo258_g43398 , Albedo_RGBA40_g43398 , DetailBlend43_g43398);
				float4 lerpResult409_g43398 = lerp( Albedo_RGBA40_g43398 , lerpResult58_g43398 , _EnableDetailMap);
				
				float _Displacement_Mode1309_g38539 = _DisplacementReconstructMode;
				float m_switch1310_g38539 = _Displacement_Mode1309_g38539;
				float4 OUT_NORMAL1178_g38539 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g43212 );
				float4 temp_output_1_0_g43220 = OUT_NORMAL1178_g38539;
				float temp_output_8_0_g43220 = _NormalStrength;
				float3 unpack52_g43220 = UnpackNormalScale( temp_output_1_0_g43220, temp_output_8_0_g43220 );
				unpack52_g43220.z = lerp( 1, unpack52_g43220.z, saturate(temp_output_8_0_g43220) );
				float3 temp_output_1478_59_g38539 = unpack52_g43220;
				float3 m_Off1310_g38539 = temp_output_1478_59_g38539;
				float3 m_Active1310_g38539 = temp_output_1478_59_g38539;
				float temp_output_1334_0_g38539 = ( _NormalStrength * 2.0 );
				float temp_output_29_0_g43206 = temp_output_1334_0_g38539;
				float Strength31_g43206 = temp_output_29_0_g43206;
				float localCalculateUVsSmooth19_g43206 = ( 0.0 );
				float2 temp_output_96_0_g43206 = OUT_UV431_g38539;
				float2 UV19_g43206 = temp_output_96_0_g43206;
				float4 TexelSize19_g43206 = _ParallaxMap_TexelSize;
				float2 UV019_g43206 = float2( 0,0 );
				float2 UV119_g43206 = float2( 0,0 );
				float2 UV219_g43206 = float2( 0,0 );
				float2 UV319_g43206 = float2( 0,0 );
				float2 UV419_g43206 = float2( 0,0 );
				float2 UV519_g43206 = float2( 0,0 );
				float2 UV619_g43206 = float2( 0,0 );
				float2 UV719_g43206 = float2( 0,0 );
				float2 UV819_g43206 = float2( 0,0 );
				CalculateUVsSmooth19_g43206( UV19_g43206 , TexelSize19_g43206 , UV019_g43206 , UV119_g43206 , UV219_g43206 , UV319_g43206 , UV419_g43206 , UV519_g43206 , UV619_g43206 , UV719_g43206 , UV819_g43206 );
				float4 break13_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV019_g43206 );
				float S031_g43206 = break13_g43206.r;
				float4 break8_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV119_g43206 );
				float S131_g43206 = break8_g43206.r;
				float4 break5_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV219_g43206 );
				float S231_g43206 = break5_g43206.r;
				float4 break3_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV319_g43206 );
				float S331_g43206 = break3_g43206.r;
				float4 break12_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV419_g43206 );
				float S431_g43206 = break12_g43206.r;
				float4 break23_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV519_g43206 );
				float S531_g43206 = break23_g43206.r;
				float4 break44_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV619_g43206 );
				float S631_g43206 = break44_g43206.r;
				float4 break42_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV719_g43206 );
				float S731_g43206 = break42_g43206.r;
				float4 break40_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV819_g43206 );
				float S831_g43206 = break40_g43206.r;
				float3 localCombineSamplesSmooth31_g43206 = CombineSamplesSmooth31_g43206( Strength31_g43206 , S031_g43206 , S131_g43206 , S231_g43206 , S331_g43206 , S431_g43206 , S531_g43206 , S631_g43206 , S731_g43206 , S831_g43206 );
				float3 m_ActiveReconstructed1310_g38539 = localCombineSamplesSmooth31_g43206;
				float3 local_Displacement_ModeCfloat3switch1310_g38539 = _Displacement_ModeCfloat3switch( m_switch1310_g38539 , m_Off1310_g38539 , m_Active1310_g38539 , m_ActiveReconstructed1310_g38539 );
				float3 NORMAL_OUT314_g38539 = local_Displacement_ModeCfloat3switch1310_g38539;
				float3 temp_output_16_0_g43213 = NORMAL_OUT314_g38539;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal134_g43213 = temp_output_16_0_g43213;
				float3 worldNormal134_g43213 = float3(dot(tanToWorld0,tanNormal134_g43213), dot(tanToWorld1,tanNormal134_g43213), dot(tanToWorld2,tanNormal134_g43213));
				float3 NORMAL_TANGENTSPACE135_g43213 = worldNormal134_g43213;
				float3 WorldPosition63_g43213 = NORMAL_TANGENTSPACE135_g43213;
				float4 shadowMaskValue77_g43213 = float4(1,1,1,1);
				float4 ShadowMask63_g43213 = shadowMaskValue77_g43213;
				float3 localAdditionalLightsFlatMask63_g43213 = AdditionalLightsFlatMask( WorldPosition63_g43213 , ShadowMask63_g43213 );
				float3 ADDITIONAL_LIGHT1342_g38539 = localAdditionalLightsFlatMask63_g43213;
				float3 temp_output_38_0_g43398 = ( local_Displacement_ModeCfloat3switch1310_g38539 + ADDITIONAL_LIGHT1342_g38539 );
				float3 Normal_XYZ260_g43398 = temp_output_38_0_g43398;
				float EnableDetailMask216_g43398 = _EnableDetailMask;
				float m_switch221_g43398 = EnableDetailMask216_g43398;
				float4 temp_output_1_0_g43401 = SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, texCoord67_g43398 );
				float temp_output_8_0_g43401 = _DetailNormalMapScale;
				float3 unpack52_g43401 = UnpackNormalScale( temp_output_1_0_g43401, temp_output_8_0_g43401 );
				unpack52_g43401.z = lerp( 1, unpack52_g43401.z, saturate(temp_output_8_0_g43401) );
				float3 Detail_Normal199_g43398 = unpack52_g43401;
				float3 m_Off221_g43398 = Detail_Normal199_g43398;
				float3 lerpResult205_g43398 = lerp( Normal_XYZ260_g43398 , Detail_Normal199_g43398 , temp_output_403_0_g43398);
				float3 m_Active221_g43398 = saturate( lerpResult205_g43398 );
				float3 lerpResult406_g43398 = lerp( Detail_Normal199_g43398 , Normal_XYZ260_g43398 , temp_output_403_21_g43398);
				float3 m_ActiveInverted221_g43398 = saturate( lerpResult406_g43398 );
				float3 localDetail_Maskfloat3switch221_g43398 = Detail_Maskfloat3switch221_g43398( m_switch221_g43398 , m_Off221_g43398 , m_Active221_g43398 , m_ActiveInverted221_g43398 );
				float3 Mask_Normal222_g43398 = localDetail_Maskfloat3switch221_g43398;
				float layeredBlendVar413_g43398 = DetailBlend43_g43398;
				float3 layeredBlend413_g43398 = ( lerp( Mask_Normal222_g43398,Normal_XYZ260_g43398 , layeredBlendVar413_g43398 ) );
				float3 normalizeResult414_g43398 = normalize( layeredBlend413_g43398 );
				float3 temp_output_416_0_g43398 = BlendNormal( normalizeResult414_g43398 , Normal_XYZ260_g43398 );
				float EnebleMode122_g43398 = _EnableDetailMap;
				float3 lerpResult410_g43398 = lerp( Normal_XYZ260_g43398 , temp_output_416_0_g43398 , EnebleMode122_g43398);
				
				float4 _MASK_B1440_g38539 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g43212 );
				float temp_output_1_0_g43210 = _MetallicStrength;
				
				float temp_output_223_0_g43215 = _SmoothnessSource;
				float m_switch215_g43215 = temp_output_223_0_g43215;
				float4 _MASK_G1438_g38539 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g43212 );
				float4 temp_cast_10 = (_SmoothnessMin).xxxx;
				float4 temp_cast_11 = (_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g43215 = (temp_cast_10 + (_MASK_G1438_g38539 - float4( 0,0,0,0 )) * (temp_cast_11 - temp_cast_10) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g43215 = temp_output_216_0_g43215;
				float4 temp_cast_12 = (_SmoothnessMin).xxxx;
				float4 temp_cast_13 = (_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g43215 = ( 1.0 - temp_output_216_0_g43215 );
				float4 m_Roughness215_g43215 = temp_output_214_0_g43215;
				float4 temp_cast_14 = (_SmoothnessMin).xxxx;
				float4 temp_cast_15 = (_SmoothnessMax).xxxx;
				float m_switch1387_g38539 = _Displacement_Mode1309_g38539;
				float3 tanNormal67_g43220 = unpack52_g43220;
				float3 worldNormal67_g43220 = float3(dot(tanToWorld0,tanNormal67_g43220), dot(tanToWorld1,tanNormal67_g43220), dot(tanToWorld2,tanNormal67_g43220));
				float3 temp_output_1478_66_g38539 = worldNormal67_g43220;
				float3 m_Off1387_g38539 = temp_output_1478_66_g38539;
				float3 m_Active1387_g38539 = temp_output_1478_66_g38539;
				float3x3 ase_tangentToWorldFast = float3x3(WorldTangent.x,WorldBiTangent.x,WorldNormal.x,WorldTangent.y,WorldBiTangent.y,WorldNormal.y,WorldTangent.z,WorldBiTangent.z,WorldNormal.z);
				float3 tangentToWorldDir104_g43206 = mul( ase_tangentToWorldFast, localCombineSamplesSmooth31_g43206 );
				float3 m_ActiveReconstructed1387_g38539 = tangentToWorldDir104_g43206;
				float3 local_Displacement_ModeCfloat3switch1387_g38539 = _Displacement_ModeCfloat3switch( m_switch1387_g38539 , m_Off1387_g38539 , m_Active1387_g38539 , m_ActiveReconstructed1387_g38539 );
				float3 NORMAL_WORLD_OUT164_g38539 = local_Displacement_ModeCfloat3switch1387_g38539;
				float3 temp_output_4_0_g43215 = NORMAL_WORLD_OUT164_g38539;
				float3 temp_output_178_0_g43215 = ddx( temp_output_4_0_g43215 );
				float dotResult195_g43215 = dot( temp_output_178_0_g43215 , temp_output_178_0_g43215 );
				float3 temp_output_175_0_g43215 = ddy( temp_output_4_0_g43215 );
				float dotResult201_g43215 = dot( temp_output_175_0_g43215 , temp_output_175_0_g43215 );
				float4 break377_g38539 = OUT_ALBEDO_RGBA1177_g38539;
				float ALBEDO_R169_g38539 = break377_g38539.r;
				float4 temp_cast_16 = (ALBEDO_R169_g38539).xxxx;
				float4 m_Geometric215_g43215 = ( sqrt( saturate( ( temp_output_216_0_g43215 + ( ( dotResult195_g43215 + dotResult201_g43215 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_16 ) );
				float4 localSmoothnessTypefloat4switch215_g43215 = SmoothnessTypefloat4switch215_g43215( m_switch215_g43215 , m_Smoothness215_g43215 , m_Roughness215_g43215 , m_Geometric215_g43215 );
				float4 temp_output_1556_33_g38539 = localSmoothnessTypefloat4switch215_g43215;
				float4 PBR_Occlusion1641_g38539 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g43212 );
				float temp_output_16_0_g43209 = _OcclusionStrengthAO;
				float temp_output_65_0_g43209 = ( 1.0 - temp_output_16_0_g43209 );
				float3 appendResult69_g43209 = (float3(temp_output_65_0_g43209 , temp_output_65_0_g43209 , temp_output_65_0_g43209));
				float4 color77_g43209 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_19 = (IN.ase_color.a).xxxx;
				float4 lerpResult75_g43209 = lerp( color77_g43209 , temp_cast_19 , temp_output_16_0_g43209);
				float4 lerpResult83_g43209 = lerp( float4( ( ( ( (PBR_Occlusion1641_g38539).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g43209 ) + appendResult69_g43209 ) , 0.0 ) , lerpResult75_g43209 , _OcclusionSource);
				float4 Occlusion1550_g38539 = saturate( lerpResult83_g43209 );
				
				float3 Albedo = lerpResult409_g43398.xyz;
				float3 Normal = lerpResult410_g43398;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = ( _MASK_B1440_g38539.r * temp_output_1_0_g43210 );
				float Smoothness = ( temp_output_1556_33_g38539 * Occlusion1550_g38539 ).x;
				float Occlusion = saturate( lerpResult83_g43209 ).r;
				float Alpha = break377_g38539.a;
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
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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

			#define ASE_NEEDS_VERT_NORMAL
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
				float4 ase_texcoord : TEXCOORD0;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Smoothness;
			float4 _Color;
			float4 _ParallaxMap_TexelSize;
			half4 _ColorDetail;
			half _DetailOffsetXDetail;
			half _DetailOffsetYDetail;
			float _DetailTilingXDetailMask;
			float _DetailTilingYDetailMask;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			float _MetallicStrength;
			half _SmoothnessSource;
			half _DetailBlendInfluence;
			float _DetailTilingYDetail;
			float _DetailTilingXDetail;
			half _EnableDetailMask;
			float _SmoothnessMin;
			float _SmoothnessMax;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ZWriteMode;
			half _TessellationDistanceMax;
			half _TessellationPhong;
			int _ColorMask;
			float _OcclusionStrengthAO;
			half _EmissionFlags;
			float _AlphatoCoverage;
			half _DisplacementReconstructMode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _DisplacementReconstructStrength;
			half _Brightness;
			int _RenderFace;
			float _OcclusionSource;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);


			float3 _Displacement_ModeCfloat3switch( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
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

				float3 temp_output_309_0_g38539 = float3(0,0,0);
				float temp_output_62_0_g43218 = _DisplacementReconstructMode;
				float m_switch74_g43218 = temp_output_62_0_g43218;
				float3 _Vector3 = float3(0,0,0);
				float3 m_Off74_g43218 = _Vector3;
				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = v.ase_texcoord.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 OUT_DISPLAC1180_g38539 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g43212, 0.0 );
				float3 temp_output_190_0_g43218 = (OUT_DISPLAC1180_g38539).xyz;
				float temp_output_61_0_g43218 = _DisplacementReconstructStrength;
				float3 temp_output_200_0_g43218 = ( v.ase_normal * ( temp_output_190_0_g43218 * temp_output_61_0_g43218 ) );
				float3 m_Active74_g43218 = temp_output_200_0_g43218;
				float3 m_ActiveReconstructed74_g43218 = temp_output_200_0_g43218;
				float3 local_Displacement_ModeCfloat3switch74_g43218 = _Displacement_ModeCfloat3switch( m_switch74_g43218 , m_Off74_g43218 , m_Active74_g43218 , m_ActiveReconstructed74_g43218 );
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38539 + local_Displacement_ModeCfloat3switch74_g43218 );
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
				float4 ase_texcoord : TEXCOORD0;

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
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
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

				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = IN.ase_texcoord2.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 tex2DNode63_g43212 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43212 );
				float4 OUT_ALBEDO_RGBA1177_g38539 = tex2DNode63_g43212;
				float4 break377_g38539 = OUT_ALBEDO_RGBA1177_g38539;
				
				float Alpha = break377_g38539.a;
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
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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

			#define ASE_NEEDS_VERT_NORMAL
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
				float4 ase_texcoord : TEXCOORD0;
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
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Smoothness;
			float4 _Color;
			float4 _ParallaxMap_TexelSize;
			half4 _ColorDetail;
			half _DetailOffsetXDetail;
			half _DetailOffsetYDetail;
			float _DetailTilingXDetailMask;
			float _DetailTilingYDetailMask;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			float _MetallicStrength;
			half _SmoothnessSource;
			half _DetailBlendInfluence;
			float _DetailTilingYDetail;
			float _DetailTilingXDetail;
			half _EnableDetailMask;
			float _SmoothnessMin;
			float _SmoothnessMax;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ZWriteMode;
			half _TessellationDistanceMax;
			half _TessellationPhong;
			int _ColorMask;
			float _OcclusionStrengthAO;
			half _EmissionFlags;
			float _AlphatoCoverage;
			half _DisplacementReconstructMode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _DisplacementReconstructStrength;
			half _Brightness;
			int _RenderFace;
			float _OcclusionSource;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);


			float3 _Displacement_ModeCfloat3switch( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_output_309_0_g38539 = float3(0,0,0);
				float temp_output_62_0_g43218 = _DisplacementReconstructMode;
				float m_switch74_g43218 = temp_output_62_0_g43218;
				float3 _Vector3 = float3(0,0,0);
				float3 m_Off74_g43218 = _Vector3;
				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = v.ase_texcoord.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 OUT_DISPLAC1180_g38539 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g43212, 0.0 );
				float3 temp_output_190_0_g43218 = (OUT_DISPLAC1180_g38539).xyz;
				float temp_output_61_0_g43218 = _DisplacementReconstructStrength;
				float3 temp_output_200_0_g43218 = ( v.ase_normal * ( temp_output_190_0_g43218 * temp_output_61_0_g43218 ) );
				float3 m_Active74_g43218 = temp_output_200_0_g43218;
				float3 m_ActiveReconstructed74_g43218 = temp_output_200_0_g43218;
				float3 local_Displacement_ModeCfloat3switch74_g43218 = _Displacement_ModeCfloat3switch( m_switch74_g43218 , m_Off74_g43218 , m_Active74_g43218 , m_ActiveReconstructed74_g43218 );
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38539 + local_Displacement_ModeCfloat3switch74_g43218 );
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
				float4 ase_texcoord : TEXCOORD0;

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
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
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

				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = IN.ase_texcoord2.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 tex2DNode63_g43212 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43212 );
				float4 OUT_ALBEDO_RGBA1177_g38539 = tex2DNode63_g43212;
				float4 break377_g38539 = OUT_ALBEDO_RGBA1177_g38539;
				
				float Alpha = break377_g38539.a;
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
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Smoothness;
			float4 _Color;
			float4 _ParallaxMap_TexelSize;
			half4 _ColorDetail;
			half _DetailOffsetXDetail;
			half _DetailOffsetYDetail;
			float _DetailTilingXDetailMask;
			float _DetailTilingYDetailMask;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			float _MetallicStrength;
			half _SmoothnessSource;
			half _DetailBlendInfluence;
			float _DetailTilingYDetail;
			float _DetailTilingXDetail;
			half _EnableDetailMask;
			float _SmoothnessMin;
			float _SmoothnessMax;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ZWriteMode;
			half _TessellationDistanceMax;
			half _TessellationPhong;
			int _ColorMask;
			float _OcclusionStrengthAO;
			half _EmissionFlags;
			float _AlphatoCoverage;
			half _DisplacementReconstructMode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _DisplacementReconstructStrength;
			half _Brightness;
			int _RenderFace;
			float _OcclusionSource;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);


			float3 _Displacement_ModeCfloat3switch( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			
			float4 Detail_Maskfloat4switch226_g43398( float m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float4(0,0,0,0);
			}
			
			float Detail_BlendVCfloatswitch319_g43398( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_output_309_0_g38539 = float3(0,0,0);
				float temp_output_62_0_g43218 = _DisplacementReconstructMode;
				float m_switch74_g43218 = temp_output_62_0_g43218;
				float3 _Vector3 = float3(0,0,0);
				float3 m_Off74_g43218 = _Vector3;
				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = v.ase_texcoord.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 OUT_DISPLAC1180_g38539 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g43212, 0.0 );
				float3 temp_output_190_0_g43218 = (OUT_DISPLAC1180_g38539).xyz;
				float temp_output_61_0_g43218 = _DisplacementReconstructStrength;
				float3 temp_output_200_0_g43218 = ( v.ase_normal * ( temp_output_190_0_g43218 * temp_output_61_0_g43218 ) );
				float3 m_Active74_g43218 = temp_output_200_0_g43218;
				float3 m_ActiveReconstructed74_g43218 = temp_output_200_0_g43218;
				float3 local_Displacement_ModeCfloat3switch74_g43218 = _Displacement_ModeCfloat3switch( m_switch74_g43218 , m_Off74_g43218 , m_Active74_g43218 , m_ActiveReconstructed74_g43218 );
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38539 + local_Displacement_ModeCfloat3switch74_g43218 );
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
				float4 ase_texcoord : TEXCOORD0;
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
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
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

				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = IN.ase_texcoord2.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 tex2DNode63_g43212 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43212 );
				float4 OUT_ALBEDO_RGBA1177_g38539 = tex2DNode63_g43212;
				float3 temp_output_7_0_g38539 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38539).rgb * _Brightness );
				float4 temp_output_39_0_g43398 = float4( temp_output_7_0_g38539 , 0.0 );
				float4 Albedo_RGBA40_g43398 = temp_output_39_0_g43398;
				float m_switch226_g43398 = _EnableDetailMask;
				float2 appendResult132_g43398 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g43398 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g43398 = IN.ase_texcoord2.xy * appendResult132_g43398 + appendResult114_g43398;
				float4 tex2DNode45_g43398 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord67_g43398 );
				float4 ALBEDO_OUT255_g43398 = ( _ColorDetail * tex2DNode45_g43398 * _Brightness );
				float4 m_Off226_g43398 = ALBEDO_OUT255_g43398;
				float2 appendResult219_g43398 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g43398 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g43398 = IN.ase_texcoord2.xy * appendResult219_g43398 + appendResult206_g43398;
				float temp_output_15_0_g43399 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g43398 ).r );
				float temp_output_26_0_g43399 = _Detail_BlendAmountMask;
				float temp_output_24_0_g43399 = _Detail_BlendHardnessMask;
				float saferPower2_g43399 = abs( max( saturate( (0.0 + (temp_output_15_0_g43399 - ( 1.0 - temp_output_26_0_g43399 )) * (temp_output_24_0_g43399 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g43399 ))) ) , 0.0 ) );
				float temp_output_22_0_g43399 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g43398 = saturate( pow( saferPower2_g43399 , ( 1.0 - temp_output_22_0_g43399 ) ) );
				float4 lerpResult225_g43398 = lerp( Albedo_RGBA40_g43398 , ALBEDO_OUT255_g43398 , temp_output_403_0_g43398);
				float4 m_Active226_g43398 = lerpResult225_g43398;
				float saferPower11_g43399 = abs( max( saturate( (1.0 + (temp_output_15_0_g43399 - temp_output_26_0_g43399) * (( 1.0 - temp_output_24_0_g43399 ) - 1.0) / (0.0 - temp_output_26_0_g43399)) ) , 0.0 ) );
				float temp_output_403_21_g43398 = saturate( pow( saferPower11_g43399 , temp_output_22_0_g43399 ) );
				float4 lerpResult408_g43398 = lerp( ALBEDO_OUT255_g43398 , Albedo_RGBA40_g43398 , temp_output_403_21_g43398);
				float4 m_ActiveInverted226_g43398 = lerpResult408_g43398;
				float4 localDetail_Maskfloat4switch226_g43398 = Detail_Maskfloat4switch226_g43398( m_switch226_g43398 , m_Off226_g43398 , m_Active226_g43398 , m_ActiveInverted226_g43398 );
				float4 Mask_Albedo258_g43398 = localDetail_Maskfloat4switch226_g43398;
				float4 break48_g43398 = temp_output_39_0_g43398;
				float Albedo_RGB300_g43398 = ( break48_g43398.x + break48_g43398.y + break48_g43398.z );
				int m_switch319_g43398 = _BlendColor;
				float m_Red319_g43398 = IN.ase_color.r;
				float m_Green319_g43398 = IN.ase_color.g;
				float m_Blue319_g43398 = IN.ase_color.b;
				float localDetail_BlendVCfloatswitch319_g43398 = Detail_BlendVCfloatswitch319_g43398( m_switch319_g43398 , m_Red319_g43398 , m_Green319_g43398 , m_Blue319_g43398 );
				float clampResult47_g43398 = clamp( ( ( ( ( Albedo_RGB300_g43398 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localDetail_BlendVCfloatswitch319_g43398 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DetailBlend43_g43398 = clampResult47_g43398;
				float4 lerpResult58_g43398 = lerp( Mask_Albedo258_g43398 , Albedo_RGBA40_g43398 , DetailBlend43_g43398);
				float4 lerpResult409_g43398 = lerp( Albedo_RGBA40_g43398 , lerpResult58_g43398 , _EnableDetailMap);
				
				float4 break377_g38539 = OUT_ALBEDO_RGBA1177_g38539;
				
				
				float3 Albedo = lerpResult409_g43398.xyz;
				float3 Emission = 0;
				float Alpha = break377_g38539.a;
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
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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
			
			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
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
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_color : COLOR;
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
				float4 ase_color : COLOR;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Smoothness;
			float4 _Color;
			float4 _ParallaxMap_TexelSize;
			half4 _ColorDetail;
			half _DetailOffsetXDetail;
			half _DetailOffsetYDetail;
			float _DetailTilingXDetailMask;
			float _DetailTilingYDetailMask;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			float _MetallicStrength;
			half _SmoothnessSource;
			half _DetailBlendInfluence;
			float _DetailTilingYDetail;
			float _DetailTilingXDetail;
			half _EnableDetailMask;
			float _SmoothnessMin;
			float _SmoothnessMax;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ZWriteMode;
			half _TessellationDistanceMax;
			half _TessellationPhong;
			int _ColorMask;
			float _OcclusionStrengthAO;
			half _EmissionFlags;
			float _AlphatoCoverage;
			half _DisplacementReconstructMode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _DisplacementReconstructStrength;
			half _Brightness;
			int _RenderFace;
			float _OcclusionSource;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);


			float3 _Displacement_ModeCfloat3switch( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			
			float4 Detail_Maskfloat4switch226_g43398( float m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float4(0,0,0,0);
			}
			
			float Detail_BlendVCfloatswitch319_g43398( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float3 temp_output_309_0_g38539 = float3(0,0,0);
				float temp_output_62_0_g43218 = _DisplacementReconstructMode;
				float m_switch74_g43218 = temp_output_62_0_g43218;
				float3 _Vector3 = float3(0,0,0);
				float3 m_Off74_g43218 = _Vector3;
				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = v.ase_texcoord.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 OUT_DISPLAC1180_g38539 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g43212, 0.0 );
				float3 temp_output_190_0_g43218 = (OUT_DISPLAC1180_g38539).xyz;
				float temp_output_61_0_g43218 = _DisplacementReconstructStrength;
				float3 temp_output_200_0_g43218 = ( v.ase_normal * ( temp_output_190_0_g43218 * temp_output_61_0_g43218 ) );
				float3 m_Active74_g43218 = temp_output_200_0_g43218;
				float3 m_ActiveReconstructed74_g43218 = temp_output_200_0_g43218;
				float3 local_Displacement_ModeCfloat3switch74_g43218 = _Displacement_ModeCfloat3switch( m_switch74_g43218 , m_Off74_g43218 , m_Active74_g43218 , m_ActiveReconstructed74_g43218 );
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;
				
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38539 + local_Displacement_ModeCfloat3switch74_g43218 );
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
				float4 ase_texcoord : TEXCOORD0;
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
				o.ase_texcoord = v.ase_texcoord;
				o.ase_color = v.ase_color;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_color = patch[0].ase_color * bary.x + patch[1].ase_color * bary.y + patch[2].ase_color * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
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

				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = IN.ase_texcoord2.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 tex2DNode63_g43212 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43212 );
				float4 OUT_ALBEDO_RGBA1177_g38539 = tex2DNode63_g43212;
				float3 temp_output_7_0_g38539 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38539).rgb * _Brightness );
				float4 temp_output_39_0_g43398 = float4( temp_output_7_0_g38539 , 0.0 );
				float4 Albedo_RGBA40_g43398 = temp_output_39_0_g43398;
				float m_switch226_g43398 = _EnableDetailMask;
				float2 appendResult132_g43398 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g43398 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g43398 = IN.ase_texcoord2.xy * appendResult132_g43398 + appendResult114_g43398;
				float4 tex2DNode45_g43398 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord67_g43398 );
				float4 ALBEDO_OUT255_g43398 = ( _ColorDetail * tex2DNode45_g43398 * _Brightness );
				float4 m_Off226_g43398 = ALBEDO_OUT255_g43398;
				float2 appendResult219_g43398 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g43398 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g43398 = IN.ase_texcoord2.xy * appendResult219_g43398 + appendResult206_g43398;
				float temp_output_15_0_g43399 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g43398 ).r );
				float temp_output_26_0_g43399 = _Detail_BlendAmountMask;
				float temp_output_24_0_g43399 = _Detail_BlendHardnessMask;
				float saferPower2_g43399 = abs( max( saturate( (0.0 + (temp_output_15_0_g43399 - ( 1.0 - temp_output_26_0_g43399 )) * (temp_output_24_0_g43399 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g43399 ))) ) , 0.0 ) );
				float temp_output_22_0_g43399 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g43398 = saturate( pow( saferPower2_g43399 , ( 1.0 - temp_output_22_0_g43399 ) ) );
				float4 lerpResult225_g43398 = lerp( Albedo_RGBA40_g43398 , ALBEDO_OUT255_g43398 , temp_output_403_0_g43398);
				float4 m_Active226_g43398 = lerpResult225_g43398;
				float saferPower11_g43399 = abs( max( saturate( (1.0 + (temp_output_15_0_g43399 - temp_output_26_0_g43399) * (( 1.0 - temp_output_24_0_g43399 ) - 1.0) / (0.0 - temp_output_26_0_g43399)) ) , 0.0 ) );
				float temp_output_403_21_g43398 = saturate( pow( saferPower11_g43399 , temp_output_22_0_g43399 ) );
				float4 lerpResult408_g43398 = lerp( ALBEDO_OUT255_g43398 , Albedo_RGBA40_g43398 , temp_output_403_21_g43398);
				float4 m_ActiveInverted226_g43398 = lerpResult408_g43398;
				float4 localDetail_Maskfloat4switch226_g43398 = Detail_Maskfloat4switch226_g43398( m_switch226_g43398 , m_Off226_g43398 , m_Active226_g43398 , m_ActiveInverted226_g43398 );
				float4 Mask_Albedo258_g43398 = localDetail_Maskfloat4switch226_g43398;
				float4 break48_g43398 = temp_output_39_0_g43398;
				float Albedo_RGB300_g43398 = ( break48_g43398.x + break48_g43398.y + break48_g43398.z );
				int m_switch319_g43398 = _BlendColor;
				float m_Red319_g43398 = IN.ase_color.r;
				float m_Green319_g43398 = IN.ase_color.g;
				float m_Blue319_g43398 = IN.ase_color.b;
				float localDetail_BlendVCfloatswitch319_g43398 = Detail_BlendVCfloatswitch319_g43398( m_switch319_g43398 , m_Red319_g43398 , m_Green319_g43398 , m_Blue319_g43398 );
				float clampResult47_g43398 = clamp( ( ( ( ( Albedo_RGB300_g43398 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localDetail_BlendVCfloatswitch319_g43398 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DetailBlend43_g43398 = clampResult47_g43398;
				float4 lerpResult58_g43398 = lerp( Mask_Albedo258_g43398 , Albedo_RGBA40_g43398 , DetailBlend43_g43398);
				float4 lerpResult409_g43398 = lerp( Albedo_RGBA40_g43398 , lerpResult58_g43398 , _EnableDetailMap);
				
				float4 break377_g38539 = OUT_ALBEDO_RGBA1177_g38539;
				
				
				float3 Albedo = lerpResult409_g43398.xyz;
				float Alpha = break377_g38539.a;
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
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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

			#define ASE_NEEDS_VERT_NORMAL
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
				float4 ase_texcoord : TEXCOORD0;
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
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _Smoothness;
			float4 _Color;
			float4 _ParallaxMap_TexelSize;
			half4 _ColorDetail;
			half _DetailOffsetXDetail;
			half _DetailOffsetYDetail;
			float _DetailTilingXDetailMask;
			float _DetailTilingYDetailMask;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			float _MetallicStrength;
			half _SmoothnessSource;
			half _DetailBlendInfluence;
			float _DetailTilingYDetail;
			float _DetailTilingXDetail;
			half _EnableDetailMask;
			float _SmoothnessMin;
			float _SmoothnessMax;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ZWriteMode;
			half _TessellationDistanceMax;
			half _TessellationPhong;
			int _ColorMask;
			float _OcclusionStrengthAO;
			half _EmissionFlags;
			float _AlphatoCoverage;
			half _DisplacementReconstructMode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _DisplacementReconstructStrength;
			half _Brightness;
			int _RenderFace;
			float _OcclusionSource;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);


			float3 _Displacement_ModeCfloat3switch( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float3 temp_output_309_0_g38539 = float3(0,0,0);
				float temp_output_62_0_g43218 = _DisplacementReconstructMode;
				float m_switch74_g43218 = temp_output_62_0_g43218;
				float3 _Vector3 = float3(0,0,0);
				float3 m_Off74_g43218 = _Vector3;
				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = v.ase_texcoord.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 OUT_DISPLAC1180_g38539 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g43212, 0.0 );
				float3 temp_output_190_0_g43218 = (OUT_DISPLAC1180_g38539).xyz;
				float temp_output_61_0_g43218 = _DisplacementReconstructStrength;
				float3 temp_output_200_0_g43218 = ( v.ase_normal * ( temp_output_190_0_g43218 * temp_output_61_0_g43218 ) );
				float3 m_Active74_g43218 = temp_output_200_0_g43218;
				float3 m_ActiveReconstructed74_g43218 = temp_output_200_0_g43218;
				float3 local_Displacement_ModeCfloat3switch74_g43218 = _Displacement_ModeCfloat3switch( m_switch74_g43218 , m_Off74_g43218 , m_Active74_g43218 , m_ActiveReconstructed74_g43218 );
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38539 + local_Displacement_ModeCfloat3switch74_g43218 );
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
				float4 ase_texcoord : TEXCOORD0;

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
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessellationPhong;
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

				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = IN.ase_texcoord3.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 tex2DNode63_g43212 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43212 );
				float4 OUT_ALBEDO_RGBA1177_g38539 = tex2DNode63_g43212;
				float4 break377_g38539 = OUT_ALBEDO_RGBA1177_g38539;
				
				float Alpha = break377_g38539.a;
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
			#define _ALPHATEST_SHADOW_ON 1
			#pragma multi_compile_instancing
			#pragma multi_compile _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define TESSELLATION_ON 1
			#pragma require tessellation tessHW
			#pragma hull HullFunction
			#pragma domain DomainFunction
			#define ASE_PHONG_TESSELLATION
			#define ASE_DISTANCE_TESSELLATION
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

			#define ASE_NEEDS_VERT_NORMAL
			#define ASE_NEEDS_FRAG_COLOR
			#define ASE_NEEDS_FRAG_WORLD_TANGENT
			#define ASE_NEEDS_FRAG_WORLD_NORMAL
			#define ASE_NEEDS_FRAG_WORLD_BITANGENT
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
			float4 _Smoothness;
			float4 _Color;
			float4 _ParallaxMap_TexelSize;
			half4 _ColorDetail;
			half _DetailOffsetXDetail;
			half _DetailOffsetYDetail;
			float _DetailTilingXDetailMask;
			float _DetailTilingYDetailMask;
			half _DetailOffsetXDetailMask;
			half _DetailOffsetYDetailMask;
			half _Detail_BlendAmountMask;
			half _Detail_BlendHardnessMask;
			half _Detail_BlendFalloffMask;
			int _BlendColor;
			half _BlendHeight;
			half _DetailBlendSmooth;
			float _EnableDetailMap;
			half _NormalStrength;
			half _DetailNormalMapScale;
			float _MetallicStrength;
			half _SmoothnessSource;
			half _DetailBlendInfluence;
			float _DetailTilingYDetail;
			float _DetailTilingXDetail;
			half _EnableDetailMask;
			float _SmoothnessMin;
			float _SmoothnessMax;
			half _TessellationStrength;
			half _TessellationDistanceMin;
			int _ZWriteMode;
			half _TessellationDistanceMax;
			half _TessellationPhong;
			int _ColorMask;
			float _OcclusionStrengthAO;
			half _EmissionFlags;
			float _AlphatoCoverage;
			half _DisplacementReconstructMode;
			float _TilingX;
			float _TilingY;
			float _OffsetX;
			float _OffsetY;
			half _DisplacementReconstructStrength;
			half _Brightness;
			int _RenderFace;
			float _OcclusionSource;
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
			TEXTURE2D(_ParallaxMap);
			SAMPLER(sampler_trilinear_repeat);
			TEXTURE2D(_MainTex);
			TEXTURE2D(_DetailAlbedoMap);
			TEXTURE2D(_DetailMaskMap);
			TEXTURE2D(_BumpMap);
			TEXTURE2D(_DetailNormalMap);
			TEXTURE2D(_MetallicGlossMap);
			TEXTURE2D(_SmoothnessMap);
			TEXTURE2D(_OcclusionMap);


			float3 _Displacement_ModeCfloat3switch( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveReconstructed )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveReconstructed;
				else
				return float3(0,0,0);
			}
			
			float4 Detail_Maskfloat4switch226_g43398( float m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float4(0,0,0,0);
			}
			
			float Detail_BlendVCfloatswitch319_g43398( int m_switch, float m_Red, float m_Green, float m_Blue )
			{
				if(m_switch ==0)
					return m_Red;
				else if(m_switch ==1)
					return m_Green;
				else if(m_switch ==2)
					return m_Blue;
				else
				return float(0);
			}
			
			void CalculateUVsSmooth19_g43206( float2 UV, float4 TexelSize, out float2 UV0, out float2 UV1, out float2 UV2, out float2 UV3, out float2 UV4, out float2 UV5, out float2 UV6, out float2 UV7, out float2 UV8 )
			{
				{
				 float3 pos = float3( TexelSize.xy, 0 );
				    float3 neg = float3( -pos.xy, 0 );
				 UV0 = UV + neg.xy;
				    UV1 = UV + neg.zy;
				    UV2 = UV + float2( pos.x, neg.y );
				    UV3 = UV + neg.xz;
				    UV4 = UV;
				    UV5 = UV + pos.xz;
				    UV6 = UV + float2( neg.x, pos.y );
				    UV7 = UV + pos.zy;
				    UV8 = UV + pos.xy;
				    return;
				}
			}
			
			float3 CombineSamplesSmooth31_g43206( float Strength, float S0, float S1, float S2, float S3, float S4, float S5, float S6, float S7, float S8 )
			{
				{
				 float3 normal;
				    normal.x = Strength * ( S0 - S2 + 2 * S3 - 2 * S5 + S6 - S8 );
				    normal.y = Strength * ( S0 + 2 * S1 + S2 - S6 - 2 * S7 - S8 );
				    normal.z = 1.0;
				    return normalize( normal );
				}
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
			
			float3 Detail_Maskfloat3switch221_g43398( float m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
			{
				if(m_switch ==0)
					return m_Off;
				else if(m_switch ==1)
					return m_Active;
				else if(m_switch ==2)
					return m_ActiveInverted;
				else
				return float3(0,0,0);
			}
			
			float4 SmoothnessTypefloat4switch215_g43215( float m_switch, float4 m_Smoothness, float4 m_Roughness, float4 m_Geometric )
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

				float3 temp_output_309_0_g38539 = float3(0,0,0);
				float temp_output_62_0_g43218 = _DisplacementReconstructMode;
				float m_switch74_g43218 = temp_output_62_0_g43218;
				float3 _Vector3 = float3(0,0,0);
				float3 m_Off74_g43218 = _Vector3;
				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = v.texcoord.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 OUT_DISPLAC1180_g38539 = SAMPLE_TEXTURE2D_LOD( _ParallaxMap, sampler_trilinear_repeat, UV40_g43212, 0.0 );
				float3 temp_output_190_0_g43218 = (OUT_DISPLAC1180_g38539).xyz;
				float temp_output_61_0_g43218 = _DisplacementReconstructStrength;
				float3 temp_output_200_0_g43218 = ( v.ase_normal * ( temp_output_190_0_g43218 * temp_output_61_0_g43218 ) );
				float3 m_Active74_g43218 = temp_output_200_0_g43218;
				float3 m_ActiveReconstructed74_g43218 = temp_output_200_0_g43218;
				float3 local_Displacement_ModeCfloat3switch74_g43218 = _Displacement_ModeCfloat3switch( m_switch74_g43218 , m_Off74_g43218 , m_Active74_g43218 , m_ActiveReconstructed74_g43218 );
				
				o.ase_texcoord7.xy = v.texcoord.xy;
				o.ase_color = v.ase_color;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord7.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = ( temp_output_309_0_g38539 + local_Displacement_ModeCfloat3switch74_g43218 );
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
				float tessValue = _TessellationStrength; float tessMin = _TessellationDistanceMin; float tessMax = _TessellationDistanceMax;
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
				float phongStrength = _TessellationPhong;
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

				float2 appendResult150_g38539 = (float2(_TilingX , _TilingY));
				float2 appendResult151_g38539 = (float2(_OffsetX , _OffsetY));
				float2 texCoord2_g43214 = IN.ase_texcoord7.xy * appendResult150_g38539 + appendResult151_g38539;
				float2 OUT_UV431_g38539 = texCoord2_g43214;
				float2 UV40_g43212 = OUT_UV431_g38539;
				float4 tex2DNode63_g43212 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g43212 );
				float4 OUT_ALBEDO_RGBA1177_g38539 = tex2DNode63_g43212;
				float3 temp_output_7_0_g38539 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38539).rgb * _Brightness );
				float4 temp_output_39_0_g43398 = float4( temp_output_7_0_g38539 , 0.0 );
				float4 Albedo_RGBA40_g43398 = temp_output_39_0_g43398;
				float m_switch226_g43398 = _EnableDetailMask;
				float2 appendResult132_g43398 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
				float2 appendResult114_g43398 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
				float2 texCoord67_g43398 = IN.ase_texcoord7.xy * appendResult132_g43398 + appendResult114_g43398;
				float4 tex2DNode45_g43398 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, texCoord67_g43398 );
				float4 ALBEDO_OUT255_g43398 = ( _ColorDetail * tex2DNode45_g43398 * _Brightness );
				float4 m_Off226_g43398 = ALBEDO_OUT255_g43398;
				float2 appendResult219_g43398 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
				float2 appendResult206_g43398 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
				float2 texCoord220_g43398 = IN.ase_texcoord7.xy * appendResult219_g43398 + appendResult206_g43398;
				float temp_output_15_0_g43399 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, texCoord220_g43398 ).r );
				float temp_output_26_0_g43399 = _Detail_BlendAmountMask;
				float temp_output_24_0_g43399 = _Detail_BlendHardnessMask;
				float saferPower2_g43399 = abs( max( saturate( (0.0 + (temp_output_15_0_g43399 - ( 1.0 - temp_output_26_0_g43399 )) * (temp_output_24_0_g43399 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g43399 ))) ) , 0.0 ) );
				float temp_output_22_0_g43399 = _Detail_BlendFalloffMask;
				float temp_output_403_0_g43398 = saturate( pow( saferPower2_g43399 , ( 1.0 - temp_output_22_0_g43399 ) ) );
				float4 lerpResult225_g43398 = lerp( Albedo_RGBA40_g43398 , ALBEDO_OUT255_g43398 , temp_output_403_0_g43398);
				float4 m_Active226_g43398 = lerpResult225_g43398;
				float saferPower11_g43399 = abs( max( saturate( (1.0 + (temp_output_15_0_g43399 - temp_output_26_0_g43399) * (( 1.0 - temp_output_24_0_g43399 ) - 1.0) / (0.0 - temp_output_26_0_g43399)) ) , 0.0 ) );
				float temp_output_403_21_g43398 = saturate( pow( saferPower11_g43399 , temp_output_22_0_g43399 ) );
				float4 lerpResult408_g43398 = lerp( ALBEDO_OUT255_g43398 , Albedo_RGBA40_g43398 , temp_output_403_21_g43398);
				float4 m_ActiveInverted226_g43398 = lerpResult408_g43398;
				float4 localDetail_Maskfloat4switch226_g43398 = Detail_Maskfloat4switch226_g43398( m_switch226_g43398 , m_Off226_g43398 , m_Active226_g43398 , m_ActiveInverted226_g43398 );
				float4 Mask_Albedo258_g43398 = localDetail_Maskfloat4switch226_g43398;
				float4 break48_g43398 = temp_output_39_0_g43398;
				float Albedo_RGB300_g43398 = ( break48_g43398.x + break48_g43398.y + break48_g43398.z );
				int m_switch319_g43398 = _BlendColor;
				float m_Red319_g43398 = IN.ase_color.r;
				float m_Green319_g43398 = IN.ase_color.g;
				float m_Blue319_g43398 = IN.ase_color.b;
				float localDetail_BlendVCfloatswitch319_g43398 = Detail_BlendVCfloatswitch319_g43398( m_switch319_g43398 , m_Red319_g43398 , m_Green319_g43398 , m_Blue319_g43398 );
				float clampResult47_g43398 = clamp( ( ( ( ( Albedo_RGB300_g43398 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localDetail_BlendVCfloatswitch319_g43398 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
				float DetailBlend43_g43398 = clampResult47_g43398;
				float4 lerpResult58_g43398 = lerp( Mask_Albedo258_g43398 , Albedo_RGBA40_g43398 , DetailBlend43_g43398);
				float4 lerpResult409_g43398 = lerp( Albedo_RGBA40_g43398 , lerpResult58_g43398 , _EnableDetailMap);
				
				float _Displacement_Mode1309_g38539 = _DisplacementReconstructMode;
				float m_switch1310_g38539 = _Displacement_Mode1309_g38539;
				float4 OUT_NORMAL1178_g38539 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g43212 );
				float4 temp_output_1_0_g43220 = OUT_NORMAL1178_g38539;
				float temp_output_8_0_g43220 = _NormalStrength;
				float3 unpack52_g43220 = UnpackNormalScale( temp_output_1_0_g43220, temp_output_8_0_g43220 );
				unpack52_g43220.z = lerp( 1, unpack52_g43220.z, saturate(temp_output_8_0_g43220) );
				float3 temp_output_1478_59_g38539 = unpack52_g43220;
				float3 m_Off1310_g38539 = temp_output_1478_59_g38539;
				float3 m_Active1310_g38539 = temp_output_1478_59_g38539;
				float temp_output_1334_0_g38539 = ( _NormalStrength * 2.0 );
				float temp_output_29_0_g43206 = temp_output_1334_0_g38539;
				float Strength31_g43206 = temp_output_29_0_g43206;
				float localCalculateUVsSmooth19_g43206 = ( 0.0 );
				float2 temp_output_96_0_g43206 = OUT_UV431_g38539;
				float2 UV19_g43206 = temp_output_96_0_g43206;
				float4 TexelSize19_g43206 = _ParallaxMap_TexelSize;
				float2 UV019_g43206 = float2( 0,0 );
				float2 UV119_g43206 = float2( 0,0 );
				float2 UV219_g43206 = float2( 0,0 );
				float2 UV319_g43206 = float2( 0,0 );
				float2 UV419_g43206 = float2( 0,0 );
				float2 UV519_g43206 = float2( 0,0 );
				float2 UV619_g43206 = float2( 0,0 );
				float2 UV719_g43206 = float2( 0,0 );
				float2 UV819_g43206 = float2( 0,0 );
				CalculateUVsSmooth19_g43206( UV19_g43206 , TexelSize19_g43206 , UV019_g43206 , UV119_g43206 , UV219_g43206 , UV319_g43206 , UV419_g43206 , UV519_g43206 , UV619_g43206 , UV719_g43206 , UV819_g43206 );
				float4 break13_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV019_g43206 );
				float S031_g43206 = break13_g43206.r;
				float4 break8_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV119_g43206 );
				float S131_g43206 = break8_g43206.r;
				float4 break5_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV219_g43206 );
				float S231_g43206 = break5_g43206.r;
				float4 break3_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV319_g43206 );
				float S331_g43206 = break3_g43206.r;
				float4 break12_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV419_g43206 );
				float S431_g43206 = break12_g43206.r;
				float4 break23_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV519_g43206 );
				float S531_g43206 = break23_g43206.r;
				float4 break44_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV619_g43206 );
				float S631_g43206 = break44_g43206.r;
				float4 break42_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV719_g43206 );
				float S731_g43206 = break42_g43206.r;
				float4 break40_g43206 = SAMPLE_TEXTURE2D( _ParallaxMap, sampler_trilinear_repeat, UV819_g43206 );
				float S831_g43206 = break40_g43206.r;
				float3 localCombineSamplesSmooth31_g43206 = CombineSamplesSmooth31_g43206( Strength31_g43206 , S031_g43206 , S131_g43206 , S231_g43206 , S331_g43206 , S431_g43206 , S531_g43206 , S631_g43206 , S731_g43206 , S831_g43206 );
				float3 m_ActiveReconstructed1310_g38539 = localCombineSamplesSmooth31_g43206;
				float3 local_Displacement_ModeCfloat3switch1310_g38539 = _Displacement_ModeCfloat3switch( m_switch1310_g38539 , m_Off1310_g38539 , m_Active1310_g38539 , m_ActiveReconstructed1310_g38539 );
				float3 NORMAL_OUT314_g38539 = local_Displacement_ModeCfloat3switch1310_g38539;
				float3 temp_output_16_0_g43213 = NORMAL_OUT314_g38539;
				float3 tanToWorld0 = float3( WorldTangent.x, WorldBiTangent.x, WorldNormal.x );
				float3 tanToWorld1 = float3( WorldTangent.y, WorldBiTangent.y, WorldNormal.y );
				float3 tanToWorld2 = float3( WorldTangent.z, WorldBiTangent.z, WorldNormal.z );
				float3 tanNormal134_g43213 = temp_output_16_0_g43213;
				float3 worldNormal134_g43213 = float3(dot(tanToWorld0,tanNormal134_g43213), dot(tanToWorld1,tanNormal134_g43213), dot(tanToWorld2,tanNormal134_g43213));
				float3 NORMAL_TANGENTSPACE135_g43213 = worldNormal134_g43213;
				float3 WorldPosition63_g43213 = NORMAL_TANGENTSPACE135_g43213;
				float4 shadowMaskValue77_g43213 = float4(1,1,1,1);
				float4 ShadowMask63_g43213 = shadowMaskValue77_g43213;
				float3 localAdditionalLightsFlatMask63_g43213 = AdditionalLightsFlatMask( WorldPosition63_g43213 , ShadowMask63_g43213 );
				float3 ADDITIONAL_LIGHT1342_g38539 = localAdditionalLightsFlatMask63_g43213;
				float3 temp_output_38_0_g43398 = ( local_Displacement_ModeCfloat3switch1310_g38539 + ADDITIONAL_LIGHT1342_g38539 );
				float3 Normal_XYZ260_g43398 = temp_output_38_0_g43398;
				float EnableDetailMask216_g43398 = _EnableDetailMask;
				float m_switch221_g43398 = EnableDetailMask216_g43398;
				float4 temp_output_1_0_g43401 = SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, texCoord67_g43398 );
				float temp_output_8_0_g43401 = _DetailNormalMapScale;
				float3 unpack52_g43401 = UnpackNormalScale( temp_output_1_0_g43401, temp_output_8_0_g43401 );
				unpack52_g43401.z = lerp( 1, unpack52_g43401.z, saturate(temp_output_8_0_g43401) );
				float3 Detail_Normal199_g43398 = unpack52_g43401;
				float3 m_Off221_g43398 = Detail_Normal199_g43398;
				float3 lerpResult205_g43398 = lerp( Normal_XYZ260_g43398 , Detail_Normal199_g43398 , temp_output_403_0_g43398);
				float3 m_Active221_g43398 = saturate( lerpResult205_g43398 );
				float3 lerpResult406_g43398 = lerp( Detail_Normal199_g43398 , Normal_XYZ260_g43398 , temp_output_403_21_g43398);
				float3 m_ActiveInverted221_g43398 = saturate( lerpResult406_g43398 );
				float3 localDetail_Maskfloat3switch221_g43398 = Detail_Maskfloat3switch221_g43398( m_switch221_g43398 , m_Off221_g43398 , m_Active221_g43398 , m_ActiveInverted221_g43398 );
				float3 Mask_Normal222_g43398 = localDetail_Maskfloat3switch221_g43398;
				float layeredBlendVar413_g43398 = DetailBlend43_g43398;
				float3 layeredBlend413_g43398 = ( lerp( Mask_Normal222_g43398,Normal_XYZ260_g43398 , layeredBlendVar413_g43398 ) );
				float3 normalizeResult414_g43398 = normalize( layeredBlend413_g43398 );
				float3 temp_output_416_0_g43398 = BlendNormal( normalizeResult414_g43398 , Normal_XYZ260_g43398 );
				float EnebleMode122_g43398 = _EnableDetailMap;
				float3 lerpResult410_g43398 = lerp( Normal_XYZ260_g43398 , temp_output_416_0_g43398 , EnebleMode122_g43398);
				
				float4 _MASK_B1440_g38539 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g43212 );
				float temp_output_1_0_g43210 = _MetallicStrength;
				
				float temp_output_223_0_g43215 = _SmoothnessSource;
				float m_switch215_g43215 = temp_output_223_0_g43215;
				float4 _MASK_G1438_g38539 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g43212 );
				float4 temp_cast_10 = (_SmoothnessMin).xxxx;
				float4 temp_cast_11 = (_SmoothnessMax).xxxx;
				float4 temp_output_216_0_g43215 = (temp_cast_10 + (_MASK_G1438_g38539 - float4( 0,0,0,0 )) * (temp_cast_11 - temp_cast_10) / (float4( 1,1,1,1 ) - float4( 0,0,0,0 )));
				float4 m_Smoothness215_g43215 = temp_output_216_0_g43215;
				float4 temp_cast_12 = (_SmoothnessMin).xxxx;
				float4 temp_cast_13 = (_SmoothnessMax).xxxx;
				float4 temp_output_214_0_g43215 = ( 1.0 - temp_output_216_0_g43215 );
				float4 m_Roughness215_g43215 = temp_output_214_0_g43215;
				float4 temp_cast_14 = (_SmoothnessMin).xxxx;
				float4 temp_cast_15 = (_SmoothnessMax).xxxx;
				float m_switch1387_g38539 = _Displacement_Mode1309_g38539;
				float3 tanNormal67_g43220 = unpack52_g43220;
				float3 worldNormal67_g43220 = float3(dot(tanToWorld0,tanNormal67_g43220), dot(tanToWorld1,tanNormal67_g43220), dot(tanToWorld2,tanNormal67_g43220));
				float3 temp_output_1478_66_g38539 = worldNormal67_g43220;
				float3 m_Off1387_g38539 = temp_output_1478_66_g38539;
				float3 m_Active1387_g38539 = temp_output_1478_66_g38539;
				float3x3 ase_tangentToWorldFast = float3x3(WorldTangent.x,WorldBiTangent.x,WorldNormal.x,WorldTangent.y,WorldBiTangent.y,WorldNormal.y,WorldTangent.z,WorldBiTangent.z,WorldNormal.z);
				float3 tangentToWorldDir104_g43206 = mul( ase_tangentToWorldFast, localCombineSamplesSmooth31_g43206 );
				float3 m_ActiveReconstructed1387_g38539 = tangentToWorldDir104_g43206;
				float3 local_Displacement_ModeCfloat3switch1387_g38539 = _Displacement_ModeCfloat3switch( m_switch1387_g38539 , m_Off1387_g38539 , m_Active1387_g38539 , m_ActiveReconstructed1387_g38539 );
				float3 NORMAL_WORLD_OUT164_g38539 = local_Displacement_ModeCfloat3switch1387_g38539;
				float3 temp_output_4_0_g43215 = NORMAL_WORLD_OUT164_g38539;
				float3 temp_output_178_0_g43215 = ddx( temp_output_4_0_g43215 );
				float dotResult195_g43215 = dot( temp_output_178_0_g43215 , temp_output_178_0_g43215 );
				float3 temp_output_175_0_g43215 = ddy( temp_output_4_0_g43215 );
				float dotResult201_g43215 = dot( temp_output_175_0_g43215 , temp_output_175_0_g43215 );
				float4 break377_g38539 = OUT_ALBEDO_RGBA1177_g38539;
				float ALBEDO_R169_g38539 = break377_g38539.r;
				float4 temp_cast_16 = (ALBEDO_R169_g38539).xxxx;
				float4 m_Geometric215_g43215 = ( sqrt( saturate( ( temp_output_216_0_g43215 + ( ( dotResult195_g43215 + dotResult201_g43215 ) * 2.0 ) ) ) ) * ( 1.0 - temp_cast_16 ) );
				float4 localSmoothnessTypefloat4switch215_g43215 = SmoothnessTypefloat4switch215_g43215( m_switch215_g43215 , m_Smoothness215_g43215 , m_Roughness215_g43215 , m_Geometric215_g43215 );
				float4 temp_output_1556_33_g38539 = localSmoothnessTypefloat4switch215_g43215;
				float4 PBR_Occlusion1641_g38539 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g43212 );
				float temp_output_16_0_g43209 = _OcclusionStrengthAO;
				float temp_output_65_0_g43209 = ( 1.0 - temp_output_16_0_g43209 );
				float3 appendResult69_g43209 = (float3(temp_output_65_0_g43209 , temp_output_65_0_g43209 , temp_output_65_0_g43209));
				float4 color77_g43209 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
				float4 temp_cast_19 = (IN.ase_color.a).xxxx;
				float4 lerpResult75_g43209 = lerp( color77_g43209 , temp_cast_19 , temp_output_16_0_g43209);
				float4 lerpResult83_g43209 = lerp( float4( ( ( ( (PBR_Occlusion1641_g38539).xyz - float3( 0.5,0.5,0.5 ) ) * temp_output_16_0_g43209 ) + appendResult69_g43209 ) , 0.0 ) , lerpResult75_g43209 , _OcclusionSource);
				float4 Occlusion1550_g38539 = saturate( lerpResult83_g43209 );
				
				float3 Albedo = lerpResult409_g43398.xyz;
				float3 Normal = lerpResult410_g43398;
				float3 Emission = 0;
				float3 Specular = 0.5;
				float Metallic = ( _MASK_B1440_g38539.r * temp_output_1_0_g43210 );
				float Smoothness = ( temp_output_1556_33_g38539 * Occlusion1550_g38539 ).x;
				float Occlusion = saturate( lerpResult83_g43209 ).r;
				float Alpha = break377_g38539.a;
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
71;29.5;1654.5;850.5;-470.9956;1319.488;1;True;True
Node;AmplifyShaderEditor.CommentaryNode;384;1080.215,-1056.793;Inherit;False;300.1923;348.7019;Tessellation;4;386;385;387;388;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;394;1381.743,-372.798;Inherit;False;294.6667;106;DESF Common ASE Compile Shaders;1;395;;0,0.2047877,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;403;1723.634,-1057.934;Inherit;False;255.6026;356.7736;DEBUG SETTINGS ;1;409;;0,0,0,1;0;0
Node;AmplifyShaderEditor.FunctionNode;396;701.1121,-686.88;Inherit;False;DESF Core Surface;9;;38539;c3df20d62907cd04086a1eacc41e29d1;18,183,2,1352,2,1382,1,1433,1,1432,1,1434,1,1638,0,1588,0,1491,0,1446,0,1284,0,249,1,1319,1,1318,1,1407,0,1443,0,1337,0,1336,0;1;309;FLOAT3;0,0,0;False;7;FLOAT3;42;FLOAT3;39;FLOAT;0;FLOAT4;41;COLOR;43;FLOAT;55;FLOAT3;313
Node;AmplifyShaderEditor.FunctionNode;393;1153.659,-681.048;Inherit;False;DESF Module Detail;69;;43398;49c077198be2bdb409ab6ad879c0ca28;4,200,1,201,1,346,0,347,0;2;39;FLOAT4;0,0,0,0;False;38;FLOAT3;0,0,1;False;2;FLOAT4;73;FLOAT3;72
Node;AmplifyShaderEditor.RangedFloatNode;409;1752.211,-800.1067;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;False;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;411;1417.496,-1021.488;Inherit;False;Property;_RenderFace;Render Face;3;2;[Header];[Enum];Create;False;1;SURFACE OPTIONS;0;1;Front,2,Back,1,Both,0;True;0;False;2;1;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;291;1751.509,-949.39;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;388;1097.701,-815.3647;Half;False;Property;_TessellationPhong;Tessellation Phong;66;0;Create;False;1;;0;0;True;0;False;0.5;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;410;1414.995,-949.2378;Inherit;False;DESF GUI URP Surface 10x;4;;43397;06c8ac62791f7a845bbafd8ecdb1912b;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;293;1752.027,-1020.408;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;395;1391.743,-336.798;Inherit;False;DESF Utility ASE Compile Shaders;-1;;43396;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;387;1098.714,-954.8705;Half;False;Property;_TessellationDistanceMin;Tessellation Distance Min;67;0;Create;False;1;;0;0;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;386;1098.215,-1024.085;Half;False;Property;_TessellationStrength;Tessellation Strength;65;0;Create;False;1;;0;0;True;1;Header(TESSELLATION URP);False;6;0.5;0.001;100;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1752.674,-873.8951;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;385;1099.53,-884.6912;Half;False;Property;_TessellationDistanceMax;Tessellation Distance Max ;68;0;Create;False;1;;0;0;True;0;False;5;2000;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;390;1374.904,-620.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;378;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;False;False;False;False;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;376;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;375;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;False;False;True;False;False;False;False;0;False;-1;False;False;False;False;False;False;False;False;False;True;1;False;-1;True;3;False;-1;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;377;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;374;1374.904,-680.6909;Float;False;True;-1;2;DE_ShaderGUI;0;2;DEC/Surface/Surface Height Detail Tessellation;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;18;False;False;False;False;False;False;False;False;False;False;False;False;True;0;True;409;True;True;2;True;411;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=-10;NatureRendererInstancing=True;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;2;LightMode=UniversalForward;NatureRendererInstancing=True;False;False;5;Include;;False;;Native;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;ed9205546b797304ea7576ba0b32877e;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom; ;0;0;Standard;38;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;0;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Transmission;0;0;  Transmission Shadow;0.5,False,-1;0;Translucency;0;0;  Translucency Strength;1,False,-1;0;  Normal Distortion;0.5,False,-1;0;  Scattering;2,False,-1;0;  Direct;0.9,False,-1;0;  Ambient;0.1,False,-1;0;  Shadow;0.5,False,-1;0;Cast Shadows;1;0;  Use Shadow Threshold;1;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;1;0;  Phong;1;0;  Strength;0.5,True,388;0;  Type;1;0;  Tess;16,True,386;0;  Min;10,True,387;0;  Max;25,True,385;0;  Edge Length;16,False,-1;0;  Max Displacement;25,False,-1;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;0;8;False;True;True;True;True;True;True;True;False;;True;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;373;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;2;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;0;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;True;True;True;True;0;False;-1;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;False;-1;True;3;False;-1;True;True;0;False;-1;0;False;-1;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;391;1374.904,-680.6909;Float;False;False;-1;2;UnityEditor.ShaderGraph.PBRMasterGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;-1;False;True;0;False;-1;False;False;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;False;False;False;True;3;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;True;0;True;18;all;0;False;True;1;1;False;-1;0;False;-1;1;1;False;-1;0;False;-1;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;True;291;False;False;False;False;False;False;False;True;False;255;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;False;True;1;True;293;True;3;False;292;True;True;0;False;-1;0;False;-1;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;402;1389.533,-1060.037;Inherit;False;328.6918;357.9233;GLOBAL SETTINGS ;0;;0,0,0,1;0;0
WireConnection;393;39;396;42
WireConnection;393;38;396;39
WireConnection;374;0;393;73
WireConnection;374;1;393;72
WireConnection;374;3;396;0
WireConnection;374;4;396;41
WireConnection;374;5;396;43
WireConnection;374;6;396;55
WireConnection;374;8;396;313
ASEEND*/
//CHKSM=15DBDB69D3B0D0DFAB7969208739DDBB34676F54