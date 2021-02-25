Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94653254DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 18:53:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmgPz5nVkz3d7Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 04:53:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmgLW2jQ4z3cjr
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 04:50:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DmgLQ6NXvz9v1BB;
 Thu, 25 Feb 2021 18:50:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QvMhW63DNFRf; Thu, 25 Feb 2021 18:50:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DmgLQ5FHxz9v19y;
 Thu, 25 Feb 2021 18:50:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 905668B895;
 Thu, 25 Feb 2021 18:50:40 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hhm05etgtTnB; Thu, 25 Feb 2021 18:50:40 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E6888B88B;
 Thu, 25 Feb 2021 18:50:40 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 295BD67442; Thu, 25 Feb 2021 17:50:40 +0000 (UTC)
Message-Id: <1bca82b81046b5cf094fbb9163d73c4043455865.1614275314.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1614275314.git.christophe.leroy@csgroup.eu>
References: <cover.1614275314.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 10/15] powerpc/uaccess: Split out __get_user_nocheck()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 25 Feb 2021 17:50:40 +0000 (UTC)
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

One part of __get_user_nocheck() is used for __get_user(),
the other part for unsafe_get_user().

Move the part dedicated to unsafe_get_user() in it.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/uaccess.h | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index a8c683695ec7..678651a615c3 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -49,7 +49,7 @@ static inline bool __access_ok(unsigned long addr, unsigned long size)
 	__put_user_check((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
 
 #define __get_user(x, ptr) \
-	__get_user_nocheck((x), (ptr), sizeof(*(ptr)), true)
+	__get_user_nocheck((x), (ptr), sizeof(*(ptr)))
 #define __put_user(x, ptr) \
 	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
 
@@ -216,19 +216,15 @@ do {								\
 #define __long_type(x) \
 	__typeof__(__builtin_choose_expr(sizeof(x) > sizeof(0UL), 0ULL, 0UL))
 
-#define __get_user_nocheck(x, ptr, size, do_allow)			\
+#define __get_user_nocheck(x, ptr, size)			\
 ({								\
 	long __gu_err;						\
 	__long_type(*(ptr)) __gu_val;				\
 	__typeof__(*(ptr)) __user *__gu_addr = (ptr);	\
 	__typeof__(size) __gu_size = (size);			\
 								\
-	if (do_allow) {								\
-		might_fault();					\
-		__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err);	\
-	} else {									\
-		__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err); \
-	}									\
+	might_fault();					\
+	__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err);	\
 	(x) = (__typeof__(*(ptr)))__gu_val;			\
 								\
 	__gu_err;						\
@@ -386,8 +382,14 @@ user_write_access_begin(const void __user *ptr, size_t len)
 #define user_write_access_end		prevent_current_write_to_user
 
 #define unsafe_get_user(x, p, e) do {					\
-	if (unlikely(__get_user_nocheck((x), (p), sizeof(*(p)), false)))\
-		goto e;							\
+	long __gu_err;						\
+	__long_type(*(p)) __gu_val;				\
+	__typeof__(*(p)) __user *__gu_addr = (p);		\
+								\
+	__get_user_size_allowed(__gu_val, __gu_addr, sizeof(*(p)), __gu_err); \
+	if (__gu_err)						\
+		goto e;						\
+	(x) = (__typeof__(*(p)))__gu_val;			\
 } while (0)
 
 #define unsafe_put_user(x, p, e) \
-- 
2.25.0

