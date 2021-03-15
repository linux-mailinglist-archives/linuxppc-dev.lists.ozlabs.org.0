Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D0033A9F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 04:21:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzMCg6NCYz3dLs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:21:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=d4SXUydm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d4SXUydm; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzM772VFHz3cQH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 14:17:55 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id 30so10029849ple.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 20:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jAwtRsOv8O/7M1UZvQlVhR1vwsKHgs5ba/+l79GxyM0=;
 b=d4SXUydmGvWvwWHcNYLJe7p0wHumZW9Vyem3cxfqxpOoCqXsMKtbAMPtPZeO+SwXVx
 TA1qcveIMoztTywCHW50Tyd3N890CiPy9VnOfGs//7xt1OyQwW2d8C65uXeJICuGJgOV
 MWfXltPw1b8i0xSvgQVVqz2GsdvjbeNWeL3dhdarSU76NRYAPUVhYyLLjU2ycO48hI9W
 d3HXKk0swzn4Kx8LYBGuW3z84ACmyRhw8Bz/u/cZoWYhKGvT34Px7cIaJL2laS1LQJMV
 +M4eP7+lzpqF1YLZIkx/AohHDAmYqqZ/dQ0vhO2myKT/BVZmKbPNKSu6Iq0NlPGm82YE
 fOYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jAwtRsOv8O/7M1UZvQlVhR1vwsKHgs5ba/+l79GxyM0=;
 b=qzyshKbGXTg5nSVPv6jVUlPe5pS1J2gFRVz7xqhXPf0lVYTrTY3dG8dNteAhfJak4K
 BnU7qnrMikRv6XYrz1QYsPd3oCK85ohY6MrvUgHShhPU1PJH0C9g70Qr0zyIAJJMk2Im
 UIF2YftcEct5GL28j2vjjuk6KlHOW75ijEiM7oswY/UeNNJ8+ZgRcmNb63hBRYH6YaoD
 trbX2BFdrxPRyG9i1cbQgwf9jPTkyR0ux0sUMbeQIqchapBei4zrnwuPRl/8PtbELSt4
 7yKwdCnzzzicZ5VvjczRyaC2RSnh5EFBIL2vHsUARAT2cP6aKxKDlpIKXFX0HhjUCxMS
 qBLw==
X-Gm-Message-State: AOAM530cQsAoa45azi+icrQlUXONIu/YPIK0etA2NUGZVuQ+vTnJsZuA
 b7gwscYSX1Ozo/aHW3BCKTVoKptG0AY=
X-Google-Smtp-Source: ABdhPJy13qCoSQ80oJNrZ3qAV145cG3SBPdRZlJk3CSay91eB9Eo/5JEsPWmPAYGgT2iRQe0Bkpoqw==
X-Received: by 2002:a17:90a:bd95:: with SMTP id
 z21mr10869521pjr.214.1615778272542; 
 Sun, 14 Mar 2021 20:17:52 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 j22sm8517740pjz.3.2021.03.14.20.17.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 20:17:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/10] powerpc: remove partial register save logic
Date: Mon, 15 Mar 2021 13:17:15 +1000
Message-Id: <20210315031716.3940350-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210315031716.3940350-1-npiggin@gmail.com>
References: <20210315031716.3940350-1-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All subarchitectures always save all GPRs to pt_regs interrupt frames
now. Remove FULL_REGS and associated bits.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/ptrace.h        | 17 ++---------------
 arch/powerpc/kernel/align.c              |  6 ------
 arch/powerpc/kernel/interrupt.c          |  3 ---
 arch/powerpc/kernel/process.c            | 12 ------------
 arch/powerpc/kernel/ptrace/ptrace-view.c | 21 ---------------------
 arch/powerpc/kernel/ptrace/ptrace.c      |  2 --
 arch/powerpc/kernel/ptrace/ptrace32.c    |  4 ----
 arch/powerpc/kernel/signal_32.c          |  3 ---
 arch/powerpc/kernel/signal_64.c          |  2 --
 arch/powerpc/kernel/traps.c              |  1 -
 arch/powerpc/lib/sstep.c                 |  4 ----
 arch/powerpc/xmon/xmon.c                 | 23 +++++++----------------
 12 files changed, 9 insertions(+), 89 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index c5b3669918f4..91194fdd5d01 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -188,29 +188,16 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
 #ifdef __powerpc64__
 #define TRAP_FLAGS_MASK		0x10
 #define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
