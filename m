Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A11171696
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 13:01:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SrqT3R8XzDqf9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 23:01:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=Apiz0zKp; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SrYC1mbfzDqxQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 22:49:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SrY66zFlz9tyj4;
 Thu, 27 Feb 2020 12:48:58 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Apiz0zKp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qSBArqc1uHq3; Thu, 27 Feb 2020 12:48:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SrY65ngmz9tyhM;
 Thu, 27 Feb 2020 12:48:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582804138; bh=L4yqb0BCFkaKadMOOwxR17ksmx4VcmckLGkRTHxYdrQ=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Apiz0zKp0f/FX6OsDYh8rIOpNJCYWq5fNH8+7vPej20WKvaJ5CkAUgV3YswGPqkHT
 U1QX3RJt3+dbUBCTB1BBzK993tku1PFOB7eEQ0sDRjJP6cnjn3X4etkbgI2NmSRPir
 3eLiyYbRUfUz8mmmeYcR67Nmw1PHl9yOxyKFF0rw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0F8028B872;
 Thu, 27 Feb 2020 12:49:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oq2c8moz3D3v; Thu, 27 Feb 2020 12:48:59 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A35AB8B799;
 Thu, 27 Feb 2020 12:48:59 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6C1DC65402; Thu, 27 Feb 2020 11:48:59 +0000 (UTC)
Message-Id: <af38b87a7e1e3efe4f9b664eaeb029e6e7d69fdb.1582803998.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1582803998.git.christophe.leroy@c-s.fr>
References: <cover.1582803998.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 03/13] powerpc/ptrace: drop unnecessary #ifdefs CONFIG_PPC64
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Thu, 27 Feb 2020 11:48:59 +0000 (UTC)
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

Drop a bunch of #ifdefs CONFIG_PPC64 that are not vital.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/ptrace.h   |  2 ++
 arch/powerpc/kernel/ptrace/ptrace.c | 18 +++---------------
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index ee3ada66deb5..8e1953d99353 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -276,6 +276,8 @@ static inline unsigned long regs_get_kernel_stack_nth(struct pt_regs *regs,
 #endif /* __ASSEMBLY__ */
 
 #ifndef __powerpc64__
+/* We need PT_SOFTE defined at all time to avoid #ifdefs */
+#define PT_SOFTE PT_MQ
 #else /* __powerpc64__ */
 #define PT_FPSCR32 (PT_FPR0 + 2*32 + 1)	/* each FP reg occupies 2 32-bit userspace slots */
 #define PT_VR0_32 164	/* each Vector reg occupies 4 slots in 32-bit */
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 7ed54dbb2d7e..3dd94c296ac7 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -274,17 +274,15 @@ int ptrace_get_reg(struct task_struct *task, int regno, unsigned long *data)
 	if (regno == PT_DSCR)
 		return get_user_dscr(task, data);
 
-#ifdef CONFIG_PPC64
 	/*
 	 * softe copies paca->irq_soft_mask variable state. Since irq_soft_mask is
 	 * no more used as a flag, lets force usr to alway see the softe value as 1
 	 * which means interrupts are not soft disabled.
 	 */
-	if (regno == PT_SOFTE) {
+	if (IS_ENABLED(CONFIG_PPC64) && regno == PT_SOFTE) {
 		*data = 1;
 		return  0;
 	}
-#endif
 
 	regs_max = sizeof(struct user_pt_regs) / sizeof(unsigned long);
 	if (regno < regs_max) {
@@ -1998,7 +1996,6 @@ static const struct user_regset_view user_ppc_native_view = {
 	.regsets = native_regsets, .n = ARRAY_SIZE(native_regsets)
 };
 
-#ifdef CONFIG_PPC64
 #include <linux/compat.h>
 
 static int gpr32_get_common(struct task_struct *target,
@@ -2272,14 +2269,11 @@ static const struct user_regset_view user_ppc_compat_view = {
 	.name = "ppc", .e_machine = EM_PPC, .ei_osabi = ELF_OSABI,
 	.regsets = compat_regsets, .n = ARRAY_SIZE(compat_regsets)
 };
-#endif	/* CONFIG_PPC64 */
 
 const struct user_regset_view *task_user_regset_view(struct task_struct *task)
 {
-#ifdef CONFIG_PPC64
-	if (test_tsk_thread_flag(task, TIF_32BIT))
+	if (IS_ENABLED(CONFIG_PPC64) && test_tsk_thread_flag(task, TIF_32BIT))
 		return &user_ppc_compat_view;
-#endif
 	return &user_ppc_native_view;
 }
 
@@ -3063,11 +3057,7 @@ long arch_ptrace(struct task_struct *child, long request,
 		else
 			dbginfo.num_data_bps = 0;
 		dbginfo.num_condition_regs = 0;
-#ifdef CONFIG_PPC64
-		dbginfo.data_bp_alignment = 8;
-#else
-		dbginfo.data_bp_alignment = 4;
-#endif
+		dbginfo.data_bp_alignment = sizeof(long);
 		dbginfo.sizeof_condition = 0;
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 		dbginfo.features = PPC_DEBUG_FEATURE_DATA_BP_RANGE;
@@ -3304,12 +3294,10 @@ long do_syscall_trace_enter(struct pt_regs *regs)
 	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
 		trace_sys_enter(regs, regs->gpr[0]);
 
-#ifdef CONFIG_PPC64
 	if (!is_32bit_task())
 		audit_syscall_entry(regs->gpr[0], regs->gpr[3], regs->gpr[4],
 				    regs->gpr[5], regs->gpr[6]);
 	else
-#endif
 		audit_syscall_entry(regs->gpr[0],
 				    regs->gpr[3] & 0xffffffff,
 				    regs->gpr[4] & 0xffffffff,
-- 
2.25.0

