Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A731F591
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 15:28:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453wNq4Bw7zDqRd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 23:28:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hcwi14Q2"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453wDl6JB2zDqQJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 23:21:27 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id t22so1362210pgi.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 06:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bwCbazG0uWpeHHq16h61suXp9iNQSDKrijvI5Xb8k5A=;
 b=Hcwi14Q2tGdVL2zCKha7YAmgbnjBfn0I+F4J0mIrtvPa2xNDi1kWRnxlZmsp29p/u/
 a2vEykX7CJ7AQwG714ATKj2Q7EDExwSFQTK2sVDyrP9mS+gcYt47vK2E08+WUNzMlRCm
 mPZ25kRrfrTrk4WEq6BmcgWePQHHz4h1vgLp2fQoj70GI6IBMWc3GG8ASc3dYSjt5c78
 ivA348YjsJGXM6E254fAy2igbikZxE08ct7OMzNDbYQidTUnJw4fu+/5QwqbAjkMOgCQ
 IEVq3KCOmUEIhcd8WMbAXvCr5OqVLfZRDuWRGp/GukYllQTM4rCy+OP8LJaiNvKDHzX1
 9wdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bwCbazG0uWpeHHq16h61suXp9iNQSDKrijvI5Xb8k5A=;
 b=KfU5z39ctALJp77LHvn29mruERCDomN4teKvzt4axZrnD3WMbwE5Kk9D50hfaxzja+
 tb1ZCYLdUl4/del0icUULUFFtH3hzEkVL/k0EwuKj9HFS0iAFwyBVY2tguIIRyd5t95R
 fY05OgmFq7f0RCLos+xfXLuAIopOVLjH5xUrnC5lN8GxkFz1JtgjCoT0OoD0sD04h5c9
 WT32xckvONBUkJWnooXH823RhxNYbS7TzHP5uWHEs9VagVzsU5dnjtNDmXfyGL32LPlq
 Vz8knAqcPuaVePfCwt1AcDRWurgs727AoNgplCdlGIVjasDKyobS8APJo8/9BW15JI3e
 DgjQ==
X-Gm-Message-State: APjAAAVQLak3GqYI2YO5SpAzZmkfXetLJ7Vf3tGAXeNgMnJ8lgbkzjky
 syFxCbLnQblxCGzQWYVQaz+A2SDh
X-Google-Smtp-Source: APXvYqzrGvRl04leG3wMiKC5XwoMrKTT0j4sN+ztWjxzzL/exH73j2Kp+fjMcn3xSXwRLWO2cGw2BQ==
X-Received: by 2002:a62:7d8e:: with SMTP id
 y136mr25109171pfc.224.1557926485554; 
 Wed, 15 May 2019 06:21:25 -0700 (PDT)
Received: from bobo.local0.net (115-64-240-98.tpgi.com.au. [115.64.240.98])
 by smtp.gmail.com with ESMTPSA id a19sm2784459pgm.46.2019.05.15.06.21.22
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 15 May 2019 06:21:25 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-mm@kvack.org
Subject: [RFC PATCH 4/5] powerpc/64s/radix: Enable HAVE_ARCH_HUGE_VMAP
Date: Wed, 15 May 2019 23:19:43 +1000
Message-Id: <20190515131944.12489-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190515131944.12489-1-npiggin@gmail.com>
References: <20190515131944.12489-1-npiggin@gmail.com>
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This does not actually enable huge vmap mappings, because powerpc/64
ioremap does not call ioremap_page_range, but it is required before
implementing huge mappings in ioremap, because the generic vunmap code
needs to cope with them.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                     |  1 +
 arch/powerpc/mm/book3s64/radix_pgtable.c | 93 ++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d7996cfaceca..ffac84600e0e 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -166,6 +166,7 @@ config PPC
 	select GENERIC_STRNLEN_USER
 	select GENERIC_TIME_VSYSCALL
 	select HAVE_ARCH_AUDITSYSCALL
+	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
 	select HAVE_ARCH_JUMP_LABEL
 	select HAVE_ARCH_KASAN			if PPC32
 	select HAVE_ARCH_KGDB
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index c9bcf428dd2b..3bc9ade56277 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1122,3 +1122,96 @@ void radix__ptep_modify_prot_commit(struct vm_area_struct *vma,
 
 	set_pte_at(mm, addr, ptep, pte);
 }
+
+int __init arch_ioremap_pud_supported(void)
+{
+	return radix_enabled();
+}
+
+int __init arch_ioremap_pmd_supported(void)
+{
+	return radix_enabled();
+}
+
+int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
+{
+	return 0;
+}
+
+int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
+{
+	pte_t *ptep = (pte_t *)pud;
+	pte_t new_pud = pfn_pte(__phys_to_pfn(addr), prot);
+
+	set_pte_at(&init_mm, 0 /* radix unused */, ptep, new_pud);
+
+	return 1;
+}
+
+int pud_clear_huge(pud_t *pud)
+{
+	if (pud_huge(*pud)) {
+		pud_clear(pud);
+		return 1;
+	}
+
+	return 0;
+}
+
+int pud_free_pmd_page(pud_t *pud, unsigned long addr)
+{
+	pmd_t *pmd;
+	int i;
+
+	pmd = (pmd_t *)pud_page_vaddr(*pud);
+	pud_clear(pud);
+
+	flush_tlb_kernel_range(addr, addr + PUD_SIZE);
+
+	for (i = 0; i < PTRS_PER_PMD; i++) {
+		if (!pmd_none(pmd[i])) {
+			pte_t *pte;
+			pte = (pte_t *)pmd_page_vaddr(pmd[i]);
+
+			pte_free_kernel(&init_mm, pte);
+		}
+	}
+
+	pmd_free(&init_mm, pmd);
+
+	return 1;
+}
+
+int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
+{
+	pte_t *ptep = (pte_t *)pmd;
+	pte_t new_pmd = pfn_pte(__phys_to_pfn(addr), prot);
+
+	set_pte_at(&init_mm, 0 /* radix unused */, ptep, new_pmd);
+
+	return 1;
+}
+
+int pmd_clear_huge(pmd_t *pmd)
+{
+	if (pmd_huge(*pmd)) {
+		pmd_clear(pmd);
+		return 1;
+	}
+
+	return 0;
+}
+
+int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
+{
+	pte_t *pte;
+
+	pte = (pte_t *)pmd_page_vaddr(*pmd);
+	pmd_clear(pmd);
+
+	flush_tlb_kernel_range(addr, addr + PMD_SIZE);
+
+	pte_free_kernel(&init_mm, pte);
+
+	return 1;
+}
-- 
2.20.1

