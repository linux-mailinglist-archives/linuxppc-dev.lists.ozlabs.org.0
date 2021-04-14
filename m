Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6838835F955
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 19:00:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FL7yB1WHdz3cDM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 03:00:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FL7x33Cbgz2ysq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 02:59:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FL7ww2RpSzB09ZS;
 Wed, 14 Apr 2021 18:59:12 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 7xncGceT2Qtl; Wed, 14 Apr 2021 18:59:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FL7ww18cnzB09ZC;
 Wed, 14 Apr 2021 18:59:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C1BF58B7CE;
 Wed, 14 Apr 2021 18:59:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1DUihww9BCXs; Wed, 14 Apr 2021 18:59:13 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 75FA18B7C4;
 Wed, 14 Apr 2021 18:59:13 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 5368C679F3; Wed, 14 Apr 2021 16:59:13 +0000 (UTC)
Message-Id: <6c77cf01d88115c57c1f72f2c45d31f6bf64ef4f.1618419539.git.christophe.leroy@csgroup.eu>
In-Reply-To: <7aaa03114d8bc4ba1805b51993fb92ec520899e0.1618419539.git.christophe.leroy@csgroup.eu>
References: <7aaa03114d8bc4ba1805b51993fb92ec520899e0.1618419539.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v3 3/3] powerpc/atomics: Remove atomic_inc()/atomic_dec() and
 friends
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 14 Apr 2021 16:59:13 +0000 (UTC)
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

Now that atomic_add() and atomic_sub() handle immediate operands,
atomic_inc() and atomic_dec() have no added value compared to the
generic fallback which calls atomic_add(1) and atomic_sub(1).

Also remove atomic_inc_not_zero() which fallsback to
atomic_add_unless() which itself fallsback to
atomic_fetch_add_unless() which now handles immediate operands.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: New
---
 arch/powerpc/include/asm/atomic.h | 95 -------------------------------
 1 file changed, 95 deletions(-)

diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index eb1bdf14f67c..00ba5d9e837b 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -118,71 +118,6 @@ ATOMIC_OPS(xor, xor, "", K)
 #undef ATOMIC_OP_RETURN_RELAXED
 #undef ATOMIC_OP
 
-static __inline__ void atomic_inc(atomic_t *v)
-{
-	int t;
-
-	__asm__ __volatile__(
-"1:	lwarx	%0,0,%2		# atomic_inc\n\
-	addic	%0,%0,1\n"
-"	stwcx.	%0,0,%2 \n\
-	bne-	1b"
-	: "=&r" (t), "+m" (v->counter)
-	: "r" (&v->counter)
-	: "cc", "xer");
-}
-#define atomic_inc atomic_inc
-
-static __inline__ int atomic_inc_return_relaxed(atomic_t *v)
-{
-	int t;
-
-	__asm__ __volatile__(
-"1:	lwarx	%0,0,%2		# atomic_inc_return_relaxed\n"
-"	addic	%0,%0,1\n"
-"	stwcx.	%0,0,%2\n"
-"	bne-	1b"
-	: "=&r" (t), "+m" (v->counter)
-	: "r" (&v->counter)
-	: "cc", "xer");
-
-	return t;
-}
-
-static __inline__ void atomic_dec(atomic_t *v)
-{
-	int t;
-
-	__asm__ __volatile__(
-"1:	lwarx	%0,0,%2		# atomic_dec\n\
-	addic	%0,%0,-1\n"
-"	stwcx.	%0,0,%2\n\
-	bne-	1b"
-	: "=&r" (t), "+m" (v->counter)
-	: "r" (&v->counter)
-	: "cc", "xer");
-}
-#define atomic_dec atomic_dec
-
-static __inline__ int atomic_dec_return_relaxed(atomic_t *v)
-{
-	int t;
-
-	__asm__ __volatile__(
-"1:	lwarx	%0,0,%2		# atomic_dec_return_relaxed\n"
-"	addic	%0,%0,-1\n"
-"	stwcx.	%0,0,%2\n"
-"	bne-	1b"
-	: "=&r" (t), "+m" (v->counter)
-	: "r" (&v->counter)
-	: "cc", "xer");
-
-	return t;
-}
-
-#define atomic_inc_return_relaxed atomic_inc_return_relaxed
-#define atomic_dec_return_relaxed atomic_dec_return_relaxed
-
 #define atomic_cmpxchg(v, o, n) (cmpxchg(&((v)->counter), (o), (n)))
 #define atomic_cmpxchg_relaxed(v, o, n) \
 	cmpxchg_relaxed(&((v)->counter), (o), (n))
@@ -252,36 +187,6 @@ static __inline__ int atomic_fetch_add_unless(atomic_t *v, int a, int u)
 }
 #define atomic_fetch_add_unless atomic_fetch_add_unless
 
-/**
- * atomic_inc_not_zero - increment unless the number is zero
- * @v: pointer of type atomic_t
- *
- * Atomically increments @v by 1, so long as @v is non-zero.
- * Returns non-zero if @v was non-zero, and zero otherwise.
- */
-static __inline__ int atomic_inc_not_zero(atomic_t *v)
-{
-	int t1, t2;
-
-	__asm__ __volatile__ (
-	PPC_ATOMIC_ENTRY_BARRIER
-"1:	lwarx	%0,0,%2		# atomic_inc_not_zero\n\
-	cmpwi	0,%0,0\n\
-	beq-	2f\n\
-	addic	%1,%0,1\n"
-"	stwcx.	%1,0,%2\n\
-	bne-	1b\n"
-	PPC_ATOMIC_EXIT_BARRIER
-	"\n\
-2:"
-	: "=&r" (t1), "=&r" (t2)
-	: "r" (&v->counter)
-	: "cc", "xer", "memory");
-
-	return t1;
-}
-#define atomic_inc_not_zero(v) atomic_inc_not_zero((v))
-
 /*
  * Atomically test *v and decrement if it is greater than 0.
  * The function returns the old value of *v minus 1, even if
-- 
2.25.0

