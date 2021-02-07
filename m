Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 122D1312364
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 11:10:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DYPzT06PJzDvXp
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Feb 2021 21:10:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DYPxM24BNzDvXG
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Feb 2021 21:08:17 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DYPx466cDz9txrK;
 Sun,  7 Feb 2021 11:08:08 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id kzuzDFmCJECz; Sun,  7 Feb 2021 11:08:08 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DYPx45CBFz9txrJ;
 Sun,  7 Feb 2021 11:08:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C15038B788;
 Sun,  7 Feb 2021 11:08:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dp6qCZ_f1S0i; Sun,  7 Feb 2021 11:08:11 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D8698B766;
 Sun,  7 Feb 2021 11:08:11 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4A964672C0; Sun,  7 Feb 2021 10:08:11 +0000 (UTC)
Message-Id: <c72f014730823b413528e90ab6c4d3bcb79f8497.1612692067.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH] powerpc/uaccess: Perform barrier_nospec() in KUAP allowance
 helpers
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 cmr@codefail.de
Date: Sun,  7 Feb 2021 10:08:11 +0000 (UTC)
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

barrier_nospec() in uaccess helpers is there to protect against
speculative accesses around access_ok().

When using user_access_begin() sequences together with
unsafe_get_user() like macros, barrier_nospec() is called for
every single read although we know the access_ok() is done
onece.

Since all user accesses must be granted by a call to either
allow_read_from_user() or allow_read_write_user() which will
always happen after the access_ok() check, move the barrier_nospec()
there.

Reported-by: Christopher M. Riedl <cmr@codefail.de>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/kup.h     |  2 ++
 arch/powerpc/include/asm/uaccess.h | 12 +-----------
 2 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/kup.h b/arch/powerpc/include/asm/kup.h
index bf221a2a523e..7ec21af49a45 100644
--- a/arch/powerpc/include/asm/kup.h
+++ b/arch/powerpc/include/asm/kup.h
@@ -91,6 +91,7 @@ static __always_inline void setup_kup(void)
 
 static inline void allow_read_from_user(const void __user *from, unsigned long size)
 {
+	barrier_nospec();
 	allow_user_access(NULL, from, size, KUAP_READ);
 }
 
@@ -102,6 +103,7 @@ static inline void allow_write_to_user(void __user *to, unsigned long size)
 static inline void allow_read_write_user(void __user *to, const void __user *from,
 					 unsigned long size)
 {
+	barrier_nospec();
 	allow_user_access(to, from, size, KUAP_READ_WRITE);
 }
 
diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 501c9a79038c..46123ae6a4c9 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -315,7 +315,6 @@ do {								\
 	__chk_user_ptr(__gu_addr);				\
 	if (!is_kernel_addr((unsigned long)__gu_addr))		\
 		might_fault();					\
-	barrier_nospec();					\
 	if (do_allow)								\
 		__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err);	\
 	else									\
@@ -333,10 +332,8 @@ do {								\
 	__typeof__(size) __gu_size = (size);				\
 									\
 	might_fault();							\
-	if (access_ok(__gu_addr, __gu_size)) {				\
-		barrier_nospec();					\
+	if (access_ok(__gu_addr, __gu_size))				\
 		__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
-	}								\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;				\
 									\
 	__gu_err;							\
@@ -350,7 +347,6 @@ do {								\
 	__typeof__(size) __gu_size = (size);			\
 								\
 	__chk_user_ptr(__gu_addr);				\
-	barrier_nospec();					\
 	__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
 	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
 								\
@@ -395,7 +391,6 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
 {
 	unsigned long ret;
 
-	barrier_nospec();
 	allow_read_write_user(to, from, n);
 	ret = __copy_tofrom_user(to, from, n);
 	prevent_read_write_user(to, from, n);
@@ -412,19 +407,15 @@ static inline unsigned long raw_copy_from_user(void *to,
 
 		switch (n) {
 		case 1:
-			barrier_nospec();
 			__get_user_size(*(u8 *)to, from, 1, ret);
 			break;
 		case 2:
-			barrier_nospec();
 			__get_user_size(*(u16 *)to, from, 2, ret);
 			break;
 		case 4:
-			barrier_nospec();
 			__get_user_size(*(u32 *)to, from, 4, ret);
 			break;
 		case 8:
-			barrier_nospec();
 			__get_user_size(*(u64 *)to, from, 8, ret);
 			break;
 		}
@@ -432,7 +423,6 @@ static inline unsigned long raw_copy_from_user(void *to,
 			return 0;
 	}
 
-	barrier_nospec();
 	allow_read_from_user(from, n);
 	ret = __copy_tofrom_user((__force void __user *)to, from, n);
 	prevent_read_from_user(from, n);
-- 
2.25.0

