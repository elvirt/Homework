import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class MyStream {
    static List<Integer> randomList(int n) {
        Random random = new Random();
        return Stream.generate(() -> random.nextInt(30)).limit(n).collect(Collectors.toList());
    }


    public static void main(String[] args) {
        List<Integer> list = randomList(10);
        System.out.println(list);
        double average = list.stream().mapToDouble(Integer::intValue).average().getAsDouble();
        System.out.println("Average = " + average);
        System.out.println("Min = " + list.stream()
                .min(Integer::compareTo)
                .get());
        System.out.println("Max = " + list.stream()
                .max(Integer::compareTo)
                .get());
        System.out.println("Sum1 = " + list.stream()
                .mapToDouble(Integer::intValue)
                .sum());
        System.out.println("Sum2 = " + list.stream()
                .reduce((a, b) -> a + b)
                .get());
        System.out.println("Count numbers bigger than averange = " + list.stream()
                .filter((a) -> a > average)
                .count());


    }
}
