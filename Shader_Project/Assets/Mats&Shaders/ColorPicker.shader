Shader "Custom/ColorPicker"
{
    Properties
    {
        _Red ("Red", Range(0,1)) = 1
        _Green ("Green", Range(0,1)) = 1
        _Blue("Blue", Range(0,1)) = 1
        _Brightness("Brightness", Range(-1,1)) = 0
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }

        CGPROGRAM
        #pragma surface surf Standard fullforwardshadows

        struct Input
        {
            fixed4 color : COLOR;
        };

        fixed _Red;
        fixed _Green;
        fixed _Blue;
        fixed _Brightness;
        

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            // Albedo comes from a texture tinted by color
            o.Albedo = fixed3(_Red, _Green, _Blue) + _Brightness;
            o.Alpha = 1;
        }
        ENDCG
    }
    FallBack "Diffuse"
}
