Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CBC21A66B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 15:06:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49185k26Y0zDqCC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 23:06:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GVv3ucsL; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4917qY3jbPzDqDT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 22:54:33 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id ng8so3798672pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 05:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X7MVUjdxoTYLktr/8CAz1umz/rNBVR6DTMKwArT/SjI=;
 b=GVv3ucsLdjLUrSZaDItIqGtF0WWKcVpzdbpq18nnkIs2OAT34acUNvX86wGgS5qUPt
 n6eXXfGcFLXIPOrj5zWoabSdRtTKYBMOewFnwpkFojN4v/klGSSHHlHARq0Rs04rdwqF
 6et6QgG8LMT11/1pt6TtwEcXb87MNDRoOswAzhtHJFzxutN8GEbIra19aeo6HYzC4FUg
 MVZDNpVwlRwzs8UdEL8banprE+O7Fbox0giyXbjLs2KUjtsq7nEO9psIbdXed/PTdfg+
 088Ra4JqNWxxV7Uvgr5IJdRTFaJcz43ERTPzE2NIV0C09uILsPK1RCZYZuejPI9i/fjv
 3fYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X7MVUjdxoTYLktr/8CAz1umz/rNBVR6DTMKwArT/SjI=;
 b=l/CJMHsMoQAaSWjdb6fstyjFlDmD8WBVgVfdfodzVyOcpUXqD8udyyw7FvaJVsEFbA
 H7ohN371Ap2C0EfkdE2yB0WwNKxv2w6tG+WRyCLdnpx677j6duHPsQDN8Za3lC03NrF7
 uKiZn6uEd79+1CgsqowrQjTZsiOz4Ggcpv/1CwgjEgpKiBxKPZhp5Fx9LsYuTltggjj4
 t86bEQvZOPco42FfNghc9KahNSUzEbbigj6Cfjxq7JuomzEhdcy31eUPo0vt/siN+KlY
 WM9UjX9LX6PInyBwG/dfa6qPCI95F6fRIbi0kM31Koe4ccymN9hLLr7f82dRfzvqdo0X
 w3wg==
X-Gm-Message-State: AGi0PubmcASI8F/rEDkukWhAgztstTCuvxejUFwPlw7ZIJVcCo2egktZ
 Ue034EBzPqzPTeCBRtuQPXQ=
X-Google-Smtp-Source: APiQypJEopX9J7e6sNl1kmYurlQKu4voKqn4JL7aajl4MYhYcb+7jAwZXAvFZLoBz74E1dpgMe756w==
X-Received: by 2002:a17:902:5a0b:: with SMTP id
 q11mr17051128pli.23.1586782470530; 
 Mon, 13 Apr 2020 05:54:30 -0700 (PDT)
