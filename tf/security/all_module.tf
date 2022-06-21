/* 
	This configuration includes following modules:
		ebs Encryption
		iam password policy
		account level s3 public block
*/

module "modules_all_global" {
  source     = "../modules/all_global/"
  security   = data.aws_caller_identity.current.account_id
  central    = data.aws_caller_identity.current.account_id
  grafana_id = var.grafana_id
}

module "modules_all_regional" {
  source        = "../modules/all_regional/"
  unique_prefix = var.unique_prefix
  base_region   = var.base_region
  security      = data.aws_caller_identity.current.account_id
  aggregate     = data.terraform_remote_state.org.outputs.all_accounts_ids
  recorder      = true
  providers = {
    aws.ap-northeast-1 = aws.ap-northeast-1
    aws.ap-northeast-2 = aws.ap-northeast-2
    aws.ap-south-1     = aws.ap-south-1
    aws.ap-southeast-1 = aws.ap-southeast-1
    aws.ap-southeast-2 = aws.ap-southeast-2
    aws.eu-west-1      = aws.eu-west-1
    aws.ca-central-1   = aws.ca-central-1
    aws.eu-central-1   = aws.eu-central-1
    aws.eu-north-1     = aws.eu-north-1
    aws.eu-west-2      = aws.eu-west-2
    aws.eu-west-3      = aws.eu-west-3
    aws.sa-east-1      = aws.sa-east-1
    aws.us-east-1      = aws.us-east-1
    aws.us-east-2      = aws.us-east-2
    aws.us-west-1      = aws.us-west-1
    aws.us-west-2      = aws.us-west-2
  }
}

