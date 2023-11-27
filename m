Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF2B07F9E3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 12:14:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf2yx3532z3d94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Nov 2023 22:14:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=james.clark@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sf2yR4f9Hz30hn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Nov 2023 22:13:32 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BA8262F4;
	Mon, 27 Nov 2023 03:13:44 -0800 (PST)
Received: from [192.168.1.3] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C76D53F73F;
	Mon, 27 Nov 2023 03:12:55 -0800 (PST)
Message-ID: <e8143e4d-d3ca-88c5-f1c8-b79f70ee5ffa@arm.com>
Date: Mon, 27 Nov 2023 11:12:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V4] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
 jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
 namhyung@kernel.org
References: <20231123160232.94253-1-atrajeev@linux.vnet.ibm.com>
From: James Clark <james.clark@arm.com>
In-Reply-To: <20231123160232.94253-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-perf-users@vger.kernel.org, kjain@linux.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 23/11/2023 16:02, Athira Rajeev wrote:
> Add rule in new Makefile "tests/Makefile.tests" for running
> shellcheck on shell test scripts. This automates below shellcheck
> into the build.
> 

Seems to work really well. I also tested it on Ubuntu, and checked
NO_SHELLCHECK, cleaning and with and without shellcheck installed etc.

Reviewed-by: James Clark <james.clark@arm.com>

