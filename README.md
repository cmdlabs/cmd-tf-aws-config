<!-- vim: set ft=markdown: -->
# terraform-aws-config

This module sets up AWS Config within an AWS Account.

#### Table of contents

1. [Overview](#overview)
2. [Terraform AWS Config - Overview Diagram](#terraform-aws-config---overview-diagram)
3. [Terraform AWS Config](#terraform-aws-config)
    * [Resources docs](#resources-docs)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
    * [Examples](#examples)
        - [Aggregator Account](#aggregator-account)
        - [Source Account](#source-account)
4. [License](#license)

## Overview

AWS Config catpures point in time snapshots of the environment to allow for point in time review of configuration. Additionally AWS Config can be utilised for automated action using AWS Config rules.

NOTE: Currently only supports AWS owned / managed rules - http://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html

Terraform >= 0.12.6 is required for this module.

## Terraform AWS Config - Overview Diagram

![AWSConfig|medium](docs/AWSConfig.png)

## Terraform AWS Config

### Resources docs

Terraform AWS Config automation includes use of the following core Terraform resources:

- [`aws_config_aggregate_authorization`](https://www.terraform.io/docs/providers/aws/r/aws_config_aggregate_authorization.html) - Manages an AWS Config Aggregate Authorization.
- [`aws_config_configuration_aggregator`](https://www.terraform.io/docs/providers/aws/r/aws_config_configuration_aggregator.html) - Manages an AWS Config Configuration Aggregator.
- [`aws_config_config_rule`](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html) - Provides an AWS Config Rule.
- [`aws_config_configuration_recorder_status`](https://www.terraform.io/docs/providers/aws/r/aws_config_configuration_recorder_status.html) - Manages status (recording / stopped) of an AWS Config Configuration Recorder.
- [`aws_config_configuration_recorder`](https://www.terraform.io/docs/providers/aws/r/config_configuration_recorder.html) - Provides an AWS Config Configuration Recorder.
- [`aws_config_delivery_channel`](https://www.terraform.io/docs/providers/aws/r/config_delivery_channel.html) - Provides an AWS Config Delivery Channel.

### Inputs

The below outlines the current parameters and defaults.

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-------:|:--------:|
|delivery_frequency|The frequency with which AWS Config recurringly delivers configuration snapshots. May be one of One_Hour, Three_Hours, Six_Hours, Twelve_Hours, or TwentyFour_Hours|string|TwentyFour_Hours|No|
|enable_recorder|Whether the configuration recorder should be enabled or disabled|bool|true|No|
|expiration|The number of days to wait before expiring an object|number|2555|No|
|transition_to_glacier|The number of days to wait before transitioning an object to Glacier|number|30|No|
|is_aggregator|Whether the account is to be an aggregator or not|bool|false|No|
|aggregator_account_id|The AWS Account ID of the aggregator account|string|null|No|
|aggregator_account_region|The AWS Region of the aggregator account|string|null|No|
|source_account_ids|List of 12-digit account IDs of the accounts being aggregated|list(string)|[]|No|
|bucket_name|The bucket name - required by both aggregator and source accounts|string|""|Yes|
|force_destroy|A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error|bool|false|No
|config_rules|A list of config rules. By not specifying, a minimum set of recommended rules are applied|map(any)|(map)|No|

### Outputs

|Name|Description|
|------------|---------------------|
|bucket|The bucket name that config writes output to|
|bucket_arn|The bucket ARN that config writes output to|
|delivery_channel_id|The name of the delivery channel|
|recorder_id|Name of the recorder|
|topic_arn|The ARN of the SNS topic AWS Config writes events to|



## License

Apache 2.0.
