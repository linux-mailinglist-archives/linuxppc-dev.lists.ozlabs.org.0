Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F31740971D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 17:20:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7VYF442Hz3c8k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 01:20:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7VWw3WSpz2yJw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 01:19:40 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4H7VWk2R3Jz9sVX;
 Mon, 13 Sep 2021 17:19:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EWU2ONK7-YPH; Mon, 13 Sep 2021 17:19:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4H7VWh3WMbz9sVl;
 Mon, 13 Sep 2021 17:19:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 644148B774;
 Mon, 13 Sep 2021 17:19:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PxYYhFfp9iBP; Mon, 13 Sep 2021 17:19:28 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [172.25.230.107])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2099F8B763;
 Mon, 13 Sep 2021 17:19:28 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 18DFJJCm157768
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Mon, 13 Sep 2021 17:19:20 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 18DFJJ9t157767;
 Mon, 13 Sep 2021 17:19:19 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Michael Ellerman <mpe@ellerman.id.au>, ebiederm@xmission.com,
 hch@infradead.org
Subject: [PATCH RESEND v3 3/6] signal: Add unsafe_copy_siginfo_to_user()
Date: Mon, 13 Sep 2021 17:19:07 +0200
Message-Id: <4a31723d50fe14f95ece6ee29538db82e21751bf.1631537060.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <1718f38859d5366f82d5bef531f255cedf537b5d.1631537060.git.christophe.leroy@csgroup.eu>
References: <1718f38859d5366f82d5bef531f255cedf537b5d.1631537060.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This commit adds the generic fallback for unsafe_clear_user().
Architectures wanting to use unsafe_copy_siginfo_to_user() within a
user_access_begin() section have to make sure they have their
own unsafe_clear_user().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3: Added precision about unsafe_clear_user() in commit message.
---
 include/linux/signal.h  | 15 +++++++++++++++
 include/linux/uaccess.h |  1 +
 kernel/signal.c         |  5 -----
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/include/linux/signal.h b/include/linux/signal.h
index 3f96a6374e4f..70ea7e741427 100644
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
index 952741f6d0f9..23f168730b7e 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -3324,11 +3324,6 @@ enum siginfo_layout siginfo_layout(unsigned sig, int si_code)
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
2.31.1