> 	$ for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck -S warning $F; done
> 
> Condition for shellcheck is added in Makefile.perf to avoid build
> breakage in the absence of shellcheck binary. Update Makefile.perf
> to contain new rule for "SHELLCHECK_TEST" which is for making
> shellcheck test as a dependency on perf binary.
> 
> Added "tests/Makefile.tests" to run shellcheck on shellscripts in
> tests/shell. The make rule "SHLLCHECK_RUN" ensures that, every
> time during make, shellcheck will be run only on modified files
> during subsequent invocations. By this, if any newly added shell
> scripts or fixes in existing scripts breaks coding/formatting
> style, it will get captured during the perf build.
> 
> Example build failure by modifying probe_vfs_getname.sh in tests/shell:
> 
> 	In tests/shell/probe_vfs_getname.sh line 8:
> 	. $(dirname $0)/lib/probe.sh
> 	  ^-----------^ SC2046 (warning): Quote this to prevent word splitting.
> 
> 	For more information:
> 	  https://www.shellcheck.net/wiki/SC2046 -- Quote this to prevent word splitt...
> 	make[3]: *** [/root/athira/perf-tools-next/tools/perf/tests/Makefile.tests:18: tests/shell/.probe_vfs_getname.sh.shellcheck_log] Error 1
> 	make[2]: *** [Makefile.perf:686: SHELLCHECK_TEST] Error 2
> 	make[2]: *** Waiting for unfinished jobs....
> 	make[1]: *** [Makefile.perf:244: sub-make] Error 2
> 	make: *** [Makefile:70: all] Error 2
> 
> Here, like other files which gets created during
> compilation (ex: .builtin-bench.o.cmd or .perf.o.cmd ),
> create .shellcheck_log also as a hidden file.
> Example: tests/shell/.probe_vfs_getname.sh.shellcheck_log
> shellcheck is re-run if any of the script gets modified
> based on its dependency of this log file.
> 
> After this, for testing, changed "tests/shell/trace+probe_vfs_getname.sh" to
> break shellcheck format. In the next make run, it is
> also captured:
> 
> 	In tests/shell/probe_vfs_getname.sh line 8:
> 	. $(dirname $0)/lib/probe.sh
> 	  ^-----------^ SC2046 (warning): Quote this to prevent word splitting.
> 
> 	For more information:
> 	  https://www.shellcheck.net/wiki/SC2046 -- Quote this to prevent word splitt...
> 	make[3]: *** [/root/athira/perf-tools-next/tools/perf/tests/Makefile.tests:18: tests/shell/.probe_vfs_getname.sh.shellcheck_log] Error 1
> 	make[3]: *** Waiting for unfinished jobs....
> 
> 	In tests/shell/trace+probe_vfs_getname.sh line 14:
> 	. $(dirname $0)/lib/probe.sh
> 	  ^-----------^ SC2046 (warning): Quote this to prevent word splitting.
> 
> 	For more information:
> 	  https://www.shellcheck.net/wiki/SC2046 -- Quote this to prevent word splitt...
> 	make[3]: *** [/root/athira/perf-tools-next/tools/perf/tests/Makefile.tests:18: tests/shell/.trace+probe_vfs_getname.sh.shellcheck_log] Error 1
> 	make[2]: *** [Makefile.perf:686: SHELLCHECK_TEST] Error 2
> 	make[2]: *** Waiting for unfinished jobs....
> 	make[1]: *** [Makefile.perf:244: sub-make] Error 2
> 	make: *** [Makefile:70: all] Error 2
> 
> Failure log can be found in the stdout of make itself.
> 
> This is reported at build time. To be able to go ahead with
> the build or disable shellcheck even though it is known that
> some test is broken, add a "NO_SHELLCHECK" option. Example:
> 
>   make NO_SHELLCHECK=1
> 
> 	  INSTALL libsubcmd_headers
> 	  INSTALL libsymbol_headers
> 	  INSTALL libapi_headers
> 	  INSTALL libperf_headers
> 	  INSTALL libbpf_headers
> 	  LINK    perf
> 
> Note:
> This is tested on RHEL and also SLES. Use below check:
> "$(shell which shellcheck 2> /dev/null)" to look for presence
> of shellcheck binary. The approach "shell command -v" is not
> used here. In some of the distros(RHEL), command is available
> as executable file (/usr/bin/command). But in some distros(SLES),
> it is a shell builtin and not available as executable file.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> changelog:
> v3 -> v4:
> Addressed review comments from James Clark.
> - Made the shellcheck errors to be reported in make output
>   itself during make like any other build error.
> - Removed creating .dep files. Instead use the log file
> to determine whether shellcheck has to be re-run when
> there is a change in source file.
> - Change log file to have suffix as shellcheck_log so
> as to differentiate it from test execution log.
> - Also like other files which gets created during
> compilation, example, .builtin-bench.o.cmd or .perf.o.cmd,
> create .shellcheck_log as hidden file.
> Example: tests/shell/.buildid.sh.shellcheck_log
> - Initial version used "command -v shellcheck" to check
> presence of shellcheck. But while testing SLES, hit an
> issue with using "command". In RHEL, /usr/bin/command
> is available as part of bash rpm
> # rpm -qf /usr/bin/command 
> bash-5.1.8-6.el9_1.ppc64le
> 
> But in SLES ( tested in SLES 15 SP4 ), this is not
> available as an executable file, instead it is only
> a shell builtin. This resulted in below fail:
> make[2]: command: Command not found
> 
> So use "which shellcheck" to check for presence of
> shellcheck binary
> 
> v2 -> v3:
> Add option "NO_SHELLCHECK". This will allow to go ahead
> with the build or disable shellcheck even though it is
> known that some test is broken
> 
> v1 -> v2:
> Version1 had shellcheck in feature check which is not
> required since shellcheck is already a binary. Presence
> of binary can be checked using:
> $(shell command -v shellcheck)
> Addressed these changes as suggested by Namhyung in V2
> Feature test logic is removed in V2. Also added example
> for build breakage when shellcheck fails in commit message
> 
>  tools/perf/Makefile.perf        | 21 ++++++++++++++++++++-
>  tools/perf/tests/Makefile.tests | 22 ++++++++++++++++++++++
>  2 files changed, 42 insertions(+), 1 deletion(-)
>  create mode 100644 tools/perf/tests/Makefile.tests
> 
> diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
> index d80dcaa5a1e3..824cbc0af7d7 100644
> --- a/tools/perf/Makefile.perf
> +++ b/tools/perf/Makefile.perf
> @@ -134,6 +134,8 @@ include ../scripts/utilities.mak
>  #	x86 instruction decoder - new instructions test
>  #
>  # Define GEN_VMLINUX_H to generate vmlinux.h from the BTF.
> +#
> +# Define NO_SHELLCHECK if you do not want to run shellcheck during build
>  
>  # As per kernel Makefile, avoid funny character set dependencies
>  unexport LC_ALL
> @@ -671,7 +673,23 @@ $(PERF_IN): prepare FORCE
>  $(PMU_EVENTS_IN): FORCE prepare
>  	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=pmu-events obj=pmu-events
>  
> -$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN)
> +# Runs shellcheck on perf test shell scripts
> +
> +SHELLCHECK := $(shell which shellcheck 2> /dev/null)
> +
> +ifeq ($(NO_SHELLCHECK),1)
> +SHELLCHECK :=
> +endif
> +
> +ifneq ($(SHELLCHECK),)
> +SHELLCHECK_TEST: FORCE prepare
> +	$(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests
> +else
> +SHELLCHECK_TEST:
> +	@:
> +endif
> +
> +$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN) SHELLCHECK_TEST
>  	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) \
>  		$(PERF_IN) $(PMU_EVENTS_IN) $(LIBS) -o $@
>  
> @@ -1134,6 +1152,7 @@ bpf-skel-clean:
>  	$(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS)
>  
>  clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-coresight-targets-clean
> +	$(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
>  	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
>  	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete
>  	$(Q)$(RM) $(OUTPUT).config-detected
> diff --git a/tools/perf/tests/Makefile.tests b/tools/perf/tests/Makefile.tests
> new file mode 100644
> index 000000000000..fdaca5f7a946
> --- /dev/null
> +++ b/tools/perf/tests/Makefile.tests
> @@ -0,0 +1,22 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 2023
> +
> +PROGS := $(shell find tests/shell -perm -o=x -type f -name '*.sh')
> +FILE_NAME := $(notdir $(PROGS))
> +FILE_NAME := $(FILE_NAME:%=.%)
> +LOGS := $(join $(dir $(PROGS)),$(FILE_NAME))
> +LOGS := $(LOGS:%=%.shellcheck_log)
> +
> +.PHONY: all
> +all: SHELLCHECK_RUN
> +	@:
> +
> +SHELLCHECK_RUN: $(LOGS)
> +
> +.%.shellcheck_log: %
> +	$(call rule_mkdir)
> +	$(Q)$(call frecho-cmd,test)@shellcheck -S warning "$<" > $@ || (cat $@ && rm $@ && false)
> +
> +clean:
> +	$(eval log_files := $(shell find . -name '.*.shellcheck_log'))
> +	@rm -rf $(log_files)
