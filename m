Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 507A62400EE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 04:37:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ0VD34ThzDqQt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 12:37:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tZiIwaB8; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ0Hv1sgZzDqQH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 12:28:11 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id w17so4025930ply.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Aug 2020 19:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zgciMtrhUFyjwGUVG4/y+NlOfAX4ULiG8JBMTv5iRYk=;
 b=tZiIwaB8BveXvJ0qK+agLn8o7f/k9ONmRsftQ1bZ63EC63Z/XEH5pTtw77UfAZPd9n
 kxiiuHHhcrAVfr9Fl2k8sXr2I6N/989l3wwxLvH0bkId7wwtO4GjZcU9QK+YoEmJnu10
 4ZbdSBy9Hml4gG7G+zLD4mgSI1lhMem2Nkla3FSN9oks/WzhKSP4xooacEQDGg72msep
 FbEdQznPWaUSu1WfjTzRbx/VXQcnK6XiCCcZxbGkSa1LcTXHYeVlsSkhs8W+5fYRiL7s
 MM2Bsd/g/A2yHig91GGvSj0CpLqSVy51uhfQFGwWKUEMjTxdVQHl5uHqgOyVmTTt67qN
 tW8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zgciMtrhUFyjwGUVG4/y+NlOfAX4ULiG8JBMTv5iRYk=;
 b=Sn69UArcimySFvMAT8NEbnkuP9/Ogb9LrQReHvU3btR1ph4n82McFuymZ6FCHNtkyw
 LsJanOpWKTOpdcoXSspjcp+2yxlvrtyJS/H9TRpVqG3ABrAzEWnDxiDIegk/DmIyDIKq
 uKwCjOT4/JSQt2WqdPHeQP0n8YCPGYJGmH3x2j7xqeyyyAFhbsCW6bfa7O5WTgGjtKND
 85k49fni1JrufrJQFhgS9gqUr0tnTrcq1gKKv3baqKmWV1JridWuPvzGp21BXQCK8LLd
 qo27QCBZPfm77gE3jyySfojnykr3uy4EP92ykAXwPIymmMw5dUlfRDXZA2p2wSbFbIaD
 rsWg==
X-Gm-Message-State: AOAM530E/1uCt6CCY6mvCftE2G1eegYm57sXreKd26FtDuHE3MdB7CIS
 xqnncwvO3QN8J/rEC7wyrow=
X-Google-Smtp-Source: ABdhPJzbhgo47H7fSvYqc7Khnd7jyS/4Sw4Oefgk6E1CVciPFOLuQaOPH7ht6fIVkgxh5qrmVHA1dA==
X-Received: by 2002:a17:902:6b43:: with SMTP id
 g3mr20835887plt.319.1597026488157; 
 Sun, 09 Aug 2020 19:28:08 -0700 (PDT)
Received: from bobo.ibm.com (193-116-100-32.tpgi.com.au. [193.116.100.32])
 by smtp.gmail.com with ESMTPSA id l17sm21863475pff.126.2020.08.09.19.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 19:28:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH v3 4/8] lib/ioremap: rename ioremap_*_range to vmap_*_range
Date: Mon, 10 Aug 2020 12:27:28 +1000
Message-Id: <20200810022732.1150009-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200810022732.1150009-1-npiggin@gmail.com>
References: <20200810022732.1150009-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Zefan Li <lizefan@huawei.com>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This will be moved to mm/ and used as a generic kernel virtual mapping
function, so re-name it in preparation.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 mm/ioremap.c | 55 ++++++++++++++++++++++------------------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/mm/ioremap.c b/mm/ioremap.c
index 5fa1ab41d152..6016ae3227ad 100644
--- a/mm/ioremap.c
+++ b/mm/ioremap.c
@@ -61,9 +61,8 @@ static inline int ioremap_pud_enabled(void) { return 0; }
 static inline int ioremap_pmd_enabled(void) { return 0; }
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
-static int ioremap_pte_range(pmd_t *pmd, unsigned long addr,
-		unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
-		pgtbl_mod_mask *mask)
+static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot, pgtbl_mod_mask *mask)
 {
 	pte_t *pte;
 	u64 pfn;
@@ -81,9 +80,8 @@ static int ioremap_pte_range(pmd_t *pmd, unsigned long addr,
 	return 0;
 }
 
-static int ioremap_try_huge_pmd(pmd_t *pmd, unsigned long addr,
-				unsigned long end, phys_addr_t phys_addr,
-				pgprot_t prot)
+static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot)
 {
 	if (!ioremap_pmd_enabled())
 		return 0;
@@ -103,9 +101,8 @@ static int ioremap_try_huge_pmd(pmd_t *pmd, unsigned long addr,
 	return pmd_set_huge(pmd, phys_addr, prot);
 }
 
-static inline int ioremap_pmd_range(pud_t *pud, unsigned long addr,
-		unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
-		pgtbl_mod_mask *mask)
+static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot, pgtbl_mod_mask *mask)
 {
 	pmd_t *pmd;
 	unsigned long next;
@@ -116,20 +113,19 @@ static inline int ioremap_pmd_range(pud_t *pud, unsigned long addr,
 	do {
 		next = pmd_addr_end(addr, end);
 
-		if (ioremap_try_huge_pmd(pmd, addr, next, phys_addr, prot)) {
+		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot)) {
 			*mask |= PGTBL_PMD_MODIFIED;
 			continue;
 		}
 
-		if (ioremap_pte_range(pmd, addr, next, phys_addr, prot, mask))
+		if (vmap_pte_range(pmd, addr, next, phys_addr, prot, mask))
 			return -ENOMEM;
 	} while (pmd++, phys_addr += (next - addr), addr = next, addr != end);
 	return 0;
 }
 
