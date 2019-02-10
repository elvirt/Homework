public class Droid {

    private String model;
    private int year;

    public Droid (String model, int year) {
        this.model = model;
        this.year = year;
    }

    public String getModel() {
        return model;
    }

    public int getYear() {
        return year;
    }

    @Override
    public String toString() {
        return "Droid{" +
                "model='" + model + '\'' +
                ", year=" + year +
                '}';
    }
}
