Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03E0C3F1C88
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Aug 2021 17:22:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gr7m76hCzz3cHH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 01:21:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gr7lN41bpz3cKp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 01:21:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gr7lC4bL0z9sVX;
 Thu, 19 Aug 2021 17:21:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ca_fpAu8CAGA; Thu, 19 Aug 2021 17:21:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gr7lC3P63z9sTb;
 Thu, 19 Aug 2021 17:21:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5B6038B842;
 Thu, 19 Aug 2021 17:21:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VpTLl4HljJCr; Thu, 19 Aug 2021 17:21:11 +0200 (CEST)
Received: from po9473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 315D48B837;
 Thu, 19 Aug 2021 17:21:11 +0200 (CEST)
Received: by po9473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1D9D666958; Thu, 19 Aug 2021 15:21:11 +0000 (UTC)
Message-Id: <c2fb93708196734f4176dda334aaa3055f213b89.1629386461.git.christophe.leroy@csgroup.eu>
In-Reply-To: <385ead49ccb66a259b25fee3eebf0bd4094068f3.1629386461.git.christophe.leroy@csgroup.eu>
References: <385ead49ccb66a259b25fee3eebf0bd4094068f3.1629386461.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 2/3] powerpc: Refactor verification of MSR_RI
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Thu, 19 Aug 2021 15:21:11 +0000 (UTC)
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

40x and BOOKE don't have MSR_RI therefore all tests involving
MSR_RI may be problematic on those plateforms.

Create helpers to check or set MSR_RI in regs, and use them
in common code.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Remove superflous {
---
 arch/powerpc/include/asm/ptrace.h             | 23 +++++++++++++++++++
 arch/powerpc/kernel/interrupt.c               |  9 +++-----
 arch/powerpc/kernel/traps.c                   |  8 +++----
 arch/powerpc/mm/book3s64/slb.c                |  2 +-
 arch/powerpc/platforms/embedded6xx/holly.c    |  2 +-
 .../platforms/embedded6xx/mpc7448_hpc2.c      |  2 +-
 arch/powerpc/platforms/pasemi/idle.c          |  2 +-
 arch/powerpc/platforms/powernv/opal.c         |  2 +-
 arch/powerpc/platforms/pseries/ras.c          |  2 +-
 arch/powerpc/sysdev/fsl_rio.c                 |  2 +-
 arch/powerpc/xmon/xmon.c                      | 16 +++----------
 11 files changed, 40 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index fd60538737a0..0cdb7b9c2c9c 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -22,6 +22,7 @@
 #include <linux/err.h>
 #include <uapi/asm/ptrace.h>
 #include <asm/asm-const.h>
+#include <asm/reg.h>
 
 #ifndef __ASSEMBLY__
 struct pt_regs
@@ -282,6 +283,28 @@ static inline void regs_set_return_value(struct pt_regs *regs, unsigned long rc)
 	regs->gpr[3] = rc;
 }
 
+static inline bool cpu_has_msr_ri(void)
+{
+	return !IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x);
+}
+
+static inline bool regs_is_unrecoverable(struct pt_regs *regs)
+{
+	return unlikely(cpu_has_msr_ri() && !(regs->msr & MSR_RI));
+}
+
+static inline void regs_set_recoverable(struct pt_regs *regs)
+{
+	if (cpu_has_msr_ri())
+		regs_set_return_msr(regs, regs->msr | MSR_RI);
+}
+
+static inline void regs_set_unrecoverable(struct pt_regs *regs)
+{
+	if (cpu_has_msr_ri())
+		regs_set_return_msr(regs, regs->msr & ~MSR_RI);
+}
+
 #define arch_has_single_step()	(1)
 #define arch_has_block_step()	(true)
 #define ARCH_HAS_USER_SINGLE_STEP_REPORT
diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index f26caf911ab5..f06c38e8fe36 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -93,8 +93,7 @@ notrace long system_call_exception(long r3, long r4, long r5,
 	CT_WARN_ON(ct_state() == CONTEXT_KERNEL);
 	user_exit_irqoff();
 
-	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
-		BUG_ON(!(regs->msr & MSR_RI));
+	BUG_ON(regs_is_unrecoverable(regs));
 	BUG_ON(!(regs->msr & MSR_PR));
 	BUG_ON(arch_irq_disabled_regs(regs));
 
@@ -463,8 +462,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
 {
 	unsigned long ret;
 
-	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x))
-		BUG_ON(!(regs->msr & MSR_RI));
+	BUG_ON(regs_is_unrecoverable(regs));
 	BUG_ON(arch_irq_disabled_regs(regs));
 	CT_WARN_ON(ct_state() == CONTEXT_USER);
 
