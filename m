Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2D73F4D9F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 17:37:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gtbvd3yN2z2yJR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 01:37:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtbtX1smbz2yK6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Aug 2021 01:36:04 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GtbtL3fhlz9sT5;
 Mon, 23 Aug 2021 17:35:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y5iTCjVg7hjg; Mon, 23 Aug 2021 17:35:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GtbtK4Tthz9sWm;
 Mon, 23 Aug 2021 17:35:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 80CA58B7AF;
 Mon, 23 Aug 2021 17:35:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id AgmLn7dR3tfH; Mon, 23 Aug 2021 17:35:53 +0200 (CEST)
Received: from po18078vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 62DBC8B7AD;
 Mon, 23 Aug 2021 17:35:53 +0200 (CEST)
Received: by po18078vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5BFAE6BC7C; Mon, 23 Aug 2021 15:35:53 +0000 (UTC)
Message-Id: <a94be61f008ab29c231b805e1a97e9dab35cb0cc.1629732940.git.christophe.leroy@csgroup.eu>
In-Reply-To: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
References: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 3/5] signal: Add unsafe_copy_siginfo_to_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 23 Aug 2021 15:35:53 +0000 (UTC)
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

In the same spirit as commit fb05121fd6a2 ("signal: Add
unsafe_get_compat_sigset()"), implement an 'unsafe' version of
copy_siginfo_to_user() in order to use it within user access blocks.

For that, also add an 'unsafe' version of clear_user().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/signal.h  | 15 +++++++++++++++
 include/linux/uaccess.h |  1 +
 kernel/signal.c         |  5 -----
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/linux/signal.h b/include/linux/signal.h
index 3454c7ff0778..659bd43daf10 100644
--- a/include/linux/signal.h
+++ b/include/linux/signal.h
@@ -35,6 +35,21 @@ static inline void copy_siginfo_to_external(siginfo_t *to,
 int copy_siginfo_to_user(siginfo_t __user *to, const kernel_siginfo_t *from);
 int copy_siginfo_from_user(kernel_siginfo_t *to, const siginfo_t __user *from);
 
+static __always_inline char __user *si_expansion(const siginfo_t __user *info)
+{
+	return ((char __user *)info) + sizeof(struct kernel_siginfo);
+}
+
+#define unsafe_copy_siginfo_to_user(to, from, label) do {		\
+	siginfo_t __user *__ucs_to = to;				\
+	const kernel_siginfo_t *__ucs_from = from;			\
+	char __user *__ucs_expansion = si_expansion(__ucs_to);		\
+									\
+	unsafe_copy_to_user(__ucs_to, __ucs_from,			\
+			    sizeof(struct kernel_siginfo), label);	\
+	unsafe_clear_user(__ucs_expansion, SI_EXPANSION_SIZE, label);	\
+} while (0)
+
 enum siginfo_layout {
 	SIL_KILL,
 	SIL_TIMER,
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index c05e903cef02..37073caac474 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -398,6 +398,7 @@ long strnlen_user_nofault(const void __user *unsafe_addr, long count);
 #define unsafe_put_user(x,p,e) unsafe_op_wrap(__put_user(x,p),e)
 #define unsafe_copy_to_user(d,s,l,e) unsafe_op_wrap(__copy_to_user(d,s,l),e)
 #define unsafe_copy_from_user(d,s,l,e) unsafe_op_wrap(__copy_from_user(d,s,l),e)
+#define unsafe_clear_user(d, l, e) unsafe_op_wrap(__clear_user(d, l), e)
 static inline unsigned long user_access_save(void) { return 0UL; }
 static inline void user_access_restore(unsigned long flags) { }
 #endif
diff --git a/kernel/signal.c b/kernel/signal.c
index a3229add4455..83b5971e4304 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3261,11 +3261,6 @@ enum siginfo_layout siginfo_layout(unsigned sig, int si_code)
 	return layout;
 }
 
-static inline char __user *si_expansion(const siginfo_t __user *info)
-{
-	return ((char __user *)info) + sizeof(struct kernel_siginfo);
-}
-
 int copy_siginfo_to_user(siginfo_t __user *to, const kernel_siginfo_t *from)
 {
 	char __user *expansion = si_expansion(to);
-- 
2.25.0

