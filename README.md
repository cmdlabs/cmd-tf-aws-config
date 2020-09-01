# terraform-aws-config

This module sets up AWS Config within an AWS Account.

## Overview

AWS Config catpures point in time snapshots of the environment to allow for point in time review of configuration. Additionally AWS Config can be utilised for automated action using AWS Config rules.

NOTE: Currently only supports AWS owned / managed rules - http://docs.aws.amazon.com/config/latest/developerguide/managed-rules-by-aws-config.html

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

## Requirements

The following requirements are needed by this module:

- terraform ( >= 0.12.26)

- aws (>= 2.59.0)

## Required Inputs

The following input variables are required:

### bucket\_name

Description: The bucket name - required by both aggregator and source accounts

Type: `string`

## Optional Inputs

The following input variables are optional (have default values):

### aggregator\_account\_id

Description: The AWS Account ID of the aggregator account

Type: `string`

Default: `null`

### aggregator\_account\_region

Description: The AWS Region of the aggregator account

Type: `string`

Default: `null`

### config\_role\_name

Description: Name of the role for config

Type: `string`

Default: `"CmdlabtfConfigRole"`

### config\_rules

Description: A list of config rules. By not specifying, a minimum set of recommended rules are applied

Type: `map(any)`

Default:

```json
{
  "acm_certificate_expiration_check": {
    "name": "acm-certificate-expiration-check",
    "scope": {
      "compliance_resource_types": [
        "AWS::ACM::Certificate"
      ]
    },
    "source": {
      "owner": "AWS",
      "source_identifier": "ACM_CERTIFICATE_EXPIRATION_CHECK"
    }
  },
  "ec2_instances_in_vpc": {
    "name": "ec2-instances-in-vpc",
    "scope": {
      "compliance_resource_types": [
        "AWS::EC2::Instance"
      ]
    },
    "source": {
      "owner": "AWS",
      "source_identifier": "INSTANCES_IN_VPC"
    }
  },
  "eip_attached": {
    "name": "eip-attached",
    "scope": {
      "compliance_resource_types": [
        "AWS::EC2::EIP"
      ]
    },
    "source": {
      "owner": "AWS",
      "source_identifier": "EIP_ATTACHED"
    }
  },
  "encrypted_volumes": {
    "name": "encrypted-volumes",
    "scope": {
      "compliance_resource_types": [
        "AWS::EC2::SecurityGroup"
      ]
    },
    "source": {
      "owner": "AWS",
      "source_identifier": "ENCRYPTED_VOLUMES"
    }
  },
  "root_account_mfa_enabled": {
    "name": "root-account-mfa-enabled",
    "scope": {
      "compliance_resource_types": [
        "AWS::S3::Bucket"
      ]
    },
    "source": {
      "owner": "AWS",
      "source_identifier": "ROOT_ACCOUNT_MFA_ENABLED"
    }
  },
  "s3_bucket_logging_enabled": {
    "name": "s3-bucket-logging-enabled",
    "scope": {
      "compliance_resource_types": [
        "AWS::S3::Bucket"
      ]
    },
    "source": {
      "owner": "AWS",
      "source_identifier": "S3_BUCKET_LOGGING_ENABLED"
    }
  },
  "s3_bucket_ssl_requests_only": {
    "name": "s3-bucket-ssl-requests-only",
    "scope": {
      "compliance_resource_types": [
        "AWS::S3::Bucket"
      ]
    },
    "source": {
      "owner": "AWS",
      "source_identifier": "S3_BUCKET_SSL_REQUESTS_ONLY"
    }
  }
}
```

### delivery\_frequency

Description: The frequency with which AWS Config recurringly delivers configuration snapshots. May be one of One\_Hour, Three\_Hours, Six\_Hours, Twelve\_Hours, or TwentyFour\_Hours

Type: `string`

Default: `"TwentyFour_Hours"`

### enable\_recorder

Description: Whether the configuration recorder should be enabled or disabled

Type: `bool`

Default: `true`

### expiration

Description: The number of days to wait before expiring an object

Type: `number`

Default: `2555`

### force\_destroy

Description: A boolean that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error

Type: `bool`

Default: `false`

### is\_aggregator

Description: Whether the account is to be an aggregator or not

Type: `bool`

Default: `false`

### source\_account\_ids

Description: List of 12-digit account IDs of the accounts being aggregated

Type: `list(string)`

Default: `[]`

### transition\_to\_glacier

Description: The number of days to wait before transitioning an object to Glacier

Type: `number`

Default: `30`

## Outputs

The following outputs are exported:

### bucket

Description: The bucket name that config writes output to

### bucket\_arn

Description: The bucket ARN that config writes output to

### delivery\_channel\_id

Description: The name of the delivery channel

### recorder\_id

Description: Name of the recorder

### topic\_arn

Description: The ARN of the SNS topic AWS Config writes events to

