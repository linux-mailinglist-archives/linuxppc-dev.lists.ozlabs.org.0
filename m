Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D968D4DC8EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 15:40:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK8tq53NHz3bXP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 01:40:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=nTV00lmL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK8tF5H2hz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 01:39:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=nTV00lmL; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KK8tF0FBNz4xbs;
 Fri, 18 Mar 2022 01:39:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1647527973;
 bh=FxUdnTh3IBY26xcVI3VxTCKSNJqEqGspAm3AjFPW2+Q=;
 h=From:To:Subject:Date:From;
 b=nTV00lmLdpL8wPg/jxkrQ9slDyMlr+z9dZnom5ehd+4NzHcctmGsgW2bpF9XOvTiT
 j3KImpruspNT/qAJLUbKTZQIyOQtXPf4E0J/aVlUR1ZiqlcB3rAhfPg7eX17LU3Ojq
 i14RhE+sCM0JOcj0HU2Rp/R8aA5NsBN2SOx1glzzii8IByNkqTJEPtkOVgXaqJWrEW
 fgjimNlapCgCQPxd7+YBwWg+53hOFZbMh3AjQuO72vmQUHfVzzBHodnUUcw2VOC7H4
 LBqTA4m6MUKnW2133sCu7Z6wRYA+A3pAdXatMmXm9rjp8kMacuQidQwWlWjvb/7FvS
 3CVxU+9t2t8gw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] selftests/powerpc: Add a test of 4PB SLB handling
