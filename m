Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63DF73F4DA2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 17:37:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtbwV22hyz3cJq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 01:37:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gtbth0msnz2yg3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 01:36:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GtbtN6ThDz9sWx;
 Mon, 23 Aug 2021 17:35:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q3MsoyM3ZJve; Mon, 23 Aug 2021 17:35:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GtbtM5bkyz9sWm;
 Mon, 23 Aug 2021 17:35:55 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9035A8B7AF;
 Mon, 23 Aug 2021 17:35:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id R3keXlOwx4s6; Mon, 23 Aug 2021 17:35:55 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 728DF8B7AD;
 Mon, 23 Aug 2021 17:35:55 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6B4476BC7C; Mon, 23 Aug 2021 15:35:55 +0000 (UTC)
Message-Id: <7d391d915d2bd1c0f601f55f61f8dd4c70066229.1629732940.git.christophe.leroy@csgroup.eu>
In-Reply-To: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
References: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 5/5] powerpc/signal: Use unsafe_copy_siginfo_to_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Aug 2021 15:35:55 +0000 (UTC)
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

Use unsafe_copy_siginfo_to_user() in order to do the copy
within the user access block.

On an mpc 8321 (book3s/32) the improvment is about 5% on a process
sending a signal to itself.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 13 ++++++-------
 arch/powerpc/kernel/signal_64.c |  5 +----
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index ff101e2b3bab..f9e16d108bc8 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -710,12 +710,6 @@ static long restore_tm_user_regs(struct pt_regs *regs, struct mcontext __user *s
 }
 #endif
 
-#ifdef CONFIG_PPC64
-
-#define copy_siginfo_to_user	copy_siginfo_to_user32
-
-#endif /* CONFIG_PPC64 */
-
 /*
  * Set up a signal frame for a "real-time" signal handler
  * (one which gets siginfo).
@@ -779,14 +773,19 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 		asm("dcbst %y0; sync; icbi %y0; sync" :: "Z" (mctx->mc_pad[0]));
 	}
 	unsafe_put_sigset_t(&frame->uc.uc_sigmask, oldset, failed);
+#ifndef CONFIG_COMPAT
+	unsafe_copy_siginfo_to_user(&frame->info, &ksig->info, failed);
+#endif
 
 	/* create a stack frame for the caller of the handler */
 	unsafe_put_user(regs->gpr[1], newsp, failed);
 
 	user_access_end();
 
-	if (copy_siginfo_to_user(&frame->info, &ksig->info))
+#ifdef CONFIG_COMPAT
+	if (copy_siginfo_to_user32(&frame->info, &ksig->info))
 		goto badframe;
+#endif
 
 	regs->link = tramp;
 
diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
index 2cca6c8febe1..82b73fbd937d 100644
--- a/arch/powerpc/kernel/signal_64.c
+++ b/arch/powerpc/kernel/signal_64.c
@@ -901,15 +901,12 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
 	}
 
 	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badframe_block);
+	unsafe_copy_siginfo_to_user(&frame->info, &ksig->info, badframe_block);
 	/* Allocate a dummy caller frame for the signal handler. */
 	unsafe_put_user(regs->gpr[1], newsp, badframe_block);
 
 	user_write_access_end();
 
-	/* Save the siginfo outside of the unsafe block. */
-	if (copy_siginfo_to_user(&frame->info, &ksig->info))
-		goto badframe;
-
 	/* Make sure signal handler doesn't get spurious FP exceptions */
 	tsk->thread.fp_state.fpscr = 0;
 
-- 
2.25.0

