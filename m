Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFD7186C63
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 14:44:10 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48gyFf5XLwzDqDV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 00:44:06 +1100 (AEDT)
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
 header.s=mail header.b=Fl1TPdNU; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwlB564ZzDqLX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:06 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwl269JGz9v02g;
 Mon, 16 Mar 2020 13:35:58 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Fl1TPdNU; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id s0ivenQ9e08L; Mon, 16 Mar 2020 13:35:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwl256lqz9v02f;
 Mon, 16 Mar 2020 13:35:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362158; bh=Ri3yOfdiaLciYHtt4MZxIf0q2mfumVgCna8RRu4NpbQ=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=Fl1TPdNU2qKlpzmtayYTl7ssLJG1eYnyWiyIajKUiURsW4cVTPCzENZSacJcWiWo7
 1dBdEVLXDf811cAM72CC08ZGWXeAMq3kW+q5AUOrSP/Lm5JVPSvuH1ujKzp+l/Z1Om
 rUhSScl1JHh54+DAUVbhkiNCO5dcev8JALFi+QGw=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A94928B7D0;
 Mon, 16 Mar 2020 13:36:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tzfIxHZF9h8f; Mon, 16 Mar 2020 13:36:03 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B9FF8B7CB;
 Mon, 16 Mar 2020 13:36:03 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 81C5665595; Mon, 16 Mar 2020 12:36:03 +0000 (UTC)
Message-Id: <e6932fd4860bc3dad05fe406a207b329c6547bf9.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 18/46] powerpc/mm: PTE_ATOMIC_UPDATES is only for 40x
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:36:03 +0000 (UTC)
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

Only 40x still uses PTE_ATOMIC_UPDATES.
40x cannot not select CONFIG_PTE64_BIT.

Drop handling of PTE_ATOMIC_UPDATES:
- In nohash/64
- In nohash/32 for CONFIG_PTE_64BIT

Keep PTE_ATOMIC_UPDATES only for nohash/32 for !CONFIG_PTE_64BIT

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 17 ------------
 arch/powerpc/include/asm/nohash/64/pgtable.h | 28 +-------------------
 2 files changed, 1 insertion(+), 44 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index b04ba257fddb..523c4c3876c5 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -262,25 +262,8 @@ static inline unsigned long long pte_update(pte_t *p,
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
-	PPC405_ERR77(0,%3)
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
index 9a33b8bd842d..9c703b140d64 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -211,22 +211,9 @@ static inline unsigned long pte_update(struct mm_struct *mm,
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
+
 	/* huge pages use the old page table lock */
 	if (!huge)
 		assert_pte_locked(mm, addr);
@@ -310,21 +297,8 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
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

