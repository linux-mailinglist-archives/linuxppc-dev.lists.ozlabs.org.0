Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D341E7C7EB2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 09:37:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o4NHhuOS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S6JJB4lDlz3dgN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 18:37:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o4NHhuOS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S6JHH1mPbz30gn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 18:36:59 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39D7JnTd021073;
	Fri, 13 Oct 2023 07:36:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=aU5KNpJK3u7LyaWyghxLcbo+YVcAjwk7WeytjlNjRIY=;
 b=o4NHhuOSwxKQTGhSjiazGJWkP3SkEiuGmY5W+Gb9OhRKcpYkdOUHZqrx4oDO0eB8+Pk7
 Ko6ikd6hagJsHAePouf+zfsJtPTg/AjU4jN3cqnR3UewFgxq8nHTACrmB8O2pDFjjfhI
 4YcZFeaMC/kNa08gz+Jpoo9VYT26I3f/bRWpFOTmk/oehs7b+RWm49TCWsSGF9LR3NXh
 s9T5m2W7wpNQAm/4UmzzuyAeFX5QmIWJ3xjz71LdCeqAIiGlDXio7dbouSju6Lxp2i+r
 LZXMDfO5MwB+AtLj0LlegDAPYuNZfT1mS4aKW/vO0ZICLBoKce6a/6k9lc++iGICcZ6f 0A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tq1dk0hw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 07:36:52 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39D7KLTp023646;
	Fri, 13 Oct 2023 07:36:52 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tq1dk0hvu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 07:36:52 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39D5OrwK009845;
	Fri, 13 Oct 2023 07:36:51 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tpt59jbt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Oct 2023 07:36:51 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39D7am3V18940464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Oct 2023 07:36:48 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 47BF72004B;
	Fri, 13 Oct 2023 07:36:48 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF11F20040;
	Fri, 13 Oct 2023 07:36:45 +0000 (GMT)
Received: from athiras-mbp.in.ibm.com (unknown [9.109.214.47])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Oct 2023 07:36:45 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH V3] tools/perf: Add perf binary dependent rule for shellcheck log in Makefile.perf
Date: Fri, 13 Oct 2023 13:06:41 +0530
Message-Id: <20231013073641.99934-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: h-VYu126WhuwZAf-HclgLYurtshmEY54
X-Proofpoint-GUID: fMbDeXpsaP6fIYCVLr_09DISEvC73QXr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-13_03,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310130062
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
shellcheck test as a dependency on perf binary. Added
"tests/Makefile.tests" to run shellcheck on shellscripts in
tests/shell. The make rule "SHLLCHECK_RUN" ensures that, every
time during make, shellcheck will be run only on modified files
during subsequent invocations. By this, if any newly added shell
scripts or fixes in existing scripts breaks coding/formatting
style, it will get captured during the perf build.

Example build failure with present scripts in tests/shell:

	INSTALL libsubcmd_headers
	INSTALL libperf_headers
	INSTALL libapi_headers
	INSTALL libsymbol_headers
	INSTALL libbpf_headers
	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/record_sideband.dep] Error 1
	make[3]: *** Waiting for unfinished jobs....
	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/test_arm_coresight.dep] Error 1
	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/lock_contention.dep] Error 1
	make[2]: *** [Makefile.perf:675: SHELLCHECK_TEST] Error 2
	make[1]: *** [Makefile.perf:238: sub-make] Error 2
	make: *** [Makefile:70: all] Error 2

After this, for testing, changed "tests/shell/record.sh" to
break shellcheck format. In the next make run, it is
also captured:

	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/record_sideband.dep] Error 1
	make[3]: *** Waiting for unfinished jobs....
	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/record.dep] Error 1
	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/test_arm_coresight.dep] Error 1
	make[3]: *** [/root/athira/namhyung/perf-tools-next/tools/perf/tests/Makefile.tests:17: output/tests/shell/lock_contention.dep] Error 1
	make[2]: *** [Makefile.perf:675: SHELLCHECK_TEST] Error 2
	make[1]: *** [Makefile.perf:238: sub-make] Error 2
	make: *** [Makefile:70: all] Error 2

The exact failure log can be found in:
output/tests/shell/record.dep.log file

This is reported at build time. To be able to go ahead with
the build or disable shellcheck even though it is known that
some test is broken, add a "NO_SHELLCHECK" option. Example:

  make NO_LIBTRACEEVENT=1 NO_SHELLCHECK=1

  INSTALL libsubcmd_headers
  INSTALL libsymbol_headers
  INSTALL libperf_headers
  INSTALL libapi_headers
  INSTALL libbpf_headers
  PERF_VERSION = 6.6.rc1.g7108a40e02ae
  GEN     perf-iostat
  GEN     perf-archive
  CC      util/header.o
  LD      util/perf-in.o
  LD      perf-in.o
  LINK    perf

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
changelog:
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

 tools/perf/Makefile.perf        | 20 +++++++++++++++++++-
 tools/perf/tests/Makefile.tests | 24 ++++++++++++++++++++++++
 2 files changed, 43 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/tests/Makefile.tests

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 456872ac410d..bb49eb8b0d43 100644
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
@@ -671,7 +673,22 @@ $(PERF_IN): prepare FORCE
 $(PMU_EVENTS_IN): FORCE prepare
 	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=pmu-events obj=pmu-events
 
-$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN)
+# Runs shellcheck on perf test shell scripts
+
+SHELLCHECK := $(shell command -v shellcheck)
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
 
@@ -1134,6 +1151,7 @@ bpf-skel-clean:
 	$(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS)
 
 clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-coresight-targets-clean
+	$(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
 	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
 	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete
 	$(Q)$(RM) $(OUTPUT).config-detected
diff --git a/tools/perf/tests/Makefile.tests b/tools/perf/tests/Makefile.tests
new file mode 100644
index 000000000000..8011e99768a3
--- /dev/null
+++ b/tools/perf/tests/Makefile.tests
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0
+# Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 2023
+
+PROGS = $(subst ./,,$(shell find tests/shell -perm -o=x -type f -name '*.sh'))
+DEPS = $(addprefix output/,$(addsuffix .dep,$(basename $(PROGS))))
+DIRS = $(shell echo $(dir $(DEPS)) | xargs -n1 | sort -u | xargs)
+
+.PHONY: all
+all: SHELLCHECK_RUN
+	@:
+
+SHELLCHECK_RUN: $(DEPS) $(DIRS)
+
+output/%.dep: %.sh | $(DIRS)
+	$(call rule_mkdir)
+	$(eval input_file := $(subst output/,./,$(patsubst %.dep, %.sh, $@)))
+	$(Q)$(call frecho-cmd,test)@shellcheck -S warning ${input_file} 1> $@.log && ([[ ! -s $@.log ]])
+	$(Q)$(call frecho-cmd,test)@touch $@
+	$(Q)$(call frecho-cmd,test)@rm -rf $@.log
+$(DIRS):
+	@mkdir -p $@
+
+clean:
+	@rm -rf output
-- 
2.31.1

