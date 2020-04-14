Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C806B1A8780
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 19:29:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491stZ1Z5LzDr6y
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 03:29:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=HtS5j6m8; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491sFG0lpLzDqxf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 03:00:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 491sF65Jp9z9v1nr;
 Tue, 14 Apr 2020 19:00:42 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=HtS5j6m8; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id PS3lHpQcNQKi; Tue, 14 Apr 2020 19:00:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 491sF63s8xz9v1nq;
 Tue, 14 Apr 2020 19:00:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586883642; bh=/Ft+Gmyd+9ZkkElmyP5Bs07Yi8xdo9w8wOPT86yD6kg=;
 h=From:Subject:To:Cc:Date:From;
 b=HtS5j6m8XxTrH2uKPtOkuFfdyRrxI7e5BjJNjt7mvZd9KUqHLDJ63bg3YWdn+vmHI
 Km5la3U/hDoMOGd9+Pr2JGJs2m2AnwrEQqrCkKfUnDnwDXjheFlwnyhpseJdqdDcdN
 4UBDdDx2Rkgo8RW0hMXL73CKHS67Yd2MEYHf9Pzg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3913E8B912;
 Tue, 14 Apr 2020 19:00:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WOtW7gCovPuE; Tue, 14 Apr 2020 19:00:44 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D51AA8B8DC;
 Tue, 14 Apr 2020 19:00:43 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9A84A6578A; Tue, 14 Apr 2020 17:00:43 +0000 (UTC)
Message-Id: <b5cae5af3c68cb76770efdeea31cfe4c4be8c156.1586883626.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/uaccess: Implement unsafe_put_user() using 'asm goto'
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com
Date: Tue, 14 Apr 2020 17:00:43 +0000 (UTC)
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

unsafe_put_user() is designed to take benefit of 'asm goto'.

Instead of using the standard __put_user() approach and branch
based on the returned error, use 'asm goto' to branch directly
to the error label from the .fixup code.

This change significantly simplifies functions using
unsafe_put_user()

Small exemple of the benefit with the following code:

struct test {
	unsigned long item1;
	unsigned long item2;
	unsigned long item3;
};

int set_test_to_user(struct test __user *test, unsigned long item1,
		     unsigned long item2, unsigned long item3)
{
	unsafe_put_user(item1, &test->item1, failed);
	unsafe_put_user(item2, &test->item2, failed);
	unsafe_put_user(item3, &test->item3, failed);
	return 0;
failed:
	return -EFAULT;
}

Before the patch:

00000d94 <set_test_to_user>:
 d94:	39 20 00 00 	li      r9,0
 d98:	90 83 00 00 	stw     r4,0(r3)
 d9c:	2f 89 00 00 	cmpwi   cr7,r9,0
 da0:	40 9e 00 30 	bne     cr7,dd0 <set_test_to_user+0x3c>
 da4:	39 43 00 04 	addi    r10,r3,4
 da8:	90 aa 00 00 	stw     r5,0(r10)
 dac:	2f 89 00 00 	cmpwi   cr7,r9,0
 db0:	40 9e 00 20 	bne     cr7,dd0 <set_test_to_user+0x3c>
 db4:	38 63 00 08 	addi    r3,r3,8
 db8:	90 c3 00 00 	stw     r6,0(r3)
 dbc:	21 29 00 00 	subfic  r9,r9,0
 dc0:	7d 29 49 10 	subfe   r9,r9,r9
 dc4:	38 60 ff f2 	li      r3,-14
 dc8:	7d 23 18 38 	and     r3,r9,r3
 dcc:	4e 80 00 20 	blr
 dd0:	38 60 ff f2 	li      r3,-14
 dd4:	4e 80 00 20 	blr

00000000 <.fixup>:
	...
  b8:	39 20 ff f2 	li      r9,-14
  bc:	48 00 00 00 	b       bc <.fixup+0xbc>
			bc: R_PPC_REL24	.text+0xd9c
  c0:	39 20 ff f2 	li      r9,-14
  c4:	48 00 00 00 	b       c4 <.fixup+0xc4>
			c4: R_PPC_REL24	.text+0xdac
  c8:	39 20 ff f2 	li      r9,-14
  cc:	48 00 00 00 	b       cc <.fixup+0xcc>
			cc: R_PPC_REL24	.text+0xdbc

After the patch:

00000d94 <set_test_to_user>:
 d94:	90 83 00 00 	stw     r4,0(r3)
 d98:	39 23 00 04 	addi    r9,r3,4
 d9c:	90 a9 00 00 	stw     r5,0(r9)
 da0:	38 63 00 08 	addi    r3,r3,8
 da4:	90 c3 00 00 	stw     r6,0(r3)
 da8:	38 60 00 00 	li      r3,0
 dac:	4e 80 00 20 	blr
 db0:	38 60 ff f2 	li      r3,-14
 db4:	4e 80 00 20 	blr

00000000 <.fixup>:
	...
  b8:	48 00 00 00 	b       b8 <.fixup+0xb8>
			b8: R_PPC_REL24	.text+0xdb0
  bc:	48 00 00 00 	b       bc <.fixup+0xbc>
			bc: R_PPC_REL24	.text+0xdb0
  c0:	48 00 00 00 	b       c0 <.fixup+0xc0>
			c0: R_PPC_REL24	.text+0xdb0

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/uaccess.h | 63 +++++++++++++++++++++++++-----
 1 file changed, 54 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 2f500debae21..b904f3c56463 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -93,12 +93,10 @@ static inline int __access_ok(unsigned long addr, unsigned long size,
 #define __get_user(x, ptr) \
 	__get_user_nocheck((x), (ptr), sizeof(*(ptr)), true)
 #define __put_user(x, ptr) \
-	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), true)
+	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)))
 
 #define __get_user_allowed(x, ptr) \
 	__get_user_nocheck((x), (ptr), sizeof(*(ptr)), false)