-static int ioremap_try_huge_pud(pud_t *pud, unsigned long addr,
-				unsigned long end, phys_addr_t phys_addr,
-				pgprot_t prot)
+static int vmap_try_huge_pud(pud_t *pud, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot)
 {
 	if (!ioremap_pud_enabled())
 		return 0;
@@ -149,9 +145,8 @@ static int ioremap_try_huge_pud(pud_t *pud, unsigned long addr,
 	return pud_set_huge(pud, phys_addr, prot);
 }
 
-static inline int ioremap_pud_range(p4d_t *p4d, unsigned long addr,
-		unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
-		pgtbl_mod_mask *mask)
+static int vmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot, pgtbl_mod_mask *mask)
 {
 	pud_t *pud;
 	unsigned long next;
@@ -162,20 +157,19 @@ static inline int ioremap_pud_range(p4d_t *p4d, unsigned long addr,
 	do {
 		next = pud_addr_end(addr, end);
 
-		if (ioremap_try_huge_pud(pud, addr, next, phys_addr, prot)) {
+		if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot)) {
 			*mask |= PGTBL_PUD_MODIFIED;
 			continue;
 		}
 
-		if (ioremap_pmd_range(pud, addr, next, phys_addr, prot, mask))
+		if (vmap_pmd_range(pud, addr, next, phys_addr, prot, mask))
 			return -ENOMEM;
 	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
 	return 0;
 }
 
-static int ioremap_try_huge_p4d(p4d_t *p4d, unsigned long addr,
-				unsigned long end, phys_addr_t phys_addr,
-				pgprot_t prot)
+static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot)
 {
 	if (!ioremap_p4d_enabled())
 		return 0;
@@ -195,9 +189,8 @@ static int ioremap_try_huge_p4d(p4d_t *p4d, unsigned long addr,
 	return p4d_set_huge(p4d, phys_addr, prot);
 }
 
-static inline int ioremap_p4d_range(pgd_t *pgd, unsigned long addr,
-		unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
-		pgtbl_mod_mask *mask)
+static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot, pgtbl_mod_mask *mask)
 {
 	p4d_t *p4d;
 	unsigned long next;
@@ -208,19 +201,18 @@ static inline int ioremap_p4d_range(pgd_t *pgd, unsigned long addr,
 	do {
 		next = p4d_addr_end(addr, end);
 
-		if (ioremap_try_huge_p4d(p4d, addr, next, phys_addr, prot)) {
+		if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot)) {
 			*mask |= PGTBL_P4D_MODIFIED;
 			continue;
 		}
 
-		if (ioremap_pud_range(p4d, addr, next, phys_addr, prot, mask))
+		if (vmap_pud_range(p4d, addr, next, phys_addr, prot, mask))
 			return -ENOMEM;
 	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
 	return 0;
 }
 
-int ioremap_page_range(unsigned long addr,
-		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
+int ioremap_page_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
 {
 	pgd_t *pgd;
 	unsigned long start;
@@ -235,8 +227,7 @@ int ioremap_page_range(unsigned long addr,
 	pgd = pgd_offset_k(addr);
 	do {
 		next = pgd_addr_end(addr, end);
-		err = ioremap_p4d_range(pgd, addr, next, phys_addr, prot,
-					&mask);
+		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot, &mask);
 		if (err)
 			break;
 	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
@@ -272,7 +263,7 @@ void __iomem *ioremap_prot(phys_addr_t addr, size_t size, unsigned long prot)
 		return NULL;
 	vaddr = (unsigned long)area->addr;
 
-	if (ioremap_page_range(vaddr, vaddr + size, addr, __pgprot(prot))) {
+	if (vmap_page_range(vaddr, vaddr + size, addr, __pgprot(prot))) {
 		free_vm_area(area);
 		return NULL;
 	}
-- 
2.23.0

