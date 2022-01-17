Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1123F490F40
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jan 2022 18:17:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jcz9c756xz3fxg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jan 2022 04:17:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Sn/5D8HI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Sn/5D8HI; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jcyrr4jzBz3cWC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jan 2022 04:02:52 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0727D611F0;
 Mon, 17 Jan 2022 17:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4BDCC36AEC;
 Mon, 17 Jan 2022 17:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642438970;
 bh=fgpNcpGwTQOlUCWiGZGZm/cuplCzU4SORglq/H8Knog=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Sn/5D8HIa2xg7ZUOcBqACG2Ksld12GGFGzDemTMfbpbAKKrjWiQy2lSLz3PgmwrRD
 D88q3sZbT5TiXQsFiXhxf7RP7EOgvIA32l4RBcGo+0TLDY1sXt6eiVqE+CgQ83C4zI
 dhce2W4ZQP+gxn7ydA11iXJoTDQR28Vw5KCN85jxMUafBfwKG6Ll6H34S4vuN6/IBG
 Gjq8j4s1nl1I8RV2bGviLw6WphsJ0p8gsDTQr68utTgJBXsi8b7uJjKTi3RYFmDUPz
 M5gcqca+PUC8ACfot+SUYDI1oQSJ+yWdYqe4rLC+7y10FL3aIsgG3/JaB5SBfVZtfS
 qEQGurZTcGVCQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 33/44] selftests/powerpc: Add a test of
 sigreturning to the kernel
Date: Mon, 17 Jan 2022 12:01:16 -0500
Message-Id: <20220117170127.1471115-33-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220117170127.1471115-1-sashal@kernel.org>
References: <20220117170127.1471115-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, shuah@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit a8968521cfdc3e339fe69473d6632e0aa8d7202a ]

We have a general signal fuzzer, sigfuz, which can modify the MSR & NIP
before sigreturn. But the chance of it hitting a kernel address and also
clearing MSR_PR is fairly slim.

So add a specific test of sigreturn to a kernel address, both with and
without attempting to clear MSR_PR (which the kernel must block).

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20211209115944.4062384-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../selftests/powerpc/signal/.gitignore       |   1 +
 .../testing/selftests/powerpc/signal/Makefile |   1 +
 .../powerpc/signal/sigreturn_kernel.c         | 132 ++++++++++++++++++
 3 files changed, 134 insertions(+)
 create mode 100644 tools/testing/selftests/powerpc/signal/sigreturn_kernel.c

diff --git a/tools/testing/selftests/powerpc/signal/.gitignore b/tools/testing/selftests/powerpc/signal/.gitignore
index ce3375cd8e73e..8f6c816099a48 100644
--- a/tools/testing/selftests/powerpc/signal/.gitignore
+++ b/tools/testing/selftests/powerpc/signal/.gitignore
@@ -4,3 +4,4 @@ signal_tm
 sigfuz
 sigreturn_vdso
 sig_sc_double_restart
+sigreturn_kernel
diff --git a/tools/testing/selftests/powerpc/signal/Makefile b/tools/testing/selftests/powerpc/signal/Makefile
index d6ae54663aed7..84e201572466d 100644
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
index 0000000000000..0a1b6e591eeed
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
2.34.1

