Shader "Custom/FireShader"
{
    Properties
    {
        _MainTex ("Main Texture", 2D) = "White" {}
        _MainTex2 ("2nd Main Texture", 2D) = "White" {}
        _SubTex ("Sub Texture", 2D) = "White" {}
        _Noise ("Noise", Range(-1, 1)) = 1
    }

    SubShader
    {
        Tags
        {
            "Render Type" = "Transparent"
            "Queue" = "Transparent"
        }

        CGPROGRAM
        #pragma surface fire Standard alpha:fade
        
        sampler2D _MainTex;
        sampler2D _MainTex2;
        sampler2D _SubTex;

        struct Input
        {
            fixed2 uv_MainTex;
            fixed2 uv_MainTex2;
            fixed2 uv_SubTex;
        };

        float _Noise;

        void fire(Input input, inout SurfaceOutputStandard o)
        {
            fixed4 subTex = tex2D(_SubTex, input.uv_SubTex);
            fixed4 mainTex = tex2D(_MainTex, input.uv_MainTex + subTex.r * _Noise);
            fixed4 mainTex2 = tex2D(_MainTex2, fixed2(input.uv_MainTex2.x, input.uv_MainTex2.y -_Time.y)+ subTex.r * _Noise);

            o.Emission = mainTex.rgb * mainTex2.rgb;
            o.Alpha = mainTex.a * mainTex2.a;
        }
        
        ENDCG
    }
    
    FallBack "Diffuse"
}