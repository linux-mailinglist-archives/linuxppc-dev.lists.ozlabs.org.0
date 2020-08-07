Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD5C23F0DD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 18:21:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNVwZ6Z1NzDqsL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:21:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=fail (SPF fail - not authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.2; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase2.c-s.fr (vpn2.c-s.fr [93.17.235.2])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNVmG6FW4zDqrX
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 02:14:03 +1000 (AEST)
Received: from localhost (mailhub2-ext [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4BNVm40jBXz9ttfr;
 Fri,  7 Aug 2020 18:13:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [172.26.127.65]) (amavisd-new, port 10024)
 with ESMTP id W6UNBS7J8keU; Fri,  7 Aug 2020 18:13:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4BNVm36P8bz9ttfn;
 Fri,  7 Aug 2020 18:13:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 334C58B862;
 Fri,  7 Aug 2020 18:13:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nm6_b2U25kWU; Fri,  7 Aug 2020 18:13:59 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CD8328B849;
 Fri,  7 Aug 2020 18:13:58 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9C2C865C12; Fri,  7 Aug 2020 16:13:58 +0000 (UTC)
Message-Id: <95c00a811897f6d9176d30bf2ac92dab8c9c8e95.1596816789.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1] power: don't manage floating point regs when no FPU
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri,  7 Aug 2020 16:13:58 +0000 (UTC)
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

The following app runs in approx 10.50 seconds on an 8xx without
the patch, and in 9.45 seconds with the patch.

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
 arch/powerpc/Kconfig                      |  1 +
 arch/powerpc/include/asm/processor.h      |  2 ++
 arch/powerpc/kernel/asm-offsets.c         |  2 ++
 arch/powerpc/kernel/process.c             |  4 ++++
 arch/powerpc/kernel/ptrace/ptrace-novsx.c |  8 ++++++++
 arch/powerpc/kernel/ptrace/ptrace.c       |  4 ++++
 arch/powerpc/kernel/signal.c              | 12 +++++++++++-
 arch/powerpc/kernel/signal_32.c           |  4 ++++
 arch/powerpc/kernel/traps.c               |  4 ++++
 arch/powerpc/platforms/Kconfig.cputype    |  4 ++++
 10 files changed, 44 insertions(+), 1 deletion(-)

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
diff --git a/arch/powerpc/kernel/ptrace/ptrace-novsx.c b/arch/powerpc/kernel/ptrace/ptrace-novsx.c
index b2dc4e92d11a..8f87a11f3f8c 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-novsx.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-novsx.c
@@ -21,6 +21,7 @@
 int fpr_get(struct task_struct *target, const struct user_regset *regset,
 	    unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
 {
+#ifdef CONFIG_PPC_FPU_REGS
 	BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
 		     offsetof(struct thread_fp_state, fpr[32]));
 
@@ -28,6 +29,9 @@ int fpr_get(struct task_struct *target, const struct user_regset *regset,
 
 	return user_regset_copyout(&pos, &count, &kbuf, &ubuf,
 				   &target->thread.fp_state, 0, -1);
+#else
+	return 0;
+#endif
 }
 
 /*
@@ -47,6 +51,7 @@ int fpr_set(struct task_struct *target, const struct user_regset *regset,
 	    unsigned int pos, unsigned int count,
 	    const void *kbuf, const void __user *ubuf)
 {
+#ifdef CONFIG_PPC_FPU_REGS
 	BUILD_BUG_ON(offsetof(struct thread_fp_state, fpscr) !=
 		     offsetof(struct thread_fp_state, fpr[32]));
 
@@ -54,4 +59,7 @@ int fpr_set(struct task_struct *target, const struct user_regset *regset,
 
 	return user_regset_copyin(&pos, &count, &kbuf, &ubuf,
 				  &target->thread.fp_state, 0, -1);
+#else
+	return 0;
+#endif
 }
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index f6e51be47c6e..f162bfec0d3f 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -70,6 +70,7 @@ long arch_ptrace(struct task_struct *child, long request,
 			ret = ptrace_get_reg(child, (int) index, &tmp);
 			if (ret)
 				break;
+#ifdef CONFIG_PPC_FPU_REGS
 		} else {
 			unsigned int fpidx = index - PT_FPR0;
 
@@ -79,6 +80,7 @@ long arch_ptrace(struct task_struct *child, long request,
 				       sizeof(long));
 			else
 				tmp = child->thread.fp_state.fpscr;
+#endif
 		}
 		ret = put_user(tmp, datalp);
 		break;
@@ -103,6 +105,7 @@ long arch_ptrace(struct task_struct *child, long request,
 		CHECK_FULL_REGS(child->thread.regs);
 		if (index < PT_FPR0) {
 			ret = ptrace_put_reg(child, index, data);
+#ifdef CONFIG_PPC_FPU_REGS
 		} else {
 			unsigned int fpidx = index - PT_FPR0;
 
@@ -113,6 +116,7 @@ long arch_ptrace(struct task_struct *child, long request,
 			else
 				child->thread.fp_state.fpscr = data;
 			ret = 0;
+#endif
 		}
 		break;
 	}
diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
index d15a98c758b8..18dcbf538f8f 100644
--- a/arch/powerpc/kernel/signal.c
+++ b/arch/powerpc/kernel/signal.c
@@ -133,7 +133,7 @@ unsigned long copy_ckvsx_from_user(struct task_struct *task,
 	return 0;
 }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
-#else
+#elif defined(CONFIG_PPC_FPU_REGS)
 inline unsigned long copy_fpr_to_user(void __user *to,
 				      struct task_struct *task)
 {
@@ -163,6 +163,16 @@ inline unsigned long copy_ckfpr_from_user(struct task_struct *task,
 				ELF_NFPREG * sizeof(double));
 }
 #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
+#else
+inline unsigned long copy_fpr_to_user(void __user *to, struct task_struct *task)
+{
+	return 0;
+}
+
+inline unsigned long copy_fpr_from_user(struct task_struct *task, void __user *from)
+{
+	return 0;
+}
 #endif
 
 /* Log an error when sending an unhandled signal to a process. Controlled
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
index d1ebe152f210..ee9ec61e75b7 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -1188,6 +1188,7 @@ static inline int __parse_fpscr(unsigned long fpscr)
 	return ret;
 }
 
+#ifdef CONFIG_PPC_FPU
 static void parse_fpe(struct pt_regs *regs)
 {
 	int code = 0;
@@ -1198,6 +1199,7 @@ static void parse_fpe(struct pt_regs *regs)
 
 	_exception(SIGFPE, regs, code, regs->nip);
 }
+#endif
 
 /*
  * Illegal instruction emulation support.  Originally written to
@@ -1477,11 +1479,13 @@ void program_check_exception(struct pt_regs *regs)
 	/* We can now get here via a FP Unavailable exception if the core
 	 * has no FPU, in that case the reason flags will be 0 */
 
+#ifdef CONFIG_PPC_FPU
 	if (reason & REASON_FP) {
 		/* IEEE FP exception */
 		parse_fpe(regs);
 		goto bail;
 	}
+#endif
 	if (reason & REASON_TRAP) {
 		unsigned long bugaddr;
 		/* Debugger is first in line to stop recursive faults in
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

