Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EC0639FD4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 03:56:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NL9962t3Nz3fCD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 13:56:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dve+CnAA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dve+CnAA;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NL8wp1HZqz2xmg
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 13:46:01 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS1uNlj009989;
	Mon, 28 Nov 2022 02:45:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xnO99GV6FZKmKDSWmMrbNNguEUqgXx4mcKo7NJL7RaE=;
 b=Dve+CnAAayGmb/vaXMD7N6fL4SXne6lILLne+09kGkOpolMDvVk72km09B2Ddy5iFXDf
 hviOJ+qKntH3l07muDk9OvtWgFB1avL8Bf5MMgq+79dDhOwuY9uLEqUCkRpGq2zv3HVk
 GjDz1Ag7ow1NdkXNavor0PkskU1u1rB2XtyhqIVensaXP/+jd7xCuawx8N+dVhhmhBg5
 HHhvyo4TS54mXqVw75kGYjM1MTmn/gdKSPddelaZmLljuYMuOYrrNmPh9uKtqvIpsmBA
 M1mQ6f92GT1TILqo3a8d7YYKlOGs3RdhoalIiFN/JgSuzutTQ0ZB47/M/93b1lgfS5FU wg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vy1ujbe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:49 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS2ZTtv023833;
	Mon, 28 Nov 2022 02:45:47 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3m3ae91bkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 02:45:47 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS2jjvS1114868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 02:45:45 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5038DA404D;
	Mon, 28 Nov 2022 02:45:45 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A53ADA4040;
	Mon, 28 Nov 2022 02:45:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 02:45:44 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6E09560949;
	Mon, 28 Nov 2022 13:45:39 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 10/13] selftests/powerpc: Add hashst/hashchk test
Date: Mon, 28 Nov 2022 13:44:55 +1100
Message-Id: <20221128024458.46121-11-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221128024458.46121-1-bgray@linux.ibm.com>
References: <20221128024458.46121-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: CyZqrih2KQM7CAvPQ2ZeIfCUA4tyLrn7
X-Proofpoint-ORIG-GUID: CyZqrih2KQM7CAvPQ2ZeIfCUA4tyLrn7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_02,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 mlxscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280018
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

Test the kernel DEXCR[NPHIE] interface and hashchk exception handling.

Introduces with it a DEXCR utils library for common DEXCR operations.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 tools/testing/selftests/powerpc/Makefile      |   1 +
 .../selftests/powerpc/dexcr/.gitignore        |   1 +
 .../testing/selftests/powerpc/dexcr/Makefile  |   9 +
 tools/testing/selftests/powerpc/dexcr/dexcr.c | 118 +++++++++
 tools/testing/selftests/powerpc/dexcr/dexcr.h |  52 ++++
 .../selftests/powerpc/dexcr/hashchk_test.c    | 229 ++++++++++++++++++
 tools/testing/selftests/powerpc/include/reg.h |   4 +
 7 files changed, 414 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/dexcr/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/dexcr/Makefile
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.h
 create mode 100644 tools/testing/selftests/powerpc/dexcr/hashchk_test.c

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index 6ba95cd19e42..00dbd000ee01 100644
--- a/tools/testing/selftests/powerpc/Makefile
+++ b/tools/testing/selftests/powerpc/Makefile
@@ -17,6 +17,7 @@ SUB_DIRS = alignment		\
 	   benchmarks		\
 	   cache_shape		\
 	   copyloops		\
+	   dexcr		\
 	   dscr			\
 	   mm			\
 	   nx-gzip		\
