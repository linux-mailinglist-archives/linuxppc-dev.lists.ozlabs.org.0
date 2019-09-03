Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C831A604F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 06:49:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Mvcz1VZZzDqYV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 14:49:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Mvb81llkzDqfL
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 14:48:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="JbrQ7pUN"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 46Mvb74j29z9sPQ;
 Tue,  3 Sep 2019 14:48:03 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1567486084;
 bh=Ze1/2oesVjMCJ08hSZ8MNj/OKAFMmkot/ICeKcECvkg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JbrQ7pUN8hQPT2po9gvTajFBe9ysh6hQX+mQg9WwGtrTbztSaw6KCSHxxEqYcl1jv
 /wXUXmuNmVojSKrMBrDCn0uhqXgD0ZfdNREAFulPVQEH98HiS1x+hN8YVobnxFneLH
 FjGgIFNPY3cVXoICtgIxCRrmKbxYuq8ZDkThCgYQmPeD7NE5aHjjiQNEOHvd6VeRbX
 YU66FnCCyoacNK14PoYO1deMNKvMEBRmtfrbPodfZeSBoRGJUE06kgdIdzOGhQZn8d
 1aCMvzRDQ88sKx75pHXSvRmoMr8qksNmuvSE65NiCaYg5GtetxsoCyqmWztUWbfzci
 VoKgd61PeRvFg==
Received: by neuling.org (Postfix, from userid 1000)
 id 898232A5820; Tue,  3 Sep 2019 14:48:03 +1000 (AEST)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH 3/3] powerpc/tm: Add tm-poison test
Date: Tue,  3 Sep 2019 14:47:18 +1000
Message-Id: <20190903044718.13773-3-mikey@neuling.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190903044718.13773-1-mikey@neuling.org>
References: <20190903044718.13773-1-mikey@neuling.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, cyrilbur@gmail.com,
 Gustavo Romero <gromero@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Gustavo Romero <gromero@linux.ibm.com>

Add TM selftest to check if FP or VEC register values from one process
can leak into another process when both run on the same CPU.

This tests for CVE-2019-15030 and CVE-2019-15031.

Signed-off-by: Gustavo Romero <gromero@linux.ibm.com>
Signed-off-by: Michael Neuling <mikey@neuling.org>
---
 tools/testing/selftests/powerpc/tm/.gitignore |   1 +
 tools/testing/selftests/powerpc/tm/Makefile   |   2 +-
 .../testing/selftests/powerpc/tm/tm-poison.c  | 180 ++++++++++++++++++
 3 files changed, 182 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/tm/tm-poison.c

diff --git a/tools/testing/selftests/powerpc/tm/.gitignore b/tools/testing/selftests/powerpc/tm/.gitignore
index 951fe855f7..98f2708d86 100644
--- a/tools/testing/selftests/powerpc/tm/.gitignore
+++ b/tools/testing/selftests/powerpc/tm/.gitignore
@@ -17,3 +17,4 @@ tm-vmx-unavail
 tm-unavailable
 tm-trap
 tm-sigreturn
+tm-poison
diff --git a/tools/testing/selftests/powerpc/tm/Makefile b/tools/testing/selftests/powerpc/tm/Makefile
index c0734ed0ef..b15a1a325b 100644
--- a/tools/testing/selftests/powerpc/tm/Makefile
+++ b/tools/testing/selftests/powerpc/tm/Makefile
@@ -5,7 +5,7 @@ SIGNAL_CONTEXT_CHK_TESTS := tm-signal-context-chk-gpr tm-signal-context-chk-fpu
 TEST_GEN_PROGS := tm-resched-dscr tm-syscall tm-signal-msr-resv tm-signal-stack \
 	tm-vmxcopy tm-fork tm-tar tm-tmspr tm-vmx-unavail tm-unavailable tm-trap \
 	$(SIGNAL_CONTEXT_CHK_TESTS) tm-sigreturn tm-signal-sigreturn-nt \
-	tm-signal-context-force-tm
+	tm-signal-context-force-tm tm-poison
 
 top_srcdir = ../../../../..
 include ../../lib.mk
