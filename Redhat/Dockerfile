FROM mcr.microsoft.com/mssql/rhel/server:2019-CU9-rhel-8

# Execute in context of root user and change working directory context
USER root
WORKDIR /var/opt/sqlconfiguration

# Create script location
RUN mkdir -p /var/opt/sqlconfiguration
RUN chown 10001:0 /var/opt/sqlconfiguration
RUN chmod +rwx /var/opt/sqlconfiguration

# Copy current folder content to working directory
COPY ./entrypoint.sh ./
COPY ./inst-init.sh ./
COPY ./inst-init.sql ./

# Apply Execute permissions 
RUN chmod +x entrypoint.sh
RUN chmod +x inst-init.sh

# SQL Server pre-configuration
# https://docs.microsoft.com/en-us/sql/linux/sql-server-linux-configure-environment-variables?view=sql-server-ver15
ENV MSSQL_PID=Developer
ENV ACCEPT_EULA=Y
ENV MSSQL_TCP_PORT=1433

# Configure specific settings with mssql-conf
# Enable agent
RUN /opt/mssql/bin/mssql-conf set sqlagent.enabled true

# Appy trace flag 3226 (Suppress Backup Messages) and 4199 (Optimizer Hotfixes)
RUN /opt/mssql/bin/mssql-conf traceflag 3226 on
RUN /opt/mssql/bin/mssql-conf traceflag 4199 on

# Disable Telemetry services
RUN /opt/mssql/bin/mssql-conf set telemetry.customerfeedback false

# Switch back to mssql user context
USER mssql

# Start SQL and apply default configuration
CMD ["/bin/bash", "./entrypoint.sh"]
