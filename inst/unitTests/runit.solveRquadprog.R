

# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Library General Public
# License as published by the Free Software Foundation; either
# version 2 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU Library General Public License for more details.
#
# You should have received a copy of the GNU Library General
# Public License along with this library; if not, write to the
# Free Foundation, Inc., 59 Temple Place, Suite 330, Boston,
# MA  02111-1307  USA

# Copyrights (C)
# for this R-port:
#   1999 - Diethelm Wuertz, GPL
#   2007 - Rmetrics Foundation, GPL
#   Diethelm Wuertz <wuertz@itp.phys.ethz.ch>
# for code accessed (or partly included) from other sources:
#   see Rmetric's copyright and license files


################################################################################
# FUNCTION:
#  test.solveRquadprog.LongOnly
################################################################################


test.solveRquadprog.LongOnly <-
    function()
{
    # Quadratic Programmming - Mean-Variance Portfolio:

    # Data:
    data <- SMALLCAP.RET
    print(head(data))

    # Specification:
    spec = portfolioSpec()
    setType(spec) = "MV"
    setOptimize(spec) = "minRisk"
    setTargetReturn(spec) = mean(colMeans(data))
    print(spec)

    # Default Constraints:
    constraints = "LongOnly"
    constraints

    # Quadprog:
    ans = solveRquadprog(data, spec, constraints)
    print(ans)

    # Return Value:
    return()
}


# ------------------------------------------------------------------------------


test.solveRquadprog.twoAssets <-
    function()
{
    # Solved Analytically
    #   Speeds up the two-assets forntier significantly!

    # Data:
    data = SMALLCAP.RET
    data = data[, c("BKE", "GG")]
    print(head(data))

    # Specification:
    spec = portfolioSpec()
    setType(spec) = "MV"
    setOptimize(spec) = "minRisk"
    setTargetReturn(spec) = mean(colMeans(data))
    print(spec)

    # Default Constraints:
    constraints = "LongOnly"
    print(constraints)

    # Quadprog:
    ans = solveRquadprog(data, spec, constraints)
    print(ans)

    # Return Value:
    return()
}


################################################################################

