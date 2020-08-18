Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 911E9248D98
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:59:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJZp47GZzDqpC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:59:30 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhk1QMNzDqbc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:34 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhd3S6Kz9vCxp;
 Tue, 18 Aug 2020 19:19:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0bLen4RI6I1n; Tue, 18 Aug 2020 19:19:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhd2ZBYz9vCxg;
 Tue, 18 Aug 2020 19:19:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 262B98B7EC;
 Tue, 18 Aug 2020 19:19:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AwIJ5OTJw8pO; Tue, 18 Aug 2020 19:19:31 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DC50B8B7D7;
 Tue, 18 Aug 2020 19:19:30 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id BB52665CF4; Tue, 18 Aug 2020 17:19:30 +0000 (UTC)
Message-Id: <2974314226256f958e2984912b48883ef1754185.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 18/25] powerpc/signal32: Switch handle_rt_signal32() to
 user_access_begin() logic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:30 +0000 (UTC)
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

On the same way as handle_signal32(), replace all user
accesses with equivalent unsafe_ versions, and move the
trampoline code icache flush outside the user access block.

Functions that have no unsafe_ equivalent also remains outside
the access block.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 55 ++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index fc8ba4b29edf..93c2d6304831 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -58,8 +58,6 @@
 #define mcontext	mcontext32
 #define ucontext	ucontext32
 
-#define __save_altstack __compat_save_altstack
-
 /*
  * Userspace code may pass a ucontext which doesn't include VSX added
  * at the end.  We need to check for this case.
@@ -745,16 +743,28 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	tm_mctx = &frame->uc_transact.uc_mcontext;
 #endif
-	if (!access_ok(frame, sizeof(*frame)))
+	if (!user_write_access_begin(frame, sizeof(*frame)))
 		goto badframe;
 
 	/* Put the siginfo & fill in most of the ucontext */
-	if (copy_siginfo_to_user(&frame->info, &ksig->info) ||
-	    __put_user(0, &frame->uc.uc_flags) ||
-	    __save_altstack(&frame->uc.uc_stack, regs->gpr[1]) ||
-	    __put_user(to_user_ptr(&frame->uc.uc_mcontext), &frame->uc.uc_regs) ||
-	    put_sigset_t(&frame->uc.uc_sigmask, oldset))
-		goto badframe;
+	unsafe_put_user(0, &frame->uc.uc_flags, failed);
+#ifdef CONFIG_PPC64
+	unsafe_compat_save_altstack(&frame->uc.uc_stack, regs->gpr[1], failed);
+#else
+	unsafe_save_altstack(&frame->uc.uc_stack, regs->gpr[1], failed);
+#endif
+	unsafe_put_user(to_user_ptr(&frame->uc.uc_mcontext), &frame->uc.uc_regs, failed);
+
+	if (MSR_TM_ACTIVE(msr)) {
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+		unsafe_put_user((unsigned long)&frame->uc_transact,
+				&frame->uc.uc_link, failed);
+		unsafe_put_user((unsigned long)tm_mctx,
+				&frame->uc_transact.uc_regs, failed);
+#endif
+	} else {
+		unsafe_put_user(0, &frame->uc.uc_link, failed);
+	}
 
 	/* Save user registers on the stack */
 	if (vdso32_rt_sigtramp && tsk->mm->context.vdso_base) {
@@ -762,28 +772,28 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	} else {
 		tramp = (unsigned long)mctx->mc_pad;
 		/* Set up the sigreturn trampoline: li r0,sigret; sc */
-		if (__put_user(PPC_INST_ADDI + __NR_sigreturn, &mctx->mc_pad[0]))
-			goto badframe;
-		if (__put_user(PPC_INST_SC, &mctx->mc_pad[1]))
-			goto badframe;
-		flush_icache_range(tramp, tramp + 2 * sizeof(unsigned long));
+		unsafe_put_user(PPC_INST_ADDI + __NR_rt_sigreturn, &mctx->mc_pad[0],
+				failed);
+		unsafe_put_user(PPC_INST_SC, &mctx->mc_pad[1], failed);
 	}
+	user_write_access_end();
+
+	if (put_sigset_t(&frame->uc.uc_sigmask, oldset))
+		goto badframe;
+	if (copy_siginfo_to_user(&frame->info, &ksig->info))
+		goto badframe;
+
+	if (tramp == (unsigned long)mctx->mc_pad)
+		flush_icache_range(tramp, tramp + 2 * sizeof(unsigned long));
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (MSR_TM_ACTIVE(msr)) {
-		if (__put_user((unsigned long)&frame->uc_transact,
-			       &frame->uc.uc_link) ||
-		    __put_user((unsigned long)tm_mctx,
-			       &frame->uc_transact.uc_regs))
-			goto badframe;
 		if (save_tm_user_regs(regs, mctx, tm_mctx, msr))
 			goto badframe;
 	}
 	else
 #endif
 	{
-		if (__put_user(0, &frame->uc.uc_link))
-			goto badframe;
 		if (save_user_regs(regs, mctx, tm_mctx, 1))
 			goto badframe;
 	}
@@ -810,6 +820,9 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	regs->msr |= (MSR_KERNEL & MSR_LE);
 	return 0;
 
+failed:
+	user_write_access_end();
+
 badframe:
 	signal_fault(tsk, regs, "handle_rt_signal32", frame);
 
-- 
2.25.0

