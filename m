Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7447A2429C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 14:53:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRV4W4TwhzDqR7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 22:53:31 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRT1y2BHNzDqZV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 22:06:14 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BRT1r0XlgzB09Zs;
 Wed, 12 Aug 2020 14:06:08 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EYIVEdrFQatj; Wed, 12 Aug 2020 14:06:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BRT1q6tkvzB09Zf;
 Wed, 12 Aug 2020 14:06:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 691C98B828;
 Wed, 12 Aug 2020 14:06:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XALPXVlmoRZG; Wed, 12 Aug 2020 14:06:09 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 213CB8B7FC;
 Wed, 12 Aug 2020 14:06:09 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 03AD265C34; Wed, 12 Aug 2020 12:06:09 +0000 (UTC)
Message-Id: <5fe96b182b49c03dd51659079ac0486436d696c4.1597233555.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1597233555.git.christophe.leroy@csgroup.eu>
References: <cover.1597233555.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [RFC PATCH v1 17/19] signal: Add unsafe_put_compat_sigset()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 ldv@altlinux.org, viro@zeniv.linux.org.uk
Date: Wed, 12 Aug 2020 12:06:09 +0000 (UTC)
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
Cc: Dmitry V. Levin <ldv@altlinux.org>
Cc: Al Viro <viro@zeniv.linux.org.uk>
---
 include/linux/compat.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/compat.h b/include/linux/compat.h
index c4255d8a4a8a..bbe5f9658ed1 100644
--- a/include/linux/compat.h
+++ b/include/linux/compat.h
@@ -442,6 +442,38 @@ put_compat_sigset(compat_sigset_t __user *compat, const sigset_t *set,
 #endif
 }
 
+#ifdef CONFIG_CPU_BIG_ENDIAN
+#define unsafe_put_compat_sigset(compat, set, label) do { 		\
+	compat_sigset_t __user *__c = compat;				\
+	const sigset_t *__s = set;					\
+									\
+	switch (_NSIG_WORDS) {						\
+	case 4:								\
+		unsafe_put_user(__s->sig[3] >> 32, __c->sig[7], label);	\
+		unsafe_put_user(__s->sig[3], __c->sig[6], label);	\
+		fallthrough;						\
+	case 3:								\
+		unsafe_put_user(__s->sig[2] >> 32, __c->sig[5], label);	\
+		unsafe_put_user(__s->sig[2], __c->sig[4], label);	\
+		fallthrough;						\
+	case 2:								\
+		unsafe_put_user(__s->sig[1] >> 32, __c->sig[3], label);	\
+		unsafe_put_user(__s->sig[1], __c->sig[2], label);	\
+		fallthrough;						\
+	case 1:								\
+		unsafe_put_user(__s->sig[0] >> 32, __c->sig[1], label);	\
+		unsafe_put_user(__s->sig[0], __c->sig[0], label);	\
+	}								\
+} while (0)
+#else
+#define unsafe_put_compat_sigset(compat, set, label) do { 		\
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

