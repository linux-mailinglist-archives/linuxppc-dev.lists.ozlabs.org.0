Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFEB24CD07
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 06:53:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXq0h58qdzDr5Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 14:53:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kmFDAZrz; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXppb4QwyzDr2d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 14:44:55 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id v15so424403pgh.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Aug 2020 21:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zgciMtrhUFyjwGUVG4/y+NlOfAX4ULiG8JBMTv5iRYk=;
 b=kmFDAZrzlugaf2iOwFJzFKy0qRhytpzHPWy1SyzEHCf7x9/jJjxRvUYRt3BCCk2gIP
 G4nsleWjGt4aNX9fvVP1KwjLhxMcXIvVfmtN3e3JqaN3cKpbVL2k7MzRrLEd6j92X8V0
 oIcDcwGG+tmZt9h0+p+96X55aiBn1lvUzVOzHmRiQq304Nwxl4zMONajDK1Vtrn4GVYh
 KSQ60Hj72mDozDv7yDH5QAPSFG+Bg3LgmMbAwkLnl2OL+rDtWrod3/UZItrijQavzDgb
 LLfAOYLTzIZa7dbKDU1ia4cBiQ9+m3Z1xDkKS6YKyaGG8mxCOox9KskxiZKX77/xORO9
 71YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zgciMtrhUFyjwGUVG4/y+NlOfAX4ULiG8JBMTv5iRYk=;
 b=ikRgJl50HIwpOWY6i79VSV36GXymLlXP5aNSx6oovhUFXkUT+dJXpANIl9ZY1feuN+
 ThS/4TzwDcDFvLr8hQuWbmGqNlXEoYf6FmF0tey8Q3dHL7v0OJYHSzXxPKb301xqVLTZ
 f6eLKmpRma0ZPJdsR1MLQxBhG4hd5sjY5erC1CDgN952eUEQ4+cXMIUYC+cb64S4qdQH
 q3rFzPMw2fYhdA4oljToOUBzfXIJ8xptf9Bffk16kHaGcfj7/grn+1qJ+u2Bru7hugyN
 m4Rf9+DT5+bumwvVQQcuusjfmSiLVZraQgm7Ixxzb3isfvScZQk3kNhZ7M6teOAuoIUh
 yBEw==
X-Gm-Message-State: AOAM530W5vhQ7tckRPwOGZ327l6RxQ8oYgigJD4hackHz9wSlvMAQDf2
 JikiBEwrVujoo4Zma7dmAqof/midxxA=
X-Google-Smtp-Source: ABdhPJw3Yjk+AuHsrY+Z3Qa1QvCviblO1Uhp70gloFt8uX+sF1897Ta2d+ML5N6Yc+IbHzqAbpKmvw==
X-Received: by 2002:a05:6a00:22c9:: with SMTP id
 f9mr1023487pfj.212.1597985093609; 
 Thu, 20 Aug 2020 21:44:53 -0700 (PDT)
Received: from bobo.ibm.com (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id l9sm683374pgg.29.2020.08.20.21.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 21:44:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 4/8] lib/ioremap: rename ioremap_*_range to vmap_*_range
Date: Fri, 21 Aug 2020 14:44:23 +1000
Message-Id: <20200821044427.736424-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200821044427.736424-1-npiggin@gmail.com>
References: <20200821044427.736424-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Zefan Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>, linuxppc-dev@lists.ozlabs.org
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

