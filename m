Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB348D372
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 14:48:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467qBr49w1zDqkK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 22:48:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="sfigohy/"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467pwg2F4QzDqFH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Aug 2019 22:36:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467pwX46Jjz9v0dM;
 Wed, 14 Aug 2019 14:36:12 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=sfigohy/; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Ns4VjSPXU8QY; Wed, 14 Aug 2019 14:36:12 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467pwX302vz9v0dJ;
 Wed, 14 Aug 2019 14:36:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565786172; bh=tZIO4hN5UhqIHA84c5kHAJ+5u0attVl897iQhB7+51s=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=sfigohy/jUX16dbPav1SIlP8pYVpU7zUSM9YbV/0RMp4wds9r1qXJCBTO6NuS+9/m
 HoOC325fZabH72Sz/OdlFEWHIySXjvcndVCXq3SNHnDEhxBEI3bVPXfAHo/jEGUzOb
 7qVbRqdt97LD2RZf4l+wIAQen6AFi6kgpHODLQqI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E3E598B7F5;
 Wed, 14 Aug 2019 14:36:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GN1p7v0uNpUd; Wed, 14 Aug 2019 14:36:13 +0200 (CEST)
Received: from pc17473vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C17B78B761;
 Wed, 14 Aug 2019 14:36:13 +0200 (CEST)
Received: by pc17473vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id B02EB6B6C0; Wed, 14 Aug 2019 12:36:13 +0000 (UTC)
Message-Id: <c8998ed32e4e3954b56a8dacecfe43319a2a0483.1565786091.git.christophe.leroy@c-s.fr>
In-Reply-To: <eb4d626514e22f85814830012642329018ef6af9.1565786091.git.christophe.leroy@c-s.fr>
References: <eb4d626514e22f85814830012642329018ef6af9.1565786091.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH 5/5] powerpc/ptdump: drop non vital #ifdefs
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 14 Aug 2019 12:36:13 +0000 (UTC)
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

hashpagetable.c is only compiled when CONFIG_PPC_BOOK3S_64 is
defined, so drop the test and its 'else' branch.

Use IS_ENABLED(CONFIG_PPC_PSERIES) instead of #ifdef, this allows the
code to be checked at any build. It is still optimised out by GCC.

Use IS_ENABLED(CONFIG_PPC_64K_PAGES) instead of #ifdef.

Use IS_ENABLED(CONFIG_SPARSEMEN_VMEMMAP) instead of #ifdef.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/plpar_wrappers.h |  6 ++++++
 arch/powerpc/mm/ptdump/hashpagetable.c    | 24 +++++++++---------------
 2 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/include/asm/plpar_wrappers.h b/arch/powerpc/include/asm/plpar_wrappers.h
index cff5a411e595..4497c8afb573 100644
--- a/arch/powerpc/include/asm/plpar_wrappers.h
+++ b/arch/powerpc/include/asm/plpar_wrappers.h
@@ -340,6 +340,12 @@ static inline long plpar_set_ciabr(unsigned long ciabr)
 {
 	return 0;
 }
+
+static inline long plpar_pte_read_4(unsigned long flags, unsigned long ptex,
+				    unsigned long *ptes)
+{
+	return 0;
+}
 #endif /* CONFIG_PPC_PSERIES */
 
 #endif /* _ASM_POWERPC_PLPAR_WRAPPERS_H */
diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index 72f0e4a3d839..a07278027c6f 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -237,7 +237,6 @@ static int native_find(unsigned long ea, int psize, bool primary, u64 *v, u64
 	return -1;
 }
 
-#ifdef CONFIG_PPC_PSERIES
 static int pseries_find(unsigned long ea, int psize, bool primary, u64 *v, u64 *r)
 {
 	struct hash_pte ptes[4];
@@ -274,7 +273,6 @@ static int pseries_find(unsigned long ea, int psize, bool primary, u64 *v, u64 *
 	}
 	return -1;
 }
-#endif
 
 static void decode_r(int bps, unsigned long r, unsigned long *rpn, int *aps,
 		unsigned long *lp_bits)
@@ -316,10 +314,9 @@ static void decode_r(int bps, unsigned long r, unsigned long *rpn, int *aps,
 static int base_hpte_find(unsigned long ea, int psize, bool primary, u64 *v,
 			  u64 *r)
 {
-#ifdef CONFIG_PPC_PSERIES
-	if (firmware_has_feature(FW_FEATURE_LPAR))
+	if (IS_ENABLED(CONFIG_PPC_PSERIES) && firmware_has_feature(FW_FEATURE_LPAR))
 		return pseries_find(ea, psize, primary, v, r);
-#endif
+
 	return native_find(ea, psize, primary, v, r);
 }
 
@@ -386,12 +383,13 @@ static void walk_pte(struct pg_state *st, pmd_t *pmd, unsigned long start)
 			psize = mmu_vmalloc_psize;
 		else
 			psize = mmu_io_psize;
-#ifdef CONFIG_PPC_64K_PAGES
+
 		/* check for secret 4K mappings */
-		if (((pteval & H_PAGE_COMBO) == H_PAGE_COMBO) ||
-			((pteval & H_PAGE_4K_PFN) == H_PAGE_4K_PFN))
+		if (IS_ENABLED(CONFIG_PPC_64K_PAGES) &&
+		    ((pteval & H_PAGE_COMBO) == H_PAGE_COMBO ||
+		     (pteval & H_PAGE_4K_PFN) == H_PAGE_4K_PFN))
 			psize = mmu_io_psize;
-#endif
+
 		/* check for hashpte */
 		status = hpte_find(st, addr, psize);
 
@@ -469,9 +467,10 @@ static void walk_linearmapping(struct pg_state *st)
 
 static void walk_vmemmap(struct pg_state *st)
 {
-#ifdef CONFIG_SPARSEMEM_VMEMMAP
 	struct vmemmap_backing *ptr = vmemmap_list;
 
+	if (!IS_ENABLED(CONFIG_SPARSEMEM_VMEMMAP))
+		return;
 	/*
 	 * Traverse the vmemmaped memory and dump pages that are in the hash
 	 * pagetable.
@@ -481,7 +480,6 @@ static void walk_vmemmap(struct pg_state *st)
 		ptr = ptr->list;
 	}
 	seq_puts(st->seq, "---[ vmemmap end ]---\n");
-#endif
 }
 
 static void populate_markers(void)
@@ -495,11 +493,7 @@ static void populate_markers(void)
 	address_markers[6].start_address = PHB_IO_END;
 	address_markers[7].start_address = IOREMAP_BASE;
 	address_markers[8].start_address = IOREMAP_END;
-#ifdef CONFIG_PPC_BOOK3S_64
 	address_markers[9].start_address =  H_VMEMMAP_START;
-#else
-	address_markers[9].start_address =  VMEMMAP_BASE;
-#endif
 }
 
 static int ptdump_show(struct seq_file *m, void *v)
-- 
2.13.3

