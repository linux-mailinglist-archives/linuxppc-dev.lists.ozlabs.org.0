Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 892091C8A77
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 14:20:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Hsws6BXqzDq7d
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 22:20:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Hsn03Vb2zDqKL
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 22:13:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=AI0yFB+0; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49Hsmz668Zz9sSc; Thu,  7 May 2020 22:13:23 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49Hsmz55Nyz9sSg; Thu,  7 May 2020 22:13:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588853603;
 bh=iYiuoZ9KVtTqqQcf6JiKbEfcmGF4hCnLnYKWhGAVES8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AI0yFB+0l2nTCcpP7tr1K0UMR43HDqxd3HiZOL3r1MEd21mGimrzyALlM2UFrrTcy
 9FUBRzouipCH5Tn5L14OYoEZCeG2KDbecEMGbsfm7tq7++PG6hyIZcx0g9NmWZp17c
 tdj6DfLhJveHGT3qGKmvwwyPIv4UUC/9fquXJ9/D+U048Yqr4iTl+Ro81+1YtIYZId
 e6MxZEzvPLB/ibRtiHnLEvH656mOSxz3tgFtmDLDIWMbJcaFeM90q0X1jCBQaadMjH
 n3SlEmUNAq7ZkW1N+PWCxF1f7WnhvdItsyg9rcMbDyQK5MSrLr4WikzN33ltWPkUSF
 YZRwqVL1SxNnQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 3/4] powerpc: trap_is_syscall() helper to hide syscall trap
 number
Date: Thu,  7 May 2020 22:13:31 +1000
Message-Id: <20200507121332.2233629-3-mpe@ellerman.id.au>
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

A new system call interrupt will be added with a new trap number.
Hide the explicit 0xc00 test behind an accessor to reduce churn
in callers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
[mpe: Make it a static inline]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/ptrace.h  | 5 +++++
 arch/powerpc/include/asm/syscall.h | 5 ++++-
 arch/powerpc/kernel/process.c      | 2 +-
 arch/powerpc/kernel/signal.c       | 2 +-
 arch/powerpc/xmon/xmon.c           | 2 +-
 5 files changed, 12 insertions(+), 4 deletions(-)

v2: mpe: Make it a static inline

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index 7c585bddc06e..5db45790a087 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -222,6 +222,11 @@ static inline void set_trap(struct pt_regs *regs, unsigned long val)
 	regs->trap = (regs->trap & TRAP_FLAGS_MASK) | (val & ~TRAP_FLAGS_MASK);
 }
 
+static inline bool trap_is_syscall(struct pt_regs *regs)
+{
+	return TRAP(regs) == 0xc00;
+}
+
 #define arch_has_single_step()	(1)
 #ifndef CONFIG_BOOK3S_601
 #define arch_has_block_step()	(true)
diff --git a/arch/powerpc/include/asm/syscall.h b/arch/powerpc/include/asm/syscall.h
index 38d62acfdce7..fd1b518eed17 100644
--- a/arch/powerpc/include/asm/syscall.h
+++ b/arch/powerpc/include/asm/syscall.h
@@ -26,7 +26,10 @@ static inline int syscall_get_nr(struct task_struct *task, struct pt_regs *regs)
 	 * This is important for seccomp so that compat tasks can set r0 = -1
 	 * to reject the syscall.
 	 */
-	return TRAP(regs) == 0xc00 ? regs->gpr[0] : -1;
+	if (trap_is_syscall(regs))
+		return regs->gpr[0];
+	else
+		return -1;
 }
 
 static inline void syscall_rollback(struct task_struct *task,
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 8af3583546b7..db766252238f 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1413,7 +1413,7 @@ void show_regs(struct pt_regs * regs)
 	print_msr_bits(regs->msr);
 	pr_cont("  CR: %08lx  XER: %08lx\n", regs->ccr, regs->xer);
 	trap = TRAP(regs);
-	if ((TRAP(regs) != 0xc00) && cpu_has_feature(CPU_FTR_CFAR))
+	if (!trap_is_syscall(regs) && cpu_has_feature(CPU_FTR_CFAR))
 		pr_cont("CFAR: "REG" ", regs->orig_gpr3);
 	if (trap == 0x200 || trap == 0x300 || trap == 0x600)
 #if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index a264989626fd..f2be9e960c2e 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -198,7 +198,7 @@ static void check_syscall_restart(struct pt_regs *regs, struct k_sigaction *ka,
 	int restart = 1;
 
 	/* syscall ? */
-	if (TRAP(regs) != 0x0C00)
+	if (!trap_is_syscall(regs))
 		return;
 
 	/* error signalled ? */
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 92761e47fb5c..a7430632bab4 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1776,7 +1776,7 @@ static void prregs(struct pt_regs *fp)
 #endif
 	printf("pc  = ");
 	xmon_print_symbol(fp->nip, " ", "\n");
-	if (TRAP(fp) != 0xc00 && cpu_has_feature(CPU_FTR_CFAR)) {
+	if (!trap_is_syscall(fp) && cpu_has_feature(CPU_FTR_CFAR)) {
 		printf("cfar= ");
 		xmon_print_symbol(fp->orig_gpr3, " ", "\n");
 	}
-- 
2.25.1

