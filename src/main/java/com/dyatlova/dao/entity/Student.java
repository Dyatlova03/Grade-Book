package com.dyatlova.dao.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "student")
@Data
public class Student {
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String studentName;

    @Column(name = "group")
    private int group;

    @Column(name = "record")
    private int record;
}
