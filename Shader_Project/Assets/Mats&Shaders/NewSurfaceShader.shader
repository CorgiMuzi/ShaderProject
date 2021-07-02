Shader "ShaderStudy/Test/Chapter1/TestShader"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _TestColor ("Test Color Picker", Color) = (1, 1, 1, 1)
        _Vector ("Enter Vector", vector) = (1,1,1,1)
        _MainTex ("Albedo (RGB)", 2D) = "white" {}
        _SubTex("Sub Texture", 2D) = "white" {}
        _Glossiness ("Smoothness", Range(0,1)) = 0.5
        _Brightness ("Brightness", Range(0,1)) = 0.5
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _Parentness1 ("Parentness", float) = 0
        
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows noambient

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        sampler2D _MainTex;

        struct Input
        {
            float2 uv_MainTex;
        };

        half _Glossiness;
        half _Metallic;
        fixed4 _Color;
        fixed4 _TestColor;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed r = 1;
            fixed2 gg = fixed2(0.5, 0);
            fixed3 bbb = fixed3(1, 0, 1);
            
            fixed4 c = tex2D (_MainTex, IN.uv_MainTex) * _Color;

            o.Albedo = _TestColor.rgb;
            // 1, 0.5, 1
            
            o.Alpha = c.a;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
