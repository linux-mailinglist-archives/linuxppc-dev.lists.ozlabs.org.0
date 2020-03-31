Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A2375198C6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 08:39:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s07J1Nf9zDrPV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 17:39:56 +1100 (AEDT)
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
 header.s=mail header.b=fiQyu9Lg; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rznx38lnzDqqW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 17:24:53 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48rzns0Tdvz9v0KL;
 Tue, 31 Mar 2020 08:24:49 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fiQyu9Lg; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id f0xEd0TD0Jvh; Tue, 31 Mar 2020 08:24:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48rznr6T6xz9v0KC;
 Tue, 31 Mar 2020 08:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585635888; bh=8dgIh7fRtGyYIN9w8nAk5rbhZBf0YZZiQ6G2a+dxRQo=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=fiQyu9LgWVevoYe/KH3HMqAzB7EOAUgtgPgiP2Hl2bwhOso2PanYskhGe77Ngi/Gg
 H5hwnPGZ+k/gLOV1Ij6hugVSG8dDgFvbqpMqKsfnmC9QwjEGTt7QNFdAy9ADpQs+Ez
 P5+/88jtyEvD2aGBulgaBqTNph2bZ1J00m1ur6/U=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C1E628B784;
 Tue, 31 Mar 2020 08:24:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ec39iXvv1NJY; Tue, 31 Mar 2020 08:24:49 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7A3548B752;
 Tue, 31 Mar 2020 08:24:49 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 7AC1165673; Tue, 31 Mar 2020 06:24:49 +0000 (UTC)
Message-Id: <dc8e597e322d9992178b3cffdc05d41bfb758e79.1585635837.git.christophe.leroy@c-s.fr>
In-Reply-To: <40899eb1b8f10da3706acd06c3d46d2418c8886e.1585635837.git.christophe.leroy@c-s.fr>
References: <40899eb1b8f10da3706acd06c3d46d2418c8886e.1585635837.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 09/10] powerpc/pgtable: Drop PTE_ATOMIC_UPDATES
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 31 Mar 2020 06:24:49 +0000 (UTC)
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

40x was the last user of PTE_ATOMIC_UPDATES.

Drop everything related to PTE_ATOMIC_UPDATES.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 30 --------------------
 arch/powerpc/include/asm/nohash/64/pgtable.h | 27 ------------------
 2 files changed, 57 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 719bf09db1a6..d253ce035f72 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -224,19 +224,6 @@ static inline unsigned long pte_update(pte_t *p,
 				       unsigned long clr,
 				       unsigned long set)
 {
-#ifdef PTE_ATOMIC_UPDATES
-	unsigned long old, tmp;
-
-	__asm__ __volatile__("\
-1:	lwarx	%0,0,%3\n\
-	andc	%1,%0,%4\n\
-	or	%1,%1,%5\n"
-"	stwcx.	%1,0,%3\n\
-	bne-	1b"
-	: "=&r" (old), "=&r" (tmp), "=m" (*p)
-	: "r" (p), "r" (clr), "r" (set), "m" (*p)
-	: "cc" );
-#else /* PTE_ATOMIC_UPDATES */
 	unsigned long old = pte_val(*p);
 	unsigned long new = (old & ~clr) | set;
 
@@ -245,7 +232,6 @@ static inline unsigned long pte_update(pte_t *p,
 #else
 	*p = __pte(new);
 #endif
-#endif /* !PTE_ATOMIC_UPDATES */
 
 #ifdef CONFIG_44x
 	if ((old & _PAGE_USER) && (old & _PAGE_EXEC))
@@ -258,24 +244,8 @@ static inline unsigned long long pte_update(pte_t *p,
 					    unsigned long clr,
 					    unsigned long set)
 {
-#ifdef PTE_ATOMIC_UPDATES
-	unsigned long long old;
-	unsigned long tmp;
-
-	__asm__ __volatile__("\
-1:	lwarx	%L0,0,%4\n\
-	lwzx	%0,0,%3\n\
-	andc	%1,%L0,%5\n\
-	or	%1,%1,%6\n"
-"	stwcx.	%1,0,%4\n\
-	bne-	1b"
-	: "=&r" (old), "=&r" (tmp), "=m" (*p)
-	: "r" (p), "r" ((unsigned long)(p) + 4), "r" (clr), "r" (set), "m" (*p)
-	: "cc" );
-#else /* PTE_ATOMIC_UPDATES */
 	unsigned long long old = pte_val(*p);
 	*p = __pte((old & ~(unsigned long long)clr) | set);
-#endif /* !PTE_ATOMIC_UPDATES */
 
 #ifdef CONFIG_44x
 	if ((old & _PAGE_USER) && (old & _PAGE_EXEC))
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 9a33b8bd842d..3cacace9bfa0 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -211,22 +211,8 @@ static inline unsigned long pte_update(struct mm_struct *mm,
 				       unsigned long set,
 				       int huge)
 {
-#ifdef PTE_ATOMIC_UPDATES
-	unsigned long old, tmp;
-
-	__asm__ __volatile__(
-	"1:	ldarx	%0,0,%3		# pte_update\n\
-	andc	%1,%0,%4 \n\
-	or	%1,%1,%6\n\
-	stdcx.	%1,0,%3 \n\
-	bne-	1b"
-	: "=&r" (old), "=&r" (tmp), "=m" (*ptep)
-	: "r" (ptep), "r" (clr), "m" (*ptep), "r" (set)
-	: "cc" );
-#else
 	unsigned long old = pte_val(*ptep);
 	*ptep = __pte((old & ~clr) | set);
-#endif
 	/* huge pages use the old page table lock */
 	if (!huge)
 		assert_pte_locked(mm, addr);
@@ -310,21 +296,8 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 	unsigned long bits = pte_val(entry) &
 		(_PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_RW | _PAGE_EXEC);
 
-#ifdef PTE_ATOMIC_UPDATES
-	unsigned long old, tmp;
-
-	__asm__ __volatile__(
-	"1:	ldarx	%0,0,%4\n\
-		or	%0,%3,%0\n\
-		stdcx.	%0,0,%4\n\
-		bne-	1b"
-	:"=&r" (old), "=&r" (tmp), "=m" (*ptep)
-	:"r" (bits), "r" (ptep), "m" (*ptep)
-	:"cc");
-#else
 	unsigned long old = pte_val(*ptep);
 	*ptep = __pte(old | bits);
-#endif
 
 	flush_tlb_page(vma, address);
 }
-- 
2.25.0

