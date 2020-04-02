Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC1919BE3A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 10:56:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tH3Y51ZdzDqJY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Apr 2020 19:56:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=russell.cc (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=ruscur@russell.cc;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=russell.cc
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256
 header.s=fm1 header.b=EZgS2pqa; 
 dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm2 header.b=IZYJExNp; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tGkl6L0mzDrP6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Apr 2020 19:41:35 +1100 (AEDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id D60295C01A3;
 Thu,  2 Apr 2020 04:41:33 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 02 Apr 2020 04:41:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=
 from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding; s=fm1; bh=7R7IdzkGiZmeG
 W2gS6NLH9ZT+BLkV5BQs8Fc1hM3RU0=; b=EZgS2pqa/mJCj7AH0QptTQNP1vjJU
 BPsKmSpMxyjYSbNQQOU9Fnf2kSNGsNpZz7NWFU0kCv8nY+WV73gFWFADd0ZQBlSe
 R6cSw8AgMi9jyDVcl2+pyvC51fbWT438eiiQ87e4qstEINLK4tYWPDaPPrpGcKP5
 2NuGdkyxxegCKATTv85lWKIBxKgfXZkOMMkdCLp8+lK7Uyc/yOF9oIFWYfl+kuWc
 5naBIDvDM5rKOMrPy6VZa4KXJAEjdAqkh9mdoxxpgUW8o2tRh3zfMd8eGErknNdM
 gLPqF81vaa/ufXzAetXjzE2WgFnQDmZi3G1wNdiXGgdJFupzTsLlt45/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:date:from
 :in-reply-to:message-id:mime-version:references:subject:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; bh=7R7IdzkGiZmeGW2gS6NLH9ZT+BLkV5BQs8Fc1hM3RU0=; b=IZYJExNp
 ao1Y02uLOUwQocDzL3D+6bOTaB1ewhFKKD6CzHxDBMxxMHoeDuq9Yx5LDxaJrk8E
 uoNWZCiItRADNUV6e9YmOs+qoPvzed/emDiu2/xoHnVn3IBqN3FoezzXL2EmcrKB
 EBs6KhPR0dvq9lps5Oe5C2EIRoXcYqxye9mfu7pUTLFOvXnKRsOw716fjfsaPWNM
 jQEhcd7yCLjX702LBPzTZ0jCUbgNl1uK5d2tMUGPQCwR4bODx8r3QdQWZICKWzDx
 shFgDKHCycVoDisHdvLO/76D8B8qfcCI0z7m1dQi607MgTGQfuhJg/FzGx58ze8e
 +mT/D7MJufM2EQ==
X-ME-Sender: <xms:PaWFXizHDJMWSYIADkB7bg6laJ3KfQsGM8Pe-zwTE2njjNiKw7LEDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrtdeggddtgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
 hrlhcuvffnffculdduhedmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddt
 necuhfhrohhmpeftuhhsshgvlhhlucevuhhrrhgvhicuoehruhhstghurhesrhhushhsvg
 hllhdrtggtqeenucfkphepuddvuddrgeehrddvuddvrddvfeelnecuvehluhhsthgvrhfu
 ihiivgepgeenucfrrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlh
 hlrdgttg
X-ME-Proxy: <xmx:PaWFXr0xNscCeyt_6XMtlOSB6o0xnB7Tz71OZqyh9rxg2kpdYSQc2w>
 <xmx:PaWFXqxprtEbMSpNUjy9xoYZRUKLEwPr4YMfp3Ga6MWDchPaqjJ4ig>
 <xmx:PaWFXqFaeNQbLBLr4YGOknES9wOMjIkPkImvhJvgqGyBoqsA_3o2Og>
 <xmx:PaWFXp0sBvkK3Ok1iyzURxiGWLnaItiKj3MOSvRVqbsDfzOunex7pg>
Received: from crackle.ozlabs.ibm.com.com
 (ppp121-45-212-239.bras1.cbr2.internode.on.net [121.45.212.239])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0D6A33280063;
 Thu,  2 Apr 2020 04:41:30 -0400 (EDT)
From: Russell Currey <ruscur@russell.cc>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v8 7/7] powerpc/32: use set_memory_attr()
Date: Thu,  2 Apr 2020 19:40:52 +1100
Message-Id: <20200402084053.188537-7-ruscur@russell.cc>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200402084053.188537-1-ruscur@russell.cc>
References: <20200402084053.188537-1-ruscur@russell.cc>
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
 Russell Currey <ruscur@russell.cc>, dja@axtens.net
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
[ruscur: rebase on powerpc/merge with Christophe's new patches]
Signed-off-by: Russell Currey <ruscur@russell.cc>
---
v8: Rebase on powerpc/merge

 arch/powerpc/mm/pgtable_32.c | 60 ++++++------------------------------
 1 file changed, 10 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index f62de06e3d07..0d9d164fad26 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -23,6 +23,7 @@
 #include <linux/highmem.h>
 #include <linux/memblock.h>
 #include <linux/slab.h>
+#include <linux/set_memory.h>
 
 #include <asm/pgtable.h>
 #include <asm/pgalloc.h>
@@ -121,64 +122,20 @@ void __init mapin_ram(void)
 	}
 }
 
-static int __change_page_attr_noflush(struct page *page, pgprot_t prot)
-{
-	pte_t *kpte;
-	unsigned long address;
-
-	BUG_ON(PageHighMem(page));
-	address = (unsigned long)page_address(page);
-
-	if (v_block_mapped(address))
-		return 0;
-	kpte = virt_to_kpte(address);
-	if (!kpte)
-		return -EINVAL;
-	__set_pte_at(&init_mm, address, kpte, mk_pte(page, prot), 0);
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
@@ -187,20 +144,18 @@ void mark_rodata_ro(void)
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
@@ -210,9 +165,14 @@ void mark_rodata_ro(void)
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
2.26.0