diff --git a/tools/testing/selftests/powerpc/tm/tm-poison.c b/tools/testing/selftests/powerpc/tm/tm-poison.c
new file mode 100644
index 0000000000..0113da7a8d
--- /dev/null
+++ b/tools/testing/selftests/powerpc/tm/tm-poison.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright 2019, Gustavo Romero, Michael Neuling, IBM Corp.
+ *
+ * This test will spawn two processes. Both will be attached to the same
+ * CPU (CPU 0). The child will be in a loop writing to FP register f31 and
+ * VMX/VEC/Altivec register vr31 a known value, called poison, calling
+ * sched_yield syscall after to allow the parent to switch on the CPU.
+ * Parent will set f31 and vr31 to 1 and in a loop will check if f31 and
+ * vr31 remain 1 as expected until a given timeout (2m). If the issue is
+ * present child's poison will leak into parent's f31 or vr31 registers,
+ * otherwise, poison will never leak into parent's f31 and vr31 registers.
+ *
+ * This test for CVE-2019-15030 and CVE-2019-15031.
+ */
+
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+#include <inttypes.h>
+#include <sched.h>
+#include <sys/types.h>
+#include <signal.h>
+
+#include "tm.h"
+
+int tm_poison_test(void)
+{
+	int pid;
+	cpu_set_t cpuset;
+	uint64_t poison = 0xdeadbeefc0dec0fe;
+	uint64_t unknown = 0;
+	bool fail_fp = false;
+	bool fail_vr = false;
+
+	SKIP_IF(!have_htm());
+
+	/* Attach both Child and Parent to CPU 0 */
+	CPU_ZERO(&cpuset);
+	CPU_SET(0, &cpuset);
+	sched_setaffinity(0, sizeof(cpuset), &cpuset);
+
+	pid = fork();
+	if (!pid) {
+		/**
+		 * child
+		 */
+		while (1) {
+			sched_yield();
+			asm (
+				"mtvsrd 31, %[poison];" // f31 = poison
+				"mtvsrd 63, %[poison];" // vr31 = poison
+
+				: : [poison] "r" (poison) : );
+		}
+	}
+
+	/**
+	 * parent
+	 */
+	asm (
+		/*
+		 * Set r3, r4, and f31 to known value 1 before entering
+		 * in transaction. They won't be written after that.
+		 */
+		"       li      3, 0x1          ;"
+		"       li      4, 0x1          ;"
+		"       mtvsrd  31, 4           ;"
+
+		/*
+		 * The Time Base (TB) is a 64-bit counter register that is
+		 * independent of the CPU clock and which is incremented
+		 * at a frequency of 512000000 Hz, so every 1.953125ns.
+		 * So it's necessary 120s/0.000000001953125s = 61440000000
+		 * increments to get a 2 minutes timeout. Below we set that
+		 * value in r5 and then use r6 to track initial TB value,
+		 * updating TB values in r7 at every iteration and comparing it
+		 * to r6. When r7 (current) - r6 (initial) > 61440000000 we bail
+		 * out since for sure we spent already 2 minutes in the loop.
+		 * SPR 268 is the TB register.
+		 */
+		"       lis     5, 14           ;"
+		"       ori     5, 5, 19996     ;"
+		"       sldi    5, 5, 16        ;" // r5 = 61440000000
+
+		"       mfspr   6, 268          ;" // r6 (TB initial)
+		"1:     mfspr   7, 268          ;" // r7 (TB current)
+		"       subf    7, 6, 7         ;" // r7 - r6 > 61440000000 ?
+		"       cmpd    7, 5            ;"
+		"       bgt     3f              ;" // yes, exit
+
+		/*
+		 * Main loop to check f31
+		 */
+		"       tbegin.                 ;" // no, try again
+		"       beq     1b              ;" // restart if no timeout
+		"       mfvsrd  3, 31           ;" // read f31
+		"       cmpd    3, 4            ;" // f31 == 1 ?
+		"       bne     2f              ;" // broken :-(
+		"       tabort. 3               ;" // try another transaction
+		"2:     tend.                   ;" // commit transaction
+		"3:     mr    %[unknown], 3     ;" // record r3
+
+		: [unknown] "=r" (unknown)
+		:
+		: "cr0", "r3", "r4", "r5", "r6", "r7", "vs31"
+
+		);
+
+	/*
+	 * On leak 'unknown' will contain 'poison' value from child,
+	 * otherwise (no leak) 'unknown' will contain the same value
+	 * as r3 before entering in transactional mode, i.e. 0x1.
+	 */
+	fail_fp = unknown != 0x1;
+	if (fail_fp)
+		printf("Unknown value %#lx leaked into f31!\n", unknown);
+	else
+		printf("Good, no poison or leaked value into FP registers\n");
+
+	asm (
+		/*
+		 * Set r3, r4, and vr31 to known value 1 before entering
+		 * in transaction. They won't be written after that.
+		 */
+		"       li      3, 0x1          ;"
+		"       li      4, 0x1          ;"
+		"       mtvsrd  63, 4           ;"
+
+		"       lis     5, 14           ;"
+		"       ori     5, 5, 19996     ;"
+		"       sldi    5, 5, 16        ;" // r5 = 61440000000
+
+		"       mfspr   6, 268          ;" // r6 (TB initial)
+		"1:     mfspr   7, 268          ;" // r7 (TB current)
+		"       subf    7, 6, 7         ;" // r7 - r6 > 61440000000 ?
+		"       cmpd    7, 5            ;"
+		"       bgt     3f              ;" // yes, exit
+
+		/*
+		 * Main loop to check vr31
+		 */
+		"       tbegin.                 ;" // no, try again
+		"       beq     1b              ;" // restart if no timeout
+		"       mfvsrd  3, 63           ;" // read vr31
+		"       cmpd    3, 4            ;" // vr31 == 1 ?
+		"       bne     2f              ;" // broken :-(
+		"       tabort. 3               ;" // try another transaction
+		"2:     tend.                   ;" // commit transaction
+		"3:     mr    %[unknown], 3     ;" // record r3
+
+		: [unknown] "=r" (unknown)
+		:
+		: "cr0", "r3", "r4", "r5", "r6", "r7", "vs63"
+
+		);
+
+	/*
+	 * On leak 'unknown' will contain 'poison' value from child,
+	 * otherwise (no leak) 'unknown' will contain the same value
+	 * as r3 before entering in transactional mode, i.e. 0x1.
+	 */
+	fail_vr = unknown != 0x1;
+	if (fail_vr)
+		printf("Unknown value %#lx leaked into vr31!\n", unknown);
+	else
+		printf("Good, no poison or leaked value into VEC registers\n");
+
+	kill(pid, SIGKILL);
+
+	return (fail_fp | fail_vr);
+}
+
+int main(int argc, char *argv[])
+{
+	/* Test completes in about 4m */
+	test_harness_set_timeout(250);
+	return test_harness(tm_poison_test, "tm_poison_test");
+}
-- 
2.21.0

