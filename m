Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A744490504
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 17:54:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4697Dh0ZwNzDrWy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2019 01:54:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="fBcmFbwY"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4697Bf62QFzDrRv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2019 01:52:57 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4697BW0hrqz9txKQ;
 Fri, 16 Aug 2019 17:52:51 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=fBcmFbwY; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id FYR3124NhMyd; Fri, 16 Aug 2019 17:52:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4697BV6hbsz9txKK;
 Fri, 16 Aug 2019 17:52:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565970770; bh=TwIdZYiHS1CL7yhls5hGrr/rHMBYJ2MBfmVz6lKl8SU=;
 h=From:Subject:To:Cc:Date:From;
 b=fBcmFbwYBkTexLUj/PFgcTJbWlTXdFIhMf5OARQCWusdewXDZMwFUYmGWjnxs+dYq
 pDkqO8Qgcnn/k/gH8z43SOtD7PAycxSq63sHcC44dVojkEARNFgjDa8bjcAomKaDyN
 iDhz+cuQYbRA0T5ccUrMR0vNU5EMGSfjsfuakbDM=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B241A8B78F;
 Fri, 16 Aug 2019 17:52:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id aED1l8-rZepO; Fri, 16 Aug 2019 17:52:52 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 885E98B754;
 Fri, 16 Aug 2019 17:52:52 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 539FD6B6C3; Fri, 16 Aug 2019 15:52:52 +0000 (UTC)
Message-Id: <de7a813c71c4823797bb351bea8be15acae83be2.1565970465.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [RFC PATCH] powerpc: Convert ____flush_dcache_icache_phys() to C
To: Alastair D'Silva <alastair@d-silva.org>
Date: Fri, 16 Aug 2019 15:52:52 +0000 (UTC)
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

Resulting code (8xx with 16 bytes per cacheline and 16k pages)

0000016c <__flush_dcache_icache_phys>:
 16c:	54 63 00 22 	rlwinm  r3,r3,0,0,17
 170:	7d 20 00 a6 	mfmsr   r9
 174:	39 40 04 00 	li      r10,1024
 178:	55 28 07 34 	rlwinm  r8,r9,0,28,26
 17c:	7c 67 1b 78 	mr      r7,r3
 180:	7d 49 03 a6 	mtctr   r10
 184:	7d 00 01 24 	mtmsr   r8
 188:	4c 00 01 2c 	isync
 18c:	7c 00 18 6c 	dcbst   0,r3
 190:	38 63 00 10 	addi    r3,r3,16
 194:	42 00 ff f8 	bdnz    18c <__flush_dcache_icache_phys+0x20>
 198:	7c 00 04 ac 	hwsync
 19c:	7d 49 03 a6 	mtctr   r10
 1a0:	7c 00 3f ac 	icbi    0,r7
 1a4:	38 e7 00 10 	addi    r7,r7,16
 1a8:	42 00 ff f8 	bdnz    1a0 <__flush_dcache_icache_phys+0x34>
 1ac:	7c 00 04 ac 	hwsync
 1b0:	7d 20 01 24 	mtmsr   r9
 1b4:	4c 00 01 2c 	isync
 1b8:	4e 80 00 20 	blr

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 This patch is on top of Alastair's series "powerpc: convert cache asm to C"
 Patch 3 of that series should touch __flush_dcache_icache_phys and this
 patch could come just after patch 3.

 arch/powerpc/include/asm/cacheflush.h |  8 +++++
 arch/powerpc/mm/mem.c                 | 55 ++++++++++++++++++++++++++++-------
 2 files changed, 53 insertions(+), 10 deletions(-)

diff --git a/arch/powerpc/include/asm/cacheflush.h b/arch/powerpc/include/asm/cacheflush.h
index 1826bf2cc137..bf4f2dc4eb76 100644
--- a/arch/powerpc/include/asm/cacheflush.h
+++ b/arch/powerpc/include/asm/cacheflush.h
@@ -47,6 +47,14 @@ void flush_icache_user_range(struct vm_area_struct *vma,
 				    struct page *page, unsigned long addr,
 				    int len);
 void flush_dcache_icache_page(struct page *page);
+#if defined(CONFIG_PPC32) && !defined(CONFIG_BOOKE)
+void __flush_dcache_icache_phys(unsigned long physaddr);
+#else
+static inline void __flush_dcache_icache_phys(unsigned long physaddr)
+{
+	BUG();
+}
+#endif
 
 /**
  * flush_dcache_range(): Write any modified data cache blocks out to memory and invalidate them.
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 43be99de7c9a..43009f9227c4 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -402,6 +402,50 @@ void flush_dcache_page(struct page *page)
 }
 EXPORT_SYMBOL(flush_dcache_page);
 
+#if defined(CONFIG_PPC32) && !defined(CONFIG_BOOKE)
+void __flush_dcache_icache_phys(unsigned long physaddr)
+{
+	unsigned long bytes = l1_dcache_bytes();
+	unsigned long nb = PAGE_SIZE / bytes;
+	unsigned long addr = physaddr & PAGE_MASK;
+	unsigned long msr, msr0;
+	unsigned long loop1 = addr, loop2 = addr;
+
+	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
+		/* For a snooping icache, we still need a dummy icbi to purge all the
+		 * prefetched instructions from the ifetch buffers. We also need a sync
+		 * before the icbi to order the the actual stores to memory that might
+		 * have modified instructions with the icbi.
+		 */
+		mb(); /* sync */
+		icbi((void *)addr);
+		mb(); /* sync */
+		isync();
+		return;
+	}
+	msr0 = mfmsr();
+	msr = msr0 & ~MSR_DR;
+	asm volatile(
+	    "	mtctr %2;"
+	    "	mtmsr %3;"
+	    "	isync;"
+	    "0:	dcbst	0, %0;"
+	    "	addi	%0, %0, %4;"
+	    "	bdnz	0b;"
+	    "	sync;"
+	    "	mtctr %2;"
+	    "1:	icbi	0, %1;"
+	    "	addi	%1, %1, %4;"
+	    "	bdnz	1b;"
+	    "	sync;"
+	    "	mtmsr %5;"
+	    "	isync;"
+	    : "+r" (loop1), "+r" (loop2)
+	    : "r" (nb), "r" (msr), "i" (bytes), "r" (msr0)
+	    : "ctr", "memory");
+}
+#endif
+
 void flush_dcache_icache_page(struct page *page)
 {
 #ifdef CONFIG_HUGETLB_PAGE
@@ -419,16 +463,7 @@ void flush_dcache_icache_page(struct page *page)
 		__flush_dcache_icache(start);
 		kunmap_atomic(start);
 	} else {
-		unsigned long msr = mfmsr();
-
-		/* Clear the DR bit so that we operate on physical
-		 * rather than virtual addresses
-		 */
-		mtmsr(msr & ~(MSR_DR));
-
-		__flush_dcache_icache((void *)physaddr);
-
-		mtmsr(msr);
+		__flush_dcache_icache_phys(page_to_pfn(page) << PAGE_SHIFT);
 	}
 #endif
 }
-- 
2.13.3

