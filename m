Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E7117EDE9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 02:17:45 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48bxz56xfNzDr1P
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Mar 2020 12:17:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.29;
 helo=out5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=sNFdzB4/; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=svmpc/DD; 
 dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48bxgw0W5qzDqRj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2020 12:04:28 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 184E8221B2;
 Mon,  9 Mar 2020 21:04:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 09 Mar 2020 21:04:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=nQz/eopHyv6q5
 rSvIql6tVPdKhyrOQXmquL2XzUOAb4=; b=sNFdzB4/TWYjO2WUtt5ccPXxyBw0S
 hJduypRtA4IwqdFtP+vV2wDuHE/IxoHoGPg86SVYut0c1OUUH+mBnTsOztDr6fO6
 YsQDp7MHTZDFBXgEfBrBeRzpPHyFae7MtQQDjm5gCZnRAfbFa9AcrdHZv69pS/ue
 v9OIXt+v1qEGNKc15EmjkieHdjJBB8NQJZHsVB5HbEr/oH572G5hWM+dipg+eYJk
 X6pAUGpc4DqSBU6nDaNgNYI4rPjU33vVXBy4kUMDzjJL7y8BAZVCfhrIolJT4+fO
 jTUmWX5jSktcXf6z9r+F5f/8Ernhsv0+SdgNrgdmA63xC6FTDlW57nqAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=nQz/eopHyv6q5rSvIql6tVPdKhyrOQXmquL2XzUOAb4=; b=svmpc/DD
 UGekvmGo8zwcC5NmVV2HsfVSIdtW062Rft7HZnnzKiin4PdOd0/7JgP6mVZAk3po
 eDAgYILzHe5rSU2yoIROudy9X90TzjYt0P2puqtp+fg4BQEq7pG6hFizm+qE5pd6
 v+K5Y2CdcFrio5LeXMLtGtVc8sGK901lvxyP4N2cq0nrvQJGSJew/fghqrfU0apN
 0rHvxwQExx/0tZvA+iNP/LyDkK0AuLhO7Mmr+xuP32eUO5+Kr6IwiweoCHhS/FQD
 UoDyaYhVl4srgUC94MhfdbX1P7bmcX4TFLkqxiZ139b+PwEK07Em/TIWYShi5dc/
 UKvIZGnUblccVw==
X-ME-Sender: <xms:mOdmXidb9enyq25vm1-YLkerWoni0JWCMkqC8cc-YwYz_sMC2tMb0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudduledgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 gfrhhlucfvnfffucdludehmdenucfjughrpefhvffufffkofgjfhgggfestdekredtredt
 tdenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruhhssh
 gvlhhlrdgttgeqnecukfhppeduvddvrdelledrkedvrddutdenucevlhhushhtvghrufhi
 iigvpeehnecurfgrrhgrmhepmhgrihhlfhhrohhmpehruhhstghurhesrhhushhsvghllh
 drtggt
X-ME-Proxy: <xmx:mOdmXi_EsKT-3lc64cTd3FUVtZXTKAWWFNLUILbICAubvWjabMzpyA>
 <xmx:mOdmXrq2i3IDQqa_TVFT0nX_S0dksUUYuSUn8NMAd55wKkaZcgnFGA>
 <xmx:mOdmXgwPnHGhCvDoCj9dnj8GywMXHxQbYDtx9rgqsN7nhNP-r3fjMw>
 <xmx:medmXgNG5YAkt0sMaHxnJyAOE1_UvGGCocvc7sRss0wiS34k88szAA>
Received: from crackle.ozlabs.ibm.com (unknown [122.99.82.10])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8B83B3280063;
 Mon,  9 Mar 2020 21:04:22 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 7/7] powerpc/32: use set_memory_attr()
Date: Tue, 10 Mar 2020 12:03:38 +1100
Message-Id: <20200310010338.21205-8-ruscur@russell.cc>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200310010338.21205-1-ruscur@russell.cc>
References: <20200310010338.21205-1-ruscur@russell.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@c-s.fr>

Use set_memory_attr() instead of the PPC32 specific change_page_attr()

change_page_attr() was checking that the address was not mapped by
blocks and was handling highmem, but that's unneeded because the
affected pages can't be in highmem and block mapping verification
is already done by the callers.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/mm/pgtable_32.c | 95 ++++--------------------------------
 1 file changed, 10 insertions(+), 85 deletions(-)

diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index 5fb90edd865e..3d92eaf3ee2f 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -23,6 +23,7 @@
 #include <linux/highmem.h>
 #include <linux/memblock.h>
 #include <linux/slab.h>
+#include <linux/set_memory.h>
 
 #include <asm/pgtable.h>
 #include <asm/pgalloc.h>
@@ -121,99 +122,20 @@ void __init mapin_ram(void)
 	}
 }
 
