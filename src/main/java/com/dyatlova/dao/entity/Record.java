package com.dyatlova.dao.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "record")
@Data
public class Record {
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "subject")
    private int subject;

    @Column(name = "grade")
    private int grade;
}
