package Controller;

import Model.Cat;
import Model.Dog;
import Model.Hamster;
import Model.Pets;

import java.util.ArrayList;
import java.util.List;
import java.util.NoSuchElementException;

public class PetLists {
    private List<Pets> pets = new ArrayList<>();

    // добавить животное в список
    public void addPets(Pets pet) {
        pets.add(pet);
    }

    // удалить животное
    public boolean removePets(Pets pet){
        return pets.remove(pet);
    }

    // получить список всех животных
    public List<Pets> getPets(){
        return pets;
    }

    // получить только кошек
    public List<Pets> getCats(){
        return pets.stream().filter(x -> x instanceof Cat).toList();
    }

    // получить только собак
    public List<Pets> getDogs(){
        return pets.stream().filter(x -> x instanceof Dog).toList();
    }

    // получить только хомяков
    public List<Pets> getHamsters(){
        return pets.stream().filter(x -> x instanceof Hamster).toList();
    }

    // найти кошку
    public Cat findCat(String name){
        List<Pets> cats = this.getCats();
        Cat cat = null;

        try {
            cat = (Cat) cats.stream().filter(c -> c.getName().equals(name)).findFirst().get();
        }
        catch (NoSuchElementException ex){
            cat = null;
        }
        return cat;
    }

    // найти собаку
    public Dog findDog(String name){
        List<Pets> dogs = this.getDogs();
        Dog dog = null;

        try {
            dog = (Dog) dogs.stream().filter(c -> c.getName().equals(name)).findFirst().get();
        }
        catch (NoSuchElementException ex){
            dog = null;
        }
        return dog;
    }

    // найти хомяка
    public Hamster findHamster(String name){
        List<Pets> hamsters = this.getHamsters();
        Hamster hamster = null;

        try {
            hamster = (Hamster) hamsters.stream().filter(c -> c.getName().equals(name)).findFirst().get();
        }
        catch (NoSuchElementException ex){
            hamster = null;
        }
        return hamster;
    }

}
