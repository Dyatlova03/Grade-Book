package com.dyatlova.dao.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "group")
@Data
public class Group {
    @Id
    @Column(name = "id")
    private int id;

    @Column(name = "name")
    private String studentName;
}
