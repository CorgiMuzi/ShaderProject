Shader "Custom/LerpShader"
{
    Properties{
        _MainTex ("MainTexture (RGB)", 2D) = "White" {}
        _SubTex ("SubTexture (RGB)", 2D) = "White" {}
        _MixTex ("Mixing Degree", Range(0,1)) = 0.5
    }
    
    SubShader{
        Tags { "RenderType" = "Opaque"}
        
        CGPROGRAM
        #pragma surface Surf Standard
        
        sampler2D _MainTex;
        sampler2D _SubTex;

        struct Input
        {
            fixed2 uv_MainTex;
            fixed2 uv_SubTex;
        };

        float _MixTex;

        void Surf(Input input, inout SurfaceOutputStandard o)
        {
            fixed4 texA = tex2D(_MainTex, input.uv_MainTex);
            fixed4 subTexA = tex2D(_SubTex, input.uv_SubTex);
            o.Albedo = lerp(texA, subTexA,  1-texA.a);
            o.Alpha = texA.a;
        }
        ENDCG
    }
    
    FallBack "Diffuse"
}