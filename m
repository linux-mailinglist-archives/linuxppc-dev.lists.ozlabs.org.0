Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A2C1A9886
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 11:23:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492H2Z4yMHzDqLG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 19:23:02 +1000 (AEST)
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
 header.s=mail header.b=FM7IwaxA; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492Gzf4XfVzDqF1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 19:20:30 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 492GzZ0PJNz9txYk;
 Wed, 15 Apr 2020 11:20:26 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=FM7IwaxA; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id E8EYgGbt1l53; Wed, 15 Apr 2020 11:20:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 492GzY6FJRz9txYP;
 Wed, 15 Apr 2020 11:20:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586942425; bh=Zx/m7cX70Qco3IdgO2OxDCiZ5LszHX6htR1zAIB9hVA=;
 h=From:Subject:To:Cc:Date:From;
 b=FM7IwaxAf7QV+Yl778qcQ1H8k50Q5pC5C466U4BkhK6Sok/ghqGAbu2bspftQMLse
 PWlTTG3rUrp98AUlKIAOU1efGw6PvjmP960hynKetpgx4/RPoUED3l9khKXaxVFtpl
 P94wQ+qT11bM6DPrQ2GWJeoRInKzrjjWw4DuFzXg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E8E3E8B924;
 Wed, 15 Apr 2020 11:20:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vOAMJDbS8irH; Wed, 15 Apr 2020 11:20:26 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9854B8B91F;
 Wed, 15 Apr 2020 11:20:26 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5E95765788; Wed, 15 Apr 2020 09:20:26 +0000 (UTC)
Message-Id: <4fdc2aba6f5e51887d1cd0fee94be0989eada2cd.1586942312.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/uaccess: Use flexible addressing with
 __put_user()/__get_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, segher@kernel.crashing.org
Date: Wed, 15 Apr 2020 09:20:26 +0000 (UTC)
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

At the time being, __put_user()/__get_user() and friends only use
register indirect with immediate index addressing, with the index
set to 0. Ex:

	lwz	reg1, 0(reg2)

Give the compiler the opportunity to use other adressing modes
whenever possible, to get more optimised code.

Hereunder is a small exemple:

struct test {
	u32 item1;
	u16 item2;
	u8 item3;
	u64 item4;
};

int set_test_user(struct test __user *from, struct test __user *to, int idx)
{
	int err;
	u32 item1;
	u16 item2;
	u8 item3;
	u64 item4;

	err = __get_user(item1, &from->item1);
	err |= __get_user(item2, &from->item2);
	err |= __get_user(item3, &from->item3);
	err |= __get_user(item4, &from->item4);

	err |= __put_user(item1, &to->item1);
	err |= __put_user(item2, &to->item2);
	err |= __put_user(item3, &to->item3);
	err |= __put_user(item4, &to->item4);

	return err;
}

Before the patch:

