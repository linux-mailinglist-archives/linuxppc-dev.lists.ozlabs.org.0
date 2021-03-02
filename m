Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2423329700
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 09:48:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqW505tsTz3d7s
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 19:48:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqW4L6PQDz30NV
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 19:48:16 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DqW4C5qLLz9txQh;
 Tue,  2 Mar 2021 09:48:11 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uolnubRyter1; Tue,  2 Mar 2021 09:48:11 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DqW4C439fz9txQg;
 Tue,  2 Mar 2021 09:48:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A12808B7AC;
 Tue,  2 Mar 2021 09:48:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id X_N73Rd8VYWJ; Tue,  2 Mar 2021 09:48:12 +0100 (CET)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2195E8B75F;
 Tue,  2 Mar 2021 09:48:12 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 8941D674AD; Tue,  2 Mar 2021 08:48:11 +0000 (UTC)
Message-Id: <1fc81f07cabebb875b963e295408cc3dd38c8d85.1614674882.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 1/2] powerpc: Use lwarx/ldarx directly instead of
 PPC_LWARX/LDARX macros
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue,  2 Mar 2021 08:48:11 +0000 (UTC)
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

Force the eh flag at 0 on PPC32.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/asm-compat.h      | 4 ++--
 arch/powerpc/include/asm/atomic.h          | 4 ++--
 arch/powerpc/include/asm/bitops.h          | 8 ++++----
 arch/powerpc/include/asm/ppc-opcode.h      | 2 --
 arch/powerpc/include/asm/simple_spinlock.h | 6 +++---
 5 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-compat.h b/arch/powerpc/include/asm/asm-compat.h
index 19b70c5b5f18..2b736d9fbb1b 100644
--- a/arch/powerpc/include/asm/asm-compat.h
+++ b/arch/powerpc/include/asm/asm-compat.h
@@ -17,7 +17,7 @@
 #define PPC_LONG	stringify_in_c(.8byte)
 #define PPC_LONG_ALIGN	stringify_in_c(.balign 8)
 #define PPC_TLNEI	stringify_in_c(tdnei)
-#define PPC_LLARX(t, a, b, eh)	PPC_LDARX(t, a, b, eh)
+#define PPC_LLARX	stringify_in_c(ldarx)
 #define PPC_STLCX	stringify_in_c(stdcx.)
 #define PPC_CNTLZL	stringify_in_c(cntlzd)
 #define PPC_MTOCRF(FXM, RS) MTOCRF((FXM), RS)
@@ -50,7 +50,7 @@
 #define PPC_LONG	stringify_in_c(.long)
 #define PPC_LONG_ALIGN	stringify_in_c(.balign 4)
 #define PPC_TLNEI	stringify_in_c(twnei)
-#define PPC_LLARX(t, a, b, eh)	PPC_LWARX(t, a, b, eh)
+#define PPC_LLARX	stringify_in_c(lwarx)
 #define PPC_STLCX	stringify_in_c(stwcx.)
 #define PPC_CNTLZL	stringify_in_c(cntlzw)
 #define PPC_MTOCRF	stringify_in_c(mtcrf)
diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 61c6e8b200e8..ba177d0be278 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -204,7 +204,7 @@ atomic_try_cmpxchg_lock(atomic_t *v, int *old, int new)
 	int r, o = *old;
 
 	__asm__ __volatile__ (
-"1:\t"	PPC_LWARX(%0,0,%2,1) "	# atomic_try_cmpxchg_acquire	\n"
+"1:	lwarx	%0,0,%2,%5	# atomic_try_cmpxchg_acquire		\n"
 "	cmpw	0,%0,%3							\n"
 "	bne-	2f							\n"
 "	stwcx.	%4,0,%2							\n"
@@ -212,7 +212,7 @@ atomic_try_cmpxchg_lock(atomic_t *v, int *old, int new)
 "\t"	PPC_ACQUIRE_BARRIER "						\n"
 "2:									\n"
 	: "=&r" (r), "+m" (v->counter)
-	: "r" (&v->counter), "r" (o), "r" (new)
+	: "r" (&v->counter), "r" (o), "r" (new), "i" (IS_ENABLED(CONFIG_PPC64) ? 1 : 0)
 	: "cr0", "memory");
 
 	if (unlikely(r != o))
