import java.util.ArrayList;

public class TestDroid {

    public static void main(String[] args) {

        Droid rx = new Droid("rx", 1997);
        Droid fs = new Droid("fs", 2000);
        Droid ks = new Droid("ks", 1999);

        ArrayList <Droid> droidSquat = new ArrayList<Droid>();

        droidSquat.add(rx);
        droidSquat.add(fs);
        droidSquat.add(ks);

        Ship spaceCraft = new Ship(droidSquat);
        System.out.println(spaceCraft.getDroids());
    }


}
