Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E892429E9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 15:02:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRVGS3bdBzDqCk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 23:02:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRT1y0KttzDqZR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 22:06:14 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BRT1s1nSGzB09Zt;
 Wed, 12 Aug 2020 14:06:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QCWa6f7c4hKp; Wed, 12 Aug 2020 14:06:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BRT1s0p0czB09Zf;
 Wed, 12 Aug 2020 14:06:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D7F58B826;
 Wed, 12 Aug 2020 14:06:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pwBk8hGIuTTj; Wed, 12 Aug 2020 14:06:10 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2849C8B7FC;
 Wed, 12 Aug 2020 14:06:10 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 0B57265C34; Wed, 12 Aug 2020 12:06:10 +0000 (UTC)
Message-Id: <4ea86b6d9f4e3ba0126f9961b98407549d7f0294.1597233555.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597233555.git.christophe.leroy@csgroup.eu>
References: <cover.1597233555.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 18/19] powerpc/signal32: Add and use
 unsafe_put_sigset_t()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ldv@altlinux.org, viro@zeniv.linux.org.uk
Date: Wed, 12 Aug 2020 12:06:10 +0000 (UTC)
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

put_sigset_t() calls copy_to_user() for copying two words.

Because INLINE_COPY_TO_USER is not defined on powerpc,
copy_to_user() doesn't get optimised and falls back to
copy_tofrom_user() with the relevant glue. This is terribly
inefficient for copying two words.

By switching to unsafe_put_user(), we end up with something as
simple as:

 3cc:   81 3d 00 00     lwz     r9,0(r29)
 3d0:   91 26 00 b4     stw     r9,180(r6)
 3d4:   81 3d 00 04     lwz     r9,4(r29)
 3d8:   91 26 00 b8     stw     r9,184(r6)

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/signal_32.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
index d03ba3d8eb68..6cbff0293ff4 100644
--- a/arch/powerpc/kernel/signal_32.c
+++ b/arch/powerpc/kernel/signal_32.c
@@ -87,6 +87,8 @@ static inline int put_sigset_t(compat_sigset_t __user *uset, sigset_t *set)
 	return put_compat_sigset(uset, set, sizeof(*uset));
 }
 
+#define unsafe_put_sigset_t	unsafe_put_compat_sigset
+
 static inline int get_sigset_t(sigset_t *set,
 			       const compat_sigset_t __user *uset)
 {
@@ -143,6 +145,13 @@ static inline int put_sigset_t(sigset_t __user *uset, sigset_t *set)
 	return copy_to_user(uset, set, sizeof(*uset));
 }
 
+#define unsafe_put_sigset_t(uset, set, label) do { 			\
+	sigset_t __user *__us = uset	;				\
+	const sigset_t *__s = set;					\
+									\
+	unsafe_copy_to_user(__us, __s, sizeof(*__us), label);		\
+} while (0)
+
 static inline int get_sigset_t(sigset_t *set, const sigset_t __user *uset)
 {
 	return copy_from_user(set, uset, sizeof(*uset));
@@ -820,10 +829,11 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
 	{
 		unsafe_put_user(0, &rt_sf->uc.uc_link, failed);
 	}
+
+	unsafe_put_sigset_t(&rt_sf->uc.uc_sigmask, oldset, failed);
+
 	user_write_access_end();
 
-	if (put_sigset_t(&rt_sf->uc.uc_sigmask, oldset))
-		goto badframe;
 	if (copy_siginfo_to_user(&rt_sf->info, &ksig->info))
 		goto badframe;
 
-- 
2.25.0