diff --git a/arch/powerpc/include/asm/bitops.h b/arch/powerpc/include/asm/bitops.h
index 299ab33505a6..11847b6a244e 100644
--- a/arch/powerpc/include/asm/bitops.h
+++ b/arch/powerpc/include/asm/bitops.h
@@ -70,7 +70,7 @@ static inline void fn(unsigned long mask,	\
 	unsigned long *p = (unsigned long *)_p;	\
 	__asm__ __volatile__ (			\
 	prefix					\
-"1:"	PPC_LLARX(%0,0,%3,0) "\n"		\
+"1:"	PPC_LLARX "%0,0,%3,0\n"			\
 	stringify_in_c(op) "%0,%0,%2\n"		\
 	PPC_STLCX "%0,0,%3\n"			\
 	"bne- 1b\n"				\
@@ -115,13 +115,13 @@ static inline unsigned long fn(			\
 	unsigned long *p = (unsigned long *)_p;		\
 	__asm__ __volatile__ (				\
 	prefix						\
-"1:"	PPC_LLARX(%0,0,%3,eh) "\n"			\
+"1:"	PPC_LLARX "%0,0,%3,%4\n"			\
 	stringify_in_c(op) "%1,%0,%2\n"			\
 	PPC_STLCX "%1,0,%3\n"				\
 	"bne- 1b\n"					\
 	postfix						\
 	: "=&r" (old), "=&r" (t)			\
-	: "r" (mask), "r" (p)				\
+	: "r" (mask), "r" (p), "i" (IS_ENABLED(CONFIG_PPC64) ? eh : 0)	\
 	: "cc", "memory");				\
 	return (old & mask);				\
 }
@@ -170,7 +170,7 @@ clear_bit_unlock_return_word(int nr, volatile unsigned long *addr)
 
 	__asm__ __volatile__ (
 	PPC_RELEASE_BARRIER
-"1:"	PPC_LLARX(%0,0,%3,0) "\n"
+"1:"	PPC_LLARX "%0,0,%3,0\n"
 	"andc %1,%0,%2\n"
 	PPC_STLCX "%1,0,%3\n"
 	"bne- 1b\n"
diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include/asm/ppc-opcode.h
index ed161ef2b3ca..9550af2301b1 100644
--- a/arch/powerpc/include/asm/ppc-opcode.h
+++ b/arch/powerpc/include/asm/ppc-opcode.h
@@ -531,8 +531,6 @@
 #define	PPC_DIVDE(t, a, b)	stringify_in_c(.long PPC_RAW_DIVDE(t, a, b))
 #define	PPC_DIVDEU(t, a, b)	stringify_in_c(.long PPC_RAW_DIVDEU(t, a, b))
 #define PPC_LQARX(t, a, b, eh)	stringify_in_c(.long PPC_RAW_LQARX(t, a, b, eh))
-#define PPC_LDARX(t, a, b, eh)	stringify_in_c(.long PPC_RAW_LDARX(t, a, b, eh))
-#define PPC_LWARX(t, a, b, eh)	stringify_in_c(.long PPC_RAW_LWARX(t, a, b, eh))
 #define PPC_STQCX(t, a, b)	stringify_in_c(.long PPC_RAW_STQCX(t, a, b))
 #define PPC_MADDHD(t, a, b, c)	stringify_in_c(.long PPC_RAW_MADDHD(t, a, b, c))
 #define PPC_MADDHDU(t, a, b, c)	stringify_in_c(.long PPC_RAW_MADDHDU(t, a, b, c))
diff --git a/arch/powerpc/include/asm/simple_spinlock.h b/arch/powerpc/include/asm/simple_spinlock.h
index 5b862de29dff..1b1ded4a21f3 100644
--- a/arch/powerpc/include/asm/simple_spinlock.h
+++ b/arch/powerpc/include/asm/simple_spinlock.h
@@ -52,7 +52,7 @@ static inline unsigned long __arch_spin_trylock(arch_spinlock_t *lock)
 
 	token = LOCK_TOKEN;
 	__asm__ __volatile__(
-"1:	" PPC_LWARX(%0,0,%2,1) "\n\
+"1:	lwarx		%0,0,%2,1\n\
 	cmpwi		0,%0,0\n\
 	bne-		2f\n\
 	stwcx.		%1,0,%2\n\
@@ -180,7 +180,7 @@ static inline long __arch_read_trylock(arch_rwlock_t *rw)
 	long tmp;
 
 	__asm__ __volatile__(
-"1:	" PPC_LWARX(%0,0,%1,1) "\n"
+"1:	lwarx		%0,0,%1,1\n"
 	__DO_SIGN_EXTEND
 "	addic.		%0,%0,1\n\
 	ble-		2f\n"
@@ -204,7 +204,7 @@ static inline long __arch_write_trylock(arch_rwlock_t *rw)
 
 	token = WRLOCK_TOKEN;
 	__asm__ __volatile__(
-"1:	" PPC_LWARX(%0,0,%2,1) "\n\
+"1:	lwarx		%0,0,%2,1\n\
 	cmpwi		0,%0,0\n\
 	bne-		2f\n"
 "	stwcx.		%1,0,%2\n\
-- 
2.25.0

