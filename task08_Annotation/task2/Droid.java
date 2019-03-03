public class Droid {
    String name;

    @Description("0 - 100 HP")
    int energyLevel;
    @Description("0-1000")
    int power;

    @Description
    int speed;

    boolean canFly;

    public Droid() {
    }

    public Droid(String name, int energyLevel, int power, int speed, boolean canFly) {
        this.name = name;
        this.energyLevel = energyLevel;
        this.power = power;
        this.speed = speed;
        this.canFly = canFly;
    }
}