with Ada.Text_IO;
procedure BGMC.Main is

   type Coords_3D is (X, Y, Z);
   type Vector3 is array (Coords_3D) of Float;

   type Safe_Vector3 is new Vector3 
      with Dynamic_Predicate => (for all Val of Safe_Vector3 => Val'Valid);
   -- FIXME: Can't be NaN or Inf.

   type Position is new Safe_Vector3;
   type Velocity is new Safe_Vector3;


   Top_Directional_Speed : constant Float := 1000.0;

   subtype Sensible_Velocity is Velocity
      with Dynamic_Predicate => 
         (for all Val of Sensible_Velocity => Val <= Top_Directional_Speed)

begin
   Ada.Text_IO.Put_Line ("Hello from the Big Gay Mining Company.");
end BGMC.Main;
