# Change Log

All notable changes to this project will be documented in this file.

<a name="unreleased"></a>
## [Unreleased]



<a name="v0.1.12"></a>
## [v0.1.12] - 2020-12-15

- BBL-263 | adding terraform 14 makefiles + minor terraform13 github makefile fix


<a name="v0.1.11"></a>
## [v0.1.11] - 2020-12-10

- Update Ansible Makefile to add a target to apply sec-users playbook ([#20](https://github.com/binbashar/le-dev-makefiles/issues/20))


<a name="v0.1.10"></a>
## [v0.1.10] - 2020-12-10

- BBL-192 | adding validation for ansible vault encrypted secrets


<a name="v0.1.9"></a>
## [v0.1.9] - 2020-12-02

- BBL-192 | adding tf import rm w/ mfa


<a name="v0.1.8"></a>
## [v0.1.8] - 2020-11-30

- BBL-192 | upgrading material-mkdocs ver


<a name="v0.1.7"></a>
## [v0.1.7] - 2020-11-19

- BBL-192 | replace ':' chars in terraform mfa makefiles to show the complete help output + cmd renaming + tf format recursive cmd updated


<a name="v0.1.6"></a>
## [v0.1.6] - 2020-11-16

- BBL-440 | pointing to latest makefile ver + slack notif + mkdocs ver updated


<a name="v0.1.5"></a>
## [v0.1.5] - 2020-11-15

- BBL-440 | fixing helm-charts.mk docker image helm tag ver


<a name="v0.1.4"></a>
## [v0.1.4] - 2020-11-15

- BBL-440 | fixing make help parsing


<a name="v0.1.3"></a>
## [v0.1.3] - 2020-11-15

- BBL-440 | add pending helm-charts.mk


<a name="v0.1.2"></a>
## [v0.1.2] - 2020-11-15

- BBL-440 | improving Makefile init-makefiles w/ latest fixed version


<a name="v0.1.1"></a>
## [v0.1.1] - 2020-11-13

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-192 | releasing patch for CI consistency


<a name="v0.1.0"></a>
## [v0.1.0] - 2020-11-13

- BBL-192 | releasing minor ver
- BBL-192 | docker SElinux support -> use –security-opt. This gives it the appropriate security profile, instead of giving away too much permissions within the container.


<a name="v0.0.68"></a>
## [v0.0.68] - 2020-11-11

- BBL-242 | adding missing space at ansible.mk
- BBL-242 | minor in-line comment correction chmod per chown
- BBL-242 | encrypt cmd post chown added
- BBL-242 | ansible.mk updated to use new docker image approach
- BBL-242 | correcting minor in-line comment typo


<a name="v0.0.67"></a>
## [v0.0.67] - 2020-11-10

- Add Makefile for Github with MFA support ([#11](https://github.com/binbashar/le-dev-makefiles/issues/11))


<a name="v0.0.66"></a>
## [v0.0.66] - 2020-11-09

- BBL-84 | upgrading mkdocs docker image ver


<a name="v0.0.65"></a>
## [v0.0.65] - 2020-11-09

- Create a subfolder version of the Makefile with MFA support ([#10](https://github.com/binbashar/le-dev-makefiles/issues/10))


<a name="v0.0.64"></a>
## [v0.0.64] - 2020-11-06

- Add path to common config to TF13 MFA makefile ([#9](https://github.com/binbashar/le-dev-makefiles/issues/9))


<a name="v0.0.63"></a>
## [v0.0.63] - 2020-10-24

- BBL-438 | terraform rm and import makefiles updated


<a name="v0.0.62"></a>
## [v0.0.62] - 2020-10-22

- BBL-192 | adding make decrypt validation conditional to tf plan-detailed cmd
- BBL-192 | adding auto make decrypt validation to make apply, plan and destroy


<a name="v0.0.61"></a>
## [v0.0.61] - 2020-10-21

- Update terraform13-import-rm-github.mk
- Update terraform13-github.mk


<a name="v0.0.60"></a>
## [v0.0.60] - 2020-10-21

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-192 | adding pip installation compatibility flag in ansible.mk


<a name="v0.0.59"></a>
## [v0.0.59] - 2020-10-21

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-192 | fixing ansible to 2.10.1


<a name="v0.0.58"></a>
## [v0.0.58] - 2020-10-21

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-192 | upgrading ansible version + fixing path at tf-github makefile


<a name="v0.0.57"></a>
## [v0.0.57] - 2020-10-20

- Merge branch 'feature/BB-192-makefiles-fix'
- BBL-192 | upgrading to latest ansible 2.9.x ver


<a name="v0.0.56"></a>
## [v0.0.56] - 2020-10-20

- BBL-192 | removing harcoded PROJECT_SHORT values
- BBL-192 | adding support for terraform-github dockerized approach makefile
- BBL-192 | removing duplicated code
- BBL-192 | udpating assingment operator


<a name="v0.0.55"></a>
## [v0.0.55] - 2020-10-20

- BBL-192 | adding optional include sintext
- BBL-192 | including base.mk to support custom configs for every makefile


<a name="v0.0.54"></a>
## [v0.0.54] - 2020-10-20

- BBL-192 | removing harcoded PROJET_SHORT VAR to gran precedence from include makefile
- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-192 | removing project short var to favour make include precedency


<a name="v0.0.53"></a>
## [v0.0.53] - 2020-10-20

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-192 | makdocs ver upgrade + tf makefiles improvements


<a name="v0.0.52"></a>
## [v0.0.52] - 2020-10-12

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-313 | improving params in docker makefile


<a name="v0.0.51"></a>
## [v0.0.51] - 2020-10-08

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | updating terraform13-root-context.mk to use tf 0.13.2 docker image


<a name="v0.0.50"></a>
## [v0.0.50] - 2020-10-08

- small terraform makefile sintaxt improvement


<a name="v0.0.49"></a>
## [v0.0.49] - 2020-10-08

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | updating make format to be recursive


<a name="v0.0.48"></a>
## [v0.0.48] - 2020-10-08

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- updating terraform12/13 w/ pre-commit cmd


<a name="v0.0.47"></a>
## [v0.0.47] - 2020-10-08

- updating terraform13 mk files


<a name="v0.0.46"></a>
## [v0.0.46] - 2020-10-08

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- updating comments in docker.mk


<a name="v0.0.45"></a>
## [v0.0.45] - 2020-10-08

- BBL-313 | updating inline comment as DOCKER
- BBL-313 | docker makefiles updated and new tag list ones added
- Change makefile shell associated variables to use lazy set by default instead of immediate set


<a name="v0.0.44"></a>
## [v0.0.44] - 2020-10-07

- Change some of the variables in Release Mgmt makefile to use lazy set instead of immediate set in order to avoid commands to be run at variable definition time ([#1](https://github.com/binbashar/le-dev-makefiles/issues/1))


<a name="v0.0.43"></a>
## [v0.0.43] - 2020-10-07

- BBL-313 | renaming arg var at docker-hub-build-push-single-arg.mk


<a name="v0.0.42"></a>
## [v0.0.42] - 2020-10-07

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-313 | adding docker-hub-build-single-arg-push.mk
- BBL-313 | adding docker-hub-build-single-arg-push.mk


<a name="v0.0.41"></a>
## [v0.0.41] - 2020-10-07

- BBL-313 | updating docker-hub-buil-push.mk


<a name="v0.0.40"></a>
## [v0.0.40] - 2020-10-06

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-313 | adding docker-hub-buil-push.mk


<a name="v0.0.39"></a>
## [v0.0.39] - 2020-10-06

- BBL-381 | upgrading release.mk to point to 0.0.2 docker image


<a name="v0.0.38"></a>
## [v0.0.38] - 2020-10-05

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | fixing ansible-roles.mk rsync cmd


<a name="v0.0.37"></a>
## [v0.0.37] - 2020-10-05

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | updating mkdocs-material image version


<a name="v0.0.36"></a>
## [v0.0.36] - 2020-10-02

- BBL-381 | adding inline comment to circleci config


<a name="v0.0.35"></a>
## [v0.0.35] - 2020-10-02

- BBL-381 | adding requires to circleci job


<a name="v0.0.34"></a>
## [v0.0.34] - 2020-10-01

- BBL-381 | makefiles include sintaxt improvement


<a name="v0.0.33"></a>
## [v0.0.33] - 2020-10-01

- BBL-381 | adding missing : at circleci config
- BBL-381 | adding context to sumologic workflow


<a name="v0.0.32"></a>
## [v0.0.32] - 2020-10-01

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | adding sumo-logic logs collector


<a name="v0.0.31"></a>
## [v0.0.31] - 2020-09-29

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | updating ansible.mk to use pip3


<a name="v0.0.30"></a>
## [v0.0.30] - 2020-09-29

- BBL-381 | updating ansible.mk to use pip3


<a name="v0.0.29"></a>
## [v0.0.29] - 2020-09-29

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | renaming node mk


<a name="v0.0.28"></a>
## [v0.0.28] - 2020-09-28

- BBL-381 | updating ansible-roles.mk to use molecule[docker]


<a name="v0.0.27"></a>
## [v0.0.27] - 2020-09-28

- BBL-381 | updating ansible-roles.mk to use latest versions


<a name="v0.0.26"></a>
## [v0.0.26] - 2020-09-25

- BBL-381 | --yes flag for pip uninstall


<a name="v0.0.25"></a>
## [v0.0.25] - 2020-09-25

- BBL-381 | fixing ansible-roles.mk --user uninstall no opt


<a name="v0.0.24"></a>
## [v0.0.24] - 2020-09-25

- BBL-381 | fixing ansible-roles.mk sintaxt
- BBL-381 | forcing ansible re-install


<a name="v0.0.23"></a>
## [v0.0.23] - 2020-09-25

- BBL-381 | upgrading to python3 ansible-roles.mk


<a name="v0.0.22"></a>
## [v0.0.22] - 2020-09-25

- BBL-381 | upgrading ansible and molecule versions at ansible-roles.mk


<a name="v0.0.21"></a>
## [v0.0.21] - 2020-09-25

- BBL-381 | updating circleci ansible init cmds


<a name="v0.0.20"></a>
## [v0.0.20] - 2020-09-25

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | downgrading ansible version


<a name="v0.0.19"></a>
## [v0.0.19] - 2020-09-25

- BBL-381 | adding yamlint pre-req to ansible-roles.mk


<a name="v0.0.18"></a>
## [v0.0.18] - 2020-09-24

- BBL-381 | upgrading ansible version + circleci machine exec ver


<a name="v0.0.17"></a>
## [v0.0.17] - 2020-09-24

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | fixing ansible-lint and mkdocs-material versions


<a name="v0.0.16"></a>
## [v0.0.16] - 2020-09-24

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | chagning ansible-roles.mk init cmds


<a name="v0.0.15"></a>
## [v0.0.15] - 2020-09-22

- BBL-381 | fixing comments in makefile
- BBL-381 | updating ansible-roles.mk to be compatible with python2.7
- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | adding ansible-roles.mk ansible-lint dep


<a name="v0.0.14"></a>
## [v0.0.14] - 2020-09-22

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | adding ansible-roles.mk


<a name="v0.0.13"></a>
## [v0.0.13] - 2020-09-22

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | adding docker and yarn makefiles


<a name="v0.0.12"></a>
## [v0.0.12] - 2020-09-22

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | adding mkdocs makefile


<a name="v0.0.11"></a>
## [v0.0.11] - 2020-09-20

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | adding git.mk 'checkout .' cmd


<a name="v0.0.10"></a>
## [v0.0.10] - 2020-09-18

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | minor helm kind search cmd fix


<a name="v0.0.9"></a>
## [v0.0.9] - 2020-09-18

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | adding helm makefiles


<a name="v0.0.8"></a>
## [v0.0.8] - 2020-09-18

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | adding terratest13 makefile


<a name="v0.0.7"></a>
## [v0.0.7] - 2020-09-17

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | updating terratest.mk in order to be tested in tf modules ci


<a name="v0.0.6"></a>
## [v0.0.6] - 2020-09-17

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | updating terraform-docs tag


<a name="v0.0.5"></a>
## [v0.0.5] - 2020-09-17

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | updating terraform-docs tag


<a name="v0.0.4"></a>
## [v0.0.4] - 2020-09-17

- BBL-381 | adding terrastest.mk


<a name="v0.0.3"></a>
## [v0.0.3] - 2020-09-15

- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-81 | ansible.mk sintaxt comment fixed
- BBL-81 | ansible.mk update


<a name="v0.0.2"></a>
## [v0.0.2] - 2020-09-11

- BBL-381 | updating .gitignore to allow [@bin](https://github.com/bin) ignore during buil_and_release ci stage
- Merge branch 'master' of github.com:binbashar/le-dev-makefiles
- BBL-381 | making an example of le-dev-makefiles approach by using it itself


<a name="v0.0.1"></a>
## v0.0.1 - 2020-09-11

- BBL-381 | small readme update
- CI init
- Initial Commit


[Unreleased]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.12...HEAD
[v0.1.12]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.11...v0.1.12
[v0.1.11]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.10...v0.1.11
[v0.1.10]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.9...v0.1.10
[v0.1.9]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.8...v0.1.9
[v0.1.8]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.7...v0.1.8
[v0.1.7]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.6...v0.1.7
[v0.1.6]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.5...v0.1.6
[v0.1.5]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.4...v0.1.5
[v0.1.4]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.3...v0.1.4
[v0.1.3]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.2...v0.1.3
[v0.1.2]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.1...v0.1.2
[v0.1.1]: https://github.com/binbashar/le-dev-makefiles/compare/v0.1.0...v0.1.1
[v0.1.0]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.68...v0.1.0
[v0.0.68]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.67...v0.0.68
[v0.0.67]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.66...v0.0.67
[v0.0.66]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.65...v0.0.66
[v0.0.65]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.64...v0.0.65
[v0.0.64]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.63...v0.0.64
[v0.0.63]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.62...v0.0.63
[v0.0.62]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.61...v0.0.62
[v0.0.61]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.60...v0.0.61
[v0.0.60]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.59...v0.0.60
[v0.0.59]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.58...v0.0.59
[v0.0.58]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.57...v0.0.58
[v0.0.57]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.56...v0.0.57
[v0.0.56]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.55...v0.0.56
[v0.0.55]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.54...v0.0.55
[v0.0.54]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.53...v0.0.54
[v0.0.53]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.52...v0.0.53
[v0.0.52]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.51...v0.0.52
[v0.0.51]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.50...v0.0.51
[v0.0.50]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.49...v0.0.50
[v0.0.49]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.48...v0.0.49
[v0.0.48]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.47...v0.0.48
[v0.0.47]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.46...v0.0.47
[v0.0.46]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.45...v0.0.46
[v0.0.45]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.44...v0.0.45
[v0.0.44]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.43...v0.0.44
[v0.0.43]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.42...v0.0.43
[v0.0.42]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.41...v0.0.42
[v0.0.41]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.40...v0.0.41
[v0.0.40]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.39...v0.0.40
[v0.0.39]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.38...v0.0.39
[v0.0.38]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.37...v0.0.38
[v0.0.37]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.36...v0.0.37
[v0.0.36]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.35...v0.0.36
[v0.0.35]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.34...v0.0.35
[v0.0.34]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.33...v0.0.34
[v0.0.33]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.32...v0.0.33
[v0.0.32]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.31...v0.0.32
[v0.0.31]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.30...v0.0.31
[v0.0.30]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.29...v0.0.30
[v0.0.29]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.28...v0.0.29
[v0.0.28]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.27...v0.0.28
[v0.0.27]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.26...v0.0.27
[v0.0.26]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.25...v0.0.26
[v0.0.25]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.24...v0.0.25
[v0.0.24]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.23...v0.0.24
[v0.0.23]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.22...v0.0.23
[v0.0.22]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.21...v0.0.22
[v0.0.21]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.20...v0.0.21
[v0.0.20]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.19...v0.0.20
[v0.0.19]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.18...v0.0.19
[v0.0.18]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.17...v0.0.18
[v0.0.17]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.16...v0.0.17
[v0.0.16]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.15...v0.0.16
[v0.0.15]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.14...v0.0.15
[v0.0.14]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.13...v0.0.14
[v0.0.13]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.12...v0.0.13
[v0.0.12]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.11...v0.0.12
[v0.0.11]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.10...v0.0.11
[v0.0.10]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.9...v0.0.10
[v0.0.9]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.8...v0.0.9
[v0.0.8]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.7...v0.0.8
[v0.0.7]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.6...v0.0.7
[v0.0.6]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.5...v0.0.6
[v0.0.5]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.4...v0.0.5
[v0.0.4]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.3...v0.0.4
[v0.0.3]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.2...v0.0.3
[v0.0.2]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.1...v0.0.2
