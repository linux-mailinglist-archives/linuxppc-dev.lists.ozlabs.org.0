Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A38CF2429C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 14:51:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRV1z3dxbzDqgB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 22:51:19 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRT1v73ZvzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 22:06:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BRT1q2fXnzB09Zm;
 Wed, 12 Aug 2020 14:06:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Cbs9yYywExs1; Wed, 12 Aug 2020 14:06:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BRT1q1s3jzB09Zf;
 Wed, 12 Aug 2020 14:06:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 836C68B826;
 Wed, 12 Aug 2020 14:06:08 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id zXOsF_Bo41Q5; Wed, 12 Aug 2020 14:06:08 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1AACE8B7FC;
 Wed, 12 Aug 2020 14:06:08 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F0C5D65C34; Wed, 12 Aug 2020 12:06:07 +0000 (UTC)
Message-Id: <cbba9be0a6a69984b37ba023de38be362fa7bc0d.1597233555.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597233555.git.christophe.leroy@csgroup.eu>
References: <cover.1597233555.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 16/19] powerpc/signal32: Switch handle_rt_signal32() to
 user_access_begin() logic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ldv@altlinux.org, viro@zeniv.linux.org.uk
Date: Wed, 12 Aug 2020 12:06:07 +0000 (UTC)
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

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 47 +++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 4ea83578ba9d..d03ba3d8eb68 100644
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
@@ -797,16 +795,36 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	/* Set up Signal Frame */
 	/* Put a Real Time Context onto stack */
 	rt_sf = get_sigframe(ksig, tsk, sizeof(*rt_sf), 1);
-	if (!access_ok(rt_sf, sizeof(*rt_sf)))
+	if (!user_write_access_begin(rt_sf, sizeof(*rt_sf)))
 		goto badframe;
 
 	/* Put the siginfo & fill in most of the ucontext */
-	if (copy_siginfo_to_user(&rt_sf->info, &ksig->info)
-	    || __put_user(0, &rt_sf->uc.uc_flags)
-	    || __save_altstack(&rt_sf->uc.uc_stack, regs->gpr[1])
-	    || __put_user(to_user_ptr(&rt_sf->uc.uc_mcontext),
-		    &rt_sf->uc.uc_regs)
-	    || put_sigset_t(&rt_sf->uc.uc_sigmask, oldset))
+	unsafe_put_user(0, &rt_sf->uc.uc_flags, failed);
+#ifdef CONFIG_PPC64
+	unsafe_compat_save_altstack(&rt_sf->uc.uc_stack, regs->gpr[1], failed);
+#else
+	unsafe_save_altstack(&rt_sf->uc.uc_stack, regs->gpr[1], failed);
+#endif
+	unsafe_put_user(to_user_ptr(&rt_sf->uc.uc_mcontext), &rt_sf->uc.uc_regs, failed);
+
+#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
+	tm_frame = &rt_sf->uc_transact.uc_mcontext;
+	if (MSR_TM_ACTIVE(msr)) {
+		unsafe_put_user((unsigned long)&rt_sf->uc_transact,
+				&rt_sf->uc.uc_link, failed);
+		unsafe_put_user((unsigned long)tm_frame,
+				&rt_sf->uc_transact.uc_regs, failed);
+	}
+	else
+#endif
+	{
+		unsafe_put_user(0, &rt_sf->uc.uc_link, failed);
+	}
+	user_write_access_end();
+
+	if (put_sigset_t(&rt_sf->uc.uc_sigmask, oldset))
+		goto badframe;
+	if (copy_siginfo_to_user(&rt_sf->info, &ksig->info))
 		goto badframe;
 
 	/* Save user registers on the stack */
@@ -820,21 +838,13 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	}
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-	tm_frame = &rt_sf->uc_transact.uc_mcontext;
 	if (MSR_TM_ACTIVE(msr)) {
-		if (__put_user((unsigned long)&rt_sf->uc_transact,
-			       &rt_sf->uc.uc_link) ||
-		    __put_user((unsigned long)tm_frame,
-			       &rt_sf->uc_transact.uc_regs))
-			goto badframe;
 		if (save_tm_user_regs(regs, frame, tm_frame, sigret, msr))
 			goto badframe;
 	}
 	else
 #endif
 	{
-		if (__put_user(0, &rt_sf->uc.uc_link))
-			goto badframe;
 		if (save_user_regs(regs, frame, tm_frame, sigret, 1))
 			goto badframe;
 	}
@@ -861,6 +871,9 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	regs->msr |= (MSR_KERNEL & MSR_LE);
 	return 0;
 
+failed:
+	user_write_access_end();
+
 badframe:
 	signal_fault(tsk, regs, "handle_rt_signal32", rt_sf);
 
-- 
2.25.0

