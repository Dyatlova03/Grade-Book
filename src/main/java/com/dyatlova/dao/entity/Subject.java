package com.dyatlova.dao.entity;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Entity
@Table(name = "subject")
@Data
public class Subject extends BaseEntity{

    @OneToMany(mappedBy = "subject")
    private List<Teacher> teachers;


    @Column(name = "subject_name")
    private String subjectName;

}
