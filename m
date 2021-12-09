Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A42A46E7EF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 13:00:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8szn3zQgz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 23:00:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=EBjuIeoU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8sz85YDZz2xXD
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 22:59:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=EBjuIeoU; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J8sz74DJhz4xhj;
 Thu,  9 Dec 2021 22:59:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1639051187;
 bh=4/ZzbNbM13Ua/At6Q1d4JjNpTL5tcvBrXZzAFZJdQAE=;
 h=From:To:Cc:Subject:Date:From;
 b=EBjuIeoUwtvKSq3I5Q4fXwJK1yTXBqAo0ddYIfCzfMDUVlQvZboJBgEALIZ/31fEd
 uuabw4mlYIKjbi06bQX3S4z8IUlkkHlyRCdZbi6gTg5QoIlJakWO+y56q3BV3KEynN
 1CFLR0kbmHrygqvz2lDjKr8HPO1wuC6Wfjg0VvNiXOSutKUlxUTshgXvwyNnIO+NIk
 fDxoubiuK2jiov1jWdnfCTA6/hioJusYGoymrmRaUErWnZphYnAuxBr6cdvItl+kxZ
 8TmTqTWRK2jOr9fCHEgMBL6Cth8ARHfw8/wlv2uBoRFmm75mFDUPsQXX5wTG2C9FDo
 9r6RxNkn1Av+w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] selftests/powerpc: Add a test of sigreturning to the kernel
Date: Thu,  9 Dec 2021 22:59:44 +1100
Message-Id: <20211209115944.4062384-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have a general signal fuzzer, sigfuz, which can modify the MSR & NIP
before sigreturn. But the chance of it hitting a kernel address and also
clearing MSR_PR is fairly slim.

So add a specific test of sigreturn to a kernel address, both with and
without attempting to clear MSR_PR (which the kernel must block).

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 .../testing/selftests/powerpc/signal/Makefile |   1 +
 .../powerpc/signal/sigreturn_kernel.c         | 132 ++++++++++++++++++
 2 files changed, 133 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/signal/sigreturn_kernel.c

diff --git a/tools/testing/selftests/powerpc/signal/Makefile b/tools/testing/selftests/powerpc/signal/Makefile
index d6ae54663aed..84e201572466 100644
--- a/tools/testing/selftests/powerpc/signal/Makefile
+++ b/tools/testing/selftests/powerpc/signal/Makefile
@@ -1,5 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 TEST_GEN_PROGS := signal signal_tm sigfuz sigreturn_vdso sig_sc_double_restart
+TEST_GEN_PROGS += sigreturn_kernel
 
 CFLAGS += -maltivec
 $(OUTPUT)/signal_tm: CFLAGS += -mhtm
diff --git a/tools/testing/selftests/powerpc/signal/sigreturn_kernel.c b/tools/testing/selftests/powerpc/signal/sigreturn_kernel.c
new file mode 100644
index 000000000000..0a1b6e591eee
--- /dev/null
+++ b/tools/testing/selftests/powerpc/signal/sigreturn_kernel.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Test that we can't sigreturn to kernel addresses, or to kernel mode.
+ */
+
+#define _GNU_SOURCE
+
+#include <stdio.h>
+#include <signal.h>
+#include <stdlib.h>
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <unistd.h>
+
+#include "utils.h"
+
+#define MSR_PR (1ul << 14)
+
+static volatile unsigned long long sigreturn_addr;
+static volatile unsigned long long sigreturn_msr_mask;
+
+static void sigusr1_handler(int signo, siginfo_t *si, void *uc_ptr)
+{
+	ucontext_t *uc = (ucontext_t *)uc_ptr;
+
+	if (sigreturn_addr)
+		UCONTEXT_NIA(uc) = sigreturn_addr;
+
+	if (sigreturn_msr_mask)
+		UCONTEXT_MSR(uc) &= sigreturn_msr_mask;
+}
+
+static pid_t fork_child(void)
+{
+	pid_t pid;
+
+	pid = fork();
+	if (pid == 0) {
+		raise(SIGUSR1);
+		exit(0);
+	}
+
+	return pid;
+}
+
+static int expect_segv(pid_t pid)
+{
+	int child_ret;
+
+	waitpid(pid, &child_ret, 0);
+	FAIL_IF(WIFEXITED(child_ret));
+	FAIL_IF(!WIFSIGNALED(child_ret));
+	FAIL_IF(WTERMSIG(child_ret) != 11);
+
+	return 0;
+}
+
+int test_sigreturn_kernel(void)
+{
+	struct sigaction act;
+	int child_ret, i;
+	pid_t pid;
+
+	act.sa_sigaction = sigusr1_handler;
+	act.sa_flags = SA_SIGINFO;
+	sigemptyset(&act.sa_mask);
+
+	FAIL_IF(sigaction(SIGUSR1, &act, NULL));
+
+	for (i = 0; i < 2; i++) {
+		// Return to kernel
+		sigreturn_addr = 0xcull << 60;
+		pid = fork_child();
+		expect_segv(pid);
+
+		// Return to kernel virtual
+		sigreturn_addr = 0xc008ull << 48;
+		pid = fork_child();
+		expect_segv(pid);
+
+		// Return out of range
+		sigreturn_addr = 0xc010ull << 48;
+		pid = fork_child();
+		expect_segv(pid);
+
+		// Return to no-man's land, just below PAGE_OFFSET
+		sigreturn_addr = (0xcull << 60) - (64 * 1024);
+		pid = fork_child();
+		expect_segv(pid);
+
+		// Return to no-man's land, above TASK_SIZE_4PB
+		sigreturn_addr = 0x1ull << 52;
+		pid = fork_child();
+		expect_segv(pid);
+
+		// Return to 0xd space
+		sigreturn_addr = 0xdull << 60;
+		pid = fork_child();
+		expect_segv(pid);
+
+		// Return to 0xe space
+		sigreturn_addr = 0xeull << 60;
+		pid = fork_child();
+		expect_segv(pid);
+
+		// Return to 0xf space
+		sigreturn_addr = 0xfull << 60;
+		pid = fork_child();
+		expect_segv(pid);
+
+		// Attempt to set PR=0 for 2nd loop (should be blocked by kernel)
+		sigreturn_msr_mask = ~MSR_PR;
+	}
+
+	printf("All children killed as expected\n");
+
+	// Don't change address, just MSR, should return to user as normal
+	sigreturn_addr = 0;
+	sigreturn_msr_mask = ~MSR_PR;
+	pid = fork_child();
+	waitpid(pid, &child_ret, 0);
+	FAIL_IF(!WIFEXITED(child_ret));
+	FAIL_IF(WIFSIGNALED(child_ret));
+	FAIL_IF(WEXITSTATUS(child_ret) != 0);
+
+	return 0;
+}
+
+int main(void)
+{
+	return test_harness(test_sigreturn_kernel, "sigreturn_kernel");
+}
-- 
2.31.1