-#define FULL_REGS(regs)		true
-#define SET_FULL_REGS(regs)	do { } while (0)
-#define CHECK_FULL_REGS(regs)	do { } while (0)
-#define NV_REG_POISON		0xdeadbeefdeadbeefUL
 #else
 /*
- * We use the least-significant bit of the trap field to indicate
- * whether we have saved the full set of registers, or only a
- * partial set.  A 1 there means the partial set.
- * On 4xx we use the next bit to indicate whether the exception
+ * On 4xx we use bit 1 in the trap word to indicate whether the exception
  * is a critical exception (1 means it is).
  */
-#define TRAP_FLAGS_MASK		0x1F
+#define TRAP_FLAGS_MASK		0x1E
 #define TRAP(regs)		((regs)->trap & ~TRAP_FLAGS_MASK)
-#define FULL_REGS(regs)		true
-#define SET_FULL_REGS(regs)	do { } while (0)
 #define IS_CRITICAL_EXC(regs)	(((regs)->trap & 2) != 0)
 #define IS_MCHECK_EXC(regs)	(((regs)->trap & 4) != 0)
 #define IS_DEBUG_EXC(regs)	(((regs)->trap & 8) != 0)
-#define NV_REG_POISON		0xdeadbeef
-#define CHECK_FULL_REGS(regs)						      \
-do {									      \
-} while (0)
 #endif /* __powerpc64__ */
 
 static inline void set_trap(struct pt_regs *regs, unsigned long val)
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index c7797eb958c7..ae525397947e 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -299,12 +299,6 @@ int fix_alignment(struct pt_regs *regs)
 	struct instruction_op op;
 	int r, type;
 
-	/*
-	 * We require a complete register set, if not, then our assembly
-	 * is broken
-	 */
-	CHECK_FULL_REGS(regs);
-
 	if (unlikely(__get_user_instr(instr, (void __user *)regs->nip)))
 		return -EFAULT;
 	if ((regs->msr & MSR_LE) != (MSR_KERNEL & MSR_LE)) {
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 2a017d98973a..96ca27ef68ae 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -51,7 +51,6 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
 		BUG_ON(!(regs->msr & MSR_RI));
 	BUG_ON(!(regs->msr & MSR_PR));
-	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(arch_irq_disabled_regs(regs));
 
 #ifdef CONFIG_PPC_PKEY
@@ -369,7 +368,6 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
 	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
 		BUG_ON(!(regs->msr & MSR_RI));
 	BUG_ON(!(regs->msr & MSR_PR));
-	BUG_ON(!FULL_REGS(regs));
 	BUG_ON(arch_irq_disabled_regs(regs));
 #ifdef CONFIG_PPC_BOOK3S_64
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
@@ -457,7 +455,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
 	    unlikely(!(regs->msr & MSR_RI)))
 		unrecoverable_exception(regs);
 	BUG_ON(regs->msr & MSR_PR);
-	BUG_ON(!FULL_REGS(regs));
 	/*
 	 * CT_WARN_ON comes here via program_check_exception,
 	 * so avoid recursion.
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 7989d9ce468b..1e62a70a29aa 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1447,11 +1447,9 @@ static void print_msr_bits(unsigned long val)
 #ifdef CONFIG_PPC64
 #define REG		"%016lx"
 #define REGS_PER_LINE	4
-#define LAST_VOLATILE	13
 #else
 #define REG		"%08lx"
 #define REGS_PER_LINE	8
-#define LAST_VOLATILE	12
 #endif
 
 static void __show_regs(struct pt_regs *regs)
@@ -1487,8 +1485,6 @@ static void __show_regs(struct pt_regs *regs)
 		if ((i % REGS_PER_LINE) == 0)
 			pr_cont("\nGPR%02d: ", i);
 		pr_cont(REG " ", regs->gpr[i]);
-		if (i == LAST_VOLATILE && !FULL_REGS(regs))
-			break;
 	}
 	pr_cont("\n");
 	/*
@@ -1691,7 +1687,6 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 	} else {
 		/* user thread */
 		struct pt_regs *regs = current_pt_regs();
-		CHECK_FULL_REGS(regs);
 		*childregs = *regs;
 		if (usp)
 			childregs->gpr[1] = usp;
@@ -1796,13 +1791,6 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 	regs->ccr = 0;
 	regs->gpr[1] = sp;
 
