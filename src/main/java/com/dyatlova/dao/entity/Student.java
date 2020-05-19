package com.dyatlova.dao.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "student")
public class Student extends BaseEntity {

    @Column(name = "name")
    private String studentName;

    @ManyToOne
    @JoinColumn(name = "group_id")
    private Group group;

    @OneToOne
    @JoinColumn(name = "record_id")
    private Record record;
}
