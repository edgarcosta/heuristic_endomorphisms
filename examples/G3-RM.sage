"""
 *  Some examples of endomorphism rings of genus 2 hyperelliptic curves
 *
 *  Copyright (C) 2016  J.R. Sijsling (sijsling@gmail.com)
 *
 *  Distributed under the terms of the GNU General License (GPL)
 *                  http://www.gnu.org/licenses/
 *
 *  This program is free software; you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation; either version 2 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License along
 *  with this program; if not, write to the Free Software Foundation, Inc., 51
 *  Franklin St, Fifth Floor, Boston, MA  02110-1301  USA
"""

load('../Initialize.sage')

F = QQ
R.<x> = PolynomialRing(F)

f = x^7 - 14*x^6 + 210*x^5 - 658*x^4 + 245*x^3 + 588*x^2 + 637*x - 686
h = 0
X = mHyperellipticCurve(f, h)

print X
Endo = EndomorphismData(X, prec = 300, have_oldenburg = False)

print "Field of definition:"
print Endo.endomorphism_field()

print "Geometric representation:"
overK = Endo.geometric()
rep = overK.representation()
print overK.has_generator(B = 10)
print overK.few_generators()
