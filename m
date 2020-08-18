Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C29248D5F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:42:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJBv1p0YzDqgk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:42:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhX5DGMzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:24 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhN1Tq4z9vCxs;
 Tue, 18 Aug 2020 19:19:16 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tfcRrmqFKdUH; Tue, 18 Aug 2020 19:19:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhM6LcVz9vCxg;
 Tue, 18 Aug 2020 19:19:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B8B8A8B7EC;
 Tue, 18 Aug 2020 19:19:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pUMH44mkM9Fq; Tue, 18 Aug 2020 19:19:17 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D5818B7D7;
 Tue, 18 Aug 2020 19:19:17 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3E4C065CF4; Tue, 18 Aug 2020 17:19:17 +0000 (UTC)
Message-Id: <7569070083e6cd5b279bb5023da601aba3c06f3c.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 05/25] powerpc/signal: Don't manage floating point regs
 when no FPU
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:17 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no point in copying floating point regs when there
is no FPU and MATH_EMULATION is not selected.

Create a new CONFIG_PPC_FPU_REGS bool that is selected by
CONFIG_MATH_EMULATION and CONFIG_PPC_FPU, and use it to
opt out everything related to fp_state in thread_struct.

The asm const used only by fpu.S are opted out with CONFIG_PPC_FPU
as fpu.S build is conditionnal to CONFIG_PPC_FPU.

The following app spends approx 8.1 seconds system time on an 8xx
without the patch, and 7.0 seconds with the patch (13.5% reduction).

On an 832x, it spends approx 2.6 seconds system time without
the patch and 2.1 seconds with the patch (19% reduction).

	void sigusr1(int sig) { }

	int main(int argc, char **argv)
	{
		int i = 100000;

		signal(SIGUSR1, sigusr1);
		for (;i--;)
			raise(SIGUSR1);
		exit(0);
	}

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                     |  1 +
 arch/powerpc/include/asm/processor.h     |  2 ++
 arch/powerpc/kernel/asm-offsets.c        |  2 ++
 arch/powerpc/kernel/process.c            |  4 ++++
 arch/powerpc/kernel/ptrace/Makefile      |  4 ++--
 arch/powerpc/kernel/ptrace/ptrace-decl.h | 14 ++++++++++++++
 arch/powerpc/kernel/ptrace/ptrace-view.c |  2 ++
 arch/powerpc/kernel/signal.h             | 14 +++++++++++++-
 arch/powerpc/kernel/signal_32.c          |  4 ++++
 arch/powerpc/kernel/traps.c              |  2 ++
 arch/powerpc/platforms/Kconfig.cputype   |  4 ++++
 11 files changed, 50 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1f48bbfb3ce9..a2611880b904 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -416,6 +416,7 @@ config HUGETLB_PAGE_SIZE_VARIABLE
 config MATH_EMULATION
 	bool "Math emulation"
 	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE
+	select PPC_FPU_REGS
 	help
 	  Some PowerPC chips designed for embedded applications do not have
 	  a floating-point unit and therefore do not implement the
diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
index ed0d633ab5aa..e20b0c5abe62 100644
--- a/arch/powerpc/include/asm/processor.h
+++ b/arch/powerpc/include/asm/processor.h
@@ -175,8 +175,10 @@ struct thread_struct {
 #endif
 	/* Debug Registers */
 	struct debug_reg debug;
+#ifdef CONFIG_PPC_FPU_REGS
 	struct thread_fp_state	fp_state;
 	struct thread_fp_state	*fp_save_area;
+#endif
 	int		fpexc_mode;	/* floating-point exception mode */
 	unsigned int	align_ctl;	/* alignment handling control */
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 8711c2164b45..6cb36c341c70 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -110,9 +110,11 @@ int main(void)
 #ifdef CONFIG_BOOKE
 	OFFSET(THREAD_NORMSAVES, thread_struct, normsave[0]);
 #endif
+#ifdef CONFIG_PPC_FPU
 	OFFSET(THREAD_FPEXC_MODE, thread_struct, fpexc_mode);
 	OFFSET(THREAD_FPSTATE, thread_struct, fp_state.fpr);
 	OFFSET(THREAD_FPSAVEAREA, thread_struct, fp_save_area);
+#endif
 	OFFSET(FPSTATE_FPSCR, thread_fp_state, fpscr);
 	OFFSET(THREAD_LOAD_FP, thread_struct, load_fp);
 #ifdef CONFIG_ALTIVEC
diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index 016bd831908e..7e0082ac0a39 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1694,7 +1694,9 @@ int copy_thread(unsigned long clone_flags, unsigned long usp,
 		p->thread.ptrace_bps[i] = NULL;
 #endif
 
+#ifdef CONFIG_PPC_FPU_REGS
 	p->thread.fp_save_area = NULL;
+#endif
 #ifdef CONFIG_ALTIVEC
 	p->thread.vr_save_area = NULL;
 #endif
@@ -1821,8 +1823,10 @@ void start_thread(struct pt_regs *regs, unsigned long start, unsigned long sp)
 #endif
 	current->thread.load_slb = 0;
 	current->thread.load_fp = 0;
+#ifdef CONFIG_PPC_FPU_REGS
 	memset(&current->thread.fp_state, 0, sizeof(current->thread.fp_state));
 	current->thread.fp_save_area = NULL;
+#endif
 #ifdef CONFIG_ALTIVEC
 	memset(&current->thread.vr_state, 0, sizeof(current->thread.vr_state));
 	current->thread.vr_state.vscr.u[3] = 0x00010000; /* Java mode disabled */
diff --git a/arch/powerpc/kernel/ptrace/Makefile b/arch/powerpc/kernel/ptrace/Makefile
index 77abd1a5a508..8ebc11d1168d 100644
--- a/arch/powerpc/kernel/ptrace/Makefile
+++ b/arch/powerpc/kernel/ptrace/Makefile
@@ -6,11 +6,11 @@
 CFLAGS_ptrace-view.o		+= -DUTS_MACHINE='"$(UTS_MACHINE)"'
 
 obj-y				+= ptrace.o ptrace-view.o
-obj-y				+= ptrace-fpu.o
+obj-$(CONFIG_PPC_FPU_REGS)	+= ptrace-fpu.o
 obj-$(CONFIG_COMPAT)		+= ptrace32.o
 obj-$(CONFIG_VSX)		+= ptrace-vsx.o
 ifneq ($(CONFIG_VSX),y)
-obj-y				+= ptrace-novsx.o
+obj-$(CONFIG_PPC_FPU_REGS)	+= ptrace-novsx.o
 endif
 obj-$(CONFIG_ALTIVEC)		+= ptrace-altivec.o
 obj-$(CONFIG_SPE)		+= ptrace-spe.o
diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index eafe5f0f6289..3487f2c9735c 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -165,8 +165,22 @@ int ptrace_put_reg(struct task_struct *task, int regno, unsigned long data);
 extern const struct user_regset_view user_ppc_native_view;
 
 /* ptrace-fpu */
+#ifdef CONFIG_PPC_FPU_REGS
 int ptrace_get_fpr(struct task_struct *child, int index, unsigned long *data);
 int ptrace_put_fpr(struct task_struct *child, int index, unsigned long data);
+#else
+static inline int
+ptrace_get_fpr(struct task_struct *child, int index, unsigned long *data)
+{
+	return -EIO;
+}
+
+static inline int
+ptrace_put_fpr(struct task_struct *child, int index, unsigned long data)
+{
+	return -EIO;
+}
+#endif
 
 /* ptrace-(no)adv */
 void ppc_gethwdinfo(struct ppc_debug_info *dbginfo);
diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
index 7e6478e7ed07..f1df8c62baf1 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -520,11 +520,13 @@ static const struct user_regset native_regsets[] = {
 		.size = sizeof(long), .align = sizeof(long),
 		.regset_get = gpr_get, .set = gpr_set
 	},
+#ifdef CONFIG_PPC_FPU_REGS
 	[REGSET_FPR] = {
 		.core_note_type = NT_PRFPREG, .n = ELF_NFPREG,
 		.size = sizeof(double), .align = sizeof(double),
 		.regset_get = fpr_get, .set = fpr_set
 	},
+#endif
 #ifdef CONFIG_ALTIVEC
 	[REGSET_VMX] = {
 		.core_note_type = NT_PPC_VMX, .n = 34,
diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index 4626d39cc0f0..6c2a33ab042c 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -34,7 +34,7 @@ unsigned long copy_fpr_to_user(void __user *to, struct task_struct *task);
 unsigned long copy_ckfpr_to_user(void __user *to, struct task_struct *task);
 unsigned long copy_fpr_from_user(struct task_struct *task, void __user *from);
 unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user *from);
-#else
+#elif defined(CONFIG_PPC_FPU_REGS)
 static inline unsigned long
 copy_fpr_to_user(void __user *to, struct task_struct *task)
 {
@@ -63,6 +63,18 @@ copy_ckfpr_from_user(struct task_struct *task, void __user *from)
 				ELF_NFPREG * sizeof(double));
 }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
+#else
+static inline unsigned long
+copy_fpr_to_user(void __user *to, struct task_struct *task)
+{
+	return 0;
+}
+
+static inline unsigned long
+copy_fpr_from_user(struct task_struct *task, void __user *from)
+{
+	return 0;
+}
 #endif
 
 #ifdef CONFIG_PPC64
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 96950f189b5a..7b291707eb31 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -814,7 +814,9 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	}
 	regs->link = tramp;
 
+#ifdef CONFIG_PPC_FPU_REGS
 	tsk->thread.fp_state.fpscr = 0;	/* turn off all fp exceptions */
+#endif
 
 	/* create a stack frame for the caller of the handler */
 	newsp = ((unsigned long)rt_sf) - (__SIGNAL_FRAMESIZE + 16);
@@ -1271,7 +1273,9 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 
 	regs->link = tramp;
 
+#ifdef CONFIG_PPC_FPU_REGS
 	tsk->thread.fp_state.fpscr = 0;	/* turn off all fp exceptions */
+#endif
 
 	/* create a stack frame for the caller of the handler */
 	newsp = ((unsigned long)frame) - __SIGNAL_FRAMESIZE;
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index d1ebe152f210..5c68f0de905c 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1194,7 +1194,9 @@ static void parse_fpe(struct pt_regs *regs)
 
 	flush_fp_to_thread(current);
 
+#ifdef CONFIG_PPC_FPU_REGS
 	code = __parse_fpscr(current->thread.fp_state.fpscr);
+#endif
 
 	_exception(SIGFPE, regs, code, regs->nip);
 }
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 87737ec86d39..40ffcdba42b8 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -225,9 +225,13 @@ config PPC_E500MC
 	  such as e5500/e6500), and must be disabled for running on
 	  e500v1 or e500v2.
 
+config PPC_FPU_REGS
+	bool
+
 config PPC_FPU
 	bool
 	default y if PPC64
+	select PPC_FPU_REGS
 
 config FSL_EMB_PERFMON
 	bool "Freescale Embedded Perfmon"
-- 
2.25.0

