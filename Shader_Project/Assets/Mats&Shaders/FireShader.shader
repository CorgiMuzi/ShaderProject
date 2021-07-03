Shader "Custom/FireShader"
{
    Properties
    {
        _MainTex ("Main Texture", 2D) = "White" {}
        _MainTex2 ("2nd Main Texture", 2D) = "White" {}
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

        struct Input
        {
            fixed2 uv_MainTex;
            fixed2 uv_MainTex2;
        };


        void fire(Input input, inout SurfaceOutputStandard o)
        {
            fixed4 mainTex = tex2D(_MainTex, input.uv_MainTex);
            fixed4 mainTex2 = tex2D(_MainTex2, fixed2(input.uv_MainTex2.x, input.uv_MainTex2.y -_Time.y));

            o.Emission = mainTex.rgb * mainTex2.rgb;
            o.Alpha = mainTex.a * mainTex2.a;
        }
        
        ENDCG
    }
    
    FallBack "Diffuse"
}