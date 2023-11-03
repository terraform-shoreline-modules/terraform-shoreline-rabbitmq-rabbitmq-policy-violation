
### About Shoreline
The Shoreline platform provides real-time monitoring, alerting, and incident automation for cloud operations. Use Shoreline to detect, debug, and automate repairs across your entire fleet in seconds with just a few lines of code.

Shoreline Agents are efficient and non-intrusive processes running in the background of all your monitored hosts. Agents act as the secure link between Shoreline and your environment's Resources, providing real-time monitoring and metric collection across your fleet. Agents can execute actions on your behalf -- everything from simple Linux commands to full remediation playbooks -- running simultaneously across all the targeted Resources.

Since Agents are distributed throughout your fleet and monitor your Resources in real time, when an issue occurs Shoreline automatically alerts your team before your operators notice something is wrong. Plus, when you're ready for it, Shoreline can automatically resolve these issues using Alarms, Actions, Bots, and other Shoreline tools that you configure. These objects work in tandem to monitor your fleet and dispatch the appropriate response if something goes wrong -- you can even receive notifications via the fully-customizable Slack integration.

Shoreline Notebooks let you convert your static runbooks into interactive, annotated, sharable web-based documents. Through a combination of Markdown-based notes and Shoreline's expressive Op language, you have one-click access to real-time, per-second debug data and powerful, fleetwide repair commands.

### What are Shoreline Op Packs?
Shoreline Op Packs are open-source collections of Terraform configurations and supporting scripts that use the Shoreline Terraform Provider and the Shoreline Platform to create turnkey incident automations for common operational issues. Each Op Pack comes with smart defaults and works out of the box with minimal setup, while also providing you and your team with the flexibility to customize, automate, codify, and commit your own Op Pack configurations.

# RabbitMQ Policy Violation Incident
---

RabbitMQ Policy Violation Incident refers to an event where the RabbitMQ messaging system has detected a policy violation. This might occur when the system identifies that a user or an application has performed an action that violates the predefined policies. The policies may include access control rules, message queue limits, and message expiration times. Such incidents require immediate attention to prevent any further policy breaches and ensure the proper functioning of the messaging system.

### Parameters
```shell
export VHOST_NAME="PLACEHOLDER"

export VIRTUAL_HOST="PLACEHOLDER"

export NEW_POLICY_DEFINITION="PLACEHOLDER"

export POLICY_NAME="PLACEHOLDER"
```

## Debug

### Display the RabbitMQ server status and version
```shell
rabbitmqctl status
```

### Display a list of all active channels on the RabbitMQ server
```shell
rabbitmqctl list_channels
```

### Display a list of all active connections to the RabbitMQ server
```shell
rabbitmqctl list_connections
```

### Display a list of all existing queues on the RabbitMQ server
```shell
rabbitmqctl list_queues
```

### Display the RabbitMQ server logs to check for any policy violation errors
```shell
journalctl -u rabbitmq-server
```

### Display the RabbitMQ server configuration file to check for any policy violations
```shell
cat /etc/rabbitmq/rabbitmq.conf
```

### Check if any specific policy is causing the violation
```shell
rabbitmqctl list_policies -p ${VHOST_NAME}
```

### Check for any blocked connections due to policy violations
```shell
rabbitmqctl list_blocked_connections
```

## Repair

### Review the existing policies and update them if necessary to prevent future policy violations. This may involve revising the access control rules, message queue limits, and message expiration times.
```shell


#!/bin/bash



# set the RabbitMQ policy name

policy_name=${POLICY_NAME}



# set the new policy definition

new_policy_definition=${NEW_POLICY_DEFINITION}



# update the RabbitMQ policy

rabbitmqctl -p ${VIRTUAL_HOST} set_policy $policy_name "" "$new_policy_definition"


```