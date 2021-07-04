Shader "Custom/BookFireShader"
{
    Properties
    {
        _MainTex ("Main Texture", 2D) = "White" {}
        _MainTex2 ("Main Texture 2nd", 2D) = "White" {}
        _MainTex3 ("Main Texture 3rd", 2D) = "White" {}
    }

    SubShader
    {
        Tags
        {
            "RenderType" = "Transparent"
            "Queue" = "Transparent"
        }

        CGPROGRAM
        #pragma surface BookFire Standard alpha:fade

        sampler2D _MainTex;
        sampler2D _MainTex2;
        sampler2D _MainTex3;

        struct Input
        {
            fixed2 uv_MainTex;
            fixed2 uv_MainTex2;
            fixed2 uv_MainTex3;
        };

        void BookFire(Input input, inout SurfaceOutputStandard o)
        {
            fixed4 mainTex2 = tex2D(_MainTex2, fixed2(input.uv_MainTex2.x, input.uv_MainTex2.y - _Time.y));
            fixed4 mainTex = tex2D(_MainTex, fixed2(input.uv_MainTex.x + mainTex2.r, input.uv_MainTex.y));
            fixed4 mainTex3 = tex2D(_MainTex3, fixed2(input.uv_MainTex3.x, input.uv_MainTex3.y - _Time.y));
           
            o.Albedo = mainTex.rgb * mainTex3.rgb;
            o.Alpha = mainTex.a;
        }
        
        ENDCG
        
    }

}