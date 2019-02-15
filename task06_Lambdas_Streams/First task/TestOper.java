public class TestOper {
    public static void main(String[] args) {
        Operationable operationable;
        operationable = (a, b, c) -> {
            if ((a > b) && (a > c)) return a;
            else if (b > c) return b;
            else
                return c;
        };
        System.out.println("Max=" + operationable.operation(7, 3, 6));

        Operationable operationable2;
        operationable2 = (a, b, c) -> (a + b + c) / 3;
        System.out.println("Average=" + operationable2.operation(4, 10, 1));
    }
}
