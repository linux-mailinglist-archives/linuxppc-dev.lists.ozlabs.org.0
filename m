Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FB311C8AA0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 14:23:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ht042Cc3zDqTj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 22:23:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Hsn10gmKzDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 22:13:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=YLuON8kn; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49Hsn074bCz9sSd; Thu,  7 May 2020 22:13:24 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49Hsn05Ng8z9sSc; Thu,  7 May 2020 22:13:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588853604;
 bh=7klthqnKP+WJBXmiO5Nthe8sggkNsy4AyWvAnkVbbyQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YLuON8knJrfiZKXgV8eDr4PC+8jAUoO0V8Wz7ay1AUkfmKGVdV++XVuO0WFpqCone
 WL4EmhyNgv1FMDAkvRuRCNn2XlcziD9k/t0GqP7bxScAFpkIMTLph6jKtA9u7vu1Ag
 n0+Y7RD60NDBP+X3PutS3hvmfpTk94mH36gMbdmQ0/Yt23Z0peH0npmB3LpCcyxAT6
 rGlJVi0SNsxiCaYbb5EuTZUoyj4pzCmii8IFOgf6IymB9IKhBs+5/HQ4v9qytyQD2P
 rRweayViBxA5v94gzAg9olLdGk3bQq7RG9QuLUQPX9Z/pxgf6dlCXktiinoRnzpKEA
 tsBNTObqOiZhA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 4/4] powerpc: Use trap metadata to prevent double restart
 rather than zeroing trap
Date: Thu,  7 May 2020 22:13:32 +1000
Message-Id: <20200507121332.2233629-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200507121332.2233629-1-mpe@ellerman.id.au>
References: <20200507121332.2233629-1-mpe@ellerman.id.au>
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

From: Nicholas Piggin <npiggin@gmail.com>

It's not very nice to zero trap for this, because then system calls no
longer have trap_is_syscall(regs) invariant, and we can't distinguish
between sc and scv system calls (in a later patch).

Take one last unused bit from the low bits of the pt_regs.trap word
for this instead. There is not a really good reason why it should be
in trap as opposed to another field, but trap has some concept of
flags and it exists. Ideally I think we would move trap to 2-byte
field and have 2 more bytes available independently.

Add a selftests case for this, which can be seen to fail if
trap_norestart() is changed to return false.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[mpe: Make them static inlines]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/ptrace.h             |  22 ++-
 arch/powerpc/kernel/signal.c                  |   7 +-
 arch/powerpc/kernel/signal_32.c               |   2 +-
 arch/powerpc/kernel/signal_64.c               |  10 +-
 .../testing/selftests/powerpc/signal/Makefile |   2 +-
 .../powerpc/signal/sig_sc_double_restart.c    | 174 ++++++++++++++++++
 6 files changed, 201 insertions(+), 16 deletions(-)
 create mode 100644 tools/testing/selftests/powerpc/signal/sig_sc_double_restart.c

v2: mpe: Make them static inlines

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 5db45790a087..b92877a81626 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -182,13 +182,13 @@ extern int ptrace_put_reg(struct task_struct *task, int regno,
 
 #ifdef __powerpc64__
 #ifdef CONFIG_PPC_BOOK3S
-#define TRAP_FLAGS_MASK		0
-#define TRAP(regs)		((regs)->trap)
+#define TRAP_FLAGS_MASK		0x10
+#define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
 #define FULL_REGS(regs)		true
 #define SET_FULL_REGS(regs)	do { } while (0)
 #else
-#define TRAP_FLAGS_MASK		0x1
-#define TRAP(regs)		((regs)->trap & ~0x1)
+#define TRAP_FLAGS_MASK		0x11
+#define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
 #define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
 #define SET_FULL_REGS(regs)	((regs)->trap |= 1)
 #endif
@@ -202,8 +202,8 @@ extern int ptrace_put_reg(struct task_struct *task, int regno,
  * On 4xx we use the next bit to indicate whether the exception
  * is a critical exception (1 means it is).
  */
-#define TRAP_FLAGS_MASK		0xF
-#define TRAP(regs)		((regs)->trap & ~0xF)
+#define TRAP_FLAGS_MASK		0x1F
+#define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
 #define FULL_REGS(regs)		(((regs)->trap & 1) == 0)
 #define SET_FULL_REGS(regs)	((regs)->trap |= 1)
 #define IS_CRITICAL_EXC(regs)	(((regs)->trap & 2) != 0)
@@ -227,6 +227,16 @@ static inline bool trap_is_syscall(struct pt_regs *regs)
 	return TRAP(regs) == 0xc00;
 }
 
+static inline bool trap_norestart(struct pt_regs *regs)
+{
+	return regs->trap & 0x10;
+}
+
+static inline void set_trap_norestart(struct pt_regs *regs)
+{
+	regs->trap |= 16;
+}
+
 #define arch_has_single_step()	(1)
 #ifndef CONFIG_BOOK3S_601
 #define arch_has_block_step()	(true)
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index f2be9e960c2e..a46c3fdb6853 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -201,6 +201,9 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 	if (!trap_is_syscall(regs))
 		return;
 
+	if (trap_norestart(regs))
+		return;
+
 	/* error signalled ? */
 	if (!(regs->ccr & 0x10000000))
 		return;
@@ -258,7 +261,7 @@ static void do_signal(struct task_struct *tsk)
 	if (ksig.sig <= 0) {
 		/* No signal to deliver -- put the saved sigmask back */
 		restore_saved_sigmask();
-		tsk->thread.regs->trap = 0;
+		set_trap_norestart(tsk->thread.regs);
 		return;               /* no signals delivered */
 	}
 
@@ -285,7 +288,7 @@ static void do_signal(struct task_struct *tsk)
 		ret = handle_rt_signal64(&ksig, oldset, tsk);
 	}
 
