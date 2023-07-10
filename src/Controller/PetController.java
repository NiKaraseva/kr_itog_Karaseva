package Controller;

import Model.Cat;
import Model.Dog;
import Model.Hamster;
import UserInter.Interface;

import java.util.*;

import static Controller.PetController.PETS.*;


public class PetController {
    private final PetLists petList = new PetLists();
    private final Map<String, String> menuFirst = new HashMap<>(){{
            put("1", "Завести новое животное");
            put("2", "Показать список животных конкретного типа");
            put("3", "Показать всех животных");
            put("4", "Добавить команду");
            put("5", "Показать команды");
            put("6", "Показать кол-во животных");
            put("0", "Выход");
            }};
    private final Map<String, String> menuSecond = new HashMap<>(){{
            put("1", "Кот");
            put("2", "Собака");
            put("3", "Хомяк");
            put("0", "Отмена");
            }};

    public enum PETS {CAT, DOG, HAMSTER}


    // добавить новое животное
    private void addAnimal(PETS pet) {
        String name = Interface.input("Введите имя животного: ");
        String date = Interface.input("Введите дату рождения: ");

        List<String> commands = new ArrayList<>();
        String command = Interface.input("Добавьте команду через запятую: ");
        commands.add(command);

        switch (pet) {
            case CAT -> petList.addPets(new Cat(name, date, commands));
            case DOG -> petList.addPets(new Dog(name, date, commands));
            case HAMSTER -> petList.addPets(new Hamster(name, date, commands));
        }
            try (Counter counter = new Counter()) {
                counter.add();
                System.out.println();
                System.out.println("Животное добавлено!");
                System.out.println();
            }
        }


    // список животных
    private void showAnimals(PETS pet){
        List<Object> pets = null;

        switch(pet){
            case CAT-> pets = Collections.singletonList(petList.getCats());
            case DOG -> pets = Collections.singletonList(petList.getDogs());
            case HAMSTER -> pets = Collections.singletonList(petList.getHamsters());
        }
        for(Object o:pets){
            System.out.println();
            System.out.println("Список животных конкретного типа:" + o.toString());
            System.out.println();
        }
    }


    // добавить команду
    private void addCommand(PETS pet) {
        String name = Interface.input("Введите имя животного: ");

        Object oPet = null;
        switch (pet) {
            case CAT -> oPet = petList.findCat(name);
            case DOG -> oPet = petList.findDog(name);
            case HAMSTER -> oPet = petList.findHamster(name);
        }

        if (oPet == null) {
            System.out.println();
            System.out.println("Такое животное не найдено");
            System.out.println();
        } else {
            String command = Interface.input("Введите новую команду: ");

            switch (pet) {
                case CAT -> ((Cat) oPet).addCommand(command);
                case DOG -> ((Dog) oPet).addCommand(command);
                case HAMSTER -> ((Hamster) oPet).addCommand(command);
            }
        }
    }


    // cписок команд животного
    private void showCommands(PETS pet){
        String name = Interface.input("Введите имя животного: ");

        Object o = null;

        switch(pet){
        case CAT -> o = petList.findCat(name);
        case DOG -> o = petList.findDog(name);
        case HAMSTER -> o = petList.findHamster(name);
        }

        if(o == null){
            System.out.println();
            System.out.println("Такое животное не найдено");
            System.out.println();
        return;
        }

        List<String> commands = null;

        switch(pet){
        case CAT -> commands = ((Cat)o).getCommandList();
        case DOG -> commands = ((Dog)o).getCommandList();
        case HAMSTER -> commands = ((Hamster)o).getCommandList();
        }

        StringBuilder allCommands = new StringBuilder();
        for(String c:commands){
        allCommands.append(c).append(", ");
        }
        System.out.println("Список команд животного: " + allCommands.toString());
        }


    // вывести всех животных
    private void showALLPets(){
        List<Object> pets = null;

        pets = Collections.singletonList(petList.getPets());
        for(Object o:pets){
            System.out.println();
            System.out.println("Список всех животных:" + o.toString());
            System.out.println();
        }
    }

    // количество животных
    private void showCountPets() throws Exception {
        try (Counter counter = new Counter()) {
            System.out.println();
            System.out.println("Количество животных: " + counter.getCount().toString());
            System.out.println();
        }
    }

    private String getOperation(){
            String menu = Interface.menuBuilder(menuFirst);
            if(!menu.isEmpty() && !menu.equals("0") && !menu.equals("3") && !menu.equals("6")){
            menu+= Interface.menuBuilder(menuSecond);
            }
            return menu;
            }

    public void start()throws Exception{
        String menu;
        do{
            menu=getOperation();

        switch(menu){
            case"11"->addAnimal(CAT);
            case"12"->addAnimal(DOG);
            case"13"->addAnimal(HAMSTER);
            case"21"->showAnimals(CAT);
            case"22"->showAnimals(DOG);
            case"23"->showAnimals(HAMSTER);
            case"3"->showALLPets();
            case"41"->addCommand(CAT);
            case"42"->addCommand(DOG);
            case"43"->addCommand(HAMSTER);
            case"51"->showCommands(CAT);
            case"52"->showCommands(DOG);
            case"53"->showCommands(HAMSTER);
            case"6"->showCountPets();
        }
        }while(!(menu.isEmpty()||menu.equals("0")));}

}