Received: from bobo.ibm.com (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id j24sm9235610pji.20.2020.04.13.05.54.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 05:54:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org
Subject: [PATCH v2 2/4] mm: Move ioremap page table mapping function to mm/
Date: Mon, 13 Apr 2020 22:53:01 +1000
Message-Id: <20200413125303.423864-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200413125303.423864-1-npiggin@gmail.com>
References: <20200413125303.423864-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ioremap_page_range is a generic function to create a kernel virtual
mapping, move it to mm/vmalloc.c and rename it vmap_range.

For clarity with this move, also:
- Rename vunmap_page_range (vmap_range's inverse) to vunmap_range.
- Rename vmap_pages_range (which takes a page array) to vmap_pages.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/linux/vmalloc.h |   3 +
 lib/ioremap.c           | 182 +++---------------------------
 mm/vmalloc.c            | 239 ++++++++++++++++++++++++++++++++++++----
 3 files changed, 239 insertions(+), 185 deletions(-)

diff --git a/include/linux/vmalloc.h b/include/linux/vmalloc.h
index 0507a162ccd0..eb8a5080e472 100644
--- a/include/linux/vmalloc.h
+++ b/include/linux/vmalloc.h
@@ -173,6 +173,9 @@ extern struct vm_struct *find_vm_area(const void *addr);
 extern int map_vm_area(struct vm_struct *area, pgprot_t prot,
 			struct page **pages);
 #ifdef CONFIG_MMU
+int vmap_range(unsigned long addr,
+		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
+		       unsigned int max_page_shift);
 extern int map_kernel_range_noflush(unsigned long start, unsigned long size,
 				    pgprot_t prot, struct page **pages);
 extern void unmap_kernel_range_noflush(unsigned long addr, unsigned long size);
diff --git a/lib/ioremap.c b/lib/ioremap.c
index 3f0e18543de8..7e383bdc51ad 100644
--- a/lib/ioremap.c
+++ b/lib/ioremap.c
@@ -60,176 +60,26 @@ static inline int ioremap_pud_enabled(void) { return 0; }
 static inline int ioremap_pmd_enabled(void) { return 0; }
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
-static int ioremap_pte_range(pmd_t *pmd, unsigned long addr,
-		unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
-{
-	pte_t *pte;
-	u64 pfn;
-
-	pfn = phys_addr >> PAGE_SHIFT;
-	pte = pte_alloc_kernel(pmd, addr);
-	if (!pte)
-		return -ENOMEM;
-	do {
-		BUG_ON(!pte_none(*pte));
-		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
-		pfn++;
-	} while (pte++, addr += PAGE_SIZE, addr != end);
-	return 0;
-}
-
-static int ioremap_try_huge_pmd(pmd_t *pmd, unsigned long addr,
-				unsigned long end, phys_addr_t phys_addr,
-				pgprot_t prot)
-{
-	if (!ioremap_pmd_enabled())
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
-static inline int ioremap_pmd_range(pud_t *pud, unsigned long addr,
-		unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
-{
-	pmd_t *pmd;
-	unsigned long next;
-
-	pmd = pmd_alloc(&init_mm, pud, addr);
-	if (!pmd)
-		return -ENOMEM;
-	do {
-		next = pmd_addr_end(addr, end);
-
-		if (ioremap_try_huge_pmd(pmd, addr, next, phys_addr, prot))
-			continue;
-
-		if (ioremap_pte_range(pmd, addr, next, phys_addr, prot))
-			return -ENOMEM;
-	} while (pmd++, phys_addr += (next - addr), addr = next, addr != end);
-	return 0;
-}
-
-static int ioremap_try_huge_pud(pud_t *pud, unsigned long addr,
-				unsigned long end, phys_addr_t phys_addr,
-				pgprot_t prot)
-{
-	if (!ioremap_pud_enabled())
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
-static inline int ioremap_pud_range(p4d_t *p4d, unsigned long addr,
-		unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
-{
-	pud_t *pud;
-	unsigned long next;
-
-	pud = pud_alloc(&init_mm, p4d, addr);
-	if (!pud)
-		return -ENOMEM;
-	do {
-		next = pud_addr_end(addr, end);
-
-		if (ioremap_try_huge_pud(pud, addr, next, phys_addr, prot))
-			continue;
-
-		if (ioremap_pmd_range(pud, addr, next, phys_addr, prot))
-			return -ENOMEM;
-	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
-	return 0;
-}
-
-static int ioremap_try_huge_p4d(p4d_t *p4d, unsigned long addr,
-				unsigned long end, phys_addr_t phys_addr,
-				pgprot_t prot)
-{
-	if (!ioremap_p4d_enabled())
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
-static inline int ioremap_p4d_range(pgd_t *pgd, unsigned long addr,
-		unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
-{
-	p4d_t *p4d;
-	unsigned long next;
-
-	p4d = p4d_alloc(&init_mm, pgd, addr);
-	if (!p4d)
-		return -ENOMEM;
-	do {
-		next = p4d_addr_end(addr, end);
-
-		if (ioremap_try_huge_p4d(p4d, addr, next, phys_addr, prot))
-			continue;
-
-		if (ioremap_pud_range(p4d, addr, next, phys_addr, prot))
-			return -ENOMEM;
-	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
-	return 0;
-}
-
 int ioremap_page_range(unsigned long addr,
 		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot)
 {
-	pgd_t *pgd;
-	unsigned long start;
-	unsigned long next;
-	int err;
-
-	might_sleep();
-	BUG_ON(addr >= end);
-
-	start = addr;
-	pgd = pgd_offset_k(addr);
-	do {
-		next = pgd_addr_end(addr, end);
-		err = ioremap_p4d_range(pgd, addr, next, phys_addr, prot);
-		if (err)
-			break;
-	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
-
-	flush_cache_vmap(start, end);
+	unsigned int max_page_shift = PAGE_SHIFT;
+
+	/*
+	 * Due to the max_page_shift parameter to vmap_range, platforms must
+	 * enable all smaller sizes to take advantage of a given size,
+	 * otherwise fall back to small pages.
+	 */
+	if (ioremap_pmd_enabled()) {
+		max_page_shift = PMD_SHIFT;
+		if (ioremap_pud_enabled()) {
+			max_page_shift = PUD_SHIFT;
+			if (ioremap_p4d_enabled())
+				max_page_shift = P4D_SHIFT;
+		}
+	}
 
-	return err;
+	return vmap_range(addr, end, phys_addr, prot, max_page_shift);
 }
 
 #ifdef CONFIG_GENERIC_IOREMAP
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 1afec7def23f..b1bc2fcae4e0 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -128,7 +128,7 @@ static void vunmap_p4d_range(pgd_t *pgd, unsigned long addr, unsigned long end)
 	} while (p4d++, addr = next, addr != end);
 }
 
-static void vunmap_page_range(unsigned long addr, unsigned long end)
+static void vunmap_range(unsigned long addr, unsigned long end)
 {
 	pgd_t *pgd;
 	unsigned long next;
@@ -143,7 +143,208 @@ static void vunmap_page_range(unsigned long addr, unsigned long end)
 	} while (pgd++, addr = next, addr != end);
 }
 
-static int vmap_pte_range(pmd_t *pmd, unsigned long addr,
+static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
+			  phys_addr_t phys_addr, pgprot_t prot)
+{
+	pte_t *pte;
+	u64 pfn;
+
+	pfn = phys_addr >> PAGE_SHIFT;
+	pte = pte_alloc_kernel(pmd, addr);
+	if (!pte)
+		return -ENOMEM;
+	do {
+		BUG_ON(!pte_none(*pte));
+		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
+		pfn++;
+	} while (pte++, addr += PAGE_SIZE, addr != end);
+	return 0;
+}
+
+static int vmap_try_huge_pmd(pmd_t *pmd, unsigned long addr, unsigned long end,
+			     phys_addr_t phys_addr, pgprot_t prot,
+			     unsigned int max_page_shift)
+{
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+		return 0;
+
+	if (max_page_shift < PMD_SHIFT)
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
+static inline int vmap_pmd_range(pud_t *pud, unsigned long addr,
+			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
+{
+	pmd_t *pmd;
+	unsigned long next;
+
+	pmd = pmd_alloc(&init_mm, pud, addr);
+	if (!pmd)
+		return -ENOMEM;
+	do {
+		next = pmd_addr_end(addr, end);
+
+		if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot,
+					max_page_shift))
+			continue;
+
+		if (vmap_pte_range(pmd, addr, next, phys_addr, prot))
+			return -ENOMEM;
+	} while (pmd++, phys_addr += (next - addr), addr = next, addr != end);
+	return 0;
+}
+
+static int vmap_try_huge_pud(pud_t *pud, unsigned long addr,
+			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
+{
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+		return 0;
+
+	if (max_page_shift < PUD_SHIFT)
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
+static inline int vmap_pud_range(p4d_t *p4d, unsigned long addr,
+			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
+{
+	pud_t *pud;
+	unsigned long next;
+
+	pud = pud_alloc(&init_mm, p4d, addr);
+	if (!pud)
+		return -ENOMEM;
+	do {
+		next = pud_addr_end(addr, end);
+
+		if (vmap_try_huge_pud(pud, addr, next, phys_addr, prot,
+					max_page_shift))
+			continue;
+
+		if (vmap_pmd_range(pud, addr, next, phys_addr, prot,
+					max_page_shift))
+			return -ENOMEM;
+	} while (pud++, phys_addr += (next - addr), addr = next, addr != end);
+	return 0;
+}
+
+static int vmap_try_huge_p4d(p4d_t *p4d, unsigned long addr,
+			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
+{
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+		return 0;
+
+	if (max_page_shift < P4D_SHIFT)
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
+static inline int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
+			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
+{
+	p4d_t *p4d;
+	unsigned long next;
+
+	p4d = p4d_alloc(&init_mm, pgd, addr);
+	if (!p4d)
+		return -ENOMEM;
+	do {
+		next = p4d_addr_end(addr, end);
+
+		if (vmap_try_huge_p4d(p4d, addr, next, phys_addr, prot,
+					max_page_shift))
+			continue;
+
+		if (vmap_pud_range(p4d, addr, next, phys_addr, prot,
+					max_page_shift))
+			return -ENOMEM;
+	} while (p4d++, phys_addr += (next - addr), addr = next, addr != end);
+	return 0;
+}
+
+static int vmap_range_noflush(unsigned long addr,
+			unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
+			unsigned int max_page_shift)
+{
+	pgd_t *pgd;
+	unsigned long start;
+	unsigned long next;
+	int err;
+
+	might_sleep();
+	BUG_ON(addr >= end);
+
+	start = addr;
+	pgd = pgd_offset_k(addr);
+	do {
+		next = pgd_addr_end(addr, end);
+		err = vmap_p4d_range(pgd, addr, next, phys_addr, prot,
+					max_page_shift);
+		if (err)
+			break;
+	} while (pgd++, phys_addr += (next - addr), addr = next, addr != end);
+
+	return err;
+}
+
+int vmap_range(unsigned long addr,
+		       unsigned long end, phys_addr_t phys_addr, pgprot_t prot,
+		       unsigned int max_page_shift)
+{
+	int ret;
+
+	ret = vmap_range_noflush(addr, end, phys_addr, prot, max_page_shift);
+	flush_cache_vmap(addr, end);
+
+	return ret;
+}
+
+static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr)
 {
 	pte_t *pte;
@@ -169,7 +370,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr,
 	return 0;
 }
 
-static int vmap_pmd_range(pud_t *pud, unsigned long addr,
+static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr)
 {
 	pmd_t *pmd;
@@ -180,13 +381,13 @@ static int vmap_pmd_range(pud_t *pud, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pmd_addr_end(addr, end);
-		if (vmap_pte_range(pmd, addr, next, prot, pages, nr))
+		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr))
 			return -ENOMEM;
 	} while (pmd++, addr = next, addr != end);
 	return 0;
 }
 
-static int vmap_pud_range(p4d_t *p4d, unsigned long addr,
+static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr)
 {
 	pud_t *pud;
@@ -197,13 +398,13 @@ static int vmap_pud_range(p4d_t *p4d, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pmd_range(pud, addr, next, prot, pages, nr))
+		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr))
 			return -ENOMEM;
 	} while (pud++, addr = next, addr != end);
 	return 0;
 }
 
-static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
+static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr)
 {
 	p4d_t *p4d;
@@ -214,7 +415,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
 		return -ENOMEM;
 	do {
 		next = p4d_addr_end(addr, end);
-		if (vmap_pud_range(p4d, addr, next, prot, pages, nr))
+		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr))
 			return -ENOMEM;
 	} while (p4d++, addr = next, addr != end);
 	return 0;
@@ -226,7 +427,7 @@ static int vmap_p4d_range(pgd_t *pgd, unsigned long addr,
  *
  * Ie. pte at addr+N*PAGE_SIZE shall point to pfn corresponding to pages[N]
  */
-static int vmap_page_range_noflush(unsigned long start, unsigned long end,
+static int vmap_pages_range_noflush(unsigned long start, unsigned long end,
 				   pgprot_t prot, struct page **pages)
 {
 	pgd_t *pgd;
@@ -239,7 +440,7 @@ static int vmap_page_range_noflush(unsigned long start, unsigned long end,
 	pgd = pgd_offset_k(addr);
 	do {
 		next = pgd_addr_end(addr, end);
-		err = vmap_p4d_range(pgd, addr, next, prot, pages, &nr);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr);
 		if (err)
 			return err;
 	} while (pgd++, addr = next, addr != end);
@@ -247,12 +448,12 @@ static int vmap_page_range_noflush(unsigned long start, unsigned long end,
 	return nr;
 }
 
-static int vmap_page_range(unsigned long start, unsigned long end,
+static int vmap_pages_range(unsigned long start, unsigned long end,
 			   pgprot_t prot, struct page **pages)
 {
 	int ret;
 
-	ret = vmap_page_range_noflush(start, end, prot, pages);
+	ret = vmap_pages_range_noflush(start, end, prot, pages);
 	flush_cache_vmap(start, end);
 	return ret;
 }
@@ -1238,7 +1439,7 @@ EXPORT_SYMBOL_GPL(unregister_vmap_purge_notifier);
  */
 static void unmap_vmap_area(struct vmap_area *va)
 {
-	vunmap_page_range(va->va_start, va->va_end);
+	vunmap_range(va->va_start, va->va_end);
 }
 
 /*
@@ -1699,7 +1900,7 @@ static void vb_free(const void *addr, unsigned long size)
 	rcu_read_unlock();
 	BUG_ON(!vb);
 
-	vunmap_page_range((unsigned long)addr, (unsigned long)addr + size);
+	vunmap_range((unsigned long)addr, (unsigned long)addr + size);
 
 	if (debug_pagealloc_enabled_static())
 		flush_tlb_kernel_range((unsigned long)addr,
@@ -1854,7 +2055,7 @@ void *vm_map_ram(struct page **pages, unsigned int count, int node, pgprot_t pro
 
 	kasan_unpoison_vmalloc(mem, size);
 
-	if (vmap_page_range(addr, addr + size, prot, pages) < 0) {
+	if (vmap_pages_range(addr, addr + size, prot, pages) < 0) {
 		vm_unmap_ram(mem, count);
 		return NULL;
 	}
@@ -2020,7 +2221,7 @@ void __init vmalloc_init(void)
 int map_kernel_range_noflush(unsigned long addr, unsigned long size,
 			     pgprot_t prot, struct page **pages)
 {
-	return vmap_page_range_noflush(addr, addr + size, prot, pages);
+	return vmap_pages_range_noflush(addr, addr + size, prot, pages);
 }
 
 /**
@@ -2039,7 +2240,7 @@ int map_kernel_range_noflush(unsigned long addr, unsigned long size,
  */
 void unmap_kernel_range_noflush(unsigned long addr, unsigned long size)
 {
-	vunmap_page_range(addr, addr + size);
+	vunmap_range(addr, addr + size);
 }
 EXPORT_SYMBOL_GPL(unmap_kernel_range_noflush);
 
@@ -2056,7 +2257,7 @@ void unmap_kernel_range(unsigned long addr, unsigned long size)
 	unsigned long end = addr + size;
 
 	flush_cache_vunmap(addr, end);
-	vunmap_page_range(addr, end);
+	vunmap_range(addr, end);
 	flush_tlb_kernel_range(addr, end);
 }
 EXPORT_SYMBOL_GPL(unmap_kernel_range);
@@ -2067,7 +2268,7 @@ int map_vm_area(struct vm_struct *area, pgprot_t prot, struct page **pages)
 	unsigned long end = addr + get_vm_area_size(area);
 	int err;
 
-	err = vmap_page_range(addr, end, prot, pages);
+	err = vmap_pages_range(addr, end, prot, pages);
 
 	return err > 0 ? 0 : err;
 }
-- 
2.23.0

