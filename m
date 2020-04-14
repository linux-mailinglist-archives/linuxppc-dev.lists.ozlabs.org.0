Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DBDB41A765F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 10:46:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491fGM44QpzDqbg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 18:46:03 +1000 (AEST)
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
 header.s=mail header.b=SzMRHQ7O; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491dgm1YxXzDqXg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 18:19:32 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 491dgg5F82z9tydT;
 Tue, 14 Apr 2020 10:19:27 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=SzMRHQ7O; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 4m40qpucuOQw; Tue, 14 Apr 2020 10:19:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 491dgg3TDNz9tydb;
 Tue, 14 Apr 2020 10:19:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586852367; bh=GxsSM1mHvfOul+e3M/Zrv9n+OF+1JHGP+dH0vKyY4Wo=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=SzMRHQ7OubKCwGJEXseVGiO+8GFoaCb00GF0vEItQQTJ0oVtqXt/6r70dHM3CEEcV
 XgkOiNsFZD+1hIJOGWp6JaPyAI/GAZIp/rJJJSAbUyMavhaN5z6locADJbl4kS3u+L
 PqDu06UuktRhlJXau1vYInPtDfTsBJNhXX/CqNvw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 82FD88B797;
 Tue, 14 Apr 2020 10:19:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mcJSbZTfelP4; Tue, 14 Apr 2020 10:19:28 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0A1D78B798;
 Tue, 14 Apr 2020 10:19:28 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id D0DB86578A; Tue, 14 Apr 2020 08:19:27 +0000 (UTC)
Message-Id: <76be76b2d8eed1f4aa3c4f9e6fdefc117361af26.1586852082.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1586852082.git.christophe.leroy@c-s.fr>
References: <cover.1586852082.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 11/13] powerpc: Remove IBM405 Erratum #77
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 michal.simek@xilinx.com, arnd@arndb.de
Date: Tue, 14 Apr 2020 08:19:27 +0000 (UTC)
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

This erratum is dedicated to IBM 405GP and STB03xxx
which are now gone.

Remove this erratum.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/asm-405.h           | 19 -------------------
 arch/powerpc/include/asm/atomic.h            | 11 -----------
 arch/powerpc/include/asm/bitops.h            |  4 ----
 arch/powerpc/include/asm/cmpxchg.h           | 11 -----------
 arch/powerpc/include/asm/futex.h             |  3 ---
 arch/powerpc/include/asm/nohash/32/pgtable.h |  1 -
 arch/powerpc/include/asm/spinlock.h          |  4 ----
 arch/powerpc/kernel/entry_32.S               | 11 -----------
 arch/powerpc/kernel/head_40x.S               |  3 ---
 arch/powerpc/platforms/40x/Kconfig           |  6 ------
 10 files changed, 73 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/asm-405.h

diff --git a/arch/powerpc/include/asm/asm-405.h b/arch/powerpc/include/asm/asm-405.h
deleted file mode 100644
index 7270d3ae7c8e..000000000000
--- a/arch/powerpc/include/asm/asm-405.h
+++ /dev/null
@@ -1,19 +0,0 @@
-#ifndef _ASM_POWERPC_ASM_405_H
-#define _ASM_POWERPC_ASM_405_H
-
-#include <asm/asm-const.h>
-
-#ifdef __KERNEL__
-#ifdef CONFIG_IBM405_ERR77
-/* Erratum #77 on the 405 means we need a sync or dcbt before every
- * stwcx.  The old ATOMIC_SYNC_FIX covered some but not all of this.
- */
-#define PPC405_ERR77(ra,rb)	stringify_in_c(dcbt	ra, rb;)
-#define	PPC405_ERR77_SYNC	stringify_in_c(sync;)
-#else
-#define PPC405_ERR77(ra,rb)
-#define PPC405_ERR77_SYNC
-#endif
-#endif
-
-#endif /* _ASM_POWERPC_ASM_405_H */
diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 31c231ea56b7..498785ffc25f 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -10,7 +10,6 @@
 #include <linux/types.h>
 #include <asm/cmpxchg.h>
 #include <asm/barrier.h>
