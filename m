Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F0A9AC4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 12:00:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46FH2c064FzDqg9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 20:00:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="eZyNYRwp"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46FGy66TJwzDrhK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 19:56:28 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46FGxy0Vp8zB09ZS;
 Fri, 23 Aug 2019 11:56:22 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=eZyNYRwp; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YUt6v_gbV4Wj; Fri, 23 Aug 2019 11:56:22 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46FGxx6Zp7zB09ZC;
 Fri, 23 Aug 2019 11:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566554181; bh=B0WBywasRW5laCP5+OtduhELcOJZgjbVfcLeOQEIejI=;
 h=From:Subject:To:Cc:Date:From;
 b=eZyNYRwpZnyeVpktNH4cOFC8KNu/rWb3CEp2Li0YANIRcMiWUGaAsLZ+J3ZA7htfH
 YZwg9dV16d6iF548HMLorc6v4XvsedBtu/fc5bNJ+2dFud5NluU9hAZqwN4J9PML4f
 Z8OkcVunUR4NjxJQ2IM5avNDxKWZ083SIiOgfY6Q=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 219ED8B874;
 Fri, 23 Aug 2019 11:56:23 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id vWghA6AXK_RC; Fri, 23 Aug 2019 11:56:23 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 07A138B866;
 Fri, 23 Aug 2019 11:56:23 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id F18C56B735; Fri, 23 Aug 2019 09:56:22 +0000 (UTC)
Message-Id: <ad9d45119a48a92bf122781d0c79c9407baa12d7.1566554026.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH] powerpc/8xx: Fix permanently mapped IMMR region.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Fri, 23 Aug 2019 09:56:22 +0000 (UTC)
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

When not using large TLBs, the IMMR region is still
mapped as a whole block in the FIXMAP area.

Do not remove pages mapped in the FIXMAP region when
initialising paging.

Properly report that the IMMR region is block-mapped even
when not using large TLBs.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/mem.c        |  8 --------
 arch/powerpc/mm/nohash/8xx.c | 13 +++++++------
 2 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 69f99128a8d6..8e221d8744ba 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -216,14 +216,6 @@ void __init paging_init(void)
 	unsigned long long total_ram = memblock_phys_mem_size();
 	phys_addr_t top_of_ram = memblock_end_of_DRAM();
 
-#ifdef CONFIG_PPC32
-	unsigned long v = __fix_to_virt(__end_of_fixed_addresses - 1);
-	unsigned long end = __fix_to_virt(FIX_HOLE);
-
-	for (; v < end; v += PAGE_SIZE)
-		map_kernel_page(v, 0, __pgprot(0)); /* XXX gross */
-#endif
-
 #ifdef CONFIG_HIGHMEM
 	map_kernel_page(PKMAP_BASE, 0, __pgprot(0));	/* XXX gross */
 	pkmap_page_table = virt_to_kpte(PKMAP_BASE);
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 4a06cb342da2..e6918235fe04 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -21,33 +21,34 @@ extern int __map_without_ltlbs;
 static unsigned long block_mapped_ram;
 
 /*
- * Return PA for this VA if it is in an area mapped with LTLBs.
+ * Return PA for this VA if it is in an area mapped with LTLBs or fixmap.
  * Otherwise, returns 0
  */
 phys_addr_t v_block_mapped(unsigned long va)
 {
 	unsigned long p = PHYS_IMMR_BASE;
 
-	if (__map_without_ltlbs)
-		return 0;
 	if (va >= VIRT_IMMR_BASE && va < VIRT_IMMR_BASE + IMMR_SIZE)
 		return p + va - VIRT_IMMR_BASE;
+	if (__map_without_ltlbs)
+		return 0;
 	if (va >= PAGE_OFFSET && va < PAGE_OFFSET + block_mapped_ram)
 		return __pa(va);
 	return 0;
 }
 
 /*
- * Return VA for a given PA mapped with LTLBs or 0 if not mapped
+ * Return VA for a given PA mapped with LTLBs or fixmap
+ * Return 0 if not mapped
  */
 unsigned long p_block_mapped(phys_addr_t pa)
 {
 	unsigned long p = PHYS_IMMR_BASE;
 
-	if (__map_without_ltlbs)
-		return 0;
 	if (pa >= p && pa < p + IMMR_SIZE)
 		return VIRT_IMMR_BASE + pa - p;
+	if (__map_without_ltlbs)
+		return 0;
 	if (pa < block_mapped_ram)
 		return (unsigned long)__va(pa);
 	return 0;
-- 
2.13.3

