Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1689D3C2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 18:12:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HH8y2XRQzDqRh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 02:12:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QPQFocRC"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HGjP0s4nzDqLd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 01:52:23 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46HGjB736vz9v7Ds;
 Mon, 26 Aug 2019 17:52:14 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QPQFocRC; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id tXU2UAFMcW1P; Mon, 26 Aug 2019 17:52:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46HGjB5wxxz9v7Dq;
 Mon, 26 Aug 2019 17:52:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566834734; bh=6sNSQr2yvtmoqhGOgyrT1eVzNmPbrIKUsIKFncboTF8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=QPQFocRC3m6T81XTYxQYlX97rYcLb17h27M+OGbJ1TiMPtDOyHu5gd8iyXIjRbUpt
 2eT551qhXz2tiVEy/OneITf5243NqRrK+B3o0biwGcnZpI4ZnZ86eCSrQ98pvLjMHM
 pNAS6fRy5IR/mpkSJHfuhK1cZJ6biK0ggM1td5Ug=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C527C8B7E1;
 Mon, 26 Aug 2019 17:52:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id hUJJWwA4wCBp; Mon, 26 Aug 2019 17:52:19 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 541178B7EF;
 Mon, 26 Aug 2019 17:52:19 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 1B407696D5; Mon, 26 Aug 2019 15:52:19 +0000 (UTC)
Message-Id: <5f3e92ccd64d06477b27626f6007a9da3b8da157.1566834712.git.christophe.leroy@c-s.fr>
In-Reply-To: <d644eaf7dff8cc149260066802af230bdf34fded.1566834712.git.christophe.leroy@c-s.fr>
References: <d644eaf7dff8cc149260066802af230bdf34fded.1566834712.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 6/6] powerpc/32: don't use CPU_FTR_COHERENT_ICACHE
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 26 Aug 2019 15:52:19 +0000 (UTC)
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

Only 601 and E200 have CPU_FTR_COHERENT_ICACHE.

Just use #ifdefs instead of feature fixup.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/kernel/misc_32.S | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index 3d21fb110797..82df4b09e79f 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -324,10 +324,10 @@ EXPORT_SYMBOL(flush_instruction_cache)
  * flush_icache_range(unsigned long start, unsigned long stop)
  */
 _GLOBAL(flush_icache_range)
-BEGIN_FTR_SECTION
+#if defined(CONFIG_PPC_BOOK3S_601) || defined(CONFIG_E200)
 	PURGE_PREFETCHED_INS
-	blr				/* for 601, do nothing */
-END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
+	blr				/* for 601 and e200, do nothing */
+#else
 	rlwinm	r3,r3,0,0,31 - L1_CACHE_SHIFT
 	subf	r4,r3,r4
 	addi	r4,r4,L1_CACHE_BYTES - 1
@@ -353,6 +353,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
 	sync				/* additional sync needed on g4 */
 	isync
 	blr
+#endif
 _ASM_NOKPROBE_SYMBOL(flush_icache_range)
 EXPORT_SYMBOL(flush_icache_range)
 
@@ -360,15 +361,15 @@ EXPORT_SYMBOL(flush_icache_range)
  * Flush a particular page from the data cache to RAM.
  * Note: this is necessary because the instruction cache does *not*
  * snoop from the data cache.
- * This is a no-op on the 601 which has a unified cache.
+ * This is a no-op on the 601 and e200 which have a unified cache.
  *
  *	void __flush_dcache_icache(void *page)
  */
 _GLOBAL(__flush_dcache_icache)
-BEGIN_FTR_SECTION
+#if defined(CONFIG_PPC_BOOK3S_601) || defined(CONFIG_E200)
 	PURGE_PREFETCHED_INS
 	blr
-END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
+#else
 	rlwinm	r3,r3,0,0,31-PAGE_SHIFT		/* Get page base address */
 	li	r4,PAGE_SIZE/L1_CACHE_BYTES	/* Number of lines in a page */
 	mtctr	r4
@@ -396,6 +397,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_44x)
 	sync
 	isync
 	blr
+#endif
 
 #ifndef CONFIG_BOOKE
 /*
@@ -407,10 +409,10 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_TYPE_44x)
  *	void __flush_dcache_icache_phys(unsigned long physaddr)
  */
 _GLOBAL(__flush_dcache_icache_phys)
-BEGIN_FTR_SECTION
+#if defined(CONFIG_PPC_BOOK3S_601) || defined(CONFIG_E200)
 	PURGE_PREFETCHED_INS
-	blr					/* for 601, do nothing */
-END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
+	blr					/* for 601 and e200, do nothing */
+#else
 	mfmsr	r10
 	rlwinm	r0,r10,0,28,26			/* clear DR */
 	mtmsr	r0
@@ -431,6 +433,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_COHERENT_ICACHE)
 	mtmsr	r10				/* restore DR */
 	isync
 	blr
+#endif
 #endif /* CONFIG_BOOKE */
 
 /*
-- 
2.13.3

