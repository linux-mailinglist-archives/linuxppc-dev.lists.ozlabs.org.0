Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F62B358897
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 17:34:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGQKt1mNcz3dmv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 01:34:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGQK81Fj4z3dgn
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 01:33:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FGQK31RV4z9txf4;
 Thu,  8 Apr 2021 17:33:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4Z5H7bJ7Qr35; Thu,  8 Apr 2021 17:33:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FGQK30hQxz9txf3;
 Thu,  8 Apr 2021 17:33:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B32798B7D1;
 Thu,  8 Apr 2021 17:33:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id iO8E6hdJfhQS; Thu,  8 Apr 2021 17:33:44 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5D6608B7D0;
 Thu,  8 Apr 2021 17:33:44 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 2041C679BA; Thu,  8 Apr 2021 15:33:44 +0000 (UTC)
Message-Id: <09da6fec57792d6559d1ea64e00be9870b02dab4.1617896018.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 1/2] powerpc/bitops: Use immediate operand when possible
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu,  8 Apr 2021 15:33:44 +0000 (UTC)
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

	c000c044:	39 40 20 00 	li      r10,8192
	c000c048:	7c e0 40 28 	lwarx   r7,0,r8
	c000c04c:	7c e7 50 78 	andc    r7,r7,r10
	c000c050:	7c e0 41 2d 	stwcx.  r7,0,r8

Most set bits are constant on lower 16 bits, so it can easily
be replaced by the "immediate" version of the operation. Allow
GCC to choose between the normal or immediate form.

For clear bits, on 32 bits 'rlwinm' can be used instead or 'andc' for
when all bits to be cleared are consecutive. For the time being only
handle the single bit case, which we detect by checking whether the
mask is a power of two. Can't use is_power_of_2() function because it
is not included yet, but it is easy to code with (mask & (mask - 1))
and even the 0 case which is not a power of two is acceptable for us.

On 64 bits we don't have any equivalent single operation, we'd need
two 'rldicl' so it is not worth it.

With this patch we get:

	c0009fe0:	7d 00 50 28 	lwarx   r8,0,r10
	c0009fe4:	61 08 08 00 	ori     r8,r8,2048
	c0009fe8:	7d 00 51 2d 	stwcx.  r8,0,r10

	c000c034:	7d 00 50 28 	lwarx   r8,0,r10
	c000c038:	55 08 04 e2 	rlwinm  r8,r8,0,19,17
	c000c03c:	7d 00 51 2d 	stwcx.  r8,0,r10

On pmac32_defconfig, it reduces the text by approx 10 kbytes.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/bitops.h | 77 +++++++++++++++++++++++++++----
 1 file changed, 69 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/bitops.h b/arch/powerpc/include/asm/bitops.h
index 299ab33505a6..0b0c6bdd9be9 100644
--- a/arch/powerpc/include/asm/bitops.h
+++ b/arch/powerpc/include/asm/bitops.h
@@ -71,19 +71,49 @@ static inline void fn(unsigned long mask,	\
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
 
+#define DEFINE_CLROP(fn, prefix)					\
+static inline void fn(unsigned long mask, volatile unsigned long *_p)	\
+{									\
+	unsigned long old;						\
+	unsigned long *p = (unsigned long *)_p;				\
+	if (IS_ENABLED(CONFIG_PPC32) &&					\
+	    __builtin_constant_p(mask) && !(mask & (mask - 1))) {	\
+		asm volatile (						\
+			prefix						\
+		"1:"	"lwarx	%0,0,%3\n"				\
+			"rlwinm	%0,%0,0,%2\n"				\
+			"stwcx.	%0,0,%3\n"				\
+			"bne- 1b\n"					\
+			: "=&r" (old), "+m" (*p)			\
+			: "i" (~mask), "r" (p)				\
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
@@ -116,12 +146,12 @@ static inline unsigned long fn(			\
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
@@ -130,11 +160,42 @@ DEFINE_TESTOP(test_and_set_bits, or, PPC_ATOMIC_ENTRY_BARRIER,
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
+	    __builtin_constant_p(mask) && !(mask & (mask - 1))) {
+		asm volatile (
+			PPC_ATOMIC_ENTRY_BARRIER
+		"1:"	PPC_LLARX(%0,0,%3,0) "\n"
+			"rlwinm	%1,%0,0,%2\n"
+			PPC_STLCX "%1,0,%3\n"
+			"bne- 1b\n"
+			PPC_ATOMIC_EXIT_BARRIER
+			: "=&r" (old), "=&r" (t)
+			: "i" (~mask), "r" (p)
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

