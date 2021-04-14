Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D98EF35F952
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 18:59:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL7xM6XQdz3bTy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 02:59:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL7x339mVz2yS0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 02:59:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FL7wt0Jt8zB09ZG;
 Wed, 14 Apr 2021 18:59:10 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7pWPN0vEV4Vx; Wed, 14 Apr 2021 18:59:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FL7ws6cQ4zB09ZC;
 Wed, 14 Apr 2021 18:59:09 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AE7D58B7CE;
 Wed, 14 Apr 2021 18:59:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6jxSwQRpf5LT; Wed, 14 Apr 2021 18:59:11 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6510D8B7C4;
 Wed, 14 Apr 2021 18:59:11 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 38A04679F3; Wed, 14 Apr 2021 16:59:11 +0000 (UTC)
Message-Id: <7aaa03114d8bc4ba1805b51993fb92ec520899e0.1618419539.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 1/3] powerpc/bitops: Use immediate operand when possible
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 14 Apr 2021 16:59:11 +0000 (UTC)
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

Today we get the following code generation for bitops like
set or clear bit:

	c0009fe0:	39 40 08 00 	li      r10,2048
	c0009fe4:	7c e0 40 28 	lwarx   r7,0,r8
	c0009fe8:	7c e7 53 78 	or      r7,r7,r10
	c0009fec:	7c e0 41 2d 	stwcx.  r7,0,r8

	c000d568:	39 00 18 00 	li      r8,6144
	c000d56c:	7c c0 38 28 	lwarx   r6,0,r7
	c000d570:	7c c6 40 78 	andc    r6,r6,r8
	c000d574:	7c c0 39 2d 	stwcx.  r6,0,r7

Most set bits are constant on lower 16 bits, so it can easily
be replaced by the "immediate" version of the operation. Allow
GCC to choose between the normal or immediate form.

For clear bits, on 32 bits 'rlwinm' can be used instead of 'andc' for
when all bits to be cleared are consecutive.

On 64 bits we don't have any equivalent single operation for clearing,
single bits or a few bits, we'd need two 'rldicl' so it is not
worth it, the li/andc sequence is doing the same.

With this patch we get:

	c0009fe0:	7d 00 50 28 	lwarx   r8,0,r10
	c0009fe4:	61 08 08 00 	ori     r8,r8,2048
	c0009fe8:	7d 00 51 2d 	stwcx.  r8,0,r10

	c000d558:	7c e0 40 28 	lwarx   r7,0,r8
	c000d55c:	54 e7 05 64 	rlwinm  r7,r7,0,21,18
	c000d560:	7c e0 41 2d 	stwcx.  r7,0,r8

On pmac32_defconfig, it reduces the text by approx 10 kbytes.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v3:
- Using the mask validation proposed by Segher

v2:
- Use "n" instead of "i" as constraint for the rlwinm mask
- Improve mask verification to handle more than single bit masks

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/bitops.h | 89 ++++++++++++++++++++++++++++---
 1 file changed, 81 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/bitops.h b/arch/powerpc/include/asm/bitops.h
index 299ab33505a6..09500c789972 100644
--- a/arch/powerpc/include/asm/bitops.h
+++ b/arch/powerpc/include/asm/bitops.h
@@ -71,19 +71,61 @@ static inline void fn(unsigned long mask,	\
 	__asm__ __volatile__ (			\
 	prefix					\
 "1:"	PPC_LLARX(%0,0,%3,0) "\n"		\
-	stringify_in_c(op) "%0,%0,%2\n"		\
+	#op "%I2 %0,%0,%2\n"			\
 	PPC_STLCX "%0,0,%3\n"			\
 	"bne- 1b\n"				\
 	: "=&r" (old), "+m" (*p)		\
-	: "r" (mask), "r" (p)			\
+	: "rK" (mask), "r" (p)			\
 	: "cc", "memory");			\
 }
 
 DEFINE_BITOP(set_bits, or, "")
-DEFINE_BITOP(clear_bits, andc, "")
-DEFINE_BITOP(clear_bits_unlock, andc, PPC_RELEASE_BARRIER)
 DEFINE_BITOP(change_bits, xor, "")
 