00000df0 <set_test_user>:
 df0:	94 21 ff f0 	stwu    r1,-16(r1)
 df4:	39 40 00 00 	li      r10,0
 df8:	93 c1 00 08 	stw     r30,8(r1)
 dfc:	93 e1 00 0c 	stw     r31,12(r1)
 e00:	7d 49 53 78 	mr      r9,r10
 e04:	80 a3 00 00 	lwz     r5,0(r3)
 e08:	38 e3 00 04 	addi    r7,r3,4
 e0c:	7d 46 53 78 	mr      r6,r10
 e10:	a0 e7 00 00 	lhz     r7,0(r7)
 e14:	7d 29 33 78 	or      r9,r9,r6
 e18:	39 03 00 06 	addi    r8,r3,6
 e1c:	7d 46 53 78 	mr      r6,r10
 e20:	89 08 00 00 	lbz     r8,0(r8)
 e24:	7d 29 33 78 	or      r9,r9,r6
 e28:	38 63 00 08 	addi    r3,r3,8
 e2c:	7d 46 53 78 	mr      r6,r10
 e30:	83 c3 00 00 	lwz     r30,0(r3)
 e34:	83 e3 00 04 	lwz     r31,4(r3)
 e38:	7d 29 33 78 	or      r9,r9,r6
 e3c:	7d 43 53 78 	mr      r3,r10
 e40:	90 a4 00 00 	stw     r5,0(r4)
 e44:	7d 29 1b 78 	or      r9,r9,r3
 e48:	38 c4 00 04 	addi    r6,r4,4
 e4c:	7d 43 53 78 	mr      r3,r10
 e50:	b0 e6 00 00 	sth     r7,0(r6)
 e54:	7d 29 1b 78 	or      r9,r9,r3
 e58:	38 e4 00 06 	addi    r7,r4,6
 e5c:	7d 43 53 78 	mr      r3,r10
 e60:	99 07 00 00 	stb     r8,0(r7)
 e64:	7d 23 1b 78 	or      r3,r9,r3
 e68:	38 84 00 08 	addi    r4,r4,8
 e6c:	93 c4 00 00 	stw     r30,0(r4)
 e70:	93 e4 00 04 	stw     r31,4(r4)
 e74:	7c 63 53 78 	or      r3,r3,r10
 e78:	83 c1 00 08 	lwz     r30,8(r1)
 e7c:	83 e1 00 0c 	lwz     r31,12(r1)
 e80:	38 21 00 10 	addi    r1,r1,16
 e84:	4e 80 00 20 	blr

After the patch:

00000dbc <set_test_user>:
 dbc:	39 40 00 00 	li      r10,0
 dc0:	7d 49 53 78 	mr      r9,r10
 dc4:	80 03 00 00 	lwz     r0,0(r3)
 dc8:	7d 48 53 78 	mr      r8,r10
 dcc:	a1 63 00 04 	lhz     r11,4(r3)
 dd0:	7d 29 43 78 	or      r9,r9,r8
 dd4:	7d 48 53 78 	mr      r8,r10
 dd8:	88 a3 00 06 	lbz     r5,6(r3)
 ddc:	7d 29 43 78 	or      r9,r9,r8
 de0:	7d 48 53 78 	mr      r8,r10
 de4:	80 c3 00 08 	lwz     r6,8(r3)
 de8:	80 e3 00 0c 	lwz     r7,12(r3)
 dec:	7d 29 43 78 	or      r9,r9,r8
 df0:	7d 43 53 78 	mr      r3,r10
 df4:	90 04 00 00 	stw     r0,0(r4)
 df8:	7d 29 1b 78 	or      r9,r9,r3
 dfc:	7d 43 53 78 	mr      r3,r10
 e00:	b1 64 00 04 	sth     r11,4(r4)
 e04:	7d 29 1b 78 	or      r9,r9,r3
 e08:	7d 43 53 78 	mr      r3,r10
 e0c:	98 a4 00 06 	stb     r5,6(r4)
 e10:	7d 23 1b 78 	or      r3,r9,r3
 e14:	90 c4 00 08 	stw     r6,8(r4)
 e18:	90 e4 00 0c 	stw     r7,12(r4)
 e1c:	7c 63 53 78 	or      r3,r3,r10
 e20:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/uaccess.h | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 2f500debae21..dee71e9c7618 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -114,7 +114,7 @@ extern long __put_user_bad(void);
  */
 #define __put_user_asm(x, addr, err, op)			\
 	__asm__ __volatile__(					\
-		"1:	" op " %1,0(%2)	# put_user\n"		\
+		"1:	" op "%U2%X2 %1,%2	# put_user\n"	\
 		"2:\n"						\
 		".section .fixup,\"ax\"\n"			\
 		"3:	li %0,%3\n"				\
@@ -122,7 +122,7 @@ extern long __put_user_bad(void);
 		".previous\n"					\
 		EX_TABLE(1b, 3b)				\
 		: "=r" (err)					\
-		: "r" (x), "b" (addr), "i" (-EFAULT), "0" (err))
+		: "r" (x), "m" (*addr), "i" (-EFAULT), "0" (err))
 
 #ifdef __powerpc64__
 #define __put_user_asm2(x, ptr, retval)				\
