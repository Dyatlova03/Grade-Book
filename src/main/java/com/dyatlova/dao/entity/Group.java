package com.dyatlova.dao.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "group")
@Data
public class Group extends BaseEntity {


    @OneToMany(mappedBy = "group")
    private List<Student> students;
}