-#define __put_user_allowed(x, ptr) \
-	__put_user_nocheck((__typeof__(*(ptr)))(x), (ptr), sizeof(*(ptr)), false)
 
 #define __get_user_inatomic(x, ptr) \
 	__get_user_nosleep((x), (ptr), sizeof(*(ptr)))
@@ -124,9 +122,24 @@ extern long __put_user_bad(void);
 		: "=r" (err)					\
 		: "r" (x), "b" (addr), "i" (-EFAULT), "0" (err))
 
+#define __put_user_asm_goto(x, addr, label, op)			\
+	asm volatile goto(					\
+		"1:	" op " %0,0(%1)	# put_user\n"		\
+		"2:\n"						\
+		".section .fixup,\"ax\"\n"			\
+		"3:	b %l2\n"				\
+		".previous\n"					\
+		EX_TABLE(1b, 3b)				\
+		:						\
+		: "r" (x), "b" (addr)				\
+		:						\
+		: label)
+
 #ifdef __powerpc64__
 #define __put_user_asm2(x, ptr, retval)				\
 	  __put_user_asm(x, ptr, retval, "std")
+#define __put_user_asm2_goto(x, ptr, label)			\
+	__put_user_asm_goto(x, ptr, label, "std")
 #else /* __powerpc64__ */
 #define __put_user_asm2(x, addr, err)				\
 	__asm__ __volatile__(					\
@@ -141,6 +154,20 @@ extern long __put_user_bad(void);
 		EX_TABLE(2b, 4b)				\
 		: "=r" (err)					\
 		: "r" (x), "b" (addr), "i" (-EFAULT), "0" (err))
+#define __put_user_asm2_goto(x, addr, label)			\
+	asm volatile goto(					\
+		"1:	stw %0,0(%1)\n"				\
+		"2:	stw %L0,4(%1)\n"			\
+		"3:\n"						\
+		".section .fixup,\"ax\"\n"			\
+		"4:	b %l2\n"				\
+		".previous\n"					\
+		EX_TABLE(1b, 4b)				\
+		EX_TABLE(2b, 4b)				\
+		:						\
+		: "r" (x), "b" (addr)				\
+		:						\
+		: label)
 #endif /* __powerpc64__ */
 
 #define __put_user_size_allowed(x, ptr, size, retval)		\
@@ -155,6 +182,17 @@ do {								\
 	}							\
 } while (0)
 
+#define __put_user_size_goto(x, ptr, size, label)		\
+do {								\
+	switch (size) {						\
+	case 1: __put_user_asm_goto(x, ptr, label, "stb"); break;	\
+	case 2: __put_user_asm_goto(x, ptr, label, "sth"); break;	\
+	case 4: __put_user_asm_goto(x, ptr, label, "stw"); break;	\
+	case 8: __put_user_asm2_goto(x, ptr, label); break;	\
+	default: __put_user_bad();				\
+	}							\
+} while (0)
+
 #define __put_user_size(x, ptr, size, retval)			\
 do {								\
 	allow_write_to_user(ptr, size);				\
@@ -162,20 +200,26 @@ do {								\
 	prevent_write_to_user(ptr, size);			\
 } while (0)
 
-#define __put_user_nocheck(x, ptr, size, do_allow)			\
+#define __put_user_nocheck(x, ptr, size)			\
 ({								\
 	long __pu_err;						\
 	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
 	if (!is_kernel_addr((unsigned long)__pu_addr))		\
 		might_fault();					\
 	__chk_user_ptr(ptr);					\
-	if (do_allow)								\
-		__put_user_size((x), __pu_addr, (size), __pu_err);		\
-	else									\
-		__put_user_size_allowed((x), __pu_addr, (size), __pu_err);	\
+	__put_user_size((x), __pu_addr, (size), __pu_err);		\
 	__pu_err;						\
 })
 
+#define __put_user_goto(x, ptr, size, label)			\
+do {								\
+	__typeof__(*(ptr)) __user *__pu_addr = (ptr);		\
+	if (!is_kernel_addr((unsigned long)__pu_addr))		\
+		might_fault();					\
+	__chk_user_ptr(ptr);					\
+	__put_user_size_goto((x), __pu_addr, (size), label);	\
+} while (0)
+
 #define __put_user_check(x, ptr, size)					\
 ({									\
 	long __pu_err = -EFAULT;					\
@@ -470,7 +514,8 @@ static __must_check inline bool user_access_begin(const void __user *ptr, size_t
 
 #define unsafe_op_wrap(op, err) do { if (unlikely(op)) goto err; } while (0)
 #define unsafe_get_user(x, p, e) unsafe_op_wrap(__get_user_allowed(x, p), e)
-#define unsafe_put_user(x, p, e) unsafe_op_wrap(__put_user_allowed(x, p), e)
+#define unsafe_put_user(x, p, e) \
+	__put_user_goto((__typeof__(*(p)))(x), (p), sizeof(*(p)), e)
 #define unsafe_copy_to_user(d, s, l, e) \
 	unsafe_op_wrap(raw_copy_to_user_allowed(d, s, l), e)
 
-- 
2.25.0

