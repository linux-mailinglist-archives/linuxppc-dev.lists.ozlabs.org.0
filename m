Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8809834E069
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 06:56:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8cc327W2z3dY5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:56:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=GTvdznxY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GTvdznxY; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8cWP06vLz3bc3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 15:52:33 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id o2so5510905plg.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 21:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s0CtcMDYsFJeK2HIudgA+Uky01mskMES4MW4Sd7s+yo=;
 b=GTvdznxYbbPpPfQMjPQ4j6lNUbYyRxCYQnVhznkkUdRmIKALLl+gl487MBott/mN7k
 OJdhrevNGAK8e5Po/Glm45oKO73pgKH4okWISIyBDHG9IXYVxvaDUfnF+ycHzHJ5hqz+
 vmfVyVkG9yGRnAdGswKBzo0mEBuAJs8mIMqfxredKgJ6xI7hFdU1FZi4EfWr4d12rnZ5
 6LPT4wMKZeBr1FH2WmAkTFc6JpwGAcstB4O1nqYhMyWNov+Ukz/fWFwVFhcu/o2ucsRo
 WX66ILKv6xkN8y9YXn4A9vlxjgA0+yOEVcHknz4obqXzAJq4Yh7exO27bXv/EW22PcQ8
 qY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s0CtcMDYsFJeK2HIudgA+Uky01mskMES4MW4Sd7s+yo=;
 b=ffZB/lOIFwJMoQmhjFItA9v3frBnUgUU388ghtEnMUJdOZPslCb0JvMvgwun0ob7XO
 0CUYnCcR3SWEeuzxgquMXOU5pKwnIdEPFBoTbFZ4otXt9PatKj1iJOLPG+gk/CFabT8c
 LHqfiRBQEZFmmA0oadsCmA7O5VXSlAPxxICOSTbB39r3/KjbhH9nzJykA6mJmn2azZTf
 DVhOK0TSkiKZz4BUnDBQmseFvcDoFNGYaMz/H0H/9D+j6M+FqygddFwFNrt+2QhOmEM0
 SWN4rkssCLqJfs4dJZm8YbivBecoNtyWoH9nmNHpd+nqlk8POObhDyEHn+wyLU9mpaKv
 w9EQ==
X-Gm-Message-State: AOAM530ouuiva8yGRrO1Oxu8HRUY2IwQ9D82Y/2C2u4cdQ4p4v9umaVc
 W0rsH85VyemAPeT45rEKhPhZEt3Lok52SJ/O
X-Google-Smtp-Source: ABdhPJz0YoRj7pDY1jFCSAywKFQmVj2xhNJ7njyP4jfuQbJ8QNOoYbcjq6lFV6SuyqgALdL2Q569rw==
X-Received: by 2002:a17:90a:8c08:: with SMTP id
 a8mr2549968pjo.136.1617079951218; 
 Mon, 29 Mar 2021 21:52:31 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id a18sm14136574pfa.18.2021.03.29.21.52.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 21:52:30 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 10/10] powerpc/32: use set_memory_attr()
Date: Tue, 30 Mar 2021 15:51:32 +1100
Message-Id: <20210330045132.722243-11-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210330045132.722243-1-jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
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
Cc: ajd@linux.ibm.com, cmr@codefail.de, npiggin@gmail.com,
 naveen.n.rao@linux.ibm.com, Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Use set_memory_attr() instead of the PPC32 specific change_page_attr()

change_page_attr() was checking that the address was not mapped by
blocks and was handling highmem, but that's unneeded because the
affected pages can't be in highmem and block mapping verification
is already done by the callers.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
[ruscur: rebase on powerpc/merge with Christophe's new patches]
Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/mm/pgtable_32.c | 60 ++++++------------------------------
 1 file changed, 10 insertions(+), 50 deletions(-)

diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index e0ec67a16887..dcf5ecca19d9 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -23,6 +23,7 @@
 #include <linux/highmem.h>
 #include <linux/memblock.h>
 #include <linux/slab.h>
+#include <linux/set_memory.h>
 
 #include <asm/pgalloc.h>
 #include <asm/fixmap.h>
@@ -132,64 +133,20 @@ void __init mapin_ram(void)
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
 
 	if (v_block_mapped((unsigned long)_sinittext))
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
 
 	if (v_block_mapped((unsigned long)_stext + 1)) {
@@ -198,20 +155,18 @@ void mark_rodata_ro(void)
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
@@ -221,9 +176,14 @@ void mark_rodata_ro(void)
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