diff --git a/tools/testing/selftests/powerpc/dexcr/.gitignore b/tools/testing/selftests/powerpc/dexcr/.gitignore
new file mode 100644
index 000000000000..37adb7f47832
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/.gitignore
@@ -0,0 +1 @@
+hashchk_user
diff --git a/tools/testing/selftests/powerpc/dexcr/Makefile b/tools/testing/selftests/powerpc/dexcr/Makefile
new file mode 100644
index 000000000000..4b4380d4d986
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/Makefile
@@ -0,0 +1,9 @@
+TEST_GEN_PROGS := hashchk_test
+
+TEST_FILES := settings
+top_srcdir = ../../../../..
+include ../../lib.mk
+
+HASHCHK_TEST_CFLAGS = -no-pie $(call cc-option,-mno-rop-protect)
+
+$(TEST_GEN_PROGS): ../harness.c ../utils.c ./dexcr.c
diff --git a/tools/testing/selftests/powerpc/dexcr/dexcr.c b/tools/testing/selftests/powerpc/dexcr/dexcr.c
new file mode 100644
index 000000000000..3e7cb581d4a2
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/dexcr.c
@@ -0,0 +1,118 @@
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/capability.h>
+#include <sys/prctl.h>
+#include <sys/wait.h>
+
+#include "dexcr.h"
+#include "reg.h"
+#include "utils.h"
+
+long sysctl_get_sbhe(void)
+{
+	long value;
+
+	FAIL_IF_EXIT_MSG(read_long(SYSCTL_DEXCR_SBHE, &value, 10),
+			 "failed to read " SYSCTL_DEXCR_SBHE);
+
+	return value;
+}
+
+void sysctl_set_sbhe(long value)
+{
+	FAIL_IF_EXIT_MSG(write_long(SYSCTL_DEXCR_SBHE, value, 10),
+			 "failed to write to " SYSCTL_DEXCR_SBHE);
+}
+
+unsigned int pr_aspect_to_dexcr_mask(unsigned long which)
+{
+	switch (which) {
+	case PR_PPC_DEXCR_SBHE:
+		return DEXCR_PRO_SBHE;
+	case PR_PPC_DEXCR_IBRTPD:
+		return DEXCR_PRO_IBRTPD;
+	case PR_PPC_DEXCR_SRAPD:
+		return DEXCR_PRO_SRAPD;
+	case PR_PPC_DEXCR_NPHIE:
+		return DEXCR_PRO_NPHIE;
+	default:
+		FAIL_IF_EXIT_MSG(true, "unknown PR aspect");
+	}
+}
+
+static inline unsigned int get_dexcr_pro(void)
+{
+	return mfspr(SPRN_DEXCR);
+}
+
+static inline unsigned int get_dexcr_enf(void)
+{
+	return mfspr(SPRN_HDEXCR);
+}
+
+static inline unsigned int get_dexcr_eff(void)
+{
+	return get_dexcr_pro() | get_dexcr_enf();
+}
+
+unsigned int get_dexcr(enum DexcrSource source)
+{
+	switch (source) {
+	case UDEXCR:
+		return get_dexcr_pro();
+	case ENFORCED:
+		return get_dexcr_enf();
+	case EFFECTIVE:
+		return get_dexcr_eff();
+	default:
+		FAIL_IF_EXIT_MSG(true, "bad DEXCR source");
+	}
+}
+
+bool pr_aspect_supported(unsigned long which)
+{
+	return prctl(PR_PPC_GET_DEXCR, which, 0, 0, 0) >= 0;
+}
+
+bool pr_aspect_editable(unsigned long which)
+{
+	int ret = prctl(PR_PPC_GET_DEXCR, which, 0, 0, 0);
+	return ret > 0 && (ret & PR_PPC_DEXCR_PRCTL) > 0;
+}
+
+bool pr_aspect_edit(unsigned long which, unsigned long ctrl)
+{
+	return prctl(PR_PPC_SET_DEXCR, which, ctrl, 0, 0) == 0;
+}
+
+bool pr_aspect_check(unsigned long which, enum DexcrSource source)
+{
+	unsigned int dexcr = get_dexcr(source);
+	unsigned int aspect = pr_aspect_to_dexcr_mask(which);
+	return (dexcr & aspect) != 0;
+}
+
+int pr_aspect_get(unsigned long pr_aspect)
+{
+	int ret = prctl(PR_PPC_GET_DEXCR, pr_aspect, 0, 0, 0);
+	FAIL_IF_EXIT_MSG(ret < 0, "prctl failed");
+	return ret;
+}
+
+bool dexcr_pro_check(unsigned int pro, enum DexcrSource source)
+{
+	return (get_dexcr(source) & pro) != 0;
+}
+
+void await_child_success(pid_t pid)
+{
+	int wstatus;
+
+	FAIL_IF_EXIT_MSG(pid == -1, "fork failed");
+	FAIL_IF_EXIT_MSG(waitpid(pid, &wstatus, 0) == -1, "wait failed");
+	FAIL_IF_EXIT_MSG(!WIFEXITED(wstatus), "child did not exit cleanly");
+	FAIL_IF_EXIT_MSG(WEXITSTATUS(wstatus) != 0, "child exit error");
+}
diff --git a/tools/testing/selftests/powerpc/dexcr/dexcr.h b/tools/testing/selftests/powerpc/dexcr/dexcr.h
new file mode 100644
index 000000000000..fb8007bf19f8
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/dexcr.h
@@ -0,0 +1,52 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * POWER Dynamic Execution Control Facility (DEXCR)
+ *
+ * This header file contains helper functions and macros
+ * required for all the DEXCR related test cases.
+ */
+#ifndef _SELFTESTS_POWERPC_DEXCR_DEXCR_H
+#define _SELFTESTS_POWERPC_DEXCR_DEXCR_H
+
+#include <stdbool.h>
+#include <sys/prctl.h>
+#include <unistd.h>
+
+#include "reg.h"
+#include "utils.h"
+
+#define DEXCR_PRO_MASK(aspect)	__MASK(63 - (32 + (aspect)))
+#define DEXCR_PRO_SBHE		DEXCR_PRO_MASK(0)
+#define DEXCR_PRO_IBRTPD	DEXCR_PRO_MASK(3)
+#define DEXCR_PRO_SRAPD		DEXCR_PRO_MASK(4)
+#define DEXCR_PRO_NPHIE		DEXCR_PRO_MASK(5)
+
+enum DexcrSource {
+	UDEXCR,		/* Userspace DEXCR value */
+	ENFORCED,	/* Enforced by hypervisor */
+	EFFECTIVE,	/* Bitwise OR of requested and enforced DEXCR bits */
+};
+
+unsigned int get_dexcr(enum DexcrSource source);
+
+bool pr_aspect_supported(unsigned long which);
+
+bool pr_aspect_editable(unsigned long which);
+
+bool pr_aspect_edit(unsigned long which, unsigned long ctrl);
+
+bool pr_aspect_check(unsigned long which, enum DexcrSource source);
+
+int pr_aspect_get(unsigned long which);
+
+unsigned int pr_aspect_to_dexcr_mask(unsigned long which);
+
+bool dexcr_pro_check(unsigned int pro, enum DexcrSource source);
+
+long sysctl_get_sbhe(void);
+
+void sysctl_set_sbhe(long value);
+
+void await_child_success(pid_t pid);
+
+#endif  /* _SELFTESTS_POWERPC_DEXCR_DEXCR_H */
diff --git a/tools/testing/selftests/powerpc/dexcr/hashchk_test.c b/tools/testing/selftests/powerpc/dexcr/hashchk_test.c
new file mode 100644
index 000000000000..3351bdbdaf13
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/hashchk_test.c
@@ -0,0 +1,229 @@
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <sched.h>
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sys/mman.h>
+#include <sys/prctl.h>
+#include <unistd.h>
+
+#include "dexcr.h"
+#include "utils.h"
+
+static int require_nphie(void)
+{
+	SKIP_IF_MSG(!pr_aspect_supported(PR_PPC_DEXCR_NPHIE),
+		    "DEXCR[NPHIE] not supported");
+
+	if (dexcr_pro_check(DEXCR_PRO_NPHIE, EFFECTIVE))
+		return 0;
+
+	pr_aspect_edit(PR_PPC_DEXCR_NPHIE, PR_PPC_DEXCR_FORCE_SET_ASPECT);
+	FAIL_IF_EXIT_MSG(!dexcr_pro_check(DEXCR_PRO_NPHIE, EFFECTIVE),
+			 "failed to enable DEXCR[NPIHE]");
+
+	return 0;
+}
+
+static void sigill_handler_enabled(int signum, siginfo_t *info, void *context)
+{
+	SIGSAFE_FAIL_IF_EXIT_MSG(signum != SIGILL, "wrong signal received");
+	SIGSAFE_FAIL_IF_EXIT_MSG(info->si_code != ILL_ILLOPN, "wrong signal-code received");
+	exit(0);
+}
+
+static void do_bad_hashchk(void)
+{
+	unsigned long hash = 0;
+	void *hash_p = ((void *)&hash) + 8;	/* hash* offset must be at least -8 */
+
+	asm ("li 3, 0;"			/* set r3 (pretend LR) to known value */
+	     "hashst 3, -8(%1);"	/* compute good hash */
+	     "addi 3, 3, 1;"		/* modify hash */
+	     "hashchk 3, -8(%1);"	/* check bad hash */
+	     : "+m" (hash) : "r" (hash_p) : "r3");
+}
+
+/*
+ * Check that hashchk triggers when DEXCR[NPHIE] is enabled
+ * and is detected as such by the kernel exception handler
+ */
+static int hashchk_enabled_test(void)
+{
+	int err;
+	struct sigaction sa;
+
+	if ((err = require_nphie()))
+		return err;
+
+	sa.sa_sigaction = sigill_handler_enabled;
+	sigemptyset(&sa.sa_mask);
+	sa.sa_flags = SA_SIGINFO;
+	FAIL_IF_MSG(sigaction(SIGILL, &sa, NULL), "cannot install signal handler");
+
+	do_bad_hashchk();
+
+	FAIL_IF_MSG(true, "hashchk failed to trigger");
+}
+
+#define HASH_COUNT 8
+
+static unsigned long hash_values[HASH_COUNT + 1];
+
+static void fill_hash_values(void)
+{
+	for (unsigned long i = 0; i < HASH_COUNT; i++) {
+		void *hash_addr = ((void*)&hash_values[i]) + 8;
+
+		asm volatile ("hashst %2, -8(%1);"
+			      : "+m" (hash_values[i]) : "r" (hash_addr), "r" (i));
+	}
+
+	hash_values[HASH_COUNT] = (unsigned long)&hash_values;
+}
+
+static unsigned int count_hash_values_matches(void)
+{
+	unsigned long matches = 0;
+
+	FAIL_IF_EXIT_MSG(hash_values[HASH_COUNT] != (unsigned long)hash_values,
+			 "bad address check");
+
+	for (unsigned long i = 0; i < HASH_COUNT; i++) {
+		unsigned long orig_hash = hash_values[i];
+		void *hash_addr = ((void*)&hash_values[i]) + 8;
+
+		asm volatile ("hashst %2, -8(%1);"
+			      : "+m" (hash_values[i]) : "r" (hash_addr), "r" (i));
+
+		if (hash_values[i] == orig_hash)
+			matches++;
+	}
+
+	return matches;
+}
+
+static int hashchk_exec_child(void)
+{
+	ssize_t count;
+
+	fill_hash_values();
+
+	count = write(STDOUT_FILENO, hash_values, sizeof(hash_values));
+	return count == sizeof(hash_values) ? 0 : EOVERFLOW;
+}
+
+/*
+ * Check that new programs get different keys so a malicious process
+ * can't recreate a victim's hash values.
+ */
+static int hashchk_exec_random_key_test(void)
+{
+	pid_t pid;
+	int err;
+	int pipefd[2];
+
+	if ((err = require_nphie()))
+		return err;
+
+	FAIL_IF_MSG(pipe(pipefd), "failed to create pipe");
+
+	pid = fork();
+	if (pid == 0) {
+		char *args[] = { "hashchk_exec_child", NULL };
+
+		if (dup2(pipefd[1], STDOUT_FILENO) == -1)
+			_exit(errno);
+
+		execve("/proc/self/exe", args, NULL);
+		_exit(errno);
+	}
+
+	await_child_success(pid);
+	FAIL_IF_MSG(read(pipefd[0], hash_values, sizeof(hash_values)) != sizeof(hash_values),
+		    "missing expected child output");
+
+	/* If all hashes are the same it means (most likely) same key */
+	FAIL_IF_MSG(count_hash_values_matches() == HASH_COUNT, "shared key detected");
+
+	return 0;
+}
+
+/*
+ * Check that forks share the same key so that existing hash values
+ * remain valid.
+ */
+static int hashchk_fork_share_key_test(void)
+{
+	pid_t pid;
+	int err;
+
+	if ((err = require_nphie()))
+		return err;
+
+	fill_hash_values();
+
+	pid = fork();
+	if (pid == 0) {
+		if (count_hash_values_matches() != HASH_COUNT)
+			_exit(1);
+		_exit(0);
+	}
+
+	await_child_success(pid);
+	return 0;
+}
+
+#define STACK_SIZE (1024 * 1024)
+
+static int hashchk_clone_child_fn(void *args)
+{
+	fill_hash_values();
+	return 0;
+}
+
+/*
+ * Check that threads share the same key so that existing hash values
+ * remain valid.
+ */
+static int hashchk_clone_share_key_test(void)
+{
+	void *child_stack;
+	pid_t pid;
+	int err;
+
+	if ((err = require_nphie()))
+		return err;
+
+	child_stack = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
+
+	FAIL_IF_MSG(child_stack == MAP_FAILED, "failed to map child stack");
+
+	pid = clone(hashchk_clone_child_fn, child_stack + STACK_SIZE, CLONE_VM | SIGCHLD, NULL);
+
+	await_child_success(pid);
+	FAIL_IF_MSG(count_hash_values_matches() != HASH_COUNT, "different key detected");
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int err = 0;
+
+	if (argc >= 1 && !strcmp(argv[0], "hashchk_exec_child"))
+		return hashchk_exec_child();
+
+	err |= test_harness(hashchk_enabled_test, "hashchk_enabled");
+	err |= test_harness(hashchk_exec_random_key_test, "hashchk_exec_random_key");
+	err |= test_harness(hashchk_fork_share_key_test, "hashchk_fork_share_key");
+	err |= test_harness(hashchk_clone_share_key_test, "hashchk_clone_share_key");
+
+	return err;
+}
diff --git a/tools/testing/selftests/powerpc/include/reg.h b/tools/testing/selftests/powerpc/include/reg.h
index d5a547f72669..cbb5979cb3e2 100644
--- a/tools/testing/selftests/powerpc/include/reg.h
+++ b/tools/testing/selftests/powerpc/include/reg.h
@@ -19,6 +19,8 @@
 #define mb()		asm volatile("sync" : : : "memory");
 #define barrier()	asm volatile("" : : : "memory");
 
+#define SPRN_HDEXCR    455
+
 #define SPRN_MMCR2     769
 #define SPRN_MMCRA     770
 #define SPRN_MMCR0     779
@@ -47,6 +49,8 @@
 #define SPRN_SDAR      781
 #define SPRN_SIER      768
 
+#define SPRN_DEXCR     812
+
 #define SPRN_TEXASR     0x82    /* Transaction Exception and Status Register */
 #define SPRN_TFIAR      0x81    /* Transaction Failure Inst Addr    */
 #define SPRN_TFHAR      0x80    /* Transaction Failure Handler Addr */
-- 
2.38.1

