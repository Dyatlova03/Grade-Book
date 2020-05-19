package com.dyatlova.dao.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "teachers")
public class Teacher extends BaseEntity {

    @Column(name = "name")
    private String nameTeacher;

    @Column(name = "subject_id")
    private int subject;
}
