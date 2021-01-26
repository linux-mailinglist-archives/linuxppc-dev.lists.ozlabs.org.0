Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0263033D6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 06:08:26 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPvrl0bzJzDqwm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jan 2021 16:08:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bwwPy4xr; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPvMQ6rDXzDqnV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jan 2021 15:46:23 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d4so9155663plh.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 20:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uqoFzS1QfUJym8qaL4KmBeJJsskaloylHduiw/HszjE=;
 b=bwwPy4xrO167D/gAD7LeQt1I8plv/L7NtzkGKAKIh3CMnKro/3T30juUUKB5E+ySAU
 x/TYOWubkXtjQb6zfcRzGZ/ya21gypJWn+wyrprY4IKyOrPUkjsI6+XG0nPVEGwTxyI9
 KqA3SOK0T4/DhtDmYCqMhSfGOvmV0eIChXKoXHauBiK9eK6g5IhGNttTnz83NudsS/Iw
 l/zEfXnGUEi2Wfl3b72mzhEeFYfjimb9a8L5fTPba6iDBhA8iEwS0GnXXABvPG6dFQ1Q
 1d6xhqpQDB1k5k4bbL0UZhsYZ6ILT/EQxfPLClpnc0BDetMT+4IZN3s0iNN/fx7wC7dq
 oDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uqoFzS1QfUJym8qaL4KmBeJJsskaloylHduiw/HszjE=;
 b=Pz6Q1PMqZNjNxMrzEjD8bj2Sxg+vpvqPv3X8wrox4JxZGl5LXvXJtwFRDXPm4E8l3w
 MP110yMTkdDtHYsVZpAhMTuTdZ+Dy/KZIFLV5Ziai+IbOPP9DOt37fqHrsmFCooO+rK5
 0+8hd3OWwCTF9H3RIFG8V4uWZAGBR6uh8BgbKr9cNQI9asKPryD9g7OEf/fC2xk3Pmq5
 VZySh5r9z6fevF0xE+LKdyRAG/ewz1pfyTXNXHlyHHM9EoVn2Unf47oqfbsXQCyUGZI2
 z3vHv8rUnXy96zjwq6ipWZyegn+aCweMD5i8eDNT3vUP886uLA4JEXHwy972JtvmJami
 HTmw==
X-Gm-Message-State: AOAM533Ul1QaLwACxHO2YLf17RolT11M4+u747cRBOJBHEb6WT8VrWja
 o5Ta4w+ZW0P7lv5I44o+Tww=
X-Google-Smtp-Source: ABdhPJy0sn0AOqQ6hIW35HOxSRoCx29PJb1s1IAbHpvMqTHEcL/Axmr4+r0ykmVxAKJhZMFiZlag0Q==
X-Received: by 2002:a17:902:7684:b029:df:cfe4:6a06 with SMTP id
 m4-20020a1709027684b02900dfcfe46a06mr4236593pll.64.1611636380502; 
 Mon, 25 Jan 2021 20:46:20 -0800 (PST)
Received: from bobo.ozlabs.ibm.com
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id 68sm19272293pfg.90.2021.01.25.20.46.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 20:46:20 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v11 10/13] mm: Move vmap_range from mm/ioremap.c to
 mm/vmalloc.c
Date: Tue, 26 Jan 2021 14:45:07 +1000
Message-Id: <20210126044510.2491820-11-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210126044510.2491820-1-npiggin@gmail.com>
References: <20210126044510.2491820-1-npiggin@gmail.com>
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
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Christoph Hellwig <hch@infradead.org>,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a generic kernel virtual memory mapper, not specific to ioremap.

Code is unchanged other than making vmap_range non-static.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/linux/vmalloc.h |   3 +
 mm/ioremap.c            | 203 ----------------------------------------
 mm/vmalloc.c            | 202 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 205 insertions(+), 203 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 9f7b8b00101b..99ea72d547dc 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -194,6 +194,9 @@ extern struct vm_struct *remove_vm_area(const void *addr);
 extern struct vm_struct *find_vm_area(const void *addr);
 
 #ifdef CONFIG_MMU
