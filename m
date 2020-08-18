Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1AC248DA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 20:01:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWJdN3PNlzDqgk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 04:01:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWHhn1pJTzDqbt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 03:19:37 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BWHhg3Tvnz9vCy0;
 Tue, 18 Aug 2020 19:19:31 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8pkMd_j9NkKu; Tue, 18 Aug 2020 19:19:31 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BWHhg2lZJz9vCxg;
 Tue, 18 Aug 2020 19:19:31 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A9098B7EC;
 Tue, 18 Aug 2020 19:19:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Zzzz-Z2qN1Ye; Tue, 18 Aug 2020 19:19:33 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E96978B7D7;
 Tue, 18 Aug 2020 19:19:32 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id C8C0565CF4; Tue, 18 Aug 2020 17:19:32 +0000 (UTC)
Message-Id: <537c7082ee309a0bb9c67a50c5d9dd929aedb82d.1597770847.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597770847.git.christophe.leroy@csgroup.eu>
References: <cover.1597770847.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 20/25] signal: Add unsafe_put_compat_sigset()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 18 Aug 2020 17:19:32 +0000 (UTC)
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

Implement 'unsafe' version of put_compat_sigset()

For the bigendian, use unsafe_put_user() directly
to avoid intermediate copy through the stack.

For the littleendian, use a straight unsafe_copy_to_user().

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 include/linux/compat.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/compat.h b/include/linux/compat.h
index d38c4d7e83bd..7ec6e44b093b 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -442,6 +442,38 @@ put_compat_sigset(compat_sigset_t __user *compat, const sigset_t *set,
 #endif
 }
 
+#ifdef CONFIG_CPU_BIG_ENDIAN
+#define unsafe_put_compat_sigset(compat, set, label) do {		\
+	compat_sigset_t __user *__c = compat;				\
+	const sigset_t *__s = set;					\
+									\
+	switch (_NSIG_WORDS) {						\
+	case 4:								\
+		unsafe_put_user(__s->sig[3] >> 32, &__c->sig[7], label);	\
+		unsafe_put_user(__s->sig[3], &__c->sig[6], label);	\
+		fallthrough;						\
+	case 3:								\
+		unsafe_put_user(__s->sig[2] >> 32, &__c->sig[5], label);	\
+		unsafe_put_user(__s->sig[2], &__c->sig[4], label);	\
+		fallthrough;						\
+	case 2:								\
+		unsafe_put_user(__s->sig[1] >> 32, &__c->sig[3], label);	\
+		unsafe_put_user(__s->sig[1], &__c->sig[2], label);	\
+		fallthrough;						\
+	case 1:								\
+		unsafe_put_user(__s->sig[0] >> 32, &__c->sig[1], label);	\
+		unsafe_put_user(__s->sig[0], &__c->sig[0], label);	\
+	}								\
+} while (0)
+#else
+#define unsafe_put_compat_sigset(compat, set, label) do {		\
+	compat_sigset_t __user *__c = compat;				\
+	const sigset_t *__s = set;					\
+									\
+	unsafe_copy_to_user(__c, __s, sizeof(*__c), label);		\
+} while (0)
+#endif
+
 extern int compat_ptrace_request(struct task_struct *child,
 				 compat_long_t request,
 				 compat_ulong_t addr, compat_ulong_t data);
-- 
2.25.0

