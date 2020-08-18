Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39012248DB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 20:07:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJmK4L2gzDqd7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:07:45 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhp3Fp9zDqbf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:38 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhj5Mjyz9vCy7;
 Tue, 18 Aug 2020 19:19:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 10qMUz2cC2BH; Tue, 18 Aug 2020 19:19:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhj4cSHz9vCxg;
 Tue, 18 Aug 2020 19:19:33 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 441588B7EC;
 Tue, 18 Aug 2020 19:19:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id faFp51Yn7eYl; Tue, 18 Aug 2020 19:19:35 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1551C8B7D7;
 Tue, 18 Aug 2020 19:19:35 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E0A0765CF4; Tue, 18 Aug 2020 17:19:34 +0000 (UTC)
Message-Id: <c3ac4f2d134a3391bb51bdaa2d00e9a409aba9f8.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 22/25] powerpc/signal32: Switch swap_context() to
 user_access_begin() logic
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:34 +0000 (UTC)
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

As this was the last user of put_sigset_t(), remove it as well.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 24 ++++++++++--------------
 1 file changed, 10 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 3f9f315dd036..5b8a4ede142c 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -82,11 +82,6 @@
  * Functions for flipping sigsets (thanks to brain dead generic
  * implementation that makes things simple for little endian only)
  */
-static inline int put_sigset_t(compat_sigset_t __user *uset, sigset_t *set)
-{
-	return put_compat_sigset(uset, set, sizeof(*uset));
-}
-
 #define unsafe_put_sigset_t	unsafe_put_compat_sigset
 
 static inline int get_sigset_t(sigset_t *set,
@@ -138,11 +133,6 @@ static inline int restore_general_regs(struct pt_regs *regs,
 
 #define GP_REGS_SIZE	min(sizeof(elf_gregset_t), sizeof(struct pt_regs))
 
-static inline int put_sigset_t(sigset_t __user *uset, sigset_t *set)
-{
-	return copy_to_user(uset, set, sizeof(*uset));
-}
-
 #define unsafe_put_sigset_t(uset, set, label) do {			\
 	sigset_t __user *__us = uset	;				\
 	const sigset_t *__s = set;					\
@@ -1048,11 +1038,13 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 		 */
 		mctx = (struct mcontext __user *)
 			((unsigned long) &old_ctx->uc_mcontext & ~0xfUL);
-		if (!access_ok(old_ctx, ctx_size)
-		    || save_user_regs(regs, mctx, NULL, ctx_has_vsx_region)
-		    || put_sigset_t(&old_ctx->uc_sigmask, &current->blocked)
-		    || __put_user(to_user_ptr(mctx), &old_ctx->uc_regs))
+		if (save_user_regs(regs, mctx, NULL, ctx_has_vsx_region))
+			return -EFAULT;
+		if (!user_write_access_begin(old_ctx, ctx_size))
 			return -EFAULT;
+		unsafe_put_sigset_t(&old_ctx->uc_sigmask, &current->blocked, failed);
+		unsafe_put_user(to_user_ptr(mctx), &old_ctx->uc_regs, failed);
+		user_write_access_end();
 	}
 	if (new_ctx == NULL)
 		return 0;
@@ -1076,6 +1068,10 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext __user *, old_ctx,
 
 	set_thread_flag(TIF_RESTOREALL);
 	return 0;
+
+failed:
+	user_write_access_end();
+	return -EFAULT;
 }
 
 #ifdef CONFIG_PPC64
-- 
2.25.0

