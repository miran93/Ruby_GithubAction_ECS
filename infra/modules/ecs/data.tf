data "template_file" "enviorment_secrets" {
  template = <<EOF [
      {
        "name": "BUCKET_ACCESS_KEY_ID",
        "valueFrom": "${var.bucket_access_key_id}"
      },
      {
        "name": "BUCKET_ACCESS_SECRET_KEY",
        "valueFrom": "${var.bucket_access_secret_key}"
      }
  ]
  EOF
}

data "template_file" "container_definitions" {
    template = <<EOF
[
  {
    "name": "${var.name}_web",
    "image": "${var.image_url}:latest",
    "essential": true,
    "command": ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "80"],
    "portMappings": [
      {
        "protocol": "tcp",
        "containerPort": 80,
        "hostPort": 80
      }
    ],
    "secrets": ${data.template_file.enviorment_secrets.rendered},
    "logConfiguration": {
      "logDriver": "awslogs",
      "options": {
        "awslogs-region": "ap-northeast-1",
        "awslogs-group": "${var.cloudwatch_log_group_name}",
        "awslogs-stream-prefix": "${var.name}"
      }
    }
  }
]
EOF
}