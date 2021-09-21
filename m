Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D7A4135ED
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 17:11:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDPyd1p64z3cCf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 01:11:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDPxR2xtPz2ypJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 01:10:19 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HDPxB1F82z9sSt;
 Tue, 21 Sep 2021 17:10:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hYxOY9a00lW; Tue, 21 Sep 2021 17:10:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HDPx80kwyz9sSx;
 Tue, 21 Sep 2021 17:10:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 02E578B763;
 Tue, 21 Sep 2021 17:10:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JxnvthvgLPep; Tue, 21 Sep 2021 17:10:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.127])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9C9938B76E;
 Tue, 21 Sep 2021 17:10:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 18LF9rC41071862
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 21 Sep 2021 17:09:53 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 18LF9rkB1071861;
 Tue, 21 Sep 2021 17:09:53 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 2/3] powerpc/atomics: Use immediate operand when possible
Date: Tue, 21 Sep 2021 17:09:48 +0200
Message-Id: <2ec558d44db8045752fe9dbd29c9ba84bab6030b.1632236981.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <e6f815d9181bab09df3b350af51149437863e9f9.1632236981.git.christophe.leroy@csgroup.eu>
References: <e6f815d9181bab09df3b350af51149437863e9f9.1632236981.git.christophe.leroy@csgroup.eu>
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
v4: Rebased

v2: Use "addc/addic"
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/atomic.h | 56 +++++++++++++++----------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 6a53ef178bfd..ce0d5a013c58 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -37,62 +37,62 @@ static __inline__ void arch_atomic_set(atomic_t *v, int i)
 	__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m"UPD_CONSTR(v->counter) : "r"(i));
 }
 
-#define ATOMIC_OP(op, asm_op)						\
+#define ATOMIC_OP(op, asm_op, suffix, sign, ...)			\
 static __inline__ void arch_atomic_##op(int a, atomic_t *v)		\
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
 static inline int arch_atomic_##op##_return_relaxed(int a, atomic_t *v)	\
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
 static inline int arch_atomic_fetch_##op##_relaxed(int a, atomic_t *v)	\
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
 
 #define arch_atomic_add_return_relaxed arch_atomic_add_return_relaxed
 #define arch_atomic_sub_return_relaxed arch_atomic_sub_return_relaxed
@@ -101,13 +101,13 @@ ATOMIC_OPS(sub, subf)
 #define arch_atomic_fetch_sub_relaxed arch_atomic_fetch_sub_relaxed
 
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
 
 #define arch_atomic_fetch_and_relaxed arch_atomic_fetch_and_relaxed
 #define arch_atomic_fetch_or_relaxed  arch_atomic_fetch_or_relaxed
@@ -241,15 +241,15 @@ static __inline__ int arch_atomic_fetch_add_unless(atomic_t *v, int a, int u)
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
2.31.1