+int vmap_range(unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift);
 extern int map_kernel_range_noflush(unsigned long start, unsigned long size,
 				    pgprot_t prot, struct page **pages);
 int map_kernel_range(unsigned long start, unsigned long size, pgprot_t prot,
diff --git a/mm/ioremap.c b/mm/ioremap.c
index 3264d0203785..d1dcc7e744ac 100644
--- a/mm/ioremap.c
+++ b/mm/ioremap.c
@@ -28,209 +28,6 @@ early_param("nohugeiomap", set_nohugeiomap);
 static const bool iomap_max_page_shift = PAGE_SHIFT;
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
-static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot,
-			pgtbl_mod_mask *mask)
-{
-	pte_t *pte;
-	u64 pfn;
-
-	pfn = phys_addr >> PAGE_SHIFT;
-	pte = pte_alloc_kernel_track(pmd, addr, mask);
-	if (!pte)
-		return -ENOMEM;
-	do {
-		BUG_ON(!pte_none(*pte));
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
-	} while (pte++, addr += PAGE_SIZE, addr != end);
-	*mask |= PGTBL_PTE_MODIFIED;
-	return 0;
-}
-
-static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift)
-{
-	if (max_page_shift < PMD_SHIFT)
-		return 0;
-
-	if (!arch_vmap_pmd_supported(prot))
-		return 0;
-
-	if ((end - addr) != PMD_SIZE)
-		return 0;
-
-	if (!IS_ALIGNED(addr, PMD_SIZE))
-		return 0;
-
-	if (!IS_ALIGNED(phys_addr, PMD_SIZE))
-		return 0;
-
-	if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
-		return 0;
-
-	return pmd_set_huge(pmd, phys_addr, prot);
-}
-
-static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift, pgtbl_mod_mask *mask)
-{
-	pmd_t *pmd;
-	unsigned long next;
-
-	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
-	if (!pmd)
-		return -ENOMEM;
-	do {
-		next = pmd_addr_end(addr, end);
-
-		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
-					max_page_shift)) {
-			*mask |= PGTBL_PMD_MODIFIED;
-			continue;
-		}
-
-		if (vmap_pte_range(pmd, addr, next, phys_addr, prot, mask))
-			return -ENOMEM;
-	} while (pmd++, phys_addr += (next - addr), addr = next, addr != end);
-	return 0;
-}
-
-static int vmap_try_huge_pud(pud_t *pud, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift)
-{
-	if (max_page_shift < PUD_SHIFT)
-		return 0;
-
-	if (!arch_vmap_pud_supported(prot))
-		return 0;
-
-	if ((end - addr) != PUD_SIZE)
-		return 0;
-
-	if (!IS_ALIGNED(addr, PUD_SIZE))
-		return 0;
-
-	if (!IS_ALIGNED(phys_addr, PUD_SIZE))
-		return 0;
-
-	if (pud_present(*pud) && !pud_free_pmd_page(pud, addr))
-		return 0;
-
-	return pud_set_huge(pud, phys_addr, prot);
-}
-
-static int vmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift, pgtbl_mod_mask *mask)
-{
-	pud_t *pud;
-	unsigned long next;
-
-	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
-	if (!pud)
-		return -ENOMEM;
-	do {
-		next = pud_addr_end(addr, end);
-
-		if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot,
-					max_page_shift)) {
-			*mask |= PGTBL_PUD_MODIFIED;
-			continue;
-		}
-
-		if (vmap_pmd_range(pud, addr, next, phys_addr, prot,
-					max_page_shift, mask))
-			return -ENOMEM;
-	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
-	return 0;
-}
-
-static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift)
-{
-	if (max_page_shift < P4D_SHIFT)
-		return 0;
-
-	if (!arch_vmap_p4d_supported(prot))
-		return 0;
-
-	if ((end - addr) != P4D_SIZE)
-		return 0;
-
-	if (!IS_ALIGNED(addr, P4D_SIZE))
-		return 0;
-
-	if (!IS_ALIGNED(phys_addr, P4D_SIZE))
-		return 0;
-
-	if (p4d_present(*p4d) && !p4d_free_pud_page(p4d, addr))
-		return 0;
-
-	return p4d_set_huge(p4d, phys_addr, prot);
-}
-
-static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift, pgtbl_mod_mask *mask)
-{
-	p4d_t *p4d;
-	unsigned long next;
-
-	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
-	if (!p4d)
-		return -ENOMEM;
-	do {
-		next = p4d_addr_end(addr, end);
-
-		if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot,
-					max_page_shift)) {
-			*mask |= PGTBL_P4D_MODIFIED;
-			continue;
-		}
-
-		if (vmap_pud_range(p4d, addr, next, phys_addr, prot,
-					max_page_shift, mask))
-			return -ENOMEM;
-	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
-	return 0;
-}
-
-static int vmap_range(unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot,
-			unsigned int max_page_shift)
-{
-	pgd_t *pgd;
-	unsigned long start;
-	unsigned long next;
-	int err;
-	pgtbl_mod_mask mask = 0;
-
-	might_sleep();
-	BUG_ON(addr >= end);
-
-	start = addr;
-	pgd = pgd_offset_k(addr);
-	do {
-		next = pgd_addr_end(addr, end);
-		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
-					max_page_shift, &mask);
-		if (err)
-			break;
-	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
-
-	flush_cache_vmap(start, end);
-
-	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
-		arch_sync_kernel_mappings(start, end);
-
-	return err;
-}
-
 int ioremap_page_range(unsigned long addr,
 		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
 {
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 7f2f36116980..f043386bb51d 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -68,6 +68,208 @@ static void free_work(struct work_struct *w)
 }
 
 /*** Page table manipulation functions ***/
+static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot,
+			pgtbl_mod_mask *mask)
+{
+	pte_t *pte;
+	u64 pfn;
+
+	pfn = phys_addr >> PAGE_SHIFT;
+	pte = pte_alloc_kernel_track(pmd, addr, mask);
+	if (!pte)
+		return -ENOMEM;
+	do {
+		BUG_ON(!pte_none(*pte));
+		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
+		pfn++;
+	} while (pte++, addr += PAGE_SIZE, addr != end);
+	*mask |= PGTBL_PTE_MODIFIED;
+	return 0;
+}
+
+static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
+{
+	if (max_page_shift < PMD_SHIFT)
+		return 0;
+
+	if (!arch_vmap_pmd_supported(prot))
+		return 0;
+
+	if ((end - addr) != PMD_SIZE)
+		return 0;
+
+	if (!IS_ALIGNED(addr, PMD_SIZE))
+		return 0;
+
+	if (!IS_ALIGNED(phys_addr, PMD_SIZE))
+		return 0;
+
+	if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
+		return 0;
+
+	return pmd_set_huge(pmd, phys_addr, prot);
+}
+
+static int vmap_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift, pgtbl_mod_mask *mask)
+{
+	pmd_t *pmd;
+	unsigned long next;
+
+	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
+	if (!pmd)
+		return -ENOMEM;
+	do {
+		next = pmd_addr_end(addr, end);
+
+		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
+					max_page_shift)) {
+			*mask |= PGTBL_PMD_MODIFIED;
+			continue;
+		}
+
+		if (vmap_pte_range(pmd, addr, next, phys_addr, prot, mask))
+			return -ENOMEM;
+	} while (pmd++, phys_addr += (next - addr), addr = next, addr != end);
+	return 0;
+}
+
+static int vmap_try_huge_pud(pud_t *pud, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
+{
+	if (max_page_shift < PUD_SHIFT)
+		return 0;
+
+	if (!arch_vmap_pud_supported(prot))
+		return 0;
+
+	if ((end - addr) != PUD_SIZE)
+		return 0;
+
+	if (!IS_ALIGNED(addr, PUD_SIZE))
+		return 0;
+
+	if (!IS_ALIGNED(phys_addr, PUD_SIZE))
+		return 0;
+
+	if (pud_present(*pud) && !pud_free_pmd_page(pud, addr))
+		return 0;
+
+	return pud_set_huge(pud, phys_addr, prot);
+}
+
+static int vmap_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift, pgtbl_mod_mask *mask)
+{
+	pud_t *pud;
+	unsigned long next;
+
+	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
+	if (!pud)
+		return -ENOMEM;
+	do {
+		next = pud_addr_end(addr, end);
+
+		if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot,
+					max_page_shift)) {
+			*mask |= PGTBL_PUD_MODIFIED;
+			continue;
+		}
+
+		if (vmap_pmd_range(pud, addr, next, phys_addr, prot,
+					max_page_shift, mask))
+			return -ENOMEM;
+	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
+	return 0;
+}
+
+static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
+{
+	if (max_page_shift < P4D_SHIFT)
+		return 0;
+
+	if (!arch_vmap_p4d_supported(prot))
+		return 0;
+
+	if ((end - addr) != P4D_SIZE)
+		return 0;
+
+	if (!IS_ALIGNED(addr, P4D_SIZE))
+		return 0;
+
+	if (!IS_ALIGNED(phys_addr, P4D_SIZE))
+		return 0;
+
+	if (p4d_present(*p4d) && !p4d_free_pud_page(p4d, addr))
+		return 0;
+
+	return p4d_set_huge(p4d, phys_addr, prot);
+}
+
+static int vmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift, pgtbl_mod_mask *mask)
+{
+	p4d_t *p4d;
+	unsigned long next;
+
+	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
+	if (!p4d)
+		return -ENOMEM;
+	do {
+		next = p4d_addr_end(addr, end);
+
+		if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot,
+					max_page_shift)) {
+			*mask |= PGTBL_P4D_MODIFIED;
+			continue;
+		}
+
+		if (vmap_pud_range(p4d, addr, next, phys_addr, prot,
+					max_page_shift, mask))
+			return -ENOMEM;
+	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
+	return 0;
+}
+
+int vmap_range(unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
+{
+	pgd_t *pgd;
+	unsigned long start;
+	unsigned long next;
+	int err;
+	pgtbl_mod_mask mask = 0;
+
+	might_sleep();
+	BUG_ON(addr >= end);
+
+	start = addr;
+	pgd = pgd_offset_k(addr);
+	do {
+		next = pgd_addr_end(addr, end);
+		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
+					max_page_shift, &mask);
+		if (err)
+			break;
+	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
+
+	flush_cache_vmap(start, end);
+
+	if (mask & ARCH_PAGE_TABLE_SYNC_MASK)
+		arch_sync_kernel_mappings(start, end);
+
+	return err;
+}
 
 static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			     pgtbl_mod_mask *mask)
-- 
2.23.0

