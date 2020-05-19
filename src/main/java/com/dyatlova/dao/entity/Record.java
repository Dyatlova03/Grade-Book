package com.dyatlova.dao.entity;

import lombok.Data;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "record")
@Data
public class Record extends BaseEntity {

    @Column
    private int grade;

    @OneToOne
    @JoinColumn(name = "student_id")
    private Student student;

    @ManyToMany
    @JoinTable(name = "subject_record",
            joinColumns = @JoinColumn(name = "record_id"),
            inverseJoinColumns = @JoinColumn(name = "subject_id"))
    private List<Subject> subjects;

    @Column(name = "teacher_id")
    private int teacher;
}
