Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8452400F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 04:40:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ0Z03ZgPzDqQh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 12:40:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nzm2mSWg; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ0J64Z8kzDqQg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 12:28:22 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id kr4so4017739pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 Aug 2020 19:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n6u3W3xGRvE1f9TahLPt2tr1kQk4naizqZpWLpaJwxQ=;
 b=nzm2mSWgcF2C9f99wzi08Ql2QMVmUWsm29f5O5eBDvlRDzhbWguvvk0MLq14Jov9pL
 J3gyMa5yXaJWzK0BWQO6lRlBa1bAT/MndVEYllh7nk8KvX5NPUsDu06EltSLVrFDfBXJ
 Et472wbuMqXYBIG9zaM6d1eD8MopnUtlFa6K1izrDGSSfVay3hgRh5mY06XRwIwemtNm
 Dl/LWPGUFXUFy9KiGA2KFg4ZtSs6m6WNtmEG0+CQi0ea31POZD4rulroMY1atOaH6bmn
 JTmyFDX0To2jEHBYI8X667VaPiCbVWrE803eS7YxuYsC4QX8PoaXRISjM3WXMiLtcIiM
 /K6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n6u3W3xGRvE1f9TahLPt2tr1kQk4naizqZpWLpaJwxQ=;
 b=t2trSv/7/pKQCsUrKxqyBS9AenHVNBHBJ7fMEBHo6VNWTdSjHvQGLtlHgYoXI+PKXb
 SuTOjbKcqbjfpOh5uBzZ27YtNvkXO+UZtj8opsigCsnIrI2kTJBEKNkGfGTUKn5BH6jd
 H6TkJVu5VbzE9RdNuw/Lvwjhqodzyf5/ps69KtFSoeNo0dtp9PZL3zDtR5ogr8pfzs4W
 0QH/tPFcIhveP9iea4qmIEbU9du0cLVMsKcGlgiY5ub1nkhansP4QjpDafVD7mnZb+Um
 Fzp3zuQZ4RqifrK/lcHPwrbqHo+IhDvTmAReUQJVR2L72prC0VfScc/4HyG8EJNvnm+g
 zN6w==
X-Gm-Message-State: AOAM533+TZK3hrdlqAffy3WBN1NFC+NTudp/T/aNaASAlefvS888pIYk
 EuReY9b4dV1B4MhdeD9IWYA=
X-Google-Smtp-Source: ABdhPJysgrcVwNeIzX0wpzRpCYPA89SKM60P0U1p8K/OIM8Od7oilhb+Ai1vknhvluUYAT5wjCLY/w==
X-Received: by 2002:a17:90a:ff0e:: with SMTP id
 ce14mr25645781pjb.128.1597026500019; 
 Sun, 09 Aug 2020 19:28:20 -0700 (PDT)
Received: from bobo.ibm.com (193-116-100-32.tpgi.com.au. [193.116.100.32])
 by smtp.gmail.com with ESMTPSA id l17sm21863475pff.126.2020.08.09.19.28.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Aug 2020 19:28:19 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH v3 6/8] mm: Move vmap_range from lib/ioremap.c to mm/vmalloc.c
Date: Mon, 10 Aug 2020 12:27:30 +1000
Message-Id: <20200810022732.1150009-7-npiggin@gmail.com>
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

This is a generic kernel virtual memory mapper, not specific to ioremap.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/linux/vmalloc.h |   2 +
 mm/ioremap.c            | 192 ----------------------------------------
 mm/vmalloc.c            | 191 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 193 insertions(+), 192 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 787d77ad7536..e3590e93bfff 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -181,6 +181,8 @@ extern struct vm_struct *remove_vm_area(const void *addr);
 extern struct vm_struct *find_vm_area(const void *addr);
 
 #ifdef CONFIG_MMU
+extern int vmap_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift);
 extern int map_kernel_range_noflush(unsigned long start, unsigned long size,
 				    pgprot_t prot, struct page **pages);
 int map_kernel_range(unsigned long start, unsigned long size, pgprot_t prot,
diff --git a/mm/ioremap.c b/mm/ioremap.c
index b0032dbadaf7..cdda0e022740 100644
--- a/mm/ioremap.c
+++ b/mm/ioremap.c
@@ -28,198 +28,6 @@ early_param("nohugeiomap", set_nohugeiomap);
 static const bool iomap_allow_huge = false;
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
-static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot, pgtbl_mod_mask *mask)
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
-			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift)
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
-			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift,
-			pgtbl_mod_mask *mask)
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
-		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, max_page_shift)) {
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
-			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift)
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
-			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift,
-			pgtbl_mod_mask *mask)
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
-		if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot, max_page_shift)) {
-			*mask |= PGTBL_PUD_MODIFIED;
-			continue;
-		}
-
-		if (vmap_pmd_range(pud, addr, next, phys_addr, prot, max_page_shift, mask))
-			return -ENOMEM;
-	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
-	return 0;
-}
-
-static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr, unsigned long end,
-			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift)
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
-			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift,
-			pgtbl_mod_mask *mask)
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
-		if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot, max_page_shift)) {
-			*mask |= PGTBL_P4D_MODIFIED;
-			continue;
-		}
-
-		if (vmap_pud_range(p4d, addr, next, phys_addr, prot, max_page_shift, mask))
-			return -ENOMEM;
-	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
-	return 0;
-}
-
-static int vmap_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
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
-		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot, max_page_shift, &mask);
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
 int ioremap_page_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
 {
 	unsigned int max_page_shift = PAGE_SHIFT;
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 3a1e45fd1626..129f10545bb1 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -71,6 +71,197 @@ static void free_work(struct work_struct *w)
 }
 
 /*** Page table manipulation functions ***/
+static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot, pgtbl_mod_mask *mask)
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
+			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift)
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
+			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift,
+			pgtbl_mod_mask *mask)
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
+		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, max_page_shift)) {
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
+			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift)
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
+			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift,
+			pgtbl_mod_mask *mask)
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
+		if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot, max_page_shift)) {
+			*mask |= PGTBL_PUD_MODIFIED;
+			continue;
+		}
+
+		if (vmap_pmd_range(pud, addr, next, phys_addr, prot, max_page_shift, mask))
+			return -ENOMEM;
+	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
+	return 0;
+}
+
+static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr, unsigned long end,
+			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift)
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
+			phys_addr_t phys_addr, pgprot_t prot, unsigned int max_page_shift,
+			pgtbl_mod_mask *mask)
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
+		if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot, max_page_shift)) {
+			*mask |= PGTBL_P4D_MODIFIED;
+			continue;
+		}
+
+		if (vmap_pud_range(p4d, addr, next, phys_addr, prot, max_page_shift, mask))
+			return -ENOMEM;
+	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
+	return 0;
+}
+
+int vmap_range(unsigned long addr, unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
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
+		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot, max_page_shift, &mask);
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