@@ -130,8 +130,8 @@ extern long __put_user_bad(void);
 #else /* __powerpc64__ */
 #define __put_user_asm2(x, addr, err)				\
 	__asm__ __volatile__(					\
-		"1:	stw %1,0(%2)\n"				\
-		"2:	stw %1+1,4(%2)\n"			\
+		"1:	stw%U2%X2 %1,%2\n"			\
+		"2:	stw%U2%X2 %L1,%L2\n"			\
 		"3:\n"						\
 		".section .fixup,\"ax\"\n"			\
 		"4:	li %0,%3\n"				\
@@ -140,7 +140,7 @@ extern long __put_user_bad(void);
 		EX_TABLE(1b, 4b)				\
 		EX_TABLE(2b, 4b)				\
 		: "=r" (err)					\
-		: "r" (x), "b" (addr), "i" (-EFAULT), "0" (err))
+		: "r" (x), "m" (*addr), "i" (-EFAULT), "0" (err))
 #endif /* __powerpc64__ */
 
 #define __put_user_size_allowed(x, ptr, size, retval)		\
@@ -217,7 +217,7 @@ extern long __get_user_bad(void);
 
 #define __get_user_asm(x, addr, err, op)		\
 	__asm__ __volatile__(				\
-		"1:	"op" %1,0(%2)	# get_user\n"	\
+		"1:	"op"%U2%X2 %1, %2	# get_user\n"	\
 		"2:\n"					\
 		".section .fixup,\"ax\"\n"		\
 		"3:	li %0,%3\n"			\
@@ -226,7 +226,7 @@ extern long __get_user_bad(void);
 		".previous\n"				\
 		EX_TABLE(1b, 3b)			\
 		: "=r" (err), "=r" (x)			\
-		: "b" (addr), "i" (-EFAULT), "0" (err))
+		: "m" (*addr), "i" (-EFAULT), "0" (err))
 
 #ifdef __powerpc64__
 #define __get_user_asm2(x, addr, err)			\
@@ -234,8 +234,8 @@ extern long __get_user_bad(void);
 #else /* __powerpc64__ */
 #define __get_user_asm2(x, addr, err)			\
 	__asm__ __volatile__(				\
-		"1:	lwz %1,0(%2)\n"			\
-		"2:	lwz %1+1,4(%2)\n"		\
+		"1:	lwz%U2%X2 %1, %2\n"			\
+		"2:	lwz%U2%X2 %L1, %L2\n"		\
 		"3:\n"					\
 		".section .fixup,\"ax\"\n"		\
 		"4:	li %0,%3\n"			\
@@ -246,7 +246,7 @@ extern long __get_user_bad(void);
 		EX_TABLE(1b, 4b)			\
 		EX_TABLE(2b, 4b)			\
 		: "=r" (err), "=&r" (x)			\
-		: "b" (addr), "i" (-EFAULT), "0" (err))
+		: "m" (*addr), "i" (-EFAULT), "0" (err))
 #endif /* __powerpc64__ */
 
 #define __get_user_size_allowed(x, ptr, size, retval)		\
@@ -256,10 +256,10 @@ do {								\
 	if (size > sizeof(x))					\
 		(x) = __get_user_bad();				\
 	switch (size) {						\
-	case 1: __get_user_asm(x, ptr, retval, "lbz"); break;	\
-	case 2: __get_user_asm(x, ptr, retval, "lhz"); break;	\
-	case 4: __get_user_asm(x, ptr, retval, "lwz"); break;	\
-	case 8: __get_user_asm2(x, ptr, retval);  break;	\
+	case 1: __get_user_asm(x, (u8 __user *)ptr, retval, "lbz"); break;	\
+	case 2: __get_user_asm(x, (u16 __user *)ptr, retval, "lhz"); break;	\
+	case 4: __get_user_asm(x, (u32 __user *)ptr, retval, "lwz"); break;	\
+	case 8: __get_user_asm2(x, (u64 __user *)ptr, retval);  break;	\
 	default: (x) = __get_user_bad();			\
 	}							\
 } while (0)
-- 
2.25.0

