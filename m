Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061E639FC7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:53:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL94s2KtGz3f6n
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:53:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bgbiHG0x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bgbiHG0x;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8wk4rxnz2xmg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:45:58 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS2E5eo017340;
	Mon, 28 Nov 2022 02:45:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QcZAF3/t6pm2mw+jhhL3fpQByBZdsMo4OT7Cl5tPds0=;
 b=bgbiHG0x+xKJ48rUZfIfuk8kmiXBSuF5fYdTpwV5nhkTzsEXweAjBSQ8Os86oxtgvZJT
 2xKrp07MeceZW5MH2v7RMQgGCl55rZDiGPKRMUiMn1YUUq9dpqn06RhjOfT2E5NNixbu
 66iM90RTxy80O31Fr3yngj7EJ5o4oAcxONaDZ/u/1+OgVIRSSe7YiD4VuPCr2Dxve/vX
 EogjXxv1h/Z/MBHMRezFSb5WK0DAuNe0wP7W9HACiaEJHDmyiGFaNXSUGTRZxSSPUKhO
 Rw3yngFnmpzBtv8QznmrmF/OefZ7s0aUPv38/vOzNCaakD6XyXYolXqIVuoM31XDBZkW hg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vv9bmdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:50 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS2Zbim020310;
	Mon, 28 Nov 2022 02:45:47 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma04ams.nl.ibm.com with ESMTP id 3m3ae99ubw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:47 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS2jjZl656076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 02:45:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 501D0A4054;
	Mon, 28 Nov 2022 02:45:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A61F0A405B;
	Mon, 28 Nov 2022 02:45:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 02:45:44 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 715D16083C;
	Mon, 28 Nov 2022 13:45:39 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 11/13] selftests/powerpc: Add DEXCR prctl, sysctl interface test
Date: Mon, 28 Nov 2022 13:44:56 +1100
Message-Id: <20221128024458.46121-12-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128024458.46121-1-bgray@linux.ibm.com>
References: <20221128024458.46121-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kqkSGgx0XWdPpmHAKPJ72NBA3Qir9W3w
X-Proofpoint-GUID: kqkSGgx0XWdPpmHAKPJ72NBA3Qir9W3w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211280018
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
Cc: ajd@linux.ibm.com, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, cmr@bluescreens.de, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Test the prctl and sysctl interfaces of the DEXCR.

This adds a new capabilities util for getting and setting CAP_SYS_ADMIN.
Adding this avoids depending on an external libcap package. There is a
similar implementation (and reason) in the tools/testing/selftests/bpf
subtree but there's no obvious place to move it for sharing.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 .../selftests/powerpc/dexcr/.gitignore        |   1 +
 .../testing/selftests/powerpc/dexcr/Makefile  |   4 +-
 tools/testing/selftests/powerpc/dexcr/cap.c   |  72 ++++++
 tools/testing/selftests/powerpc/dexcr/cap.h   |  18 ++
 tools/testing/selftests/powerpc/dexcr/dexcr.h |   2 +
 .../selftests/powerpc/dexcr/dexcr_test.c      | 241 ++++++++++++++++++
 6 files changed, 336 insertions(+), 2 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/dexcr/cap.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/cap.h
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr_test.c

diff --git a/tools/testing/selftests/powerpc/dexcr/.gitignore b/tools/testing/selftests/powerpc/dexcr/.gitignore
index 37adb7f47832..035a1fcd8fb3 100644
--- a/tools/testing/selftests/powerpc/dexcr/.gitignore
+++ b/tools/testing/selftests/powerpc/dexcr/.gitignore
@@ -1 +1,2 @@
+dexcr_test
 hashchk_user
diff --git a/tools/testing/selftests/powerpc/dexcr/Makefile b/tools/testing/selftests/powerpc/dexcr/Makefile
index 4b4380d4d986..9814e72a4afa 100644
--- a/tools/testing/selftests/powerpc/dexcr/Makefile
+++ b/tools/testing/selftests/powerpc/dexcr/Makefile
@@ -1,4 +1,4 @@
-TEST_GEN_PROGS := hashchk_test
+TEST_GEN_PROGS := dexcr_test hashchk_test
 
 TEST_FILES := settings
 top_srcdir = ../../../../..
@@ -6,4 +6,4 @@ include ../../lib.mk
 
 HASHCHK_TEST_CFLAGS = -no-pie $(call cc-option,-mno-rop-protect)
 
