Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACCF5A018
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 17:58:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45b1f84vKWzDqwV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 01:58:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="X8kT5lpm"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45b1PV3xvRzDqv5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 01:47:57 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45b1PM65MDzB09ZR;
 Fri, 28 Jun 2019 17:47:51 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=X8kT5lpm; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5n7YNf7C5Udk; Fri, 28 Jun 2019 17:47:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45b1PM4qqBzB09ZN;
 Fri, 28 Jun 2019 17:47:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561736871; bh=auZsk5+eXrNvOomMroEmyexOA4o1/bt7OLpPEQ8iQig=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=X8kT5lpmFcJWgC5JpZGa0nZKQbN+Ndk21FzryPecHf9Xhc3MQgfYkCzZxFFrIPLMv
 4CHSWapC/vU7X9WPzhehbAOsOI5yqakGQdk266e99Gy8f4fZkxrQVBtB6lkP9sLnMJ
 60PLknOtD2ZdTxssD7oc3Wpv6Qg9l3YWU4zCFPso=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F35028B976;
 Fri, 28 Jun 2019 17:47:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PGpsEOsz7mwc; Fri, 28 Jun 2019 17:47:52 +0200 (CEST)
Received: from localhost.localdomain (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFDD58B977;
 Fri, 28 Jun 2019 17:47:51 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id AC8BB68DBC; Fri, 28 Jun 2019 15:47:51 +0000 (UTC)
Message-Id: <34af3942cd27f6b5365caae772fb8e0af44763d5.1561735587.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1561735587.git.christophe.leroy@c-s.fr>
References: <cover.1561735587.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH v2 02/12] powerpc/ptrace: drop unnecessary #ifdefs
 CONFIG_PPC64
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Fri, 28 Jun 2019 15:47:51 +0000 (UTC)
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
 arch/powerpc/include/asm/ptrace.h      |  9 ++++-----
 arch/powerpc/include/uapi/asm/ptrace.h | 12 ++++--------
 arch/powerpc/kernel/ptrace/ptrace.c    | 24 +++---------------------
 3 files changed, 11 insertions(+), 34 deletions(-)

diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
index faa5a338ac5a..1506a9c61d50 100644
--- a/arch/powerpc/include/asm/ptrace.h
+++ b/arch/powerpc/include/asm/ptrace.h
@@ -36,11 +36,10 @@ struct pt_regs
 			unsigned long link;
 			unsigned long xer;
 			unsigned long ccr;
-#ifdef CONFIG_PPC64
-			unsigned long softe;
-#else
-			unsigned long mq;
-#endif
+			union {
+				unsigned long softe;
+				unsigned long mq;
+			};
 			unsigned long trap;
 			unsigned long dar;
 			unsigned long dsisr;
diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
index f5f1ccc740fc..37d7befbb8dc 100644
--- a/arch/powerpc/include/uapi/asm/ptrace.h
+++ b/arch/powerpc/include/uapi/asm/ptrace.h
@@ -43,12 +43,11 @@ struct pt_regs
 	unsigned long link;
 	unsigned long xer;
 	unsigned long ccr;
-#ifdef __powerpc64__
-	unsigned long softe;		/* Soft enabled/disabled */
-#else
-	unsigned long mq;		/* 601 only (not used at present) */
+	union {
+		unsigned long softe;	/* Soft enabled/disabled */
+		unsigned long mq;	/* 601 only (not used at present) */
 					/* Used on APUS to hold IPL value. */
-#endif
+	};
 	unsigned long trap;		/* Reason for being here */
 	/* N.B. for critical exceptions on 4xx, the dar and dsisr
 	   fields are overloaded to hold srr0 and srr1. */
@@ -105,11 +104,8 @@ struct pt_regs
 #define PT_LNK	36
 #define PT_XER	37
 #define PT_CCR	38
-#ifndef __powerpc64__
 #define PT_MQ	39
-#else
 #define PT_SOFTE 39
-#endif
 #define PT_TRAP	40
 #define PT_DAR	41
 #define PT_DSISR 42
diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
index 684b0b315c32..0afb223c4d57 100644
--- a/arch/powerpc/kernel/ptrace/ptrace.c
+++ b/arch/powerpc/kernel/ptrace/ptrace.c
@@ -113,11 +113,8 @@ static const struct pt_regs_offset regoffset_table[] = {
 	REG_OFFSET_NAME(link),
 	REG_OFFSET_NAME(xer),
 	REG_OFFSET_NAME(ccr),
-#ifdef CONFIG_PPC64
 	REG_OFFSET_NAME(softe),
-#else
 	REG_OFFSET_NAME(mq),
-#endif
 	REG_OFFSET_NAME(trap),
 	REG_OFFSET_NAME(dar),
 	REG_OFFSET_NAME(dsisr),
@@ -289,17 +286,15 @@ int ptrace_get_reg(struct task_struct *task, int regno, unsigned long *data)
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
@@ -2013,7 +2008,6 @@ static const struct user_regset_view user_ppc_native_view = {
 	.regsets = native_regsets, .n = ARRAY_SIZE(native_regsets)
 };
 
-#ifdef CONFIG_PPC64
 #include <linux/compat.h>
 
 static int gpr32_get_common(struct task_struct *target,
@@ -2287,14 +2281,11 @@ static const struct user_regset_view user_ppc_compat_view = {
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
 
@@ -3081,11 +3072,7 @@ long arch_ptrace(struct task_struct *child, long request,
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
@@ -3322,12 +3309,10 @@ long do_syscall_trace_enter(struct pt_regs *regs)
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
@@ -3382,13 +3367,10 @@ void __init pt_regs_check(void)
 		     offsetof(struct user_pt_regs, xer));
 	BUILD_BUG_ON(offsetof(struct pt_regs, ccr) !=
 		     offsetof(struct user_pt_regs, ccr));
-#ifdef __powerpc64__
 	BUILD_BUG_ON(offsetof(struct pt_regs, softe) !=
 		     offsetof(struct user_pt_regs, softe));
-#else
 	BUILD_BUG_ON(offsetof(struct pt_regs, mq) !=
 		     offsetof(struct user_pt_regs, mq));
-#endif
 	BUILD_BUG_ON(offsetof(struct pt_regs, trap) !=
 		     offsetof(struct user_pt_regs, trap));
 	BUILD_BUG_ON(offsetof(struct pt_regs, dar) !=
-- 
2.13.3

