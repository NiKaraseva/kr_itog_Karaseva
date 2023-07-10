package UserInter;

import java.util.Map;
import java.util.Scanner;

public class Interface {

    public static String input(String message){
        Scanner scanner = new Scanner(System.in);

        System.out.print(message);
        return scanner.next();
    }

    public static String menuBuilder(Map<String, String> menu) {
        Scanner scanner = new Scanner(System.in);
        String ans;

        for (String s : menu.keySet()) {
            System.out.println(s + " -> " + menu.get(s));
        }
        System.out.print("Команда: ");

        ans = scanner.next();

        if(!menu.containsKey(ans)){
            ans = "";
        }

        return ans;
    }
}


