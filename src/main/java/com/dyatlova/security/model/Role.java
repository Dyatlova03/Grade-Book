package com.dyatlova.security.model;

import com.dyatlova.dao.entity.BaseEntity;
import lombok.Data;


import javax.persistence.*;
import java.util.Set;

@Entity
@Table(name = "roles")
@Data
public class Role extends BaseEntity {

    @Column(name = "name")
    private String name;

    @ManyToMany(mappedBy = "roles")
    protected Set<User> users;
}
