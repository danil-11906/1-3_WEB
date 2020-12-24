package java_db_drivers;

import java.util.List;

public interface UsersRepository <T> {
    List<T> findAllByAge(Integer age);
    List<T> findAll();}
