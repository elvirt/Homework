
public class AnnotationTest {
    void showValueOfDescription(Class c) {
        AnnotationTest testAnnotation = new AnnotationTest();
        testAnnotation.getAnnotatedDescriptionField(c)
                .stream()
                .map(f -> f.getAnnotationsByType(Description.class))
                .forEach((ab) -> {
                    System.out.println(ab[0].value());
                });
    }

    public static void main(String[] args) {
        AnnotationTest testAnnotation2 = new AnnotationTest();
        testAnnotation2.showValueOfDescription(Droid.class);

    }
}