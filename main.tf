locals {
  buildspec_template = templatefile(var.buildspec_file, {
    STAGE_NAME = var.environment
    REGION     = var.region
  })
}

resource "aws_codebuild_project" "build" {
  name          = "${var.project_name}-codebuild-${var.pipeline_type}"
  build_timeout = "10"
  service_role  = var.cicd_role

  artifacts {
    type = "CODEPIPELINE"
  }

  environment {
    compute_type    = "BUILD_GENERAL1_MEDIUM"
    image           = "aws/codebuild/standard:5.0"
    type            = "LINUX_CONTAINER"
    privileged_mode = true

    dynamic "environment_variable" {
      for_each = concat(var.build_environment_variables)

      content {
        name  = environment_variable.value.name
        value = environment_variable.value.value
      }
    }


  }

  dynamic "vpc_config" {
    for_each = var.vpc_config

    content {
      vpc_id             = lookup(vpc_config.value, "vpc_id", null)
      subnets            = lookup(vpc_config.value, "private_subnets", null)
      security_group_ids = lookup(vpc_config.value, "security_group_id", null)
    }
  }

  source {
    type      = "CODEPIPELINE"
    buildspec = local.buildspec_template
  }
}

resource "aws_codepipeline" "pipeline" {
  name     = "${var.project_name}-pipeline-${var.pipeline_type}"
  role_arn = var.cicd_role

  artifact_store {
    location = var.s3_artifact_store
    type     = "S3"
  }

  stage {
    name = "source-${var.project_name}-${var.pipeline_type}"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "CodeStarSourceConnection"
      version          = "1"
      output_artifacts = ["source"]

      configuration = {
        ConnectionArn        = var.codestar_connection_arn
        FullRepositoryId     = "${var.github_repo_owner}/${var.github_repo_name}"
        BranchName           = var.github_repo_branch
        OutputArtifactFormat = "CODE_ZIP"
      }
    }
  }

  stage {
    name = "build-${var.project_name}-${var.pipeline_type}"

    action {
      name             = "Build"
      category         = "Build"
      owner            = "AWS"
      provider         = "CodeBuild"
      version          = "1"
      input_artifacts  = ["source"]
      output_artifacts = ["build"]

      configuration = {
        ProjectName = "${var.project_name}-codebuild-${var.pipeline_type}"
      }
    }
  }

}