-	/*
-	 * We have just cleared all the nonvolatile GPRs, so make
-	 * FULL_REGS(regs) return true.  This is necessary to allow
-	 * ptrace to examine the thread immediately after exec.
-	 */
-	SET_FULL_REGS(regs);
-
 #ifdef CONFIG_PPC32
 	regs->mq = 0;
 	regs->nip = start;
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 2bad8068f598..8eb826aa2a10 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -221,17 +221,9 @@ static int gpr_get(struct task_struct *target, const struct user_regset *regset,
 #ifdef CONFIG_PPC64
 	struct membuf to_softe = membuf_at(&to, offsetof(struct pt_regs, softe));
 #endif
-	int i;
-
 	if (target->thread.regs == NULL)
 		return -EIO;
 
-	if (!FULL_REGS(target->thread.regs)) {
-		/* We have a partial register set.  Fill 14-31 with bogus values */
-		for (i = 14; i < 32; i++)
-			target->thread.regs->gpr[i] = NV_REG_POISON;
-	}
-
 	membuf_write(&to, target->thread.regs, sizeof(struct user_pt_regs));
 
 	membuf_store(&to_msr, get_user_msr(target));
@@ -252,8 +244,6 @@ static int gpr_set(struct task_struct *target, const struct user_regset *regset,
 	if (target->thread.regs == NULL)
 		return -EIO;
 
-	CHECK_FULL_REGS(target->thread.regs);
-
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf,
 				 target->thread.regs,
 				 0, PT_MSR * sizeof(reg));
@@ -723,19 +713,9 @@ static int gpr32_get(struct task_struct *target,
 		     const struct user_regset *regset,
 		     struct membuf to)
 {
-	int i;
-
 	if (target->thread.regs == NULL)
 		return -EIO;
 
-	if (!FULL_REGS(target->thread.regs)) {
-		/*
-		 * We have a partial register set.
-		 * Fill 14-31 with bogus values.
-		 */
-		for (i = 14; i < 32; i++)
-			target->thread.regs->gpr[i] = NV_REG_POISON;
-	}
 	return gpr32_get_common(target, regset, to,
 			&target->thread.regs->gpr[0]);
 }
@@ -748,7 +728,6 @@ static int gpr32_set(struct task_struct *target,
 	if (target->thread.regs == NULL)
 		return -EIO;
 
-	CHECK_FULL_REGS(target->thread.regs);
 	return gpr32_set_common(target, regset, pos, count, kbuf, ubuf,
 			&target->thread.regs->gpr[0]);
 }
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 4f3d4ff3728c..f59883902b35 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -59,7 +59,6 @@ long arch_ptrace(struct task_struct *child, long request,
 		if ((addr & (sizeof(long) - 1)) || !child->thread.regs)
 			break;
 
-		CHECK_FULL_REGS(child->thread.regs);
 		if (index < PT_FPR0)
 			ret = ptrace_get_reg(child, (int) index, &tmp);
 		else
@@ -81,7 +80,6 @@ long arch_ptrace(struct task_struct *child, long request,
 		if ((addr & (sizeof(long) - 1)) || !child->thread.regs)
 			break;
 
-		CHECK_FULL_REGS(child->thread.regs);
 		if (index < PT_FPR0)
 			ret = ptrace_put_reg(child, index, data);
 		else
diff --git a/arch/powerpc/kernel/ptrace/ptrace32.c b/arch/powerpc/kernel/ptrace/ptrace32.c
index d30b9ad70edc..19c224808982 100644
--- a/arch/powerpc/kernel/ptrace/ptrace32.c
+++ b/arch/powerpc/kernel/ptrace/ptrace32.c
@@ -83,7 +83,6 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 		if ((addr & 3) || (index > PT_FPSCR32))
 			break;
 
-		CHECK_FULL_REGS(child->thread.regs);
 		if (index < PT_FPR0) {
 			ret = ptrace_get_reg(child, index, &tmp);
 			if (ret)
@@ -133,7 +132,6 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 		if ((addr & 3) || numReg > PT_FPSCR)
 			break;
 
-		CHECK_FULL_REGS(child->thread.regs);
 		if (numReg >= PT_FPR0) {
 			flush_fp_to_thread(child);
 			/* get 64 bit FPR */
@@ -187,7 +185,6 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 		if ((addr & 3) || (index > PT_FPSCR32))
 			break;
 
-		CHECK_FULL_REGS(child->thread.regs);
 		if (index < PT_FPR0) {
 			ret = ptrace_put_reg(child, index, data);
 		} else {
@@ -226,7 +223,6 @@ long compat_arch_ptrace(struct task_struct *child, compat_long_t request,
 		 */
 		if ((addr & 3) || (numReg > PT_FPSCR))
 			break;
-		CHECK_FULL_REGS(child->thread.regs);
 		if (numReg < PT_FPR0) {
 			unsigned long freg;
 			ret = ptrace_get_reg(child, numReg, &freg);
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 75ee918a120a..73551237de9d 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -99,8 +99,6 @@ save_general_regs_unsafe(struct pt_regs *regs, struct mcontext __user *frame)
 	elf_greg_t64 *gregs = (elf_greg_t64 *)regs;
 	int val, i;
 
-	WARN_ON(!FULL_REGS(regs));
-
 	for (i = 0; i <= PT_RESULT; i ++) {
 		/* Force usr to alway see softe as 1 (interrupts enabled) */
 		if (i == PT_SOFTE)
@@ -153,7 +151,6 @@ static inline int get_sigset_t(sigset_t *set, const sigset_t __user *uset)
 static __always_inline int
 save_general_regs_unsafe(struct pt_regs *regs, struct mcontext __user *frame)
 {
-	WARN_ON(!FULL_REGS(regs));
 	unsafe_copy_to_user(&frame->mc_gregs, regs, GP_REGS_SIZE, failed);
 	return 0;
 
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index f9e4a1ac440f..0e3637722e97 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -160,7 +160,6 @@ static long setup_sigcontext(struct sigcontext __user *sc,
 	}
 #endif /* CONFIG_VSX */
 	err |= __put_user(&sc->gp_regs, &sc->regs);
-	WARN_ON(!FULL_REGS(regs));
 	err |= __copy_to_user(&sc->gp_regs, regs, GP_REGS_SIZE);
 	err |= __put_user(msr, &sc->gp_regs[PT_MSR]);
 	err |= __put_user(softe, &sc->gp_regs[PT_SOFTE]);
@@ -294,7 +293,6 @@ static long setup_tm_sigcontexts(struct sigcontext __user *sc,
 
 	err |= __put_user(&sc->gp_regs, &sc->regs);
 	err |= __put_user(&tm_sc->gp_regs, &tm_sc->regs);
-	WARN_ON(!FULL_REGS(regs));
 	err |= __copy_to_user(&tm_sc->gp_regs, regs, GP_REGS_SIZE);
 	err |= __copy_to_user(&sc->gp_regs,
 			      &tsk->thread.ckpt_regs, GP_REGS_SIZE);
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 97b5f3d83ff7..6c62e4e87979 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1319,7 +1319,6 @@ static int emulate_instruction(struct pt_regs *regs)
 
 	if (!user_mode(regs))
 		return -EINVAL;
-	CHECK_FULL_REGS(regs);
 
 	if (get_user(instword, (u32 __user *)(regs->nip)))
 		return -EFAULT;
diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 739ea6dc461c..45bda2520755 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1401,10 +1401,6 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		break;
 	}
 
-	/* Following cases refer to regs->gpr[], so we need all regs */
-	if (!FULL_REGS(regs))
-		return -1;
-
 	rd = (word >> 21) & 0x1f;
 	ra = (word >> 16) & 0x1f;
 	rb = (word >> 11) & 0x1f;
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 3fe37495f63d..42a2c831d87a 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -1815,25 +1815,16 @@ static void prregs(struct pt_regs *fp)
 	}
 
 #ifdef CONFIG_PPC64
-	if (FULL_REGS(fp)) {
-		for (n = 0; n < 16; ++n)
-			printf("R%.2d = "REG"   R%.2d = "REG"\n",
-			       n, fp->gpr[n], n+16, fp->gpr[n+16]);
-	} else {
-		for (n = 0; n < 7; ++n)
-			printf("R%.2d = "REG"   R%.2d = "REG"\n",
-			       n, fp->gpr[n], n+7, fp->gpr[n+7]);
-	}
+#define R_PER_LINE 2
 #else
+#define R_PER_LINE 4
+#endif
+
 	for (n = 0; n < 32; ++n) {
-		printf("R%.2d = %.8lx%s", n, fp->gpr[n],
-		       (n & 3) == 3? "\n": "   ");
-		if (n == 12 && !FULL_REGS(fp)) {
-			printf("\n");
-			break;
-		}
+		printf("R%.2d = "REG"%s", n, fp->gpr[n],
+			(n % R_PER_LINE) == R_PER_LINE - 1 ? "\n" : "   ");
 	}
-#endif
+
 	printf("pc  = ");
 	xmon_print_symbol(fp->nip, " ", "\n");
 	if (!trap_is_syscall(fp) && cpu_has_feature(CPU_FTR_CFAR)) {
-- 
2.23.0

