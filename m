Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8861D248D8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 19:57:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJXN3mYXzDqNS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 03:57:24 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhj2zZpzDqbC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhc4gW2z9vCxv;
 Tue, 18 Aug 2020 19:19:28 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4IYcg0QqnXeq; Tue, 18 Aug 2020 19:19:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhc3rx3z9vCxg;
 Tue, 18 Aug 2020 19:19:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4EA638B7EC;
 Tue, 18 Aug 2020 19:19:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id cf4O2kJhUrHN; Tue, 18 Aug 2020 19:19:30 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D88908B7D7;
 Tue, 18 Aug 2020 19:19:29 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B498265CF4; Tue, 18 Aug 2020 17:19:29 +0000 (UTC)
Message-Id: <a27797f781aa00da96f8284c898173d18e952361.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 17/25] powerpc/signal32: Switch handle_signal32() to
 user_access_begin() logic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:29 +0000 (UTC)
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

Replace the access_ok() by user_access_begin() and change all user
accesses to unsafe_ version.

Move flush_icache_range() outside the user access block.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index d8c3843102df..fc8ba4b29edf 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -840,35 +840,35 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	tm_mctx = &frame->mctx_transact;
 #endif
-	if (!access_ok(frame, sizeof(*frame)))
+	if (!user_write_access_begin(frame, sizeof(*frame)))
 		goto badframe;
 	sc = (struct sigcontext __user *) &frame->sctx;
 
 #if _NSIG != 64
 #error "Please adjust handle_signal()"
 #endif
-	if (__put_user(to_user_ptr(ksig->ka.sa.sa_handler), &sc->handler)
-	    || __put_user(oldset->sig[0], &sc->oldmask)
+	unsafe_put_user(to_user_ptr(ksig->ka.sa.sa_handler), &sc->handler, failed);
+	unsafe_put_user(oldset->sig[0], &sc->oldmask, failed);
 #ifdef CONFIG_PPC64
-	    || __put_user((oldset->sig[0] >> 32), &sc->_unused[3])
+	unsafe_put_user((oldset->sig[0] >> 32), &sc->_unused[3], failed);
 #else
-	    || __put_user(oldset->sig[1], &sc->_unused[3])
+	unsafe_put_user(oldset->sig[1], &sc->_unused[3], failed);
 #endif
-	    || __put_user(to_user_ptr(mctx), &sc->regs)
-	    || __put_user(ksig->sig, &sc->signal))
-		goto badframe;
+	unsafe_put_user(to_user_ptr(mctx), &sc->regs, failed);
+	unsafe_put_user(ksig->sig, &sc->signal, failed);
 
 	if (vdso32_sigtramp && tsk->mm->context.vdso_base) {
 		tramp = tsk->mm->context.vdso_base + vdso32_sigtramp;
 	} else {
 		tramp = (unsigned long)mctx->mc_pad;
 		/* Set up the sigreturn trampoline: li r0,sigret; sc */
-		if (__put_user(PPC_INST_ADDI + __NR_sigreturn, &mctx->mc_pad[0]))
-			goto badframe;
-		if (__put_user(PPC_INST_SC, &mctx->mc_pad[1]))
-			goto badframe;
-		flush_icache_range(tramp, tramp + 2 * sizeof(unsigned long));
+		unsafe_put_user(PPC_INST_ADDI + __NR_sigreturn, &mctx->mc_pad[0], failed);
+		unsafe_put_user(PPC_INST_SC, &mctx->mc_pad[1], failed);
 	}
+	user_write_access_end();
+
+	if (tramp == (unsigned long)mctx->mc_pad)
+		flush_icache_range(tramp, tramp + 2 * sizeof(unsigned long));
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
 	if (MSR_TM_ACTIVE(msr)) {
@@ -901,6 +901,9 @@ int handle_signal32(struct ksignal *ksig, sigset_t *oldset,
 	regs->msr &= ~MSR_LE;
 	return 0;
 
+failed:
+	user_write_access_end();
+
 badframe:
 	signal_fault(tsk, regs, "handle_signal32", frame);
 
-- 
2.25.0

