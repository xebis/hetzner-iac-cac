# Changelog

## [0.10.1](https://github.com/xebis/hetzner-iac-cac/compare/v0.10.0...v0.10.1) (2025-05-11)

### Bug Fixes

* branch delete shouldn't run provisioning ([ea5ac72](https://github.com/xebis/hetzner-iac-cac/commit/ea5ac7207386d3a865e121206b6ce0ab9f88a063))

## [0.10.0](https://github.com/xebis/hetzner-iac-cac/compare/v0.9.2...v0.10.0) (2025-05-11)

### Features

* add environment is created and deleted with environment branch ([53fa654](https://github.com/xebis/hetzner-iac-cac/commit/53fa654a7bbfdc31e5f0f7cb5f31a24eba7c39e9))

## [0.9.2](https://github.com/xebis/hetzner-iac-cac/compare/v0.9.1...v0.9.2) (2025-05-10)

### Bug Fixes

* production should have zero servers created ([6504379](https://github.com/xebis/hetzner-iac-cac/commit/650437904ea898bb182bf2ddf8c5747da40a2d3a))
* production uses wrong context for steps output ([77be405](https://github.com/xebis/hetzner-iac-cac/commit/77be405c90f11396552db97d9c0930116fe8f375))

## [0.9.1](https://github.com/xebis/hetzner-iac-cac/compare/v0.9.0...v0.9.1) (2025-05-10)

### Bug Fixes

* prod env name and slug shouldn't be derived from a branch ([29e2c7c](https://github.com/xebis/hetzner-iac-cac/commit/29e2c7c12cd16c02c561ac1445ac9703be4b7951))

## [0.9.0](https://github.com/xebis/hetzner-iac-cac/compare/v0.8.0...v0.9.0) (2025-05-08)

### Features

* add dynamic development environment for non-main branches ([eebd306](https://github.com/xebis/hetzner-iac-cac/commit/eebd3068bd2c5de45e02910f67ee8357bf1075ef))

### Bug Fixes

* dynamic environment has incorrect branch reference ([2777fe4](https://github.com/xebis/hetzner-iac-cac/commit/2777fe4f59c2ffd174b08dc6f38c424b22c3cccf))

## [0.8.0](https://github.com/xebis/hetzner-iac-cac/compare/v0.7.1...v0.8.0) (2025-05-03)

### Features

* **workflow:** optimize terraform steps at wait and config ([aef98fa](https://github.com/xebis/hetzner-iac-cac/commit/aef98fa5e80a7d6e4d75b561ab63032ca769ecb9))

## [0.7.1](https://github.com/xebis/hetzner-iac-cac/compare/v0.7.0...v0.7.1) (2025-04-23)

### Bug Fixes

* terraform ipv4 address output should be empty instead of null ([340cea0](https://github.com/xebis/hetzner-iac-cac/commit/340cea0c880e94aada7326bf7c6ad128f4346521))

## [0.7.0](https://github.com/xebis/hetzner-iac-cac/compare/v0.6.0...v0.7.0) (2025-04-22)

### Features

* add ansible inventory and test playbook ([d57a505](https://github.com/xebis/hetzner-iac-cac/commit/d57a505b62adafcb8505da08ab0ffdde07992375))
* add infrastructure workflow config job running ansible playbook ([2472914](https://github.com/xebis/hetzner-iac-cac/commit/2472914954ee3935b658c5d4fb085d0b8dfc814f))

## [0.6.0](https://github.com/xebis/hetzner-iac-cac/compare/v0.5.0...v0.6.0) (2025-04-21)

### Features

* add infrastructure workflow test ssh connection job ([1c5bac4](https://github.com/xebis/hetzner-iac-cac/commit/1c5bac4c30e5cd26f77ad1feda47e95e61dce08e))
* add server cloud-config and local ssh connection test ([dd6839c](https://github.com/xebis/hetzner-iac-cac/commit/dd6839c368630bd7bedf363e9112dde6b9079319))
* replace ssh algorithm rsa with ed25519 ([89c60b3](https://github.com/xebis/hetzner-iac-cac/commit/89c60b3f41db9f00664350bbc913bbf36b090a17))
* replace ssh public key injection by terraform input ([1e23ceb](https://github.com/xebis/hetzner-iac-cac/commit/1e23cebe770e0971ae661a8a9a1fce03821ac85d))

### Bug Fixes

* infrastructure workflow should run on pull request synchronize ([4490a7a](https://github.com/xebis/hetzner-iac-cac/commit/4490a7adb0728f48bff4f3f1a64e66510b980735))
* ssh connection test shouldn't be run on zero servers ([657f7af](https://github.com/xebis/hetzner-iac-cac/commit/657f7af7fe7e6c2d369bd22481806d91e25897af))
* ssh key pair must not contain extra characters ([8dd97a9](https://github.com/xebis/hetzner-iac-cac/commit/8dd97a9e463820380c6bd69b8a56c6e614917d8d))
* test should wait until ssh server is ready ([438200b](https://github.com/xebis/hetzner-iac-cac/commit/438200b40c54466bb5b035a0b36ecc2eccfda672))

## [0.5.0](https://github.com/xebis/hetzner-iac-cac/compare/v0.4.2...v0.5.0) (2025-04-19)

### Features

* split infrastructure terraform job to provision and destroy ([776a7f2](https://github.com/xebis/hetzner-iac-cac/commit/776a7f2c733f06ef8a65e3047f03a166ddbc5b30))

## [0.4.2](https://github.com/xebis/hetzner-iac-cac/compare/v0.4.1...v0.4.2) (2025-04-18)

### Bug Fixes

* do not comment pr with testing tf plan when pr is closed ([e45c5b7](https://github.com/xebis/hetzner-iac-cac/commit/e45c5b7fed75acaa0c28544c5881c0c80d811305))

## [0.4.1](https://github.com/xebis/hetzner-iac-cac/compare/v0.4.0...v0.4.1) (2025-04-18)

### Bug Fixes

* do not run terraform apply when environment is destroyed ([f640afc](https://github.com/xebis/hetzner-iac-cac/commit/f640afc0c62ac2a01a09c9d14eba39f722fb0855))

## [0.4.0](https://github.com/xebis/hetzner-iac-cac/compare/v0.3.0...v0.4.0) (2025-04-18)

### Features

* environments creation and ephemeral environments delete ([2d8c2c5](https://github.com/xebis/hetzner-iac-cac/commit/2d8c2c529af363b2ba4a6cd91142d59540f6c0c3))

## [0.3.0](https://github.com/xebis/hetzner-iac-cac/compare/v0.2.2...v0.3.0) (2025-04-16)

### Features

* zero servers at the production environment ([2baec98](https://github.com/xebis/hetzner-iac-cac/commit/2baec98c606e30b81e7df2541fcbcd3fc9bc2356))

## [0.2.2](https://github.com/xebis/hetzner-iac-cac/compare/v0.2.1...v0.2.2) (2025-04-15)

### Bug Fixes

* prefix resource names with workspace name ([f377f48](https://github.com/xebis/hetzner-iac-cac/commit/f377f4864f53e9ef6ddff9ce341a0e42dc138493))

## [0.2.1](https://github.com/xebis/hetzner-iac-cac/compare/v0.2.0...v0.2.1) (2025-04-15)

### Bug Fixes

* run tf destroy testing environment when pr is closed ([984eccb](https://github.com/xebis/hetzner-iac-cac/commit/984eccb5ee7b5c798f413d8c16352de9b4f22ff1))

## [0.2.0](https://github.com/xebis/hetzner-iac-cac/compare/v0.1.0...v0.2.0) (2025-04-14)

### Features

* add github workflow, terraform, production and testing env ([ed61dcc](https://github.com/xebis/hetzner-iac-cac/commit/ed61dcccafdca7f1f9e06d623c15df9b1421387a))

## [0.1.0](https://github.com/xebis/hetzner-iac-cac/compare/v0.0.0...v0.1.0) (2025-04-14)

### Features

* add hetzner cloud configuration and demo server ([ee4d8ca](https://github.com/xebis/hetzner-iac-cac/commit/ee4d8caa37451c79880e6a1915c1dd2e099ca0fa))
