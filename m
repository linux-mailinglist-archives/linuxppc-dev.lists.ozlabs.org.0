Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 671BC8A8212
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 13:28:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nn7fXqDr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VKJYV10Fhz3vhf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 21:27:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nn7fXqDr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VKJSt6Kxcz3cZK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 21:23:58 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43HB39Mw001185;
	Wed, 17 Apr 2024 11:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QsxtX3DnyEC+qFUIsCI9vkv8OTMPlK9nNXRnZnmDVOE=;
 b=nn7fXqDrNmetf3klJgR0VwT1Y6Fl4tTLKbFhLZo/TpzYrIoqrsJ/iWOwPa2oQ0acAo+n
 h7GpoNEhFhfSZjvXAf2UUBNSMd638i+5r+WkKy3/vP2QCq9+nGs87lOBCVT00zbjMU/3
 FA5E31gehdBrjNYJB1hIuSySauUEvQ/5BRM8zFVttdfQ7u8/lxjaCJ+cokk9yfaAq6f5
 dhzJbNdAuOupAAMDhd1Ryn+szq6/l++YyupI7CKXE9KtG/ngALWjP4o7vQ/0YwIlxhwB
 blqljh5fcc67VvpNVKz8rXc1v6CxZ7RpTSyfXyvqhm8Vswwxtl2uwY0eXJsQhWpDa2kY 2Q== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xjd75r1h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:53 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43H9eVkm015834;
	Wed, 17 Apr 2024 11:23:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3xg5vmbtpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Apr 2024 11:23:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43HBNnlZ46661924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Apr 2024 11:23:51 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 32EE720040;
	Wed, 17 Apr 2024 11:23:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 461182004B;
	Wed, 17 Apr 2024 11:23:48 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 17 Apr 2024 11:23:48 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.36.21.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0AE6561013;
	Wed, 17 Apr 2024 21:23:45 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v1 5/9] selftests/powerpc/dexcr: Add DEXCR prctl interface test
Date: Wed, 17 Apr 2024 21:23:21 +1000
Message-ID: <20240417112325.728010-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240417112325.728010-1-bgray@linux.ibm.com>
References: <20240417112325.728010-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5E87vm4Dy2xdYm_MMIvzgmyeg8WlqpZi
X-Proofpoint-ORIG-GUID: 5E87vm4Dy2xdYm_MMIvzgmyeg8WlqpZi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-17_08,2024-04-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 mlxscore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404170078
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some basic tests of the prctl interface of the DEXCR.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 .../selftests/powerpc/dexcr/.gitignore        |   1 +
 .../testing/selftests/powerpc/dexcr/Makefile  |   4 +-
 tools/testing/selftests/powerpc/dexcr/dexcr.c |  40 ++++
 tools/testing/selftests/powerpc/dexcr/dexcr.h |  10 +
 .../selftests/powerpc/dexcr/dexcr_test.c      | 213 ++++++++++++++++++
 5 files changed, 267 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr_test.c

diff --git a/tools/testing/selftests/powerpc/dexcr/.gitignore b/tools/testing/selftests/powerpc/dexcr/.gitignore
index b82f45dd46b9..5d526613cd26 100644
--- a/tools/testing/selftests/powerpc/dexcr/.gitignore
+++ b/tools/testing/selftests/powerpc/dexcr/.gitignore
@@ -1,2 +1,3 @@
+dexcr_test
 hashchk_test
 lsdexcr
diff --git a/tools/testing/selftests/powerpc/dexcr/Makefile b/tools/testing/selftests/powerpc/dexcr/Makefile
index 829ad075b4a4..076943193c07 100644
--- a/tools/testing/selftests/powerpc/dexcr/Makefile
+++ b/tools/testing/selftests/powerpc/dexcr/Makefile
@@ -1,8 +1,10 @@
-TEST_GEN_PROGS := hashchk_test
+TEST_GEN_PROGS := dexcr_test hashchk_test
 TEST_GEN_FILES := lsdexcr
 
 include ../../lib.mk
 
+CFLAGS += $(KHDR_INCLUDES)
+
 $(OUTPUT)/hashchk_test: CFLAGS += -fno-pie -no-pie $(call cc-option,-mno-rop-protect)
 
 $(TEST_GEN_PROGS): ../harness.c ../utils.c ./dexcr.c
diff --git a/tools/testing/selftests/powerpc/dexcr/dexcr.c b/tools/testing/selftests/powerpc/dexcr/dexcr.c
index 65ec5347de98..468fd0dc9912 100644
--- a/tools/testing/selftests/powerpc/dexcr/dexcr.c
+++ b/tools/testing/selftests/powerpc/dexcr/dexcr.c
@@ -3,6 +3,7 @@
 #include <errno.h>
 #include <setjmp.h>
 #include <signal.h>
