public class Functional implements Command {
    String s;

    public Functional(String s) {
        this.s = s;
    }

    @Override
    public void execute(String value) {
        System.out.println(s+" "+ value);
    }
}
