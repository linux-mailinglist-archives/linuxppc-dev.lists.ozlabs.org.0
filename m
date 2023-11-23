Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF89F7F6382
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 17:03:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lPwBy9Q/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sbjb15YLMz3dXD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 03:03:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lPwBy9Q/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SbjZ568gCz307y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 03:02:53 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ANFDGY9031479;
	Thu, 23 Nov 2023 16:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=/8E3R4qB+2Ocl8gKsDwWtGE7wtpS6K8bEXv21sMEQ08=;
 b=lPwBy9Q/oYZexdyJMbBp6ozcKW3gSWbKj1NDzsm8dA0frhEmFUsMk2HsRSW3ySEV6vzz
 iL4T3N8rkP02xvcaZDrUFCuo40gXKMqujIRazEAIZ8lWdnRBirbipTfTw0uhFvh2dD+m
 WvF9wZ0nY413Ce/E9QvJzDQ7pntWU713oRvWUXxXbjp+G/JEw42RMHc9DgP5oUV6Noae
 1R9HYfo1TaoMCSIJZDbPL2DS2ClHb8na1eb4CVJhV7ruurQEQSryuvK+viLlQ8K02+KI
 ptTT2CdXdILZ9O9fiCBjFx4Ppvk2cO6D8/eNC5SO2Ve0Y5jj1D6grS/+wbO74bP5ebN0 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uj969hc9k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 16:02:41 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ANFaHkx005133;
	Thu, 23 Nov 2023 16:02:40 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uj969hc9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 16:02:40 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3ANFmv05027396;
	Thu, 23 Nov 2023 16:02:39 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ufaa2fh6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 16:02:39 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3ANG2aBs32244106
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Nov 2023 16:02:37 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C83B920043;
	Thu, 23 Nov 2023 16:02:36 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 865DE20040;
	Thu, 23 Nov 2023 16:02:34 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.34.234])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Nov 2023 16:02:34 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, james.clark@arm.com, namhyung@kernel.org
Subject: [PATCH V4] tools/perf: Add perf binary dependent rule for shellcheck log in Makefile.perf
Date: Thu, 23 Nov 2023 21:32:32 +0530
Message-Id: <20231123160232.94253-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cak6NshRaNKzi7r_88Db7rAAIO4q6KCO
X-Proofpoint-ORIG-GUID: n8aBrsG83dpLRs2DU_MPKjL_p9XFjrLB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_12,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0 adultscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230117
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, linux-perf-users@vger.kernel.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add rule in new Makefile "tests/Makefile.tests" for running
shellcheck on shell test scripts. This automates below shellcheck
into the build.

	$ for F in $(find tests/shell/ -perm -o=x -name '*.sh'); do shellcheck -S warning $F; done

Condition for shellcheck is added in Makefile.perf to avoid build
breakage in the absence of shellcheck binary. Update Makefile.perf
to contain new rule for "SHELLCHECK_TEST" which is for making
shellcheck test as a dependency on perf binary.

Added "tests/Makefile.tests" to run shellcheck on shellscripts in
tests/shell. The make rule "SHLLCHECK_RUN" ensures that, every
time during make, shellcheck will be run only on modified files
during subsequent invocations. By this, if any newly added shell
scripts or fixes in existing scripts breaks coding/formatting
style, it will get captured during the perf build.

Example build failure by modifying probe_vfs_getname.sh in tests/shell:

	In tests/shell/probe_vfs_getname.sh line 8:
	. $(dirname $0)/lib/probe.sh
	  ^-----------^ SC2046 (warning): Quote this to prevent word splitting.

	For more information:
	  https://www.shellcheck.net/wiki/SC2046 -- Quote this to prevent word splitt...
	make[3]: *** [/root/athira/perf-tools-next/tools/perf/tests/Makefile.tests:18: tests/shell/.probe_vfs_getname.sh.shellcheck_log] Error 1
	make[2]: *** [Makefile.perf:686: SHELLCHECK_TEST] Error 2
	make[2]: *** Waiting for unfinished jobs....
	make[1]: *** [Makefile.perf:244: sub-make] Error 2
	make: *** [Makefile:70: all] Error 2

Here, like other files which gets created during
compilation (ex: .builtin-bench.o.cmd or .perf.o.cmd ),
create .shellcheck_log also as a hidden file.
Example: tests/shell/.probe_vfs_getname.sh.shellcheck_log
shellcheck is re-run if any of the script gets modified
based on its dependency of this log file.

After this, for testing, changed "tests/shell/trace+probe_vfs_getname.sh" to
break shellcheck format. In the next make run, it is
also captured:

	In tests/shell/probe_vfs_getname.sh line 8:
	. $(dirname $0)/lib/probe.sh
	  ^-----------^ SC2046 (warning): Quote this to prevent word splitting.

	For more information:
	  https://www.shellcheck.net/wiki/SC2046 -- Quote this to prevent word splitt...
	make[3]: *** [/root/athira/perf-tools-next/tools/perf/tests/Makefile.tests:18: tests/shell/.probe_vfs_getname.sh.shellcheck_log] Error 1
	make[3]: *** Waiting for unfinished jobs....

	In tests/shell/trace+probe_vfs_getname.sh line 14:
	. $(dirname $0)/lib/probe.sh
	  ^-----------^ SC2046 (warning): Quote this to prevent word splitting.

	For more information:
	  https://www.shellcheck.net/wiki/SC2046 -- Quote this to prevent word splitt...
	make[3]: *** [/root/athira/perf-tools-next/tools/perf/tests/Makefile.tests:18: tests/shell/.trace+probe_vfs_getname.sh.shellcheck_log] Error 1
	make[2]: *** [Makefile.perf:686: SHELLCHECK_TEST] Error 2
	make[2]: *** Waiting for unfinished jobs....
	make[1]: *** [Makefile.perf:244: sub-make] Error 2
	make: *** [Makefile:70: all] Error 2

