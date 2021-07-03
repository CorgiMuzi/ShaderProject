Shader "Custom/QuadShader"
{
    Properties
    {
        _MainTex("Main Texture", 2D) = "White" {}
        _UVCoordX ("X axis of UV", Range(-1, 1)) = 0
        _UVCoordY ("Y axis of UV", Range(-1, 1)) = 0
        _FlowSpeed ("Flowing Speed", Range(-1, 1)) = 1
    }

    SubShader
    {
        Tags
        {
            "RenderType" = "Opaque"
        }
        LOD 200

        CGPROGRAM
        #pragma surface surf Standard

        sampler2D _MainTex;

        struct Input
        {
            fixed2 uv_MainTex;
        };

        fixed _UVCoordX;
        fixed _UVCoordY;
        float _FlowSpeed;

        void surf(Input input, inout SurfaceOutputStandard o)
        {
            // fixed4 mainTex = tex2D(_MainTex, fixed2(input.uv_MainTex.x+_UVCoordX, input.uv_MainTex.y + _UVCoordY));
            fixed4 mainTex = tex2D(_MainTex, input.uv_MainTex + _Time.y * _FlowSpeed);
            fixed2 tempTex = input.uv_MainTex;

            o.Albedo = mainTex.rgb;
            // o.Albedo = fixed3(input.uv_MainTex + (_Time.y * _FlowSpeed), 0);
            // o.Albedo = fixed3(tempTex.x, tempTex.y,0);

            o.Alpha = mainTex.a;
        }
        ENDCG
    }

    FallBack "Diffuse"

}