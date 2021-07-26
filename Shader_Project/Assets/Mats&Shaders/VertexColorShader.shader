Shader "Custom/VertexColorShader" {
    Properties {
        _MainTex ("Main Texutre", 2D) = "White" {}
        _MainTex2 ("Main Texture2", 2D) = "White" {}
    }

    SubShader {

        Tags {
            "RenderType"="Opaque"
        }

        CGPROGRAM
        #pragma surface surf Standard noambient

        sampler2D _MainTex;
        sampler2D _MainTex2;

        struct Input
        {
            fixed2 uv_MainTex;
            fixed2 uv_MainTex2;
            fixed4 color:COLOR;
        };

        void surf(Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 mainTex = tex2D(_MainTex, IN.uv_MainTex);
            fixed4 mainTex2 = tex2D(_MainTex2, IN.uv_MainTex2);
            // o.Albedo = mainTex.rgb;
            o.Emission = IN.color.rgb + mainTex2.rgb;
            o.Alpha = mainTex.a;
        }
        ENDCG
    }
    
    FallBack "Diffuse"
}