Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C44933E9A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 07:26:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F0gCF1cKFz3bpW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Mar 2021 17:26:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=acOv1nNH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=acOv1nNH; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F0gBL5F0Jz30Fy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Mar 2021 17:25:14 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id w8so529611pjf.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 23:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6FRU9caWwWjvnrqszVqRsss5Upxnc33B3OfV8qLPoO8=;
 b=acOv1nNHq0DKxAmKf1vBi80AyxUYmYRKTh2Ey93TwUyRdkZCqWMNbWoGWU+5MekJGP
 bkdrfYR8csV+POZ7R2VaahbTBabix8QECkD93CNRXZRKrtJaqACa02+ligl4FVBcRJYf
 RjRL9pmF/JxgFVriXcGsY0lFBXYliNoOMi+qWVw74A0UwwlZXrE3SMGwlLdKOhtGwxyH
 9lj/12FT4SHFaQn2nzfmOjdPxQPBiXUpk87Lrk7+lEBO/a2gWXWdccsTtyOdbLyQHQyx
 BvmaRP5WJYWW86mzlLmFL8NBGAmVMxsp5jpPJPAvUskm1r4Xns9NfRLajx7uwAQSirTg
 9ZpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6FRU9caWwWjvnrqszVqRsss5Upxnc33B3OfV8qLPoO8=;
 b=fO59CYDK1W1aQX4BkIAG5WXRPYQygFj8eFbMp3P/SoU81acOUOtISry30jXNgOTel3
 9muQkokOgMf+3R6SEGjfa8HXfzg/tdg7eWcWFGLQ1deD3gXPN4YCJwEpr5ceNd/Ys143
 /XY+PSHELaDPgr6dO2PAJxRRstUgtG817ZpXOkLkCh9fAGTVlDZC/13D4spC51onAqEl
 gHqu81cf40vnqGwagm3JOynLbkqilZ/rSMfsV/VbCjsO5jPwD8YuxCy3HgTAIpmzEVEF
 aalQV3VmDzcurQOeHx+0LXgaWzEYV+GvWA+w16oiHzvAABa6a3i9r0oLn0tq4vXJiWl5
 60MA==
X-Gm-Message-State: AOAM532WE0ris2CiHEIiVvdBSzBMDyheCBZex7kijhqwJiy+XyXtYvZF
 2jpkcVpV5oH42LAC81PerCvkTNjyKtE=
X-Google-Smtp-Source: ABdhPJwdKgWAmNPrq81aNVKAYJ1WAYd7AWSS4jrdMlA13JJ+pQXBcMpUBMbODVrBwNM0aQs0yHN98w==
X-Received: by 2002:a17:90b:686:: with SMTP id m6mr2855807pjz.26.1615962312311; 
 Tue, 16 Mar 2021 23:25:12 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id
 s19sm17959620pfh.168.2021.03.16.23.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 23:25:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v13 07/14] powerpc: inline huge vmap supported functions
Date: Wed, 17 Mar 2021 16:23:55 +1000
Message-Id: <20210317062402.533919-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210317062402.533919-1-npiggin@gmail.com>
References: <20210317062402.533919-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows unsupported levels to be constant folded away, and so
p4d_free_pud_page can be removed because it's no longer linked to.

Cc: linuxppc-dev@lists.ozlabs.org
Acked-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/vmalloc.h       | 19 ++++++++++++++++---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 21 ---------------------
 2 files changed, 16 insertions(+), 24 deletions(-)

diff --git a/arch/powerpc/include/asm/vmalloc.h b/arch/powerpc/include/asm/vmalloc.h
index 105abb73f075..3f0c153befb0 100644
--- a/arch/powerpc/include/asm/vmalloc.h
+++ b/arch/powerpc/include/asm/vmalloc.h
@@ -1,12 +1,25 @@
 #ifndef _ASM_POWERPC_VMALLOC_H
 #define _ASM_POWERPC_VMALLOC_H
 
+#include <asm/mmu.h>
 #include <asm/page.h>
 
 #ifdef CONFIG_HAVE_ARCH_HUGE_VMAP
-bool arch_vmap_p4d_supported(pgprot_t prot);
-bool arch_vmap_pud_supported(pgprot_t prot);
-bool arch_vmap_pmd_supported(pgprot_t prot);
+static inline bool arch_vmap_p4d_supported(pgprot_t prot)
+{
+	return false;
+}
+
+static inline bool arch_vmap_pud_supported(pgprot_t prot)
+{
+	/* HPT does not cope with large pages in the vmalloc area */
+	return radix_enabled();
+}
+
+static inline bool arch_vmap_pmd_supported(pgprot_t prot)
+{
+	return radix_enabled();
+}
 #endif
 
 #endif /* _ASM_POWERPC_VMALLOC_H */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 743807fc210f..8da62afccee5 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1082,22 +1082,6 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
 	set_pte_at(mm, addr, ptep, pte);
 }
 
-bool arch_vmap_pud_supported(pgprot_t prot)
-{
-	/* HPT does not cope with large pages in the vmalloc area */
-	return radix_enabled();
-}
-
-bool arch_vmap_pmd_supported(pgprot_t prot)
-{
-	return radix_enabled();
-}
-
-int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
-{
-	return 0;
-}
-
 int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 {
 	pte_t *ptep = (pte_t *)pud;
@@ -1181,8 +1165,3 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 
 	return 1;
 }
-
-bool arch_vmap_p4d_supported(pgprot_t prot)
-{
-	return false;
-}
-- 
2.23.0