-/* Scan the real Linux page tables and return a PTE pointer for
- * a virtual address in a context.
- * Returns true (1) if PTE was found, zero otherwise.  The pointer to
- * the PTE pointer is unmodified if PTE is not found.
- */
-static int
-get_pteptr(struct mm_struct *mm, unsigned long addr, pte_t **ptep, pmd_t **pmdp)
-{
-        pgd_t	*pgd;
-	pud_t	*pud;
-        pmd_t	*pmd;
-        pte_t	*pte;
-        int     retval = 0;
-
-        pgd = pgd_offset(mm, addr & PAGE_MASK);
-        if (pgd) {
-		pud = pud_offset(pgd, addr & PAGE_MASK);
-		if (pud && pud_present(*pud)) {
-			pmd = pmd_offset(pud, addr & PAGE_MASK);
-			if (pmd_present(*pmd)) {
-				pte = pte_offset_map(pmd, addr & PAGE_MASK);
-				if (pte) {
-					retval = 1;
-					*ptep = pte;
-					if (pmdp)
-						*pmdp = pmd;
-					/* XXX caller needs to do pte_unmap, yuck */
-				}
-			}
-		}
-        }
-        return(retval);
-}
-
-static int __change_page_attr_noflush(struct page *page, pgprot_t prot)
-{
-	pte_t *kpte;
-	pmd_t *kpmd;
-	unsigned long address;
-
-	BUG_ON(PageHighMem(page));
-	address = (unsigned long)page_address(page);
-
-	if (v_block_mapped(address))
-		return 0;
-	if (!get_pteptr(&init_mm, address, &kpte, &kpmd))
-		return -EINVAL;
-	__set_pte_at(&init_mm, address, kpte, mk_pte(page, prot), 0);
-	pte_unmap(kpte);
-
-	return 0;
-}
-
-/*
- * Change the page attributes of an page in the linear mapping.
- *
- * THIS DOES NOTHING WITH BAT MAPPINGS, DEBUG USE ONLY
- */
-static int change_page_attr(struct page *page, int numpages, pgprot_t prot)
-{
-	int i, err = 0;
-	unsigned long flags;
-	struct page *start = page;
-
-	local_irq_save(flags);
-	for (i = 0; i < numpages; i++, page++) {
-		err = __change_page_attr_noflush(page, prot);
-		if (err)
-			break;
-	}
-	wmb();
-	local_irq_restore(flags);
-	flush_tlb_kernel_range((unsigned long)page_address(start),
-			       (unsigned long)page_address(page));
-	return err;
-}
-
 void mark_initmem_nx(void)
 {
-	struct page *page = virt_to_page(_sinittext);
 	unsigned long numpages = PFN_UP((unsigned long)_einittext) -
 				 PFN_DOWN((unsigned long)_sinittext);
 
 	if (v_block_mapped((unsigned long)_stext + 1))
 		mmu_mark_initmem_nx();
 	else
-		change_page_attr(page, numpages, PAGE_KERNEL);
+		set_memory_attr((unsigned long)_sinittext, numpages, PAGE_KERNEL);
 }
 
 #ifdef CONFIG_STRICT_KERNEL_RWX
 void mark_rodata_ro(void)
 {
-	struct page *page;
 	unsigned long numpages;
 
 	if (v_block_mapped((unsigned long)_sinittext)) {
@@ -222,20 +144,18 @@ void mark_rodata_ro(void)
 		return;
 	}
 
-	page = virt_to_page(_stext);
 	numpages = PFN_UP((unsigned long)_etext) -
 		   PFN_DOWN((unsigned long)_stext);
 
-	change_page_attr(page, numpages, PAGE_KERNEL_ROX);
+	set_memory_attr((unsigned long)_stext, numpages, PAGE_KERNEL_ROX);
 	/*
 	 * mark .rodata as read only. Use __init_begin rather than __end_rodata
 	 * to cover NOTES and EXCEPTION_TABLE.
 	 */
-	page = virt_to_page(__start_rodata);
 	numpages = PFN_UP((unsigned long)__init_begin) -
 		   PFN_DOWN((unsigned long)__start_rodata);
 
-	change_page_attr(page, numpages, PAGE_KERNEL_RO);
+	set_memory_attr((unsigned long)__start_rodata, numpages, PAGE_KERNEL_RO);
 
 	// mark_initmem_nx() should have already run by now
 	ptdump_check_wx();
@@ -245,9 +165,14 @@ void mark_rodata_ro(void)
 #ifdef CONFIG_DEBUG_PAGEALLOC
 void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
+	unsigned long addr = (unsigned long)page_address(page);
+
 	if (PageHighMem(page))
 		return;
 
-	change_page_attr(page, numpages, enable ? PAGE_KERNEL : __pgprot(0));
+	if (enable)
+		set_memory_attr(addr, numpages, PAGE_KERNEL);
+	else
+		set_memory_attr(addr, numpages, __pgprot(0));
 }
 #endif /* CONFIG_DEBUG_PAGEALLOC */
-- 
2.25.1

