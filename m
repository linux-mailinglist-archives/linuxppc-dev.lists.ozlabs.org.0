Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D90C835F953
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 18:59:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL7xj63YBz3bs5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 02:59:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL7x33Fv3z2yx3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 02:59:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FL7wv2tHxzB09ZH;
 Wed, 14 Apr 2021 18:59:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id u3BYiVK7Ivpp; Wed, 14 Apr 2021 18:59:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FL7wv1pJPzB09ZC;
 Wed, 14 Apr 2021 18:59:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E71A88B7CE;
 Wed, 14 Apr 2021 18:59:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4NvEI6NJYSUF; Wed, 14 Apr 2021 18:59:12 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F8708B7C4;
 Wed, 14 Apr 2021 18:59:12 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4C14A679F3; Wed, 14 Apr 2021 16:59:12 +0000 (UTC)
Message-Id: <e2034df6606fad6f8c9708c9fb375594c5be8bf7.1618419539.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7aaa03114d8bc4ba1805b51993fb92ec520899e0.1618419539.git.christophe.leroy@csgroup.eu>
References: <7aaa03114d8bc4ba1805b51993fb92ec520899e0.1618419539.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 2/3] powerpc/atomics: Use immediate operand when possible
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 14 Apr 2021 16:59:12 +0000 (UTC)
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

Today we get the following code generation for atomic operations:

	c001bb2c:	39 20 00 01 	li      r9,1
	c001bb30:	7d 40 18 28 	lwarx   r10,0,r3
	c001bb34:	7d 09 50 50 	subf    r8,r9,r10
	c001bb38:	7d 00 19 2d 	stwcx.  r8,0,r3

	c001c7a8:	39 40 00 01 	li      r10,1
	c001c7ac:	7d 00 18 28 	lwarx   r8,0,r3
	c001c7b0:	7c ea 42 14 	add     r7,r10,r8
	c001c7b4:	7c e0 19 2d 	stwcx.  r7,0,r3

By allowing GCC to choose between immediate or regular operation,
we get:

	c001bb2c:	7d 20 18 28 	lwarx   r9,0,r3
	c001bb30:	39 49 ff ff 	addi    r10,r9,-1
	c001bb34:	7d 40 19 2d 	stwcx.  r10,0,r3
	--
	c001c7a4:	7d 40 18 28 	lwarx   r10,0,r3
	c001c7a8:	39 0a 00 01 	addi    r8,r10,1
	c001c7ac:	7d 00 19 2d 	stwcx.  r8,0,r3

For "and", the dot form has to be used because "andi" doesn't exist.

For logical operations we use unsigned 16 bits immediate.
For arithmetic operations we use signed 16 bits immediate.

On pmac32_defconfig, it reduces the text by approx another 8 kbytes.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Acked-by: Segher Boessenkool <segher@kernel.crashing.org>
---
v2: Use "addc/addic"
---
 arch/powerpc/include/asm/atomic.h | 56 +++++++++++++++----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 61c6e8b200e8..eb1bdf14f67c 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -37,62 +37,62 @@ static __inline__ void atomic_set(atomic_t *v, int i)
 	__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m"UPD_CONSTR(v->counter) : "r"(i));
 }
 
-#define ATOMIC_OP(op, asm_op)						\
+#define ATOMIC_OP(op, asm_op, suffix, sign, ...)			\
 static __inline__ void atomic_##op(int a, atomic_t *v)			\
 {									\
 	int t;								\
 									\
 	__asm__ __volatile__(						\
 "1:	lwarx	%0,0,%3		# atomic_" #op "\n"			\
-	#asm_op " %0,%2,%0\n"						\
+	#asm_op "%I2" suffix " %0,%0,%2\n"				\
 "	stwcx.	%0,0,%3 \n"						\
 "	bne-	1b\n"							\
 	: "=&r" (t), "+m" (v->counter)					\
-	: "r" (a), "r" (&v->counter)					\
-	: "cc");							\
+	: "r"#sign (a), "r" (&v->counter)				\
+	: "cc", ##__VA_ARGS__);						\
 }									\
 
-#define ATOMIC_OP_RETURN_RELAXED(op, asm_op)				\
+#define ATOMIC_OP_RETURN_RELAXED(op, asm_op, suffix, sign, ...)		\
 static inline int atomic_##op##_return_relaxed(int a, atomic_t *v)	\
 {									\
 	int t;								\
 									\
 	__asm__ __volatile__(						\
 "1:	lwarx	%0,0,%3		# atomic_" #op "_return_relaxed\n"	\
-	#asm_op " %0,%2,%0\n"						\
+	#asm_op "%I2" suffix " %0,%0,%2\n"				\
 "	stwcx.	%0,0,%3\n"						\
 "	bne-	1b\n"							\
 	: "=&r" (t), "+m" (v->counter)					\
-	: "r" (a), "r" (&v->counter)					\
-	: "cc");							\
+	: "r"#sign (a), "r" (&v->counter)				\
+	: "cc", ##__VA_ARGS__);						\
 									\
 	return t;							\
 }
 
