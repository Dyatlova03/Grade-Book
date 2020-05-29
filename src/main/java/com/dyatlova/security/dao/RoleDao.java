package com.dyatlova.security.dao;

import com.dyatlova.security.model.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleDao extends JpaRepository<Role, Long> {
}
