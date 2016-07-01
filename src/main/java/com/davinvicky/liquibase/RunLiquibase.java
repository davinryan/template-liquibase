package com.davinvicky.liquibase;

import com.davinvicky.common.liquibase.LiquibaseRunner;
import com.davinvicky.common.liquibase.AbstractRunLiquibase;
import liquibase.exception.LiquibaseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.sql.SQLException;

/**
 * Created by RyanDa on 02/03/2016.
 * Main class for running liquibase
 */
public class RunLiquibase extends AbstractRunLiquibase {

    private static final Logger LOGGER = LoggerFactory.getLogger(RunLiquibase.class);

    public static void main(String[] args) throws LiquibaseException {
        new RunLiquibase(args).runLiquibase();
    }

    private RunLiquibase(String[] args) {
        super(args);
    }

    public void runLiquibase() throws LiquibaseException {
        try {
            LiquibaseRunner runnerOWNER = new LiquibaseRunner(getProperties());
            runnerOWNER.run();
        } catch (SQLException e) {
            LOGGER.error("error connecting to database" + e);
        }
    }
}
