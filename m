Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13975374DAA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 04:42:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FbHtb0BjQz3cbC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 12:42:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=I/P9mNWY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I/P9mNWY; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FbHpT6NNwz3023
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 12:39:13 +1000 (AEST)
Received: by mail-pf1-x435.google.com with SMTP id i190so3974182pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 19:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=s0CtcMDYsFJeK2HIudgA+Uky01mskMES4MW4Sd7s+yo=;
 b=I/P9mNWYeeyQviJMk8l7PaXp5/uesQIzgB1WRKNhW2GYhEEI5G5R+G57s3xkHgXTtt
 30fSM0m8Ex67sRtJKSIk0iqdJ38A9MzL2neEkHd5p9AYsNc94QPWID75sN3nZhH7ou8F
 O5mhX0+QFF5ius2mKrgjONP9Q+61mXvjfJ4B74jMLNr05b2/9XYNgD6oz1FfvmboSc4g
 DUKz2GqTkTAbJp/fVbk6siH/kyDhg9x6qsd2wHopu++2CLV5cwXTVE61uycoPBpN8BYs
 Ldjy0lM2wKIez8n2NT5JDk/BpVbKxwYh7cCvr2JK9sIviF8u22sO6CyYoBYEe137bmpj
 WF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=s0CtcMDYsFJeK2HIudgA+Uky01mskMES4MW4Sd7s+yo=;
 b=lB4D0Z59FThj5Wu9a3zGjtyij7rMaUAM7Vs9yvxp8X7S+O9wkLOQI+PXDsQg4kVixZ
 f4gBY/O+Na+QKSYJr6LCOxLviVXA0XgfYbsrsykESKckV6435Dox5qPthH2OiOfRY9sr
 30bwQyfvN1rpzZaAl6IQI9c09NoS8NOwvG+jzN7AxuyDPISlGfYIgVGhOK8efOlAJRwV
 XIFHkwQgo7EeYc2NSUmmTS6DtE1v+Xs4K5ERRQRr4oe4N6bUiEK9UxmLNYkuaL9IgXjQ
 6BZWUX3IKgXrS2oJv5nkgpX8K5IHcIZOLM1XV5aUdBCzEfmGaAjT/pee4T9WqYSbrHS8
 13IA==
X-Gm-Message-State: AOAM531ilK0adpHTvoy+9fFvlhT+B0nfYy2E6DiJQXUpBN6N5DzfPKiH
 6/b0NK4PedOxcPsf8mVUvJhwqp+lV2c=
X-Google-Smtp-Source: ABdhPJygoQ/dcRm4aGNYkk1hFjE1Zh5HkC0lFSqmhgqQZIZd4SflpWzISXEFC73T9+4nxc1J3kdCXA==
X-Received: by 2002:a62:28b:0:b029:28e:e592:fe65 with SMTP id
 133-20020a62028b0000b029028ee592fe65mr1984304pfc.75.1620268750592; 
 Wed, 05 May 2021 19:39:10 -0700 (PDT)
Received: from tee480.ozlabs.ibm.com
 (159-196-117-139.9fc475.syd.nbn.aussiebb.net. [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id k12sm454490pgh.16.2021.05.05.19.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 19:39:10 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v12 8/8] powerpc/32: use set_memory_attr()
Date: Thu,  6 May 2021 12:34:49 +1000
Message-Id: <20210506023449.3568630-9-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210506023449.3568630-1-jniethe5@gmail.com>
References: <20210506023449.3568630-1-jniethe5@gmail.com>
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
 aneesh.kumar@linux.ibm.com, naveen.n.rao@linux.ibm.com,
 Jordan Niethe <jniethe5@gmail.com>, dja@axtens.net
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

