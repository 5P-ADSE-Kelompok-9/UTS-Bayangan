package com.uts;

public record QuadraticEquationResult(
        double a,
        double b,
        double c,
        double discriminant,
        SolutionType solutionType,
        Double rootOne,
        Double rootTwo,
        Double realPart,
        Double imaginaryPart
) {

    public enum SolutionType {
        TWO_REAL_ROOTS,
        ONE_DOUBLE_ROOT,
        COMPLEX_ROOTS
    }
}