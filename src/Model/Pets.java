package Model;

import java.util.List;
import java.util.Objects;

public abstract class Pets extends Animals {
    protected String name;
    protected String dateBirth;
    protected List<String> commands;


    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getDateBirth(){
        return dateBirth;
    }
    public void setDateBirth(String date) {
        this.dateBirth = date;
    }


    public List<String> getCommandList() {
        return commands;
    }

    // добавить команду
    public void addCommand(String newCommand) {
        if (commands.stream().filter(x -> x.equals(newCommand)).findFirst().isEmpty()) {
            return;
        }
        commands.add(newCommand);
    }

    // удалить команду
    public void removeCommand(String command) {
        commands.remove(command);
    }

    @Override
    public String toString() {
        return String.format("%s: имя: %s, дата рождения: %s ", getClass().getSimpleName(), name, getDateBirth());
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Pets pet = (Pets) o;
        return Objects.equals(name, pet.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }

}
