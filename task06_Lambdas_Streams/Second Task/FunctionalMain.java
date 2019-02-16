
import java.sql.SQLOutput;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class FunctionalMain {

    public static void main(String[] args) {
        List<Command> commandList = new ArrayList<>();
        System.out.println("Choose your action");
        Scanner scanner = new Scanner(System.in);
        System.out.println("1-Lambda 2-References method 3-Anonymous class 4-class");
        int k = scanner.nextInt();
        switch (k) {
            case 1:
                commandList.add(n -> System.out.println("Lambda " + n));
                commandList.get(0).execute("command");
                break;
            case 2:
                commandList.add(new Command() {
                    @Override
                    public void execute(String value) {
                        System.out.println("Anonymous " + value);
                    }
                });
                commandList.get(1).execute("command ");
                break;
            case 3:
                commandList.add(new Functional("Reference ")::execute);
                commandList.get(2).execute("command");
                break;
            case 4:
                commandList.add(new Functional("Class"));
                commandList.get(3).execute("command");
                break;
            default:
                System.out.println("non correct");
        }
    }
}