-$(TEST_GEN_PROGS): ../harness.c ../utils.c ./dexcr.c
+$(TEST_GEN_PROGS): ../harness.c ../utils.c ./dexcr.c ./cap.c
diff --git a/tools/testing/selftests/powerpc/dexcr/cap.c b/tools/testing/selftests/powerpc/dexcr/cap.c
new file mode 100644
index 000000000000..3c9b1f27345d
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/cap.c
@@ -0,0 +1,72 @@
+#include <linux/capability.h>
+#include <string.h>
+#include <sys/syscall.h>
+
+#include "cap.h"
+#include "utils.h"
+
+struct kernel_capabilities {
+	struct __user_cap_header_struct header;
+
+	struct __user_cap_data_struct data[_LINUX_CAPABILITY_U32S_3];
+};
+
+static void get_caps(struct kernel_capabilities *caps)
+{
+	FAIL_IF_EXIT_MSG(syscall(SYS_capget, &caps->header, &caps->data),
+			 "cannot get capabilities");
+}
+
+static void set_caps(struct kernel_capabilities *caps)
+{
+	FAIL_IF_EXIT_MSG(syscall(SYS_capset, &caps->header, &caps->data),
+			 "cannot set capabilities");
+}
+
+static void init_caps(struct kernel_capabilities *caps, pid_t pid)
+{
+	memset(caps, 0, sizeof(*caps));
+
+	caps->header.version = _LINUX_CAPABILITY_VERSION_3;
+	caps->header.pid = pid;
+
+	get_caps(caps);
+}
+
+static bool has_cap(struct kernel_capabilities *caps, size_t cap)
+{
+	size_t data_index = cap / 32;
+	size_t offset = cap % 32;
+
+	FAIL_IF_EXIT_MSG(data_index >= ARRAY_SIZE(caps->data), "cap out of range");
+
+	return caps->data[data_index].effective & (1 << offset);
+}
+
+static void drop_cap(struct kernel_capabilities *caps, size_t cap)
+{
+	size_t data_index = cap / 32;
+	size_t offset = cap % 32;
+
+	FAIL_IF_EXIT_MSG(data_index >= ARRAY_SIZE(caps->data), "cap out of range");
+
+	caps->data[data_index].effective &= ~(1 << offset);
+}
+
+bool check_cap_sysadmin(void)
+{
+	struct kernel_capabilities caps;
+
+	init_caps(&caps, 0);
+
+	return has_cap(&caps, CAP_SYS_ADMIN);
+}
+
+void drop_cap_sysadmin(void)
+{
+	struct kernel_capabilities caps;
+
+	init_caps(&caps, 0);
+	drop_cap(&caps, CAP_SYS_ADMIN);
+	set_caps(&caps);
+}
diff --git a/tools/testing/selftests/powerpc/dexcr/cap.h b/tools/testing/selftests/powerpc/dexcr/cap.h
new file mode 100644
index 000000000000..41f41dda9862
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/cap.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Simple capabilities getter/setter
+ *
+ * This header file contains helper functions and macros
+ * required to get and set capabilities(7). Introduced so
+ * we aren't the first to rely on libcap.
+ */
+#ifndef _SELFTESTS_POWERPC_DEXCR_CAP_H
+#define _SELFTESTS_POWERPC_DEXCR_CAP_H
+
+#include <stdbool.h>
+
+bool check_cap_sysadmin(void);
+
+void drop_cap_sysadmin(void);
+
+#endif  /* _SELFTESTS_POWERPC_DEXCR_CAP_H */
diff --git a/tools/testing/selftests/powerpc/dexcr/dexcr.h b/tools/testing/selftests/powerpc/dexcr/dexcr.h
index fb8007bf19f8..b90633ae49e9 100644
--- a/tools/testing/selftests/powerpc/dexcr/dexcr.h
+++ b/tools/testing/selftests/powerpc/dexcr/dexcr.h
@@ -21,6 +21,8 @@
 #define DEXCR_PRO_SRAPD		DEXCR_PRO_MASK(4)
 #define DEXCR_PRO_NPHIE		DEXCR_PRO_MASK(5)
 
