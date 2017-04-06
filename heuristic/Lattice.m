/**
 *  Lattices of subfield data
 *
 *  Copyright (C) 2016-2017
 *            Edgar Costa      (edgarcosta@math.dartmouth.edu)
 *            Davide Lombardo  (davide.lombardo@math.u-psud.fr)
 *            Jeroen Sijsling  (jeroen.sijsling@uni-ulm.de)
 *
 *  See LICENSE.txt for license details.
 */


function CompareGroups(G1, G2);
// Input:   Two subgroups or groups.
// Output:  A comparison function: groups with smaller cardinality are smaller.

if #G1 lt #G2 then
    return -1;
elif #G1 eq #G2 then
    return 0;
else
    return 1;
end if;

end function;


intrinsic EndomorphismLattice(GeoEndList::List) -> List
{Returns the lattice of endomorphisms by (conjugacy class of) subfield.}

AsAlg, Rs, As := Explode(GeoEndList);
L := BaseRing(AsAlg[1]);
Gp, Gf, Gphi := AutomorphismGroup(L);

Hs := Subgroups(Gp); Hs := [ H`subgroup : H in Hs ];
Sort(~Hs, CompareGroups); Reverse(~Hs);

LatReps := [* *]; LatStructs := [* *]; LatDescs := [* *];
for H in Hs do
    K := FixedField(L, H);
    EndoReps := EndomorphismBasis(GeoEndList, [ Gphi(genH) : genH in Generators(H) ]);
    EndoStructs, EndoDescs := EndomorphismStructure(EndoReps);
    Append(~LatReps, [* K *] cat EndoReps);
    Append(~LatStructs, [* K *] cat EndoStructs);
    Append(~LatDescs, [* Eltseq(MinimalPolynomial(K.1)) *] cat EndoDescs);
end for;

return [* LatReps, LatStructs, LatDescs *];

end intrinsic;