@@ -495,8 +493,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
 	bool stack_store = current_thread_info()->flags &
 						_TIF_EMULATE_STACK_STORE;
 
-	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x) &&
-	    unlikely(!(regs->msr & MSR_RI)))
+	if (regs_is_unrecoverable(regs))
 		unrecoverable_exception(regs);
 	/*
 	 * CT_WARN_ON comes here via program_check_exception,
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 3e2adb3487e7..8310147b5e7b 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -428,7 +428,7 @@ void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
 	return;
 
 nonrecoverable:
-	regs_set_return_msr(regs, regs->msr & ~MSR_RI);
+	regs_set_unrecoverable(regs);
 #endif
 }
 DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
@@ -498,7 +498,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
 		die("Unrecoverable nested System Reset", regs, SIGABRT);
 #endif
 	/* Must die if the interrupt is not recoverable */
-	if (!(regs->msr & MSR_RI)) {
+	if (regs_is_unrecoverable(regs)) {
 		/* For the reason explained in die_mce, nmi_exit before die */
 		nmi_exit();
 		die("Unrecoverable System Reset", regs, SIGABRT);
@@ -550,7 +550,7 @@ static inline int check_io_access(struct pt_regs *regs)
 			printk(KERN_DEBUG "%s bad port %lx at %p\n",
 			       (*nip & 0x100)? "OUT to": "IN from",
 			       regs->gpr[rb] - _IO_BASE, nip);
-			regs_set_return_msr(regs, regs->msr | MSR_RI);
+			regs_set_recoverable(regs);
 			regs_set_return_ip(regs, extable_fixup(entry));
 			return 1;
 		}
@@ -840,7 +840,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
 
 bail:
 	/* Must die if the interrupt is not recoverable */
-	if (!(regs->msr & MSR_RI))
+	if (regs_is_unrecoverable(regs))
 		die_mce("Unrecoverable Machine check", regs, SIGBUS);
 
 #ifdef CONFIG_PPC_BOOK3S_64
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index c91bd85eb90e..f0037bcc47a0 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -822,7 +822,7 @@ DEFINE_INTERRUPT_HANDLER_RAW(do_slb_fault)
 	/* IRQs are not reconciled here, so can't check irqs_disabled */
 	VM_WARN_ON(mfmsr() & MSR_EE);
 
-	if (unlikely(!(regs->msr & MSR_RI)))
+	if (regs_is_unrecoverable(regs))
 		return -EINVAL;
 
 	/*
diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index 85521b3e7098..7a85b117f7a4 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -251,7 +251,7 @@ static int ppc750_machine_check_exception(struct pt_regs *regs)
 	/* Are we prepared to handle this fault */
 	if ((entry = search_exception_tables(regs->nip)) != NULL) {
 		tsi108_clear_pci_cfg_error();
-		regs_set_return_msr(regs, regs->msr | MSR_RI);
+		regs_set_recoverable(regs);
 		regs_set_return_ip(regs, extable_fixup(entry));
 		return 1;
 	}
diff --git a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
index d8da6a483e59..9eb9abb5bce2 100644
--- a/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
+++ b/arch/powerpc/platforms/embedded6xx/mpc7448_hpc2.c
@@ -173,7 +173,7 @@ static int mpc7448_machine_check_exception(struct pt_regs *regs)
 	/* Are we prepared to handle this fault */
 	if ((entry = search_exception_tables(regs->nip)) != NULL) {
 		tsi108_clear_pci_cfg_error();
-		regs_set_return_msr(regs, regs->msr | MSR_RI);
+		regs_set_recoverable(regs);
 		regs_set_return_ip(regs, extable_fixup(entry));
 		return 1;
 	}
diff --git a/arch/powerpc/platforms/pasemi/idle.c b/arch/powerpc/platforms/pasemi/idle.c
index 534b0317fc15..6087c70ed2ef 100644
--- a/arch/powerpc/platforms/pasemi/idle.c
+++ b/arch/powerpc/platforms/pasemi/idle.c
@@ -59,7 +59,7 @@ static int pasemi_system_reset_exception(struct pt_regs *regs)
 	restore_astate(hard_smp_processor_id());
 
 	/* everything handled */
-	regs_set_return_msr(regs, regs->msr | MSR_RI);
+	regs_set_recoverable(regs);
 	return 1;
 }
 
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 2835376e61a4..e9d18519e650 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -588,7 +588,7 @@ static int opal_recover_mce(struct pt_regs *regs,
 {
 	int recovered = 0;
 
-	if (!(regs->msr & MSR_RI)) {
+	if (regs_is_unrecoverable(regs)) {
 		/* If MSR_RI isn't set, we cannot recover */
 		pr_err("Machine check interrupt unrecoverable: MSR(RI=0)\n");
 		recovered = 0;
diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 167f2e1b8d39..56092dccfdb8 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -783,7 +783,7 @@ static int recover_mce(struct pt_regs *regs, struct machine_check_event *evt)
 {
 	int recovered = 0;
 
-	if (!(regs->msr & MSR_RI)) {
+	if (regs_is_unrecoverable(regs)) {
 		/* If MSR_RI isn't set, we cannot recover */
 		pr_err("Machine check interrupt unrecoverable: MSR(RI=0)\n");
 		recovered = 0;
diff --git a/arch/powerpc/sysdev/fsl_rio.c b/arch/powerpc/sysdev/fsl_rio.c
index 5a95b8ea23d8..ff7906b48ca1 100644
--- a/arch/powerpc/sysdev/fsl_rio.c
+++ b/arch/powerpc/sysdev/fsl_rio.c
@@ -108,7 +108,7 @@ int fsl_rio_mcheck_exception(struct pt_regs *regs)
 				 __func__);
 			out_be32((u32 *)(rio_regs_win + RIO_LTLEDCSR),
 				 0);
-			regs_set_return_msr(regs, regs->msr | MSR_RI);
+			regs_set_recoverable(regs);
 			regs_set_return_ip(regs, extable_fixup(entry));
 			return 1;
 		}
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index ead460b80905..dd8241c009e5 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -482,16 +482,6 @@ static inline void get_output_lock(void) {}
 static inline void release_output_lock(void) {}
 #endif
 
-static inline int unrecoverable_excp(struct pt_regs *regs)
-{
-#if defined(CONFIG_4xx) || defined(CONFIG_PPC_BOOK3E)
-	/* We have no MSR_RI bit on 4xx or Book3e, so we simply return false */
-	return 0;
-#else
-	return ((regs->msr & MSR_RI) == 0);
-#endif
-}
-
 static void xmon_touch_watchdogs(void)
 {
 	touch_softlockup_watchdog_sync();
@@ -565,7 +555,7 @@ static int xmon_core(struct pt_regs *regs, volatile int fromipi)
 	bp = NULL;
 	if ((regs->msr & (MSR_IR|MSR_PR|MSR_64BIT)) == (MSR_IR|MSR_64BIT))
 		bp = at_breakpoint(regs->nip);
-	if (bp || unrecoverable_excp(regs))
+	if (bp || regs_is_unrecoverable(regs))
 		fromipi = 0;
 
 	if (!fromipi) {
@@ -577,7 +567,7 @@ static int xmon_core(struct pt_regs *regs, volatile int fromipi)
 			       cpu, BP_NUM(bp));
 			xmon_print_symbol(regs->nip, " ", ")\n");
 		}
-		if (unrecoverable_excp(regs))
+		if (regs_is_unrecoverable(regs))
 			printf("WARNING: exception is not recoverable, "
 			       "can't continue\n");
 		release_output_lock();
@@ -693,7 +683,7 @@ static int xmon_core(struct pt_regs *regs, volatile int fromipi)
 			printf("Stopped at breakpoint %tx (", BP_NUM(bp));
 			xmon_print_symbol(regs->nip, " ", ")\n");
 		}
-		if (unrecoverable_excp(regs))
+		if (regs_is_unrecoverable(regs))
 			printf("WARNING: exception is not recoverable, "
 			       "can't continue\n");
 		remove_bpts();
-- 
2.25.0