-#define ATOMIC_FETCH_OP_RELAXED(op, asm_op)				\
+#define ATOMIC_FETCH_OP_RELAXED(op, asm_op, suffix, sign, ...)		\
 static inline int atomic_fetch_##op##_relaxed(int a, atomic_t *v)	\
 {									\
 	int res, t;							\
 									\
 	__asm__ __volatile__(						\
 "1:	lwarx	%0,0,%4		# atomic_fetch_" #op "_relaxed\n"	\
-	#asm_op " %1,%3,%0\n"						\
+	#asm_op "%I3" suffix " %1,%0,%3\n"				\
 "	stwcx.	%1,0,%4\n"						\
 "	bne-	1b\n"							\
 	: "=&r" (res), "=&r" (t), "+m" (v->counter)			\
-	: "r" (a), "r" (&v->counter)					\
-	: "cc");							\
+	: "r"#sign (a), "r" (&v->counter)				\
+	: "cc", ##__VA_ARGS__);						\
 									\
 	return res;							\
 }
 
-#define ATOMIC_OPS(op, asm_op)						\
-	ATOMIC_OP(op, asm_op)						\
-	ATOMIC_OP_RETURN_RELAXED(op, asm_op)				\
-	ATOMIC_FETCH_OP_RELAXED(op, asm_op)
+#define ATOMIC_OPS(op, asm_op, suffix, sign, ...)			\
+	ATOMIC_OP(op, asm_op, suffix, sign, ##__VA_ARGS__)		\
+	ATOMIC_OP_RETURN_RELAXED(op, asm_op, suffix, sign, ##__VA_ARGS__)\
+	ATOMIC_FETCH_OP_RELAXED(op, asm_op, suffix, sign, ##__VA_ARGS__)
 
-ATOMIC_OPS(add, add)
-ATOMIC_OPS(sub, subf)
+ATOMIC_OPS(add, add, "c", I, "xer")
+ATOMIC_OPS(sub, sub, "c", I, "xer")
 
 #define atomic_add_return_relaxed atomic_add_return_relaxed
 #define atomic_sub_return_relaxed atomic_sub_return_relaxed
@@ -101,13 +101,13 @@ ATOMIC_OPS(sub, subf)
 #define atomic_fetch_sub_relaxed atomic_fetch_sub_relaxed
 
 #undef ATOMIC_OPS
-#define ATOMIC_OPS(op, asm_op)						\
-	ATOMIC_OP(op, asm_op)						\
-	ATOMIC_FETCH_OP_RELAXED(op, asm_op)
+#define ATOMIC_OPS(op, asm_op, suffix, sign)				\
+	ATOMIC_OP(op, asm_op, suffix, sign)				\
+	ATOMIC_FETCH_OP_RELAXED(op, asm_op, suffix, sign)
 
-ATOMIC_OPS(and, and)
-ATOMIC_OPS(or, or)
-ATOMIC_OPS(xor, xor)
+ATOMIC_OPS(and, and, ".", K)
+ATOMIC_OPS(or, or, "", K)
+ATOMIC_OPS(xor, xor, "", K)
 
 #define atomic_fetch_and_relaxed atomic_fetch_and_relaxed
 #define atomic_fetch_or_relaxed  atomic_fetch_or_relaxed
@@ -238,15 +238,15 @@ static __inline__ int atomic_fetch_add_unless(atomic_t *v, int a, int u)
 "1:	lwarx	%0,0,%1		# atomic_fetch_add_unless\n\
 	cmpw	0,%0,%3 \n\
 	beq	2f \n\
-	add	%0,%2,%0 \n"
+	add%I2c	%0,%0,%2 \n"
 "	stwcx.	%0,0,%1 \n\
 	bne-	1b \n"
 	PPC_ATOMIC_EXIT_BARRIER
-"	subf	%0,%2,%0 \n\
+"	sub%I2c	%0,%0,%2 \n\
 2:"
 	: "=&r" (t)
-	: "r" (&v->counter), "r" (a), "r" (u)
-	: "cc", "memory");
+	: "r" (&v->counter), "rI" (a), "r" (u)
+	: "cc", "memory", "xer");
 
 	return t;
 }
-- 
2.25.0

