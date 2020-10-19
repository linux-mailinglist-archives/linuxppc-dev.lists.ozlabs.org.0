Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0B1292712
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 14:17:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFG3p1fH9zDqWd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 23:17:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFFyJ6L2GzDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 23:12:53 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CFFy40vKbz9tx02;
 Mon, 19 Oct 2020 14:12:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tkVbIzAd7YhC; Mon, 19 Oct 2020 14:12:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CFFy36Vbfz9twyp;
 Mon, 19 Oct 2020 14:12:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E487D8B7A1;
 Mon, 19 Oct 2020 14:12:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NuT0dlRarBoW; Mon, 19 Oct 2020 14:12:48 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [10.25.210.27])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 544B68B79E;
 Mon, 19 Oct 2020 14:12:48 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4EF376678A; Mon, 19 Oct 2020 12:12:48 +0000 (UTC)
Message-Id: <fbcdb173cc42da62f00285dfef8c2f7d4960b5c7.1603109522.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5ffcb064f695d5285bf1faab91bffa3f9245fc26.1603109522.git.christophe.leroy@csgroup.eu>
References: <5ffcb064f695d5285bf1faab91bffa3f9245fc26.1603109522.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 3/3] powerpc: Fix pre-update addressing in inline assembly
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 19 Oct 2020 12:12:48 +0000 (UTC)
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

In several places, inline assembly uses the "%Un" modifier
to enable the use of instruction with pre-update addressing,
but the associated "<>" constraint is missing.

As mentioned in previous patch, this fails with gcc 4.9, so
"<>" can't be used directly.

Use UPD_CONSTR macro everywhere %Un modifier is used.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/atomic.h            | 9 +++++----
 arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
 arch/powerpc/include/asm/io.h                | 4 ++--
 arch/powerpc/include/asm/nohash/pgtable.h    | 2 +-
 arch/powerpc/kvm/powerpc.c                   | 4 ++--
 5 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/atomic.h b/arch/powerpc/include/asm/atomic.h
index 8a55eb8cc97b..b82f9154e45a 100644
--- a/arch/powerpc/include/asm/atomic.h
+++ b/arch/powerpc/include/asm/atomic.h
@@ -10,6 +10,7 @@
 #include <linux/types.h>
 #include <asm/cmpxchg.h>
 #include <asm/barrier.h>
+#include <asm/ppc_asm.h>
 
 /*
  * Since *_return_relaxed and {cmp}xchg_relaxed are implemented with
@@ -26,14 +27,14 @@ static __inline__ int atomic_read(const atomic_t *v)
 {
 	int t;
 
-	__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=r"(t) : "m"(v->counter));
+	__asm__ __volatile__("lwz%U1%X1 %0,%1" : "=r"(t) : "m"UPD_CONSTR(v->counter));
 
 	return t;
 }
 
 static __inline__ void atomic_set(atomic_t *v, int i)
 {
-	__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m"(v->counter) : "r"(i));
+	__asm__ __volatile__("stw%U0%X0 %1,%0" : "=m"UPD_CONSTR(v->counter) : "r"(i));
 }
 
 #define ATOMIC_OP(op, asm_op)						\
@@ -316,14 +317,14 @@ static __inline__ s64 atomic64_read(const atomic64_t *v)
 {
 	s64 t;
 
-	__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m"(v->counter));
+	__asm__ __volatile__("ld%U1%X1 %0,%1" : "=r"(t) : "m"UPD_CONSTR(v->counter));
 
 	return t;
 }
 
 static __inline__ void atomic64_set(atomic64_t *v, s64 i)
 {
-	__asm__ __volatile__("std%U0%X0 %1,%0" : "=m"(v->counter) : "r"(i));
+	__asm__ __volatile__("std%U0%X0 %1,%0" : "=m"UPD_CONSTR(v->counter) : "r"(i));
 }
 
 #define ATOMIC64_OP(op, asm_op)						\
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 34f5ca391f0c..0e1b6e020cef 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -525,7 +525,7 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 		stw%U0%X0 %2,%0\n\
 		eieio\n\
 		stw%U1%X1 %L2,%1"
-	: "=m" (*ptep), "=m" (*((unsigned char *)ptep+4))
+	: "=m"UPD_CONSTR (*ptep), "=m"UPD_CONSTR (*((unsigned char *)ptep+4))
 	: "r" (pte) : "memory");
 
 #else
diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
index 58635960403c..87964dfb838e 100644
--- a/arch/powerpc/include/asm/io.h
+++ b/arch/powerpc/include/asm/io.h
@@ -122,7 +122,7 @@ static inline u##size name(const volatile u##size __iomem *addr)	\
 {									\
 	u##size ret;							\
 	__asm__ __volatile__("sync;"#insn"%U1%X1 %0,%1;twi 0,%0,0;isync"\
-		: "=r" (ret) : "m" (*addr) : "memory");			\
+		: "=r" (ret) : "m"UPD_CONSTR (*addr) : "memory");	\
 	return ret;							\
 }
 
@@ -130,7 +130,7 @@ static inline u##size name(const volatile u##size __iomem *addr)	\
 static inline void name(volatile u##size __iomem *addr, u##size val)	\
 {									\
 	__asm__ __volatile__("sync;"#insn"%U0%X0 %1,%0"			\
-		: "=m" (*addr) : "r" (val) : "memory");			\
+		: "=m"UPD_CONSTR (*addr) : "r" (val) : "memory");	\
 	mmiowb_set_pending();						\
 }
 
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index a00e4c1746d6..55ef2112ed00 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -200,7 +200,7 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 			stw%U0%X0 %2,%0\n\
 			eieio\n\
 			stw%U1%X1 %L2,%1"
-		: "=m" (*ptep), "=m" (*((unsigned char *)ptep+4))
+		: "=m"UPD_CONSTR (*ptep), "=m"UPD_CONSTR (*((unsigned char *)ptep+4))
 		: "r" (pte) : "memory");
 		return;
 	}
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 13999123b735..cf52d26f49cd 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -1087,7 +1087,7 @@ static inline u64 sp_to_dp(u32 fprs)
 
 	preempt_disable();
 	enable_kernel_fp();
-	asm ("lfs%U1%X1 0,%1; stfd%U0%X0 0,%0" : "=m" (fprd) : "m" (fprs)
+	asm ("lfs%U1%X1 0,%1; stfd%U0%X0 0,%0" : "=m"UPD_CONSTR (fprd) : "m"UPD_CONSTR (fprs)
 	     : "fr0");
 	preempt_enable();
 	return fprd;
@@ -1099,7 +1099,7 @@ static inline u32 dp_to_sp(u64 fprd)
 
 	preempt_disable();
 	enable_kernel_fp();
-	asm ("lfd%U1%X1 0,%1; stfs%U0%X0 0,%0" : "=m" (fprs) : "m" (fprd)
+	asm ("lfd%U1%X1 0,%1; stfs%U0%X0 0,%0" : "=m"UPD_CONSTR (fprs) : "m"UPD_CONSTR (fprd)
 	     : "fr0");
 	preempt_enable();
 	return fprs;
-- 
2.25.0