-	tsk->thread.regs->trap = 0;
+	set_trap_norestart(tsk->thread.regs);
 	signal_setup_done(ret, &ksig, test_thread_flag(TIF_SINGLESTEP));
 }
 
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 4f96d29a22bf..ae3da7440b2f 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -500,7 +500,7 @@ static long restore_user_regs(struct pt_regs *regs,
 	if (!sig)
 		save_r2 = (unsigned int)regs->gpr[2];
 	err = restore_general_regs(regs, sr);
-	regs->trap = 0;
+	set_trap_norestart(regs);
 	err |= __get_user(msr, &sr->mc_gregs[PT_MSR]);
 	if (!sig)
 		regs->gpr[2] = (unsigned long) save_r2;
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index adfde59cf4ba..77061915897f 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -350,8 +350,8 @@ static long restore_sigcontext(struct task_struct *tsk, sigset_t *set, int sig,
 	err |= __get_user(regs->link, &sc->gp_regs[PT_LNK]);
 	err |= __get_user(regs->xer, &sc->gp_regs[PT_XER]);
 	err |= __get_user(regs->ccr, &sc->gp_regs[PT_CCR]);
-	/* skip SOFTE */
-	regs->trap = 0;
+	/* Don't allow userspace to set SOFTE */
+	set_trap_norestart(regs);
 	err |= __get_user(regs->dar, &sc->gp_regs[PT_DAR]);
 	err |= __get_user(regs->dsisr, &sc->gp_regs[PT_DSISR]);
 	err |= __get_user(regs->result, &sc->gp_regs[PT_RESULT]);
@@ -472,10 +472,8 @@ static long restore_tm_sigcontexts(struct task_struct *tsk,
 			  &sc->gp_regs[PT_XER]);
 	err |= __get_user(tsk->thread.ckpt_regs.ccr,
 			  &sc->gp_regs[PT_CCR]);
-
-	/* Don't allow userspace to set the trap value */
-	regs->trap = 0;
-
+	/* Don't allow userspace to set SOFTE */
+	set_trap_norestart(regs);
 	/* These regs are not checkpointed; they can go in 'regs'. */
 	err |= __get_user(regs->dar, &sc->gp_regs[PT_DAR]);
 	err |= __get_user(regs->dsisr, &sc->gp_regs[PT_DSISR]);
diff --git a/tools/testing/selftests/powerpc/signal/Makefile b/tools/testing/selftests/powerpc/signal/Makefile
index 932a032bf036..d6ae54663aed 100644
--- a/tools/testing/selftests/powerpc/signal/Makefile
+++ b/tools/testing/selftests/powerpc/signal/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-TEST_GEN_PROGS := signal signal_tm sigfuz sigreturn_vdso
+TEST_GEN_PROGS := signal signal_tm sigfuz sigreturn_vdso sig_sc_double_restart
 
 CFLAGS += -maltivec
 $(OUTPUT)/signal_tm: CFLAGS += -mhtm
diff --git a/tools/testing/selftests/powerpc/signal/sig_sc_double_restart.c b/tools/testing/selftests/powerpc/signal/sig_sc_double_restart.c
new file mode 100644
index 000000000000..64732adf3d91
--- /dev/null
+++ b/tools/testing/selftests/powerpc/signal/sig_sc_double_restart.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Test that a syscall does not get restarted twice.
+ *
+ * Based on Al's description, and a test for the bug fixed in this commit:
+ *
+ * commit 9a81c16b527528ad307843be5571111aa8d35a80
+ * Author: Al Viro <viro@zeniv.linux.org.uk>
+ * Date:   Mon Sep 20 21:48:57 2010 +0100
+ *
+ *  powerpc: fix double syscall restarts
+ *
+ *  Make sigreturn zero regs->trap, make do_signal() do the same on all
+ *  paths.  As it is, signal interrupting e.g. read() from fd 512 (==
+ *  ERESTARTSYS) with another signal getting unblocked when the first
+ *  handler finishes will lead to restart one insn earlier than it ought
+ *  to.  Same for multiple signals with in-kernel handlers interrupting
+ *  that sucker at the same time.  Same for multiple signals of any kind
+ *  interrupting that sucker on 64bit...
+ */
+#define _GNU_SOURCE
+#include <sys/types.h>
+#include <sys/wait.h>
+#include <sys/syscall.h>
+#include <unistd.h>
+#include <signal.h>
+#include <errno.h>
+#include <stdlib.h>
+#include <stdio.h>
+#include <string.h>
+
+#include "utils.h"
+
+static void SIGUSR1_handler(int sig)
+{
+	kill(getpid(), SIGUSR2);
+	/*
+	 * SIGUSR2 is blocked until the handler exits, at which point it will
+	 * be raised again and think there is a restart to be done because the
+	 * pending restarted syscall has 512 (ERESTARTSYS) in r3. The second
+	 * restart will retreat NIP another 4 bytes to fail case branch.
+	 */
+}
+
+static void SIGUSR2_handler(int sig)
+{
+}
+
+static ssize_t raw_read(int fd, void *buf, size_t count)
+{
+	register long nr asm("r0") = __NR_read;
+	register long _fd asm("r3") = fd;
+	register void *_buf asm("r4") = buf;
+	register size_t _count asm("r5") = count;
+
+	asm volatile(
+"		b	0f		\n"
+"		b	1f		\n"
+"	0:	sc	0		\n"
+"		bns	2f		\n"
+"		neg	%0,%0		\n"
+"		b	2f		\n"
+"	1:				\n"
+"		li	%0,%4		\n"
+"	2:				\n"
+		: "+r"(_fd), "+r"(nr), "+r"(_buf), "+r"(_count)
+		: "i"(-ENOANO)
+		: "memory", "r6", "r7", "r8", "r9", "r10", "r11", "r12", "ctr", "cr0");
+
+	if (_fd < 0) {
+		errno = -_fd;
+		_fd = -1;
+	}
+
+	return _fd;
+}
+
+#define DATA "test 123"
+#define DLEN (strlen(DATA)+1)
+
+int test_restart(void)
+{
+	int pipefd[2];
+	pid_t pid;
+	char buf[512];
+
+	if (pipe(pipefd) == -1) {
+		perror("pipe");
+		exit(EXIT_FAILURE);
+	}
+
+	pid = fork();
+	if (pid == -1) {
+		perror("fork");
+		exit(EXIT_FAILURE);
+	}
+
+	if (pid == 0) { /* Child reads from pipe */
+		struct sigaction act;
+		int fd;
+
+		memset(&act, 0, sizeof(act));
+		sigaddset(&act.sa_mask, SIGUSR2);
+		act.sa_handler = SIGUSR1_handler;
+		act.sa_flags = SA_RESTART;
+		if (sigaction(SIGUSR1, &act, NULL) == -1) {
+			perror("sigaction");
+			exit(EXIT_FAILURE);
+		}
+
+		memset(&act, 0, sizeof(act));
+		act.sa_handler = SIGUSR2_handler;
+		act.sa_flags = SA_RESTART;
+		if (sigaction(SIGUSR2, &act, NULL) == -1) {
+			perror("sigaction");
+			exit(EXIT_FAILURE);
+		}
+
+		/* Let's get ERESTARTSYS into r3 */
+		while ((fd = dup(pipefd[0])) != 512) {
+			if (fd == -1) {
+				perror("dup");
+				exit(EXIT_FAILURE);
+			}
+		}
+
+		if (raw_read(fd, buf, 512) == -1) {
+			if (errno == ENOANO) {
+				fprintf(stderr, "Double restart moved restart before sc instruction.\n");
+				_exit(EXIT_FAILURE);
+			}
+			perror("read");
+			exit(EXIT_FAILURE);
+		}
+
+		if (strncmp(buf, DATA, DLEN)) {
+			fprintf(stderr, "bad test string %s\n", buf);
+			exit(EXIT_FAILURE);
+		}
+
+		return 0;
+
+	} else {
+		int wstatus;
+
+		usleep(100000);		/* Hack to get reader waiting */
+		kill(pid, SIGUSR1);
+		usleep(100000);
+		if (write(pipefd[1], DATA, DLEN) != DLEN) {
+			perror("write");
+			exit(EXIT_FAILURE);
+		}
+		close(pipefd[0]);
+		close(pipefd[1]);
+		if (wait(&wstatus) == -1) {
+			perror("wait");
+			exit(EXIT_FAILURE);
+		}
+		if (!WIFEXITED(wstatus)) {
+			fprintf(stderr, "child exited abnormally\n");
+			exit(EXIT_FAILURE);
+		}
+
+		FAIL_IF(WEXITSTATUS(wstatus) != EXIT_SUCCESS);
+
+		return 0;
+	}
+}
+
+int main(void)
+{
+	test_harness_set_timeout(10);
+	return test_harness(test_restart, "sig sys restart");
+}
-- 
2.25.1