Failure log can be found in the stdout of make itself.

This is reported at build time. To be able to go ahead with
the build or disable shellcheck even though it is known that
some test is broken, add a "NO_SHELLCHECK" option. Example:

  make NO_SHELLCHECK=1

	  INSTALL libsubcmd_headers
	  INSTALL libsymbol_headers
	  INSTALL libapi_headers
	  INSTALL libperf_headers
	  INSTALL libbpf_headers
	  LINK    perf

Note:
This is tested on RHEL and also SLES. Use below check:
"$(shell which shellcheck 2> /dev/null)" to look for presence
of shellcheck binary. The approach "shell command -v" is not
used here. In some of the distros(RHEL), command is available
as executable file (/usr/bin/command). But in some distros(SLES),
it is a shell builtin and not available as executable file.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
changelog:
v3 -> v4:
Addressed review comments from James Clark.
- Made the shellcheck errors to be reported in make output
  itself during make like any other build error.
- Removed creating .dep files. Instead use the log file
to determine whether shellcheck has to be re-run when
there is a change in source file.
- Change log file to have suffix as shellcheck_log so
as to differentiate it from test execution log.
- Also like other files which gets created during
compilation, example, .builtin-bench.o.cmd or .perf.o.cmd,
create .shellcheck_log as hidden file.
Example: tests/shell/.buildid.sh.shellcheck_log
- Initial version used "command -v shellcheck" to check
presence of shellcheck. But while testing SLES, hit an
issue with using "command". In RHEL, /usr/bin/command
is available as part of bash rpm
# rpm -qf /usr/bin/command 
bash-5.1.8-6.el9_1.ppc64le

But in SLES ( tested in SLES 15 SP4 ), this is not
available as an executable file, instead it is only
a shell builtin. This resulted in below fail:
make[2]: command: Command not found

So use "which shellcheck" to check for presence of
shellcheck binary

v2 -> v3:
Add option "NO_SHELLCHECK". This will allow to go ahead
with the build or disable shellcheck even though it is
known that some test is broken

v1 -> v2:
Version1 had shellcheck in feature check which is not
required since shellcheck is already a binary. Presence
of binary can be checked using:
$(shell command -v shellcheck)
Addressed these changes as suggested by Namhyung in V2
Feature test logic is removed in V2. Also added example
for build breakage when shellcheck fails in commit message

 tools/perf/Makefile.perf        | 21 ++++++++++++++++++++-
 tools/perf/tests/Makefile.tests | 22 ++++++++++++++++++++++
 2 files changed, 42 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/tests/Makefile.tests

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index d80dcaa5a1e3..824cbc0af7d7 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -134,6 +134,8 @@ include ../scripts/utilities.mak
 #	x86 instruction decoder - new instructions test
 #
 # Define GEN_VMLINUX_H to generate vmlinux.h from the BTF.
+#
+# Define NO_SHELLCHECK if you do not want to run shellcheck during build
 
 # As per kernel Makefile, avoid funny character set dependencies
 unexport LC_ALL
@@ -671,7 +673,23 @@ $(PERF_IN): prepare FORCE
 $(PMU_EVENTS_IN): FORCE prepare
 	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=pmu-events obj=pmu-events
 
-$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN)
+# Runs shellcheck on perf test shell scripts
+
+SHELLCHECK := $(shell which shellcheck 2> /dev/null)
+
+ifeq ($(NO_SHELLCHECK),1)
+SHELLCHECK :=
+endif
+
+ifneq ($(SHELLCHECK),)
+SHELLCHECK_TEST: FORCE prepare
+	$(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests
+else
+SHELLCHECK_TEST:
+	@:
+endif
+
+$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN) SHELLCHECK_TEST
 	$(QUIET_LINK)$(CC) $(CFLAGS) $(LDFLAGS) \
 		$(PERF_IN) $(PMU_EVENTS_IN) $(LIBS) -o $@
 
@@ -1134,6 +1152,7 @@ bpf-skel-clean:
 	$(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS)
 
 clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-coresight-targets-clean
+	$(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
 	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
 	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete
 	$(Q)$(RM) $(OUTPUT).config-detected
diff --git a/tools/perf/tests/Makefile.tests b/tools/perf/tests/Makefile.tests
new file mode 100644
index 000000000000..fdaca5f7a946
--- /dev/null
+++ b/tools/perf/tests/Makefile.tests
@@ -0,0 +1,22 @@
+# SPDX-License-Identifier: GPL-2.0
+# Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 2023
+
+PROGS := $(shell find tests/shell -perm -o=x -type f -name '*.sh')
+FILE_NAME := $(notdir $(PROGS))
+FILE_NAME := $(FILE_NAME:%=.%)
+LOGS := $(join $(dir $(PROGS)),$(FILE_NAME))
+LOGS := $(LOGS:%=%.shellcheck_log)
+
+.PHONY: all
+all: SHELLCHECK_RUN
+	@:
+
+SHELLCHECK_RUN: $(LOGS)
+
+.%.shellcheck_log: %
+	$(call rule_mkdir)
+	$(Q)$(call frecho-cmd,test)@shellcheck -S warning "$<" > $@ || (cat $@ && rm $@ && false)
+
+clean:
+	$(eval log_files := $(shell find . -name '.*.shellcheck_log'))
+	@rm -rf $(log_files)
-- 
2.35.3