+#define SYSCTL_DEXCR_SBHE	"/proc/sys/kernel/speculative_branch_hint_enable"
+
 enum DexcrSource {
 	UDEXCR,		/* Userspace DEXCR value */
 	ENFORCED,	/* Enforced by hypervisor */
diff --git a/tools/testing/selftests/powerpc/dexcr/dexcr_test.c b/tools/testing/selftests/powerpc/dexcr/dexcr_test.c
new file mode 100644
index 000000000000..5446cb350c84
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/dexcr_test.c
@@ -0,0 +1,241 @@
+#include <errno.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/prctl.h>
+#include <unistd.h>
+
+#include "cap.h"
+#include "dexcr.h"
+#include "utils.h"
+
+/*
+ * Test that an editable aspect
+ * - Current prctl state reported by the getter
+ * - Can be toggled on and off when process has CAP_SYS_ADMIN
+ * - Can't be edited if CAP_SYS_ADMIN not present
+ * - Can't be modified after force set
+ */
+static int dexcr_prctl_editable_aspect_test(unsigned long which)
+{
+	pid_t pid;
+
+	SKIP_IF_MSG(!check_cap_sysadmin(), "must have capability CAP_SYS_ADMIN");
+	SKIP_IF_MSG(!pr_aspect_supported(which), "aspect not supported");
+
+	FAIL_IF_MSG(!(pr_aspect_get(which) & PR_PPC_DEXCR_PRCTL), "aspect not editable");
+
+	FAIL_IF_MSG(!pr_aspect_edit(which, PR_PPC_DEXCR_CLEAR_ASPECT), "prctl failed");
+	FAIL_IF_MSG(pr_aspect_check(which, UDEXCR),
+		    "resetting aspect did not take effect");
+
+	FAIL_IF_MSG(pr_aspect_get(which) != (PR_PPC_DEXCR_CLEAR_ASPECT | PR_PPC_DEXCR_PRCTL),
+		    "prctl getter not reporting aspect state");
+
+	FAIL_IF_MSG(!pr_aspect_edit(which, PR_PPC_DEXCR_SET_ASPECT), "prctl failed");
+	FAIL_IF_MSG(!pr_aspect_check(which, UDEXCR),
+		    "setting aspect did not take effect");
+
+	FAIL_IF_MSG(pr_aspect_get(which) != (PR_PPC_DEXCR_SET_ASPECT | PR_PPC_DEXCR_PRCTL),
+		    "prctl getter not reporting aspect state");
+
+	FAIL_IF_MSG(!pr_aspect_edit(which, PR_PPC_DEXCR_CLEAR_ASPECT), "prctl failed");
+	FAIL_IF_MSG(pr_aspect_check(which, UDEXCR),
+		    "clearing aspect did not take effect");
+
+	FAIL_IF_MSG(pr_aspect_get(which) != (PR_PPC_DEXCR_CLEAR_ASPECT | PR_PPC_DEXCR_PRCTL),
+		    "prctl getter not reporting aspect state");
+
+	pid = fork();
+	if (pid == 0) {
+		drop_cap_sysadmin();
+		FAIL_IF_EXIT_MSG(pr_aspect_edit(which, PR_PPC_DEXCR_SET_ASPECT),
+				 "prctl success when nonprivileged");
+		FAIL_IF_EXIT_MSG(pr_aspect_check(which, UDEXCR),
+				 "edited aspect when nonprivileged");
+		_exit(0);
+	}
+	await_child_success(pid);
+
+	FAIL_IF_MSG(!pr_aspect_edit(which, PR_PPC_DEXCR_FORCE_SET_ASPECT), "prctl force set failed");
+	FAIL_IF_MSG(!pr_aspect_check(which, UDEXCR),
+		    "force setting aspect did not take effect");
+
+	FAIL_IF_MSG(pr_aspect_get(which) != (PR_PPC_DEXCR_FORCE_SET_ASPECT | PR_PPC_DEXCR_PRCTL),
+		    "prctl getter not reporting aspect state");
+
+	FAIL_IF_MSG(pr_aspect_edit(which, PR_PPC_DEXCR_CLEAR_ASPECT), "prctl success when forced");
+	FAIL_IF_MSG(!pr_aspect_check(which, UDEXCR),
+		    "edited aspect when forced");
+
+	return 0;
+}
+
+static int dexcr_prctl_sbhe_test(void)
+{
+	sysctl_set_sbhe(-1);
+	return dexcr_prctl_editable_aspect_test(PR_PPC_DEXCR_SBHE);
+}
+
+static int dexcr_prctl_ibrtpd_test(void)
+{
+	return dexcr_prctl_editable_aspect_test(PR_PPC_DEXCR_IBRTPD);
+}
+
+static int dexcr_prctl_srapd_test(void)
+{
+	return dexcr_prctl_editable_aspect_test(PR_PPC_DEXCR_SRAPD);
+}
+
+static int dexcr_sysctl_sbhe_test(void)
+{
+	SKIP_IF_MSG(!check_cap_sysadmin(), "must have capability CAP_SYS_ADMIN");
+	SKIP_IF_MSG(!pr_aspect_supported(PR_PPC_DEXCR_SBHE), "aspect not supported");
+
+	sysctl_set_sbhe(0);
+	FAIL_IF_MSG(sysctl_get_sbhe() != 0, "failed to clear sysctl SBHE");
+	FAIL_IF_MSG(pr_aspect_check(PR_PPC_DEXCR_SBHE, UDEXCR),
+		    "SBHE failed to clear");
+
+	sysctl_set_sbhe(1);
+	FAIL_IF_MSG(sysctl_get_sbhe() != 1, "failed to set sysctl SBHE");
+	FAIL_IF_MSG(!pr_aspect_check(PR_PPC_DEXCR_SBHE, UDEXCR),
+		    "SBHE failed to set");
+
+	sysctl_set_sbhe(-1);
+	FAIL_IF_MSG(sysctl_get_sbhe() != -1, "failed to default sysctl SBHE");
+	FAIL_IF_MSG(!pr_aspect_edit(PR_PPC_DEXCR_SBHE, PR_PPC_DEXCR_CLEAR_ASPECT), "prctl failed");
+	FAIL_IF_MSG(pr_aspect_check(PR_PPC_DEXCR_SBHE, UDEXCR),
+		    "SBHE failed to default to prctl clear setting");
+
+	FAIL_IF_MSG(!pr_aspect_edit(PR_PPC_DEXCR_SBHE, PR_PPC_DEXCR_SET_ASPECT), "prctl failed");
+	FAIL_IF_MSG(!pr_aspect_check(PR_PPC_DEXCR_SBHE, UDEXCR),
+		    "SBHE failed to default to prctl set setting");
+
+	sysctl_set_sbhe(0);
+	FAIL_IF_MSG(sysctl_get_sbhe() != 0, "failed to clear sysctl SBHE");
+	FAIL_IF_MSG(pr_aspect_check(PR_PPC_DEXCR_SBHE, UDEXCR),
+		    "SBHE failed to override prctl setting");
+
+	return 0;
+}
+
+static int dexcr_test_inherit_execve(char expected_dexcr)
+{
+	switch (expected_dexcr) {
+	case '0':
+		FAIL_IF_EXIT_MSG(pr_aspect_get(PR_PPC_DEXCR_IBRTPD) !=
+				 (PR_PPC_DEXCR_CLEAR_ASPECT | PR_PPC_DEXCR_PRCTL),
+				 "clearing IBRTPD across exec not inherited");
+
+		FAIL_IF_EXIT_MSG(pr_aspect_check(PR_PPC_DEXCR_IBRTPD, UDEXCR),
+				 "clearing IBRTPD across exec not applied");
+		break;
+	case '1':
+		FAIL_IF_EXIT_MSG(pr_aspect_get(PR_PPC_DEXCR_IBRTPD) !=
+				 (PR_PPC_DEXCR_SET_ASPECT | PR_PPC_DEXCR_PRCTL),
+				 "setting IBRTPD across exec not inherited");
+
+		FAIL_IF_EXIT_MSG(!pr_aspect_check(PR_PPC_DEXCR_IBRTPD, UDEXCR),
+				 "setting IBRTPD across exec not applied");
+		break;
+	case '2':
+		FAIL_IF_EXIT_MSG(pr_aspect_get(PR_PPC_DEXCR_IBRTPD) !=
+				 (PR_PPC_DEXCR_FORCE_SET_ASPECT | PR_PPC_DEXCR_PRCTL),
+				 "force setting IBRTPD across exec not inherited");
+
+		FAIL_IF_EXIT_MSG(!pr_aspect_check(PR_PPC_DEXCR_IBRTPD, UDEXCR),
+				 "force setting IBRTPD across exec not applied");
+		break;
+	}
+
+	return 0;
+}
+
+/*
+ * Check that a child process inherits the DEXCR over fork and execve
+ */
+static int dexcr_inherit_test(void)
+{
+	pid_t pid;
+
+	SKIP_IF_MSG(!check_cap_sysadmin(), "must have capability CAP_SYS_ADMIN");
+	SKIP_IF_MSG(!pr_aspect_supported(PR_PPC_DEXCR_IBRTPD), "IBRTPD not supported");
+
+	pr_aspect_edit(PR_PPC_DEXCR_IBRTPD, PR_PPC_DEXCR_CLEAR_ASPECT);
+	FAIL_IF_MSG(pr_aspect_check(PR_PPC_DEXCR_IBRTPD, UDEXCR),
+		    "IBRTPD failed to clear");
+
+	pid = fork();
+	if (pid == 0) {
+		char *args[] = { "dexcr_test_inherit_execve", "0", NULL };
+
+		FAIL_IF_EXIT_MSG(pr_aspect_get(PR_PPC_DEXCR_IBRTPD) !=
+				 (PR_PPC_DEXCR_CLEAR_ASPECT | PR_PPC_DEXCR_PRCTL),
+				 "clearing IBRTPD not inherited");
+
+		FAIL_IF_EXIT_MSG(pr_aspect_check(PR_PPC_DEXCR_IBRTPD, UDEXCR),
+				 "clearing IBRTPD not applied");
+
+		execve("/proc/self/exe", args, NULL);
+		_exit(errno);
+	}
+	await_child_success(pid);
+
+	pr_aspect_edit(PR_PPC_DEXCR_IBRTPD, PR_PPC_DEXCR_SET_ASPECT);
+	FAIL_IF_MSG(!pr_aspect_check(PR_PPC_DEXCR_IBRTPD, UDEXCR),
+		    "IBRTPD failed to set");
+
+	pid = fork();
+	if (pid == 0) {
+		char *args[] = { "dexcr_test_inherit_execve", "1", NULL };
+
+		FAIL_IF_EXIT_MSG(pr_aspect_get(PR_PPC_DEXCR_IBRTPD) !=
+				 (PR_PPC_DEXCR_SET_ASPECT | PR_PPC_DEXCR_PRCTL),
+				 "setting IBRTPD not inherited");
+
+		FAIL_IF_EXIT_MSG(!pr_aspect_check(PR_PPC_DEXCR_IBRTPD, UDEXCR),
+				 "setting IBRTPD not applied");
+
+		execve("/proc/self/exe", args, NULL);
+		_exit(errno);
+	}
+	await_child_success(pid);
+
+	pr_aspect_edit(PR_PPC_DEXCR_IBRTPD, PR_PPC_DEXCR_FORCE_SET_ASPECT);
+	FAIL_IF_MSG(!pr_aspect_check(PR_PPC_DEXCR_IBRTPD, UDEXCR),
+		    "IBRTPD failed to force set");
+
+	pid = fork();
+	if (pid == 0) {
+		char *args[] = { "dexcr_test_inherit_execve", "2", NULL };
+
+		FAIL_IF_EXIT_MSG(pr_aspect_get(PR_PPC_DEXCR_IBRTPD) !=
+				 (PR_PPC_DEXCR_FORCE_SET_ASPECT | PR_PPC_DEXCR_PRCTL),
+				 "force setting IBRTPD not inherited");
+
+		FAIL_IF_EXIT_MSG(!pr_aspect_check(PR_PPC_DEXCR_IBRTPD, UDEXCR),
+				 "force setting IBRTPD not applied");
+
+		execve("/proc/self/exe", args, NULL);
+		_exit(errno);
+	}
+	await_child_success(pid);
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int err = 0;
+
+	if (argc >= 2 && strcmp(argv[0], "dexcr_test_inherit_execve") == 0)
+		return dexcr_test_inherit_execve(argv[1][0]);
+
+	err |= test_harness(dexcr_prctl_sbhe_test, "dexcr_prctl_sbhe");
+	err |= test_harness(dexcr_prctl_ibrtpd_test, "dexcr_prctl_ibrtpd");
+	err |= test_harness(dexcr_prctl_srapd_test, "dexcr_prctl_srapd");
+	err |= test_harness(dexcr_sysctl_sbhe_test, "dexcr_sysctl_sbhe");
+	err |= test_harness(dexcr_inherit_test, "dexcr_inherit");
+
+	return err;
+}
-- 
2.38.1

