Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBEA732610
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 05:59:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YAqUNA16;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj54r3DPRz3cPC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:59:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YAqUNA16;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj4tD0QCCz3bnr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:49:55 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3YUbR006115;
	Fri, 16 Jun 2023 03:49:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=J5bfFUJkCbfqXa43pm05PBP6cnXWgBiVC2CrdFyiyds=;
 b=YAqUNA16GSMG8SO7OQPNoLrfqko7j4PD/TtEcjcwsAwSGQlvSYCLK5BQOnPbsxIFmDIj
 Remoca8knX1YfkBoZos9UQ4UDa8aEC9mf2FLgR9/YQU8Kf0LMwyEUiVZc3aS/TBGsDQq
 lSrfPwHZ6RmyUQ1n6lasTUo5mQoGkwIE+fOXLlQf6fBoVNGt7x1uSJgWEhDuzJfLk4Iy
 2yISKDpuGz4WgEBka0b/EEAMiaHMGaYihVTq/duHrRCS8f927zf9zt4pNR7uGxMX08uk
 T2u3HtGprbP3dy3EDmKFzse0r8AGgHtsj1WCIAppQZkdtF9mXq+vFnE0pMf/i89LN12R vA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fxxrbdq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:50 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35G3YWFp006428;
	Fri, 16 Jun 2023 03:49:50 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8fxxrbdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:50 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35FNSGlv031195;
	Fri, 16 Jun 2023 03:49:48 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3r4gee44f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:48 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35G3njbQ43778480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 03:49:46 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D9F8B2004D;
	Fri, 16 Jun 2023 03:49:45 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB21720040;
	Fri, 16 Jun 2023 03:49:44 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 03:49:44 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id BC00F603DA;
	Fri, 16 Jun 2023 13:49:40 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 10/11] selftests/powerpc/dexcr: Add hashst/hashchk test
Date: Fri, 16 Jun 2023 13:48:45 +1000
Message-Id: <20230616034846.311705-11-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616034846.311705-1-bgray@linux.ibm.com>
References: <20230616034846.311705-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _Ktz5fE4F_O9xvJsaN_O10TXmejB0P06
X-Proofpoint-ORIG-GUID: c0a8eqgkSKiIV_O3rdeGIenUNH5Dmuvq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306160032
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Test the kernel DEXCR[NPHIE] interface and hashchk exception handling.

Introduces with it a DEXCR utils library for common DEXCR operations.

Volatile is used to prevent the compiler optimising away the signal
tests.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---
v1:	* Clean up dexcr makefile
	* Include kernel headers in CFLAGS
	* Use numeric literals for hashst/hashchk to support older
	  toolchains
	* A lot of other refactoring
---
 tools/testing/selftests/powerpc/Makefile      |   1 +
 .../selftests/powerpc/dexcr/.gitignore        |   1 +
 .../testing/selftests/powerpc/dexcr/Makefile  |   7 +
 tools/testing/selftests/powerpc/dexcr/dexcr.c | 132 ++++++++++
 tools/testing/selftests/powerpc/dexcr/dexcr.h |  49 ++++
 .../selftests/powerpc/dexcr/hashchk_test.c    | 227 ++++++++++++++++++
 tools/testing/selftests/powerpc/include/reg.h |   4 +
 .../testing/selftests/powerpc/include/utils.h |   4 +
 tools/testing/selftests/powerpc/utils.c       |  24 ++
 9 files changed, 449 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/dexcr/.gitignore
 create mode 100644 tools/testing/selftests/powerpc/dexcr/Makefile
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.c
 create mode 100644 tools/testing/selftests/powerpc/dexcr/dexcr.h
 create mode 100644 tools/testing/selftests/powerpc/dexcr/hashchk_test.c

