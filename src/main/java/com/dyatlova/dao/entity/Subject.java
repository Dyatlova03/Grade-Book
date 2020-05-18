package com.dyatlova.dao.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "subject")
@Data
public class Subject {
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "subject_name")
    private String subjectName;

}
