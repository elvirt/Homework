import java.util.*;

public class Ship {
    List<? extends Droid> droids;

    public Ship(List<? extends Droid> droids){
        this.droids = droids;
    }

    public List<? extends Droid> getDroids() {
        return droids;
    }

    public void setDroids(List<? extends Droid> droids) {
        this.droids = droids;
    }
}
