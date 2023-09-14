Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661EA7A0B6D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 19:20:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dMYIB2qs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmkbm1dG7z3cGv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 03:20:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dMYIB2qs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmkZ42T9lz3cGv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 03:18:52 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38EH8BUm008760;
	Thu, 14 Sep 2023 17:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1JHCtelDrqbNJ3A7ZDz/nIPi6zafxdBhMKDaYuL1xsM=;
 b=dMYIB2qsKmQIGk4ePt7o3TTu+6/uQhexD87N4fQ3nwdFNX6a9AZcH6K4T2Hd+fE9jK3O
 dPROd9/U2IBA+zunqkmrQwqJlzOZLeSwRqv99IPiBTcLQ6CDC1sCVJ6Q1SK7QcPTWoO6
 ZtPvlMy2DMMpdBwBy8BI9tnMODimKvtX4MzQ0cm+hPDQHkgrUdNi+JArCeVTCKcSBJg0
 jb02JNLsZZE0/ePABWhhJgqg+svK4OEjed4qrzvPrz4oZmAxjWY2MGIeISrmgzMRO+fO
 duz6ddYaMPXLFI0PEAi92ELW7q3J6mgpNf0pMWF0rnuiMWkvlyAjKPsIs4h5ljvvcK5n 1A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t46358v37-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:18:39 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 38EH8VIK011604;
	Thu, 14 Sep 2023 17:18:38 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3t46358v2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:18:38 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 38EGMcDo002318;
	Thu, 14 Sep 2023 17:18:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3t158km69t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Sep 2023 17:18:38 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 38EHIZAj61079960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Sep 2023 17:18:35 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 538DB2004E;
	Thu, 14 Sep 2023 17:18:35 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3AEF920040;
	Thu, 14 Sep 2023 17:18:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.43.35.47])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 14 Sep 2023 17:18:33 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Subject: [PATCH 2/2] tools/perf: Add perf binary dependent rule for shellcheck log in Makefile.perf
Date: Thu, 14 Sep 2023 22:48:27 +0530
Message-Id: <20230914171827.98507-2-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230914171827.98507-1-atrajeev@linux.vnet.ibm.com>
References: <20230914171827.98507-1-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GU0rTrFhhRGzXXNAX0DlqDuN3apovyTH
X-Proofpoint-ORIG-GUID: qwESk1yC4NqFkGNDMSc4EhA7usOZVhGw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309140148
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

CONFIG_SHELLCHECK check is added to avoid build breakage in
the absence of shellcheck binary. Update Makefile.perf to contain
new rule for "SHELLCHECK_TEST" which is for making shellcheck
test as a dependency on perf binary. Added "tests/Makefile.tests"
to run shellcheck on shellscripts in tests/shell. The make rule
"SHLLCHECK_RUN" ensures that, every time during make, shellcheck
will be run only on modified files during subsequent invocations.
By this, if any newly added shell scripts or fixes in existing
scripts breaks coding/formatting style, it will get captured
during the perf build.

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/Makefile.perf        | 12 +++++++++++-
 tools/perf/tests/Makefile.tests | 24 ++++++++++++++++++++++++
 2 files changed, 35 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/tests/Makefile.tests

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index f6fdc2d5a92f..c27f54771e90 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -667,7 +667,16 @@ $(PERF_IN): prepare FORCE
 $(PMU_EVENTS_IN): FORCE prepare
 	$(Q)$(MAKE) -f $(srctree)/tools/build/Makefile.build dir=pmu-events obj=pmu-events
 
-$(OUTPUT)perf: $(PERFLIBS) $(PERF_IN) $(PMU_EVENTS_IN)
+# Runs shellcheck on perf test shell scripts
+ifeq ($(CONFIG_SHELLCHECK),y)
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
 
@@ -1129,6 +1138,7 @@ bpf-skel-clean:
 	$(call QUIET_CLEAN, bpf-skel) $(RM) -r $(SKEL_TMP_OUT) $(SKELETONS)
 
 clean:: $(LIBAPI)-clean $(LIBBPF)-clean $(LIBSUBCMD)-clean $(LIBSYMBOL)-clean $(LIBPERF)-clean fixdep-clean python-clean bpf-skel-clean tests-coresight-targets-clean
+	$(Q)$(MAKE) -f $(srctree)/tools/perf/tests/Makefile.tests clean
 	$(call QUIET_CLEAN, core-objs)  $(RM) $(LIBPERF_A) $(OUTPUT)perf-archive $(OUTPUT)perf-iostat $(LANG_BINDINGS)
 	$(Q)find $(or $(OUTPUT),.) -name '*.o' -delete -o -name '\.*.cmd' -delete -o -name '\.*.d' -delete
 	$(Q)$(RM) $(OUTPUT).config-detected
diff --git a/tools/perf/tests/Makefile.tests b/tools/perf/tests/Makefile.tests
new file mode 100644
index 000000000000..e74575559e83
--- /dev/null
+++ b/tools/perf/tests/Makefile.tests
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: GPL-2.0
+# Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 2023
+-include $(OUTPUT).config-detected
+
+log_file = $(OUTPUT)shellcheck_test.log
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
+	$(Q)$(call frecho-cmd,test)@touch $@
+	$(Q)$(call frecho-cmd,test)@shellcheck -S warning $(subst output/,./,$(patsubst %.dep, %.sh, $@)) 1> ${log_file} && ([[ ! -s ${log_file} ]])
+$(DIRS):
+	@mkdir -p $@
+
+clean:
+	@rm -rf $(log_file) output
-- 
2.31.1

