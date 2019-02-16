import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Scanner;
import java.util.stream.Collectors;
import java.util.stream.Stream;


public class Task4 {
    List<String>readListString(){
        Scanner scanner = new Scanner(System.in);
        List<String> list = new ArrayList<>();
        String line;
        while (!(line = scanner.nextLine()).isEmpty()) {
            list.add(line);
        }
        return list;
    }
    long uniqueWords(List<String> list) {
        return list.stream()
                .flatMap(e -> Stream.of(e.split(" ")))
                .distinct()
                .count();
    }

    List<String> sortUniqe(List<String> list) {
        return list.stream()
                .flatMap(e -> Stream.of(e.split(" ")))
                .distinct()
                .sorted()
                .collect(Collectors.toList());
    }

    Map<String, Long> countWord(List<String> list) {
        return list.stream()
                .flatMap(e -> Stream.of(e.split(" ")))
                .collect(Collectors.groupingBy(String::valueOf, Collectors.counting()));
    }

    Map<String, Long> countSymbols(List<String> list) {
        return list.stream()
                .flatMap(e -> Stream.of(e.split(" ")))
                .flatMap(e -> Stream.of(e.split("")))
                .filter(ch -> !Character.isUpperCase(ch.charAt(0)))
                .collect(Collectors.groupingBy(String::valueOf, Collectors.counting()));
    }

    public static void main(String[] args) {
        Task4 test = new Task4();
        List<String> list = test.readListString();
        System.out.println(list);

        System.out.println("uniqueWords\n"+test.uniqueWords(list));
        System.out.println("Sort Unique\n"+test.sortUniqe(list));
        System.out.println("Count Words\n"+test.countWord(list));
        System.out.println("Count Symbols\n"+test.countSymbols(list));

    }
}