+static __always_inline bool is_rlwinm_mask_valid(unsigned long x)
+{
+	if (!x)
+		return false;
+	if (x & 1)
+		x = ~x;	// make the mask non-wrapping
+	x += x & -x;	// adding the low set bit results in at most one bit set
+
+	return !(x & (x - 1));
+}
+
+#define DEFINE_CLROP(fn, prefix)					\
+static inline void fn(unsigned long mask, volatile unsigned long *_p)	\
+{									\
+	unsigned long old;						\
+	unsigned long *p = (unsigned long *)_p;				\
+									\
+	if (IS_ENABLED(CONFIG_PPC32) &&					\
+	    __builtin_constant_p(mask) && is_rlwinm_mask_valid(~mask)) {\
+		asm volatile (						\
+			prefix						\
+		"1:"	"lwarx	%0,0,%3\n"				\
+			"rlwinm	%0,%0,0,%2\n"				\
+			"stwcx.	%0,0,%3\n"				\
+			"bne- 1b\n"					\
+			: "=&r" (old), "+m" (*p)			\
+			: "n" (~mask), "r" (p)				\
+			: "cc", "memory");				\
+	} else {							\
+		asm volatile (						\
+			prefix						\
+		"1:"	PPC_LLARX(%0,0,%3,0) "\n"			\
+			"andc %0,%0,%2\n"				\
+			PPC_STLCX "%0,0,%3\n"				\
+			"bne- 1b\n"					\
+			: "=&r" (old), "+m" (*p)			\
+			: "r" (mask), "r" (p)				\
+			: "cc", "memory");				\
+	}								\
+}
+
+DEFINE_CLROP(clear_bits, "")
+DEFINE_CLROP(clear_bits_unlock, PPC_RELEASE_BARRIER)
+
 static inline void arch_set_bit(int nr, volatile unsigned long *addr)
 {
 	set_bits(BIT_MASK(nr), addr + BIT_WORD(nr));
@@ -116,12 +158,12 @@ static inline unsigned long fn(			\
 	__asm__ __volatile__ (				\
 	prefix						\
 "1:"	PPC_LLARX(%0,0,%3,eh) "\n"			\
-	stringify_in_c(op) "%1,%0,%2\n"			\
+	#op "%I2 %1,%0,%2\n"				\
 	PPC_STLCX "%1,0,%3\n"				\
 	"bne- 1b\n"					\
 	postfix						\
 	: "=&r" (old), "=&r" (t)			\
-	: "r" (mask), "r" (p)				\
+	: "rK" (mask), "r" (p)				\
 	: "cc", "memory");				\
 	return (old & mask);				\
 }
@@ -130,11 +172,42 @@ DEFINE_TESTOP(test_and_set_bits, or, PPC_ATOMIC_ENTRY_BARRIER,
 	      PPC_ATOMIC_EXIT_BARRIER, 0)
 DEFINE_TESTOP(test_and_set_bits_lock, or, "",
 	      PPC_ACQUIRE_BARRIER, 1)
-DEFINE_TESTOP(test_and_clear_bits, andc, PPC_ATOMIC_ENTRY_BARRIER,
-	      PPC_ATOMIC_EXIT_BARRIER, 0)
 DEFINE_TESTOP(test_and_change_bits, xor, PPC_ATOMIC_ENTRY_BARRIER,
 	      PPC_ATOMIC_EXIT_BARRIER, 0)
 
+static inline unsigned long test_and_clear_bits(unsigned long mask, volatile unsigned long *_p)
+{
+	unsigned long old, t;
+	unsigned long *p = (unsigned long *)_p;
+
+	if (IS_ENABLED(CONFIG_PPC32) &&
+	    __builtin_constant_p(mask) && is_rlwinm_mask_valid(mask)) {
+		asm volatile (
+			PPC_ATOMIC_ENTRY_BARRIER
+		"1:"	"lwarx %0,0,%3\n"
+			"rlwinm	%1,%0,0,%2\n"
+			"stwcx. %1,0,%3\n"
+			"bne- 1b\n"
+			PPC_ATOMIC_EXIT_BARRIER
+			: "=&r" (old), "=&r" (t)
+			: "n" (~mask), "r" (p)
+			: "cc", "memory");
+	} else {
+		asm volatile (
+			PPC_ATOMIC_ENTRY_BARRIER
+		"1:"	PPC_LLARX(%0,0,%3,0) "\n"
+			"andc	%1,%0,%2\n"
+			PPC_STLCX "%1,0,%3\n"
+			"bne- 1b\n"
+			PPC_ATOMIC_EXIT_BARRIER
+			: "=&r" (old), "=&r" (t)
+			: "r" (mask), "r" (p)
+			: "cc", "memory");
+	}
+
+	return (old & mask);
+}
+
 static inline int arch_test_and_set_bit(unsigned long nr,
 					volatile unsigned long *addr)
 {
-- 
2.25.0