-#include <asm/asm-405.h>
 
 #define ATOMIC_INIT(i)		{ (i) }
 
@@ -47,7 +46,6 @@ static __inline__ void atomic_##op(int a, atomic_t *v)			\
 	__asm__ __volatile__(						\
 "1:	lwarx	%0,0,%3		# atomic_" #op "\n"			\
 	#asm_op " %0,%2,%0\n"						\
-	PPC405_ERR77(0,%3)						\
 "	stwcx.	%0,0,%3 \n"						\
 "	bne-	1b\n"							\
 	: "=&r" (t), "+m" (v->counter)					\
@@ -63,7 +61,6 @@ static inline int atomic_##op##_return_relaxed(int a, atomic_t *v)	\
 	__asm__ __volatile__(						\
 "1:	lwarx	%0,0,%3		# atomic_" #op "_return_relaxed\n"	\
 	#asm_op " %0,%2,%0\n"						\
-	PPC405_ERR77(0, %3)						\
 "	stwcx.	%0,0,%3\n"						\
 "	bne-	1b\n"							\
 	: "=&r" (t), "+m" (v->counter)					\
@@ -81,7 +78,6 @@ static inline int atomic_fetch_##op##_relaxed(int a, atomic_t *v)	\
 	__asm__ __volatile__(						\
 "1:	lwarx	%0,0,%4		# atomic_fetch_" #op "_relaxed\n"	\
 	#asm_op " %1,%3,%0\n"						\
-	PPC405_ERR77(0, %4)						\
 "	stwcx.	%1,0,%4\n"						\
 "	bne-	1b\n"							\
 	: "=&r" (res), "=&r" (t), "+m" (v->counter)			\
@@ -130,7 +126,6 @@ static __inline__ void atomic_inc(atomic_t *v)
 	__asm__ __volatile__(
 "1:	lwarx	%0,0,%2		# atomic_inc\n\
 	addic	%0,%0,1\n"
-	PPC405_ERR77(0,%2)
 "	stwcx.	%0,0,%2 \n\
 	bne-	1b"
 	: "=&r" (t), "+m" (v->counter)
@@ -146,7 +141,6 @@ static __inline__ int atomic_inc_return_relaxed(atomic_t *v)
 	__asm__ __volatile__(
 "1:	lwarx	%0,0,%2		# atomic_inc_return_relaxed\n"
 "	addic	%0,%0,1\n"
-	PPC405_ERR77(0, %2)
 "	stwcx.	%0,0,%2\n"
 "	bne-	1b"
 	: "=&r" (t), "+m" (v->counter)
@@ -163,7 +157,6 @@ static __inline__ void atomic_dec(atomic_t *v)
 	__asm__ __volatile__(
 "1:	lwarx	%0,0,%2		# atomic_dec\n\
 	addic	%0,%0,-1\n"
-	PPC405_ERR77(0,%2)\
 "	stwcx.	%0,0,%2\n\
 	bne-	1b"
 	: "=&r" (t), "+m" (v->counter)
@@ -179,7 +172,6 @@ static __inline__ int atomic_dec_return_relaxed(atomic_t *v)
 	__asm__ __volatile__(
 "1:	lwarx	%0,0,%2		# atomic_dec_return_relaxed\n"
 "	addic	%0,%0,-1\n"
-	PPC405_ERR77(0, %2)
 "	stwcx.	%0,0,%2\n"
 "	bne-	1b"
 	: "=&r" (t), "+m" (v->counter)
@@ -220,7 +212,6 @@ static __inline__ int atomic_fetch_add_unless(atomic_t *v, int a, int u)
 	cmpw	0,%0,%3 \n\
 	beq	2f \n\
 	add	%0,%2,%0 \n"
-	PPC405_ERR77(0,%2)
 "	stwcx.	%0,0,%1 \n\
 	bne-	1b \n"
 	PPC_ATOMIC_EXIT_BARRIER
@@ -251,7 +242,6 @@ static __inline__ int atomic_inc_not_zero(atomic_t *v)
 	cmpwi	0,%0,0\n\
 	beq-	2f\n\
 	addic	%1,%0,1\n"
-	PPC405_ERR77(0,%2)
 "	stwcx.	%1,0,%2\n\
 	bne-	1b\n"
 	PPC_ATOMIC_EXIT_BARRIER
@@ -280,7 +270,6 @@ static __inline__ int atomic_dec_if_positive(atomic_t *v)
 	cmpwi	%0,1\n\
 	addi	%0,%0,-1\n\
 	blt-	2f\n"
-	PPC405_ERR77(0,%1)
 "	stwcx.	%0,0,%1\n\
 	bne-	1b"
 	PPC_ATOMIC_EXIT_BARRIER
diff --git a/arch/powerpc/include/asm/bitops.h b/arch/powerpc/include/asm/bitops.h
index 28dcf8222943..4a4d3afd5340 100644
--- a/arch/powerpc/include/asm/bitops.h
+++ b/arch/powerpc/include/asm/bitops.h
@@ -41,7 +41,6 @@
 #include <linux/compiler.h>
 #include <asm/asm-compat.h>
 #include <asm/synch.h>
-#include <asm/asm-405.h>
 
 /* PPC bit number conversion */
 #define PPC_BITLSHIFT(be)	(BITS_PER_LONG - 1 - (be))
@@ -73,7 +72,6 @@ static inline void fn(unsigned long mask,	\
 	prefix					\
 "1:"	PPC_LLARX(%0,0,%3,0) "\n"		\
 	stringify_in_c(op) "%0,%0,%2\n"		\
-	PPC405_ERR77(0,%3)			\
 	PPC_STLCX "%0,0,%3\n"			\
 	"bne- 1b\n"				\
 	: "=&r" (old), "+m" (*p)		\
@@ -119,7 +117,6 @@ static inline unsigned long fn(			\
 	prefix						\
 "1:"	PPC_LLARX(%0,0,%3,eh) "\n"			\
 	stringify_in_c(op) "%1,%0,%2\n"			\
-	PPC405_ERR77(0,%3)				\
 	PPC_STLCX "%1,0,%3\n"				\
 	"bne- 1b\n"					\
 	postfix						\
@@ -175,7 +172,6 @@ clear_bit_unlock_return_word(int nr, volatile unsigned long *addr)
 	PPC_RELEASE_BARRIER
 "1:"	PPC_LLARX(%0,0,%3,0) "\n"
 	"andc %1,%0,%2\n"
-	PPC405_ERR77(0,%3)
 	PPC_STLCX "%1,0,%3\n"
 	"bne- 1b\n"
 	: "=&r" (old), "=&r" (t)
diff --git a/arch/powerpc/include/asm/cmpxchg.h b/arch/powerpc/include/asm/cmpxchg.h
index 27183871eb3b..cf091c4c22e5 100644
--- a/arch/powerpc/include/asm/cmpxchg.h
+++ b/arch/powerpc/include/asm/cmpxchg.h
@@ -6,7 +6,6 @@
 #include <linux/compiler.h>
 #include <asm/synch.h>
 #include <linux/bug.h>
-#include <asm/asm-405.h>
 
 #ifdef __BIG_ENDIAN
 #define BITOFF_CAL(size, off)	((sizeof(u32) - size - off) * BITS_PER_BYTE)
@@ -29,7 +28,6 @@ static inline u32 __xchg_##type##sfx(volatile void *p, u32 val)	\
 "1:	lwarx   %0,0,%3\n"					\
 "	andc	%1,%0,%5\n"					\
 "	or	%1,%1,%4\n"					\
-	PPC405_ERR77(0,%3)					\
 "	stwcx.	%1,0,%3\n"					\
 "	bne-	1b\n"						\
 	: "=&r" (prev), "=&r" (tmp), "+m" (*(u32*)p)		\
@@ -60,7 +58,6 @@ u32 __cmpxchg_##type##sfx(volatile void *p, u32 old, u32 new)	\
 "	bne-	2f\n"						\
 "	andc	%1,%0,%6\n"					\
 "	or	%1,%1,%5\n"					\
-	PPC405_ERR77(0,%3)					\
 "	stwcx.  %1,0,%3\n"					\
 "	bne-    1b\n"						\
 	br2							\
@@ -92,7 +89,6 @@ __xchg_u32_local(volatile void *p, unsigned long val)
 
 	__asm__ __volatile__(
 "1:	lwarx	%0,0,%2 \n"
-	PPC405_ERR77(0,%2)
 "	stwcx.	%3,0,%2 \n\
 	bne-	1b"
 	: "=&r" (prev), "+m" (*(volatile unsigned int *)p)
@@ -109,7 +105,6 @@ __xchg_u32_relaxed(u32 *p, unsigned long val)
 
 	__asm__ __volatile__(
 "1:	lwarx	%0,0,%2\n"
-	PPC405_ERR77(0, %2)
 "	stwcx.	%3,0,%2\n"
 "	bne-	1b"
 	: "=&r" (prev), "+m" (*p)
@@ -127,7 +122,6 @@ __xchg_u64_local(volatile void *p, unsigned long val)
 
 	__asm__ __volatile__(
 "1:	ldarx	%0,0,%2 \n"
-	PPC405_ERR77(0,%2)
 "	stdcx.	%3,0,%2 \n\
 	bne-	1b"
 	: "=&r" (prev), "+m" (*(volatile unsigned long *)p)
@@ -144,7 +138,6 @@ __xchg_u64_relaxed(u64 *p, unsigned long val)
 
 	__asm__ __volatile__(
 "1:	ldarx	%0,0,%2\n"
-	PPC405_ERR77(0, %2)
 "	stdcx.	%3,0,%2\n"
 "	bne-	1b"
 	: "=&r" (prev), "+m" (*p)
@@ -229,7 +222,6 @@ __cmpxchg_u32(volatile unsigned int *p, unsigned long old, unsigned long new)
 "1:	lwarx	%0,0,%2		# __cmpxchg_u32\n\
 	cmpw	0,%0,%3\n\
 	bne-	2f\n"
-	PPC405_ERR77(0,%2)
 "	stwcx.	%4,0,%2\n\
 	bne-	1b"
 	PPC_ATOMIC_EXIT_BARRIER
@@ -252,7 +244,6 @@ __cmpxchg_u32_local(volatile unsigned int *p, unsigned long old,
 "1:	lwarx	%0,0,%2		# __cmpxchg_u32\n\
 	cmpw	0,%0,%3\n\
 	bne-	2f\n"
-	PPC405_ERR77(0,%2)
 "	stwcx.	%4,0,%2\n\
 	bne-	1b"
 	"\n\
@@ -273,7 +264,6 @@ __cmpxchg_u32_relaxed(u32 *p, unsigned long old, unsigned long new)
 "1:	lwarx	%0,0,%2		# __cmpxchg_u32_relaxed\n"
 "	cmpw	0,%0,%3\n"
 "	bne-	2f\n"
-	PPC405_ERR77(0, %2)
 "	stwcx.	%4,0,%2\n"
 "	bne-	1b\n"
 "2:"
@@ -301,7 +291,6 @@ __cmpxchg_u32_acquire(u32 *p, unsigned long old, unsigned long new)
 "1:	lwarx	%0,0,%2		# __cmpxchg_u32_acquire\n"
 "	cmpw	0,%0,%3\n"
 "	bne-	2f\n"
-	PPC405_ERR77(0, %2)
 "	stwcx.	%4,0,%2\n"
 "	bne-	1b\n"
 	PPC_ACQUIRE_BARRIER
diff --git a/arch/powerpc/include/asm/futex.h b/arch/powerpc/include/asm/futex.h
index f187bb5e524e..e93ee3202e4c 100644
--- a/arch/powerpc/include/asm/futex.h
+++ b/arch/powerpc/include/asm/futex.h
@@ -8,14 +8,12 @@
 #include <linux/uaccess.h>
 #include <asm/errno.h>
 #include <asm/synch.h>
-#include <asm/asm-405.h>
 
 #define __futex_atomic_op(insn, ret, oldval, uaddr, oparg) \
   __asm__ __volatile ( \
 	PPC_ATOMIC_ENTRY_BARRIER \
 "1:	lwarx	%0,0,%2\n" \
 	insn \
-	PPC405_ERR77(0, %2) \
 "2:	stwcx.	%1,0,%2\n" \
 	"bne-	1b\n" \
 	PPC_ATOMIC_EXIT_BARRIER \
@@ -82,7 +80,6 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 "1:     lwarx   %1,0,%3         # futex_atomic_cmpxchg_inatomic\n\
         cmpw    0,%1,%4\n\
         bne-    3f\n"
-        PPC405_ERR77(0,%3)
 "2:     stwcx.  %5,0,%3\n\
         bne-    1b\n"
         PPC_ATOMIC_EXIT_BARRIER
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index fdbfcc44fea8..bbeb7c543274 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -9,7 +9,6 @@
 #include <linux/sched.h>
 #include <linux/threads.h>
 #include <asm/mmu.h>			/* For sub-arch specific PPC_PIN_SIZE */
-#include <asm/asm-405.h>
 
 #ifdef CONFIG_44x
 extern int icache_44x_need_flush;
diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
index 860228e917dc..2d620896cdae 100644
--- a/arch/powerpc/include/asm/spinlock.h
+++ b/arch/powerpc/include/asm/spinlock.h
@@ -23,7 +23,6 @@
 #endif
 #include <asm/synch.h>
 #include <asm/ppc-opcode.h>
-#include <asm/asm-405.h>
 
 #ifdef CONFIG_PPC64
 /* use 0x800000yy when locked, where yy == CPU number */
@@ -210,7 +209,6 @@ static inline long __arch_read_trylock(arch_rwlock_t *rw)
 	__DO_SIGN_EXTEND
 "	addic.		%0,%0,1\n\
 	ble-		2f\n"
-	PPC405_ERR77(0,%1)
 "	stwcx.		%0,0,%1\n\
 	bne-		1b\n"
 	PPC_ACQUIRE_BARRIER
@@ -234,7 +232,6 @@ static inline long __arch_write_trylock(arch_rwlock_t *rw)
 "1:	" PPC_LWARX(%0,0,%2,1) "\n\
 	cmpwi		0,%0,0\n\
 	bne-		2f\n"
-	PPC405_ERR77(0,%1)
 "	stwcx.		%1,0,%2\n\
 	bne-		1b\n"
 	PPC_ACQUIRE_BARRIER
@@ -292,7 +289,6 @@ static inline void arch_read_unlock(arch_rwlock_t *rw)
 	PPC_RELEASE_BARRIER
 "1:	lwarx		%0,0,%1\n\
 	addic		%0,%0,-1\n"
-	PPC405_ERR77(0,%1)
 "	stwcx.		%0,0,%1\n\
 	bne-		1b"
 	: "=&r"(tmp)
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index a6371fb8f761..8ea50472528c 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -28,7 +28,6 @@
 #include <asm/unistd.h>
 #include <asm/ptrace.h>
 #include <asm/export.h>
-#include <asm/asm-405.h>
 #include <asm/feature-fixups.h>
 #include <asm/barrier.h>
 #include <asm/kup.h>
@@ -541,9 +540,6 @@ syscall_exit_work:
 	addi	r12,r2,TI_FLAGS
 3:	lwarx	r8,0,r12
 	andc	r8,r8,r11
-#ifdef CONFIG_IBM405_ERR77
-	dcbt	0,r12
-#endif
 	stwcx.	r8,0,r12
 	bne-	3b
 	
@@ -918,9 +914,6 @@ resume_kernel:
 	addi	r5,r2,TI_FLAGS
 0:	lwarx	r8,0,r5
 	andc	r8,r8,r11
-#ifdef CONFIG_IBM405_ERR77
-	dcbt	0,r5
-#endif
 	stwcx.	r8,0,r5
 	bne-	0b
 1:
@@ -997,7 +990,6 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_47x)
 	mtspr	SPRN_XER,r10
 	mtctr	r11
 
-	PPC405_ERR77(0,r1)
 BEGIN_FTR_SECTION
 	lwarx	r11,0,r1
 END_FTR_SECTION_IFSET(CPU_FTR_NEED_PAIRED_STWCX)
@@ -1066,7 +1058,6 @@ exc_exit_start:
 	lwz	r1,GPR1(r1)
 	.globl exc_exit_restart_end
 exc_exit_restart_end:
-	PPC405_ERR77_SYNC
 	rfi
 	b	.			/* prevent prefetch past rfi */
 
@@ -1109,7 +1100,6 @@ exc_exit_restart_end:
 	lwz	r11,_CTR(r1);						\
 	mtspr	SPRN_XER,r10;						\
 	mtctr	r11;							\
-	PPC405_ERR77(0,r1);						\
 	stwcx.	r0,0,r1;		/* to clear the reservation */	\
 	lwz	r11,_LINK(r1);						\
 	mtlr	r11;							\
@@ -1129,7 +1119,6 @@ exc_exit_restart_end:
 	lwz	r10,GPR10(r1);						\
 	lwz	r11,GPR11(r1);						\
 	lwz	r1,GPR1(r1);						\
-	PPC405_ERR77_SYNC;						\
 	exc_lvl_rfi;							\
 	b	.;		/* prevent prefetch past exc_lvl_rfi */
 
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index faeea5b56525..afa93a36437b 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -36,7 +36,6 @@
 #include <asm/asm-offsets.h>
 #include <asm/ptrace.h>
 #include <asm/export.h>
-#include <asm/asm-405.h>
 
 #include "head_32.h"
 
@@ -486,7 +485,6 @@ _ENTRY(saved_ksp_limit)
 	lwz	r12,GPR12(r11)
 	lwz	r10,crit_r10@l(0)
 	lwz	r11,crit_r11@l(0)
-	PPC405_ERR77_SYNC
 	rfci
 	b	.
 
@@ -568,7 +566,6 @@ finish_tlb_load:
 	mfspr	r12, SPRN_SPRG_SCRATCH3
 	mfspr	r11, SPRN_SPRG_SCRATCH1
 	mfspr	r10, SPRN_SPRG_SCRATCH0
-	PPC405_ERR77_SYNC
 	rfi			/* Should sync shadow TLBs */
 	b	.		/* prevent prefetch past rfi */
 
diff --git a/arch/powerpc/platforms/40x/Kconfig b/arch/powerpc/platforms/40x/Kconfig
index ebe283476461..e3e5217c9822 100644
--- a/arch/powerpc/platforms/40x/Kconfig
+++ b/arch/powerpc/platforms/40x/Kconfig
@@ -69,12 +69,6 @@ config PPC4xx_GPIO
 	help
 	  Enable gpiolib support for ppc40x based boards
 
-# 40x errata/workaround config symbols, selected by the CPU models above
-
-# All 405-based cores up until the 405GPR and 405EP have this errata.
-config IBM405_ERR77
-	bool
-
 config APM8018X
 	bool "APM8018X"
 	depends on 40x
-- 
2.25.0

