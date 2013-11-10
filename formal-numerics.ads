with Ada.Numerics;

package Formal.Numerics is
   pragma Pure;

   pragma Annotate (GNATprove, External_Axiomatization);

   -- FIXME: external axiomatization of Pi and e constants is not supported.

--     Pi : constant := Ada.Numerics.Pi;
--     e : constant := Ada.Numerics.e;

   function Pi return Float is (Ada.Numerics.Pi);
   pragma inline(Pi);

   function e return Float is (Ada.Numerics.e);
   pragma inline(e);

   -- FIXME: rewrite with static invariants (not yet supported by GNATprove).

   -- Formal representation of (0.0 ; +Inf) interval.
   subtype Positive_Float is Float range 0.0 .. Float'Last;

   -- Formal representation of <0.0 ; +Inf) interval.
   subtype NonNegative_Float is Float range 0.0 .. Float'Last;

   -- Formal representation of (-Inf ; 0.0) interval.
   subtype Negative_Float is Float range Float'First .. 0.0;

   -- Formal representation of (-Inf ; +Inf) interval.
   subtype Unbounded_Float is Standard.Float;

   -- Formal representation of (-Inf ; 0) U (0 ; +Inf) interval.
   subtype NonZero_Float is Standard.Float;
end;
