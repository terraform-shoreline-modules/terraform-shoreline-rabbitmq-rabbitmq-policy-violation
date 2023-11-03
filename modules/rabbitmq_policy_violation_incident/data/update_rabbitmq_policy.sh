

#!/bin/bash



# set the RabbitMQ policy name

policy_name=${POLICY_NAME}



# set the new policy definition

new_policy_definition=${NEW_POLICY_DEFINITION}



# update the RabbitMQ policy

rabbitmqctl -p ${VIRTUAL_HOST} set_policy $policy_name "" "$new_policy_definition"