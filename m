Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC962341B2D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:10:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F21QW3k1Tz3dyY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 22:10:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F21Lc5b4jz3by4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 22:07:03 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F21LX009Sz9tx96;
 Fri, 19 Mar 2021 12:07:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HovJI18WGdp9; Fri, 19 Mar 2021 12:06:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F21LW6C3gz9tx8s;
 Fri, 19 Mar 2021 12:06:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E7668B976;
 Fri, 19 Mar 2021 12:07:00 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xqJzzg0emXHy; Fri, 19 Mar 2021 12:07:00 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5951D8B972;
 Fri, 19 Mar 2021 12:06:59 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F3227675FB; Fri, 19 Mar 2021 11:06:58 +0000 (UTC)
Message-Id: <9273ba664db769b8d9c7540ae91395e346e4945e.1616151715.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1616151715.git.christophe.leroy@csgroup.eu>
References: <cover.1616151715.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 09/10] powerpc/signal32: Convert do_setcontext[_tm]() to user
 access block
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 cmr@codefail.de
Date: Fri, 19 Mar 2021 11:06:58 +0000 (UTC)
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

Add unsafe_get_user_sigset() and transform PPC32 get_sigset_t()
into an unsafe version unsafe_get_sigset_t().

Then convert do_setcontext() and do_setcontext_tm() to use
user_read_access_begin/end.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal.h    |  2 ++
 arch/powerpc/kernel/signal_32.c | 42 +++++++++++++++++++--------------
 2 files changed, 26 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
index a5152ff3c52f..f4aafa337c2e 100644
--- a/arch/powerpc/kernel/signal.h
+++ b/arch/powerpc/kernel/signal.h
@@ -25,6 +25,8 @@ static inline int __get_user_sigset(sigset_t *dst, const sigset_t __user *src)
 
 	return __get_user(dst->sig[0], (u64 __user *)&src->sig[0]);
 }
+#define unsafe_get_user_sigset(dst, src, label) \
+	unsafe_get_user((dst)->sig[0], (u64 __user *)&(src)->sig[0], label)
 
 #ifdef CONFIG_VSX
 extern unsigned long copy_vsx_to_user(void __user *to,
diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index 0b1a6f53e553..592b889e3836 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -83,12 +83,7 @@
  * implementation that makes things simple for little endian only)
  */
 #define unsafe_put_sigset_t	unsafe_put_compat_sigset
-
-static inline int get_sigset_t(sigset_t *set,
-			       const compat_sigset_t __user *uset)
-{
-	return get_compat_sigset(set, uset);
-}
+#define unsafe_get_sigset_t	unsafe_get_compat_sigset
 
 #define to_user_ptr(p)		ptr_to_compat(p)
 #define from_user_ptr(p)	compat_ptr(p)
@@ -144,10 +139,7 @@ __unsafe_restore_general_regs(struct pt_regs *regs, struct mcontext __user *sr)
 	unsafe_copy_to_user(__us, __s, sizeof(*__us), label);		\
 } while (0)
 
-static inline int get_sigset_t(sigset_t *set, const sigset_t __user *uset)
-{
-	return __get_user_sigset(set, uset);
-}
+#define unsafe_get_sigset_t	unsafe_get_user_sigset
 
 #define to_user_ptr(p)		((unsigned long)(p))
 #define from_user_ptr(p)	((void __user *)(p))
@@ -982,25 +974,31 @@ static int do_setcontext(struct ucontext __user *ucp, struct pt_regs *regs, int
 	sigset_t set;
 	struct mcontext __user *mcp;
 
-	if (get_sigset_t(&set, &ucp->uc_sigmask))
+	if (user_read_access_begin(ucp, sizeof(*ucp)))
 		return -EFAULT;
+
+	unsafe_get_sigset_t(&set, &ucp->uc_sigmask, failed);
 #ifdef CONFIG_PPC64
 	{
 		u32 cmcp;
 
-		if (__get_user(cmcp, &ucp->uc_regs))
-			return -EFAULT;
+		unsafe_get_user(cmcp, &ucp->uc_regs, failed);
 		mcp = (struct mcontext __user *)(u64)cmcp;
 	}
 #else
-	if (__get_user(mcp, &ucp->uc_regs))
-		return -EFAULT;
+	unsafe_get_user(mcp, &ucp->uc_regs, failed);
 #endif
+	user_read_access_end();
+
 	set_current_blocked(&set);
 	if (restore_user_regs(regs, mcp, sig))
 		return -EFAULT;
 
 	return 0;
+
+failed:
+	user_read_access_end();
+	return -EFAULT;
 }
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
@@ -1014,11 +1012,15 @@ static int do_setcontext_tm(struct ucontext __user *ucp,
 	u32 cmcp;
 	u32 tm_cmcp;
 
-	if (get_sigset_t(&set, &ucp->uc_sigmask))
+	if (user_read_access_begin(ucp, sizeof(*ucp)))
 		return -EFAULT;
 
-	if (__get_user(cmcp, &ucp->uc_regs) ||
-	    __get_user(tm_cmcp, &tm_ucp->uc_regs))
+	unsafe_get_sigset_t(&set, &ucp->uc_sigmask, failed);
+	unsafe_get_user(cmcp, &ucp->uc_regs, failed);
+
+	user_read_access_end();
+
+	if (__get_user(tm_cmcp, &tm_ucp->uc_regs))
 		return -EFAULT;
 	mcp = (struct mcontext __user *)(u64)cmcp;
 	tm_mcp = (struct mcontext __user *)(u64)tm_cmcp;
@@ -1029,6 +1031,10 @@ static int do_setcontext_tm(struct ucontext __user *ucp,
 		return -EFAULT;
 
 	return 0;
+
+failed:
+	user_read_access_end();
+	return -EFAULT;
 }
 #endif
 
-- 
2.25.0

