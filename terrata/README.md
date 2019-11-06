# Terrata
Terrata is a Docker container for running awscli and Terraform commands. It integrates with Okta and let's you choose the role you want to use in any account you have access to. Run it from any directory you have Terraform plans in.

# Getting Started
To build the image, you must set the "oktabaseurl" argument which is your Okta base URL (e.g. company.okta.com). You can optionally set the "tfver" argument which is the version of Terraform you want to use. If you don't specify "tfver" a default version will be used.
```
docker build --build-arg oktabaseurl=your_okta_url \
    --build-arg tfver=0.12.13 \
    -t terrata \
    .
```

Run on Linux/MacOS from a directory containing Terraform plans:
```
docker run -v $(pwd):/terraform -it --rm terrata
```

Run on Windows from a directory containing Terraform plans:
```
docker run -v ${PWD}:/terraform -it --rm terrata
```

Once the container is running, simply execute the command `setup` to authenticate with Okta. By default this will create a credential profile under [default] which means you don't need to hardcode a profile or set any variables anywhere. If you'd prefer to not use [default] then simply run `okta-awscli --profile desired_profile_name` or just `okta-awscli` if you only want STS credentials. See more about using profiles with awscli [here](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html) and Terraform [here](https://www.terraform.io/docs/providers/aws/#shared-credentials-file).

If you need to refresh your credentials run `refresh`. If you'd like to switch AWS accounts or use a different role simply re-run `setup`.
