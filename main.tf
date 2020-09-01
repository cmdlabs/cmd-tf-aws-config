/**
 * # terraform-aws-config
 *
 * This module sets up AWS Config within an AWS Account.
 *
 * ## Overview
 *
 * AWS Config catpures point in time snapshots of the environment to allow for point in time review of configuration. Additionally AWS Config can be utilised for automated action using AWS Config rules.
 *
 * NOTE: Currently only supports AWS owned / managed rules - http://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html
 *
 * ## Terraform AWS Config - Overview Diagram
 *
 * ![AWSConfig|medium](docs/AWSConfig.png)
 *
 * ## Terraform AWS Config
 *
 * ### Resources docs
 *
 * Terraform AWS Config automation includes use of the following core Terraform resources:
 *
 * - [`aws_config_aggregate_authorization`](https://www.terraform.io/docs/providers/aws/r/aws_config_aggregate_authorization.html) - Manages an AWS Config Aggregate Authorization.
 * - [`aws_config_configuration_aggregator`](https://www.terraform.io/docs/providers/aws/r/aws_config_configuration_aggregator.html) - Manages an AWS Config Configuration Aggregator.
 * - [`aws_config_config_rule`](https://www.terraform.io/docs/providers/aws/r/config_config_rule.html) - Provides an AWS Config Rule.
 * - [`aws_config_configuration_recorder_status`](https://www.terraform.io/docs/providers/aws/r/aws_config_configuration_recorder_status.html) - Manages status (recording / stopped) of an AWS Config Configuration Recorder.
 * - [`aws_config_configuration_recorder`](https://www.terraform.io/docs/providers/aws/r/config_configuration_recorder.html) - Provides an AWS Config Configuration Recorder.
 * - [`aws_config_delivery_channel`](https://www.terraform.io/docs/providers/aws/r/config_delivery_channel.html) - Provides an AWS Config Delivery Channel.
 */