Date: Fri, 18 Mar 2022 01:39:25 +1100
Message-Id: <20220317143925.1030447-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.34.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a test for a bug we had in the 4PB address space SLB handling. It
was fixed in commit 4c2de74cc869 ("powerpc/64: Interrupts save PPR on
stack rather than thread_struct").

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 tools/testing/selftests/powerpc/mm/.gitignore |   1 +
 tools/testing/selftests/powerpc/mm/Makefile   |   4 +-
 .../powerpc/mm/large_vm_gpr_corruption.c      | 160 ++++++++++++++++++
 3 files changed, 164 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/powerpc/mm/large_vm_gpr_corruption.c

diff --git a/tools/testing/selftests/powerpc/mm/.gitignore b/tools/testing/selftests/powerpc/mm/.gitignore
index aac4a59f9e28..4e1a294eec35 100644
--- a/tools/testing/selftests/powerpc/mm/.gitignore
+++ b/tools/testing/selftests/powerpc/mm/.gitignore
@@ -12,3 +12,4 @@ pkey_exec_prot
 pkey_siginfo
 stack_expansion_ldst
 stack_expansion_signal
+large_vm_gpr_corruption
diff --git a/tools/testing/selftests/powerpc/mm/Makefile b/tools/testing/selftests/powerpc/mm/Makefile
index 40253abc6208..27dc09d0bfee 100644
--- a/tools/testing/selftests/powerpc/mm/Makefile
+++ b/tools/testing/selftests/powerpc/mm/Makefile
@@ -4,7 +4,8 @@
 
 TEST_GEN_PROGS := hugetlb_vs_thp_test subpage_prot prot_sao segv_errors wild_bctr \
 		  large_vm_fork_separation bad_accesses pkey_exec_prot \
-		  pkey_siginfo stack_expansion_signal stack_expansion_ldst
+		  pkey_siginfo stack_expansion_signal stack_expansion_ldst \
+		  large_vm_gpr_corruption
 TEST_PROGS := stress_code_patching.sh
 
 TEST_GEN_PROGS_EXTENDED := tlbie_test
@@ -19,6 +20,7 @@ $(OUTPUT)/prot_sao: ../utils.c
 
 $(OUTPUT)/wild_bctr: CFLAGS += -m64
 $(OUTPUT)/large_vm_fork_separation: CFLAGS += -m64
+$(OUTPUT)/large_vm_gpr_corruption: CFLAGS += -m64
 $(OUTPUT)/bad_accesses: CFLAGS += -m64
 $(OUTPUT)/pkey_exec_prot: CFLAGS += -m64
 $(OUTPUT)/pkey_siginfo: CFLAGS += -m64
diff --git a/tools/testing/selftests/powerpc/mm/large_vm_gpr_corruption.c b/tools/testing/selftests/powerpc/mm/large_vm_gpr_corruption.c
new file mode 100644
index 000000000000..8b04c6796908
--- /dev/null
+++ b/tools/testing/selftests/powerpc/mm/large_vm_gpr_corruption.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// Copyright 2022, Michael Ellerman, IBM Corp.
+//
+// Test that the 4PB address space SLB handling doesn't corrupt userspace registers
+// (r9-r13) due to a SLB fault while saving the PPR.
+//
+// The bug was introduced in f384796c4 ("powerpc/mm: Add support for handling > 512TB
+// address in SLB miss") and fixed in 4c2de74cc869 ("powerpc/64: Interrupts save PPR on
+// stack rather than thread_struct").
+//
+// To hit the bug requires the task struct and kernel stack to be in different segments.
+// Usually that requires more than 1TB of RAM, or if that's not practical, boot the kernel
+// with "disable_1tb_segments".
+//
+// The test works by creating mappings about 512TB, to trigger the large address space
+// support. It creates 64 mappings, double the size of the SLB, to cause SLB faults on
+// each access (assuming naive replacement). It then loops over those mappings touching
+// each, and checks that r9-r13 aren't corrupted.
+//
+// It then forks another child and tries again, because a new child process will get a new
+// kernel stack and thread struct allocated, which may be more optimally placed to trigger
+// the bug. It would probably be better to leave the previous child processes hanging
+// around, so that kernel stack & thread struct allocations are not reused, but that would
+// amount to a 30 second fork bomb. The current design reliably triggers the bug on
+// unpatched kernels.
+
+#include <signal.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <sys/mman.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "utils.h"
+
+
+#ifndef MAP_FIXED_NOREPLACE
+#define MAP_FIXED_NOREPLACE	MAP_FIXED	// "Should be safe" above 512TB
+#endif
+
+#define BASE_ADDRESS	(1ul << 50)	// 1PB
+#define STRIDE		(2ul << 40)	// 2TB
+
+#define SLB_SIZE	32
+#define NR_MAPPINGS	(SLB_SIZE * 2)
+
+static volatile sig_atomic_t signaled;
+
+static void signal_handler(int sig)
+{
+	signaled = 1;
+}
+
+#define CHECK_REG(_reg)							\
+	if (_reg != _reg##_orig) {					\
+		printf(str(_reg) " corrupted! Expected 0x%lx != 0x%lx\n", \
+		       _reg##_orig, _reg);				\
+		_exit(1);						\
+	}
+
+static int touch_mappings(void)
+{
+	unsigned long r9_orig, r10_orig, r11_orig, r12_orig, r13_orig;
+	unsigned long r9, r10, r11, r12, r13;
+	unsigned long addr, *p;
+	int i;
+
+	for (i = 0; i < NR_MAPPINGS; i ++) {
+		addr = BASE_ADDRESS + (i * STRIDE);
+		p = (unsigned long *)addr;
+
+		asm volatile (
+			"mr   %0, %%r9	;" // Read original GPR values
+			"mr   %1, %%r10	;"
+			"mr   %2, %%r11	;"
+			"mr   %3, %%r12	;"
+			"mr   %4, %%r13	;"
+			"std %10, 0(%11);" // Trigger SLB fault
+			"mr   %5, %%r9	;" // Save possibly corrupted values
+			"mr   %6, %%r10	;"
+			"mr   %7, %%r11	;"
+			"mr   %8, %%r12	;"
+			"mr   %9, %%r13	;"
+			"mr   %%r9,  %0	;" // Restore original values
+			"mr   %%r10, %1	;"
+			"mr   %%r11, %2	;"
+			"mr   %%r12, %3	;"
+			"mr   %%r13, %4	;"
+			: "=&b" (r9_orig), "=&b" (r10_orig), "=&b" (r11_orig),
+			  "=&b" (r12_orig), "=&b" (r13_orig), "=&b" (r9), "=&b" (r10),
+			  "=&b" (r11), "=&b" (r12), "=&b" (r13)
+			: "b" (i), "b" (p)
+			: "r9", "r10", "r11", "r12", "r13"
+		);
+
+		CHECK_REG(r9);
+		CHECK_REG(r10);
+		CHECK_REG(r11);
+		CHECK_REG(r12);
+		CHECK_REG(r13);
+	}
+
+	return 0;
+}
+
+static int test(void)
+{
+	unsigned long page_size, addr, *p;
+	struct sigaction action;
+	bool hash_mmu;
+	int i, status;
+	pid_t pid;
+
+	// This tests a hash MMU specific bug.
+	FAIL_IF(using_hash_mmu(&hash_mmu));
+	SKIP_IF(!hash_mmu);
+
+	page_size = sysconf(_SC_PAGESIZE);
+
+	for (i = 0; i < NR_MAPPINGS; i ++) {
+		addr = BASE_ADDRESS + (i * STRIDE);
+
+		p = mmap((void *)addr, page_size, PROT_READ | PROT_WRITE,
+			 MAP_PRIVATE | MAP_ANONYMOUS | MAP_FIXED_NOREPLACE, -1, 0);
+		if (p == MAP_FAILED) {
+			perror("mmap");
+			printf("Error: couldn't mmap(), confirm kernel has 4PB support?\n");
+			return 1;
+		}
+	}
+
+	action.sa_handler = signal_handler;
+	action.sa_flags = SA_RESTART;
+	FAIL_IF(sigaction(SIGALRM, &action, NULL) < 0);
+
+	// Seen to always crash in under ~10s on affected kernels.
+	alarm(30);
+
+	while (!signaled) {
+		// Fork new processes, to increase the chance that we hit the case where
+		// the kernel stack and task struct are in different segments.
+		pid = fork();
+		if (pid == 0)
+			exit(touch_mappings());
+
+		FAIL_IF(waitpid(-1, &status, 0) == -1);
+		FAIL_IF(WIFSIGNALED(status));
+		FAIL_IF(!WIFEXITED(status));
+		FAIL_IF(WEXITSTATUS(status));
+	}
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(test, "large_vm_gpr_corruption");
+}
-- 
2.34.1

