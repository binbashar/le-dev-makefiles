# Change Log

All notable changes to this project will be documented in this file.

<a name="unreleased"></a>
## [Unreleased]



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


[Unreleased]: https://github.com/binbashar/le-dev-makefiles/compare/v0.0.44...HEAD
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
