Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B027D304C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 12:45:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDX0L3cmjz3cft
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Oct 2023 21:45:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=james.clark@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SDWzp37kSz2ytj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Oct 2023 21:45:07 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7367F1FB;
	Mon, 23 Oct 2023 03:45:15 -0700 (PDT)
Received: from [192.168.1.3] (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 227A73F64C;
	Mon, 23 Oct 2023 03:44:33 -0700 (PDT)
Message-ID: <3a9164b4-9ff2-82a1-6339-3a1fdd91dc47@arm.com>
Date: Mon, 23 Oct 2023 11:44:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V3] tools/perf: Add perf binary dependent rule for
 shellcheck log in Makefile.perf
Content-Language: en-US
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <20231013073641.99934-1-atrajeev@linux.vnet.ibm.com>
From: James Clark <james.clark@arm.com>
In-Reply-To: <20231013073641.99934-1-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, acme@kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 13/10/2023 08:36, Athira Rajeev wrote:
> Add rule in new Makefile "tests/Makefile.tests" for running
> shellcheck on shell test scripts. This automates below shellcheck
> into the build.
> 
> 	$ for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck -S warning $F; done
> 
> Condition for shellcheck is added in Makefile.perf to avoid build
> breakage in the absence of shellcheck binary. Update Makefile.perf
> to contain new rule for "SHELLCHECK_TEST" which is for making
> shellcheck test as a dependency on perf binary. Added
> "tests/Makefile.tests" to run shellcheck on shellscripts in
> tests/shell. The make rule "SHLLCHECK_RUN" ensures that, every
> time during make, shellcheck will be run only on modified files
> during subsequent invocations. By this, if any newly added shell
> scripts or fixes in existing scripts breaks coding/formatting
> style, it will get captured during the perf build.
> 
> Example build failure with present scripts in tests/shell:
> 
> 	INSTALL libsubcmd_headers
> 	INSTALL libperf_headers
> 	INSTALL libapi_headers
> 	INSTALL libsymbol_headers
> 	INSTALL libbpf_headers
> 	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/record_sideband.dep] Error 1
> 	make[3]: *** Waiting for unfinished jobs....
> 	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/test_arm_coresight.dep] Error 1
> 	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/lock_contention.dep] Error 1
> 	make[2]: *** [Makefile.perf:675: SHELLCHECK_TEST] Error 2
> 	make[1]: *** [Makefile.perf:238: sub-make] Error 2
> 	make: *** [Makefile:70: all] Error 2
> 
> After this, for testing, changed "tests/shell/record.sh" to
> break shellcheck format. In the next make run, it is
> also captured:
> 
> 	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/record_sideband.dep] Error 1
> 	make[3]: *** Waiting for unfinished jobs....
> 	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/record.dep] Error 1
> 	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/test_arm_coresight.dep] Error 1
> 	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/lock_contention.dep] Error 1
> 	make[2]: *** [Makefile.perf:675: SHELLCHECK_TEST] Error 2
> 	make[1]: *** [Makefile.perf:238: sub-make] Error 2
> 	make: *** [Makefile:70: all] Error 2
> 
> The exact failure log can be found in:
> output/tests/shell/record.dep.log file
> 

Hi Athira,

Having the reason for a hard failure put into a log file rather than the
console output is very non standard. I'm not sure what the reason for
this is.

The log filename isn't even listed in the output so how would anyone
know what went wrong?

Can we just have it so that the failure is printed in the make output
like any other build error.

[...]

> +output/%.dep: %.sh | $(DIRS)
> +	$(call rule_mkdir)
> +	$(eval input_file := $(subst output/,./,$(patsubst %.dep, %.sh, $@)))
> +	$(Q)$(call frecho-cmd,test)@shellcheck -S warning ${input_file} 1> $@.log && ([[ ! -s $@.log ]])

[[ ]] is a bash extension, but the build system seems to use /bin/sh so
you get this error depending on your distro:

  tools/perf/tests/Makefile.tests:17: output/tests/shell
      /record+probe_libc_inet_pton.dep] Error 127
  /bin/sh: 1: [[: not found

Changing it to [ ] fixes it

> +	$(Q)$(call frecho-cmd,test)@touch $@

Touching the source file in the build system doesn't feel right, surely
this could be open to all kinds of parallel build race conditions or
version controll issues.

Isn't the output of the rule the .log file, so just a normal make rule
based on those two files work? Then if the .log file is older than the
source file, the shellcheck is re-run, otherwise not? It feels like the
.dep file would then also be unecessary.

The .dep lines in the make output are a bit confusing because they're
not in the source tree so it's not clear to an outsider what that make
output is for.

Other than that, it does seem to work ok for me.

> +	$(Q)$(call frecho-cmd,test)@rm -rf $@.log
> +$(DIRS):
> +	@mkdir -p $@
> +
> +clean:
> +	@rm -rf output