+#include <sys/prctl.h>
 #include <sys/types.h>
 #include <sys/wait.h>
 
@@ -43,6 +44,45 @@ bool dexcr_exists(void)
 	return exists;
 }
 
+unsigned int pr_which_to_aspect(unsigned long which)
+{
+	switch (which) {
+	case PR_PPC_DEXCR_SBHE:
+		return DEXCR_PR_SBHE;
+	case PR_PPC_DEXCR_IBRTPD:
+		return DEXCR_PR_IBRTPD;
+	case PR_PPC_DEXCR_SRAPD:
+		return DEXCR_PR_SRAPD;
+	case PR_PPC_DEXCR_NPHIE:
+		return DEXCR_PR_NPHIE;
+	default:
+		FAIL_IF_EXIT_MSG(true, "unknown PR aspect");
+	}
+}
+
+int pr_get_dexcr(unsigned long which)
+{
+	return prctl(PR_PPC_GET_DEXCR, which, 0UL, 0UL, 0UL);
+}
+
+int pr_set_dexcr(unsigned long which, unsigned long ctrl)
+{
+	return prctl(PR_PPC_SET_DEXCR, which, ctrl, 0UL, 0UL);
+}
+
+bool pr_dexcr_aspect_supported(unsigned long which)
+{
+	if (pr_get_dexcr(which) == -1)
+		return errno == ENODEV;
+
+	return true;
+}
+
+bool pr_dexcr_aspect_editable(unsigned long which)
+{
+	return pr_get_dexcr(which) & PR_PPC_DEXCR_CTRL_EDITABLE;
+}
+
 /*
  * Just test if a bad hashchk triggers a signal, without checking
  * for support or if the NPHIE aspect is enabled.
diff --git a/tools/testing/selftests/powerpc/dexcr/dexcr.h b/tools/testing/selftests/powerpc/dexcr/dexcr.h
index f55cbbc8643b..a6aa7eac11da 100644
--- a/tools/testing/selftests/powerpc/dexcr/dexcr.h
+++ b/tools/testing/selftests/powerpc/dexcr/dexcr.h
@@ -28,6 +28,16 @@
 
 bool dexcr_exists(void);
 
+bool pr_dexcr_aspect_supported(unsigned long which);
+
+bool pr_dexcr_aspect_editable(unsigned long which);
+
+int pr_get_dexcr(unsigned long pr_aspect);
+
+int pr_set_dexcr(unsigned long pr_aspect, unsigned long ctrl);
+
+unsigned int pr_which_to_aspect(unsigned long which);
+
 bool hashchk_triggers(void);
 
 enum dexcr_source {
diff --git a/tools/testing/selftests/powerpc/dexcr/dexcr_test.c b/tools/testing/selftests/powerpc/dexcr/dexcr_test.c
new file mode 100644
index 000000000000..4662c823a4f1
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/dexcr_test.c
@@ -0,0 +1,213 @@
+#include <errno.h>
+#include <fcntl.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/prctl.h>
+#include <unistd.h>
+
+#include "dexcr.h"
+#include "utils.h"
+
+/*
+ * Helper function for testing the behaviour of a newly exec-ed process
+ */
+static int dexcr_prctl_onexec_test_child(unsigned long which, const char *status)
+{
+	unsigned long dexcr = mfspr(SPRN_DEXCR_RO);
+	unsigned long aspect = pr_which_to_aspect(which);
+	int ctrl = pr_get_dexcr(which);
+
+	if (!strcmp(status, "set")) {
+		FAIL_IF_EXIT_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_SET),
+				 "setting aspect across exec not applied");
+
+		FAIL_IF_EXIT_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_SET_ONEXEC),
+				 "setting aspect across exec not inherited");
+
+		FAIL_IF_EXIT_MSG(!(aspect & dexcr), "setting aspect across exec did not take effect");
+	} else if (!strcmp(status, "clear")) {
+		FAIL_IF_EXIT_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_CLEAR),
+				 "clearing aspect across exec not applied");
+
+		FAIL_IF_EXIT_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC),
+				 "clearing aspect across exec not inherited");
+
+		FAIL_IF_EXIT_MSG(aspect & dexcr, "clearing aspect across exec did not take effect");
+	} else {
+		FAIL_IF_EXIT_MSG(true, "unknown expected status");
+	}
+
+	return 0;
+}
+
+/*
+ * Test that the given prctl value can be manipulated freely
+ */
+static int dexcr_prctl_aspect_test(unsigned long which)
+{
+	unsigned long aspect = pr_which_to_aspect(which);
+	pid_t pid;
+	int ctrl;
+	int err;
+	int errno_save;
+
+	SKIP_IF_MSG(!dexcr_exists(), "DEXCR not supported");
+	SKIP_IF_MSG(!pr_dexcr_aspect_supported(which), "DEXCR aspect not supported");
+	SKIP_IF_MSG(!pr_dexcr_aspect_editable(which), "DEXCR aspect not editable with prctl");
+
+	/* We reject invalid combinations of arguments */
+	err = pr_set_dexcr(which, PR_PPC_DEXCR_CTRL_SET | PR_PPC_DEXCR_CTRL_CLEAR);
+	errno_save = errno;
+	FAIL_IF_MSG(err != -1, "simultaneous set and clear should be rejected");
+	FAIL_IF_MSG(errno_save != EINVAL, "simultaneous set and clear should be rejected with EINVAL");
+
+	err = pr_set_dexcr(which, PR_PPC_DEXCR_CTRL_SET_ONEXEC | PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC);
+	errno_save = errno;
+	FAIL_IF_MSG(err != -1, "simultaneous set and clear on exec should be rejected");
+	FAIL_IF_MSG(errno_save != EINVAL, "simultaneous set and clear on exec should be rejected with EINVAL");
+
+	/* We set the aspect */
+	err = pr_set_dexcr(which, PR_PPC_DEXCR_CTRL_SET);
+	FAIL_IF_MSG(err, "PR_PPC_DEXCR_CTRL_SET failed");
+
+	ctrl = pr_get_dexcr(which);
+	FAIL_IF_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_SET), "config value not PR_PPC_DEXCR_CTRL_SET");
+	FAIL_IF_MSG(ctrl & PR_PPC_DEXCR_CTRL_CLEAR, "config value unexpected clear flag");
+	FAIL_IF_MSG(!(aspect & mfspr(SPRN_DEXCR_RO)), "setting aspect did not take effect");
+
+	/* We clear the aspect */
+	err = pr_set_dexcr(which, PR_PPC_DEXCR_CTRL_CLEAR);
+	FAIL_IF_MSG(err, "PR_PPC_DEXCR_CTRL_CLEAR failed");
+
+	ctrl = pr_get_dexcr(which);
+	FAIL_IF_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_CLEAR), "config value not PR_PPC_DEXCR_CTRL_CLEAR");
+	FAIL_IF_MSG(ctrl & PR_PPC_DEXCR_CTRL_SET, "config value unexpected set flag");
+	FAIL_IF_MSG(aspect & mfspr(SPRN_DEXCR_RO), "clearing aspect did not take effect");
+
+	/* We make it set on exec (doesn't change our current value) */
+	err = pr_set_dexcr(which, PR_PPC_DEXCR_CTRL_SET_ONEXEC);
+	FAIL_IF_MSG(err, "PR_PPC_DEXCR_CTRL_SET_ONEXEC failed");
+
+	ctrl = pr_get_dexcr(which);
+	FAIL_IF_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_CLEAR), "process aspect should still be cleared");
+	FAIL_IF_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_SET_ONEXEC), "config value not PR_PPC_DEXCR_CTRL_SET_ONEXEC");
+	FAIL_IF_MSG(ctrl & PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC, "config value unexpected clear on exec flag");
+	FAIL_IF_MSG(aspect & mfspr(SPRN_DEXCR_RO), "scheduling aspect to set on exec should not change it now");
+
+	/* We make it clear on exec (doesn't change our current value) */
+	err = pr_set_dexcr(which, PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC);
+	FAIL_IF_MSG(err, "PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC failed");
+
+	ctrl = pr_get_dexcr(which);
+	FAIL_IF_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_CLEAR), "process aspect config should still be cleared");
+	FAIL_IF_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC), "config value not PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC");
+	FAIL_IF_MSG(ctrl & PR_PPC_DEXCR_CTRL_SET_ONEXEC, "config value unexpected set on exec flag");
+	FAIL_IF_MSG(aspect & mfspr(SPRN_DEXCR_RO), "process aspect should still be cleared");
+
+	/* We allow setting the current and on-exec value in a single call */
+	err = pr_set_dexcr(which, PR_PPC_DEXCR_CTRL_SET | PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC);
+	FAIL_IF_MSG(err, "PR_PPC_DEXCR_CTRL_SET | PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC failed");
+
+	ctrl = pr_get_dexcr(which);
+	FAIL_IF_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_SET), "config value not PR_PPC_DEXCR_CTRL_SET");
+	FAIL_IF_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC), "config value not PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC");
+	FAIL_IF_MSG(!(aspect & mfspr(SPRN_DEXCR_RO)), "process aspect should be set");
+
+	err = pr_set_dexcr(which, PR_PPC_DEXCR_CTRL_CLEAR | PR_PPC_DEXCR_CTRL_SET_ONEXEC);
+	FAIL_IF_MSG(err, "PR_PPC_DEXCR_CTRL_CLEAR | PR_PPC_DEXCR_CTRL_SET_ONEXEC failed");
+
+	ctrl = pr_get_dexcr(which);
+	FAIL_IF_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_CLEAR), "config value not PR_PPC_DEXCR_CTRL_CLEAR");
+	FAIL_IF_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_SET_ONEXEC), "config value not PR_PPC_DEXCR_CTRL_SET_ONEXEC");
+	FAIL_IF_MSG(aspect & mfspr(SPRN_DEXCR_RO), "process aspect should be clear");
+
+	/* Verify the onexec value is applied across exec */
+	pid = fork();
+	if (!pid) {
+		char which_str[32] = {};
+		char *args[] = { "dexcr_prctl_onexec_test_child", which_str, "set", NULL };
+		unsigned int ctrl = pr_get_dexcr(which);
+
+		sprintf(which_str, "%lu", which);
+
+		FAIL_IF_EXIT_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_SET_ONEXEC),
+				 "setting aspect on exec not copied across fork");
+
+		FAIL_IF_EXIT_MSG(mfspr(SPRN_DEXCR_RO) & aspect,
+				 "setting aspect on exec wrongly applied to fork");
+
+		execve("/proc/self/exe", args, NULL);
+		_exit(errno);
+	}
+	await_child_success(pid);
+
+	err = pr_set_dexcr(which, PR_PPC_DEXCR_CTRL_SET | PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC);
+	FAIL_IF_MSG(err, "PR_PPC_DEXCR_CTRL_SET | PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC failed");
+
+	pid = fork();
+	if (!pid) {
+		char which_str[32] = {};
+		char *args[] = { "dexcr_prctl_onexec_test_child", which_str, "clear", NULL };
+		unsigned int ctrl = pr_get_dexcr(which);
+
+		sprintf(which_str, "%lu", which);
+
+		FAIL_IF_EXIT_MSG(!(ctrl & PR_PPC_DEXCR_CTRL_CLEAR_ONEXEC),
+				 "clearing aspect on exec not copied across fork");
+
+		FAIL_IF_EXIT_MSG(!(mfspr(SPRN_DEXCR_RO) & aspect),
+				 "clearing aspect on exec wrongly applied to fork");
+
+		execve("/proc/self/exe", args, NULL);
+		_exit(errno);
+	}
+	await_child_success(pid);
+
+	return 0;
+}
+
+static int dexcr_prctl_ibrtpd_test(void)
+{
+	return dexcr_prctl_aspect_test(PR_PPC_DEXCR_IBRTPD);
+}
+
+static int dexcr_prctl_srapd_test(void)
+{
+	return dexcr_prctl_aspect_test(PR_PPC_DEXCR_SRAPD);
+}
+
+static int dexcr_prctl_nphie_test(void)
+{
+	return dexcr_prctl_aspect_test(PR_PPC_DEXCR_NPHIE);
+}
+
+int main(int argc, char *argv[])
+{
+	int err = 0;
+
+	/*
+	 * Some tests require checking what happens across exec, so we may be
+	 * invoked as the child of a particular test
+	 */
+	if (argc > 1) {
+		if (argc == 3 && !strcmp(argv[0], "dexcr_prctl_onexec_test_child")) {
+			unsigned long which;
+
+			err = parse_ulong(argv[1], strlen(argv[1]), &which, 10);
+			FAIL_IF_MSG(err, "failed to parse which value for child");
+
+			return dexcr_prctl_onexec_test_child(which, argv[2]);
+		}
+
+		FAIL_IF_MSG(true, "unknown test case");
+	}
+
+	/*
+	 * Otherwise we are the main test invocation and run the full suite
+	 */
+	err |= test_harness(dexcr_prctl_ibrtpd_test, "dexcr_prctl_ibrtpd");
+	err |= test_harness(dexcr_prctl_srapd_test, "dexcr_prctl_srapd");
+	err |= test_harness(dexcr_prctl_nphie_test, "dexcr_prctl_nphie");
+
+	return err;
+}
-- 
2.44.0

