package com.dyatlova.dao.entity;

import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "teachers")
public class Teacher extends BaseEntity {

    @Column(name = "name")
    private String nameTeacher;

    @ManyToOne
    @JoinColumn(name = "subject_id")
    private Subject subject;
}