diff --git a/tools/testing/selftests/powerpc/Makefile b/tools/testing/selftests/powerpc/Makefile
index ae2bfc0d822f..49f2ad1793fd 100644
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
index 000000000000..d12e4560aca9
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/.gitignore
@@ -0,0 +1 @@
+hashchk_test
diff --git a/tools/testing/selftests/powerpc/dexcr/Makefile b/tools/testing/selftests/powerpc/dexcr/Makefile
new file mode 100644
index 000000000000..16c8b489948a
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/Makefile
@@ -0,0 +1,7 @@
+TEST_GEN_PROGS := hashchk_test
+
+include ../../lib.mk
+
+$(OUTPUT)/hashchk_test: CFLAGS += -fno-pie $(call cc-option,-mno-rop-protect)
+
+$(TEST_GEN_PROGS): ../harness.c ../utils.c ./dexcr.c
diff --git a/tools/testing/selftests/powerpc/dexcr/dexcr.c b/tools/testing/selftests/powerpc/dexcr/dexcr.c
new file mode 100644
index 000000000000..65ec5347de98
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/dexcr.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <errno.h>
+#include <setjmp.h>
+#include <signal.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+
+#include "dexcr.h"
+#include "reg.h"
+#include "utils.h"
+
+static jmp_buf generic_signal_jump_buf;
+
+static void generic_signal_handler(int signum, siginfo_t *info, void *context)
+{
+	longjmp(generic_signal_jump_buf, 0);
+}
+
+bool dexcr_exists(void)
+{
+	struct sigaction old;
+	volatile bool exists;
+
+	old = push_signal_handler(SIGILL, generic_signal_handler);
+	if (setjmp(generic_signal_jump_buf))
+		goto out;
+
+	/*
+	 * If the SPR is not recognised by the hardware it triggers
+	 * a hypervisor emulation interrupt. If the kernel does not
+	 * recognise/try to emulate it, we receive a SIGILL signal.
+	 *
+	 * If we do not receive a signal, assume we have the SPR or the
+	 * kernel is trying to emulate it correctly.
+	 */
+	exists = false;
+	mfspr(SPRN_DEXCR_RO);
+	exists = true;
+
+out:
+	pop_signal_handler(SIGILL, old);
+	return exists;
+}
+
+/*
+ * Just test if a bad hashchk triggers a signal, without checking
+ * for support or if the NPHIE aspect is enabled.
+ */
+bool hashchk_triggers(void)
+{
+	struct sigaction old;
+	volatile bool triggers;
+
+	old = push_signal_handler(SIGILL, generic_signal_handler);
+	if (setjmp(generic_signal_jump_buf))
+		goto out;
+
+	triggers = true;
+	do_bad_hashchk();
+	triggers = false;
+
+out:
+	pop_signal_handler(SIGILL, old);
+	return triggers;
+}
+
+unsigned int get_dexcr(enum dexcr_source source)
+{
+	switch (source) {
+	case DEXCR:
+		return mfspr(SPRN_DEXCR_RO);
+	case HDEXCR:
+		return mfspr(SPRN_HDEXCR_RO);
+	case EFFECTIVE:
+		return mfspr(SPRN_DEXCR_RO) | mfspr(SPRN_HDEXCR_RO);
+	default:
+		FAIL_IF_EXIT_MSG(true, "bad enum dexcr_source");
+	}
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
+
+/*
+ * Perform a hashst instruction. The following components determine the result
+ *
+ * 1. The LR value (any register technically)
+ * 2. The SP value (also any register, but it must be a valid address)
+ * 3. A secret key managed by the kernel
+ *
+ * The result is stored to the address held in SP.
+ */
+void hashst(unsigned long lr, void *sp)
+{
+	asm volatile ("addi 31, %0, 0;"		/* set r31 (pretend LR) to lr */
+		      "addi 30, %1, 8;"		/* set r30 (pretend SP) to sp + 8 */
+		      PPC_RAW_HASHST(31, -8, 30)	/* compute hash into stack location */
+		      : : "r" (lr), "r" (sp) : "r31", "r30", "memory");
+}
+
+/*
+ * Perform a hashchk instruction. A hash is computed as per hashst(),
+ * however the result is not stored to memory. Instead the existing
+ * value is read and compared against the computed hash.
+ *
+ * If they match, execution continues.
+ * If they differ, an interrupt triggers.
+ */
+void hashchk(unsigned long lr, void *sp)
+{
+	asm volatile ("addi 31, %0, 0;"		/* set r31 (pretend LR) to lr */
+		      "addi 30, %1, 8;"		/* set r30 (pretend SP) to sp + 8 */
+		      PPC_RAW_HASHCHK(31, -8, 30)	/* check hash at stack location */
+		      : : "r" (lr), "r" (sp) : "r31", "r30", "memory");
+}
+
+void do_bad_hashchk(void)
+{
+	unsigned long hash = 0;
+
+	hashst(0, &hash);
+	hash += 1;
+	hashchk(0, &hash);
+}
diff --git a/tools/testing/selftests/powerpc/dexcr/dexcr.h b/tools/testing/selftests/powerpc/dexcr/dexcr.h
new file mode 100644
index 000000000000..f55cbbc8643b
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/dexcr.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
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
+#include <sys/types.h>
+
+#include "reg.h"
+
+#define DEXCR_PR_BIT(aspect)	__MASK(63 - (32 + (aspect)))
+#define DEXCR_PR_SBHE		DEXCR_PR_BIT(0)
+#define DEXCR_PR_IBRTPD		DEXCR_PR_BIT(3)
+#define DEXCR_PR_SRAPD		DEXCR_PR_BIT(4)
+#define DEXCR_PR_NPHIE		DEXCR_PR_BIT(5)
+
+#define PPC_RAW_HASH_ARGS(b, i, a) \
+	((((i) >> 3) & 0x1F) << 21 | (a) << 16 | (b) << 11 | (((i) >> 8) & 0x1))
+#define PPC_RAW_HASHST(b, i, a) \
+	str(.long (0x7C0005A4 | PPC_RAW_HASH_ARGS(b, i, a));)
+#define PPC_RAW_HASHCHK(b, i, a) \
+	str(.long (0x7C0005E4 | PPC_RAW_HASH_ARGS(b, i, a));)
+
+bool dexcr_exists(void);
+
+bool hashchk_triggers(void);
+
+enum dexcr_source {
+	DEXCR,		/* Userspace DEXCR value */
+	HDEXCR,		/* Hypervisor enforced DEXCR value */
+	EFFECTIVE,	/* Bitwise OR of UDEXCR and ENFORCED DEXCR bits */
+};
+
+unsigned int get_dexcr(enum dexcr_source source);
+
+void await_child_success(pid_t pid);
+
+void hashst(unsigned long lr, void *sp);
+
+void hashchk(unsigned long lr, void *sp);
+
+void do_bad_hashchk(void);
+
+#endif  /* _SELFTESTS_POWERPC_DEXCR_DEXCR_H */
diff --git a/tools/testing/selftests/powerpc/dexcr/hashchk_test.c b/tools/testing/selftests/powerpc/dexcr/hashchk_test.c
new file mode 100644
index 000000000000..7d5658c9ebe4
--- /dev/null
+++ b/tools/testing/selftests/powerpc/dexcr/hashchk_test.c
@@ -0,0 +1,227 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#define _GNU_SOURCE
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <sched.h>
+#include <setjmp.h>
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
+	SKIP_IF_MSG(!dexcr_exists(), "DEXCR not supported");
+	SKIP_IF_MSG(!(get_dexcr(EFFECTIVE) & DEXCR_PR_NPHIE),
+		    "DEXCR[NPHIE] not enabled");
+
+	return 0;
+}
+
+static jmp_buf hashchk_detected_buf;
+static const char *hashchk_failure_msg;
+
+static void hashchk_handler(int signum, siginfo_t *info, void *context)
+{
+	if (signum != SIGILL)
+		hashchk_failure_msg = "wrong signal received";
+	else if (info->si_code != ILL_ILLOPN)
+		hashchk_failure_msg = "wrong signal code received";
+
+	longjmp(hashchk_detected_buf, 0);
+}
+
+/*
+ * Check that hashchk triggers when DEXCR[NPHIE] is enabled
+ * and is detected as such by the kernel exception handler
+ */
+static int hashchk_detected_test(void)
+{
+	struct sigaction old;
+	int err;
+
+	err = require_nphie();
+	if (err)
+		return err;
+
+	old = push_signal_handler(SIGILL, hashchk_handler);
+	if (setjmp(hashchk_detected_buf))
+		goto out;
+
+	hashchk_failure_msg = NULL;
+	do_bad_hashchk();
+	hashchk_failure_msg = "hashchk failed to trigger";
+
+out:
+	pop_signal_handler(SIGILL, old);
+	FAIL_IF_MSG(hashchk_failure_msg, hashchk_failure_msg);
+	return 0;
+}
+
+#define HASH_COUNT 8
+
+static unsigned long hash_values[HASH_COUNT + 1];
+
+static void fill_hash_values(void)
+{
+	for (unsigned long i = 0; i < HASH_COUNT; i++)
+		hashst(i, &hash_values[i]);
+
+	/* Used to ensure the checks uses the same addresses as the hashes */
+	hash_values[HASH_COUNT] = (unsigned long)&hash_values;
+}
+
+static unsigned int count_hash_values_matches(void)
+{
+	unsigned long matches = 0;
+
+	for (unsigned long i = 0; i < HASH_COUNT; i++) {
+		unsigned long orig_hash = hash_values[i];
+		hash_values[i] = 0;
+
+		hashst(i, &hash_values[i]);
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
+static char *hashchk_exec_child_args[] = { "hashchk_exec_child", NULL };
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
+	err = require_nphie();
+	if (err)
+		return err;
+
+	FAIL_IF_MSG(pipe(pipefd), "failed to create pipe");
+
+	pid = fork();
+	if (pid == 0) {
+		if (dup2(pipefd[1], STDOUT_FILENO) == -1)
+			_exit(errno);
+
+		execve("/proc/self/exe", hashchk_exec_child_args, NULL);
+		_exit(errno);
+	}
+
+	await_child_success(pid);
+	FAIL_IF_MSG(read(pipefd[0], hash_values, sizeof(hash_values)) != sizeof(hash_values),
+		    "missing expected child output");
+
+	/* Verify the child used the same hash_values address */
+	FAIL_IF_EXIT_MSG(hash_values[HASH_COUNT] != (unsigned long)&hash_values,
+			 "bad address check");
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
+	err = require_nphie();
+	if (err)
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
+	err = require_nphie();
+	if (err)
+		return err;
+
+	child_stack = mmap(NULL, STACK_SIZE, PROT_READ | PROT_WRITE,
+			   MAP_PRIVATE | MAP_ANONYMOUS | MAP_STACK, -1, 0);
+
+	FAIL_IF_MSG(child_stack == MAP_FAILED, "failed to map child stack");
+
+	pid = clone(hashchk_clone_child_fn, child_stack + STACK_SIZE,
+		    CLONE_VM | SIGCHLD, NULL);
+
+	await_child_success(pid);
+	FAIL_IF_MSG(count_hash_values_matches() != HASH_COUNT,
+		    "different key detected");
+
+	return 0;
+}
+
+int main(int argc, char *argv[])
+{
+	int err = 0;
+
+	if (argc >= 1 && !strcmp(argv[0], hashchk_exec_child_args[0]))
+		return hashchk_exec_child();
+
+	err |= test_harness(hashchk_detected_test, "hashchk_detected");
+	err |= test_harness(hashchk_exec_random_key_test, "hashchk_exec_random_key");
+	err |= test_harness(hashchk_fork_share_key_test, "hashchk_fork_share_key");
+	err |= test_harness(hashchk_clone_share_key_test, "hashchk_clone_share_key");
+
+	return err;
+}
diff --git a/tools/testing/selftests/powerpc/include/reg.h b/tools/testing/selftests/powerpc/include/reg.h
index d5a547f72669..fad09c9d3387 100644
--- a/tools/testing/selftests/powerpc/include/reg.h
+++ b/tools/testing/selftests/powerpc/include/reg.h
@@ -19,6 +19,8 @@
 #define mb()		asm volatile("sync" : : : "memory");
 #define barrier()	asm volatile("" : : : "memory");
 
+#define SPRN_HDEXCR_RO 455	/* Userspace readonly view of SPRN_HDEXCR (471) */
+
 #define SPRN_MMCR2     769
 #define SPRN_MMCRA     770
 #define SPRN_MMCR0     779
@@ -47,6 +49,8 @@
 #define SPRN_SDAR      781
 #define SPRN_SIER      768
 
+#define SPRN_DEXCR_RO  812	/* Userspace readonly view of SPRN_DEXCR (828) */
+
 #define SPRN_TEXASR     0x82    /* Transaction Exception and Status Register */
 #define SPRN_TFIAR      0x81    /* Transaction Failure Inst Addr    */
 #define SPRN_TFHAR      0x80    /* Transaction Failure Handler Addr */
diff --git a/tools/testing/selftests/powerpc/include/utils.h b/tools/testing/selftests/powerpc/include/utils.h
index 9dc53c4fbfe3..36c30c611457 100644
--- a/tools/testing/selftests/powerpc/include/utils.h
+++ b/tools/testing/selftests/powerpc/include/utils.h
@@ -11,6 +11,7 @@
 #include <stdint.h>
 #include <stdio.h>
 #include <stdbool.h>
+#include <sys/signal.h>
 #include <linux/auxvec.h>
 #include <linux/perf_event.h>
 #include <asm/cputable.h>
@@ -111,6 +112,9 @@ static inline char *auxv_platform(void)
 bool is_ppc64le(void);
 int using_hash_mmu(bool *using_hash);
 
+struct sigaction push_signal_handler(int sig, void (*fn)(int, siginfo_t *, void *));
+struct sigaction pop_signal_handler(int sig, struct sigaction old_handler);
+
 /* Yes, this is evil */
 #define FAIL_IF(x)						\
 do {								\
diff --git a/tools/testing/selftests/powerpc/utils.c b/tools/testing/selftests/powerpc/utils.c
index 252fb4a95e90..e5f2d8735c64 100644
--- a/tools/testing/selftests/powerpc/utils.c
+++ b/tools/testing/selftests/powerpc/utils.c
@@ -618,3 +618,27 @@ int using_hash_mmu(bool *using_hash)
 	fclose(f);
 	return rc;
 }
+
+struct sigaction push_signal_handler(int sig, void (*fn)(int, siginfo_t *, void *))
+{
+	struct sigaction sa;
+	struct sigaction old_handler;
+
+	sa.sa_sigaction = fn;
+	sigemptyset(&sa.sa_mask);
+	sa.sa_flags = SA_SIGINFO;
+	FAIL_IF_EXIT_MSG(sigaction(sig, &sa, &old_handler),
+			 "failed to push signal handler");
+
+	return old_handler;
+}
+
+struct sigaction pop_signal_handler(int sig, struct sigaction old_handler)
+{
+	struct sigaction popped;
+
+	FAIL_IF_EXIT_MSG(sigaction(sig, &old_handler, &popped),
+			 "failed to pop signal handler");
+
+	return popped;
+}
-- 
2.40.1

