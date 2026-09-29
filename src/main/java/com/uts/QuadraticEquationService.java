package com.uts;

import org.springframework.stereotype.Service;

@Service
public class QuadraticEquationService {

    private static final double EPSILON = 0.000000001;

    public QuadraticEquationResult calculate(
            double a,
            double b,
            double c
    ) {
        if (Math.abs(a) < EPSILON) {
            throw new IllegalArgumentException(
                    "Nilai a tidak boleh 0 karena bukan persamaan kuadrat."
            );
        }

        double discriminant = (b * b) - (4 * a * c);

        if (discriminant > EPSILON) {
            double sqrtDiscriminant = Math.sqrt(discriminant);

            double rootOne = (-b + sqrtDiscriminant) / (2 * a);
            double rootTwo = (-b - sqrtDiscriminant) / (2 * a);

            return new QuadraticEquationResult(
                    a,
                    b,
                    c,
                    discriminant,
                    QuadraticEquationResult.SolutionType.TWO_REAL_ROOTS,
                    rootOne,
                    rootTwo,
                    null,
                    null
            );
        }

        if (Math.abs(discriminant) <= EPSILON) {
            double root = -b / (2 * a);

            return new QuadraticEquationResult(
                    a,
                    b,
                    c,
                    0,
                    QuadraticEquationResult.SolutionType.ONE_DOUBLE_ROOT,
                    root,
                    root,
                    null,
                    null
            );
        }

        double realPart = -b / (2 * a);
        double imaginaryPart =
                Math.sqrt(Math.abs(discriminant)) / Math.abs(2 * a);

        return new QuadraticEquationResult(
                a,
                b,
                c,
                discriminant,
                QuadraticEquationResult.SolutionType.COMPLEX_ROOTS,
                null,
                null,
                realPart,
                imaginaryPart
        );
    }
}