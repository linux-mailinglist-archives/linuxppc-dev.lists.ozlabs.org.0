Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1047F38445
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 08:22:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ksrj4P9jzDqTd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 16:22:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Yf5qQ8Zb"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Ksq040bwzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 16:21:00 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id h2so614346pgg.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jun 2019 23:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QljXkCsHOY3LQbq2OYSUJdATLBoEbRR4SOZXS+4kyck=;
 b=Yf5qQ8ZbJ8lJzNp9lHbJ6rtzn58+mqGzW9MGq3k7vXquY85ygewnTQMk9YINtgd5+x
 NWzQUHQ0psWsH+rM0S+fF5VrHTfkEt8oChS3hxQOCOeyTuhQUyZAlAAMeXmQIgnH772a
 RbtNZPEwy5NaoTZW510x+2aIOTD202N9RUZu3x5TPkmCk0uGMIenwiR01oGhlunj7JMv
 KoYJx4pkPQ1m6L/+rJer6yoGVkI8+iHIH7ckLgUvOtJzYu9s/79BcJQG6yi6HAOfi18Q
 XfTuhBAe/bm5LdurmP+TIHYzJ+TixcxkfVsmfSgBpYlGMxlIfQw1Wnf4X082qouSnToT
 uWgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QljXkCsHOY3LQbq2OYSUJdATLBoEbRR4SOZXS+4kyck=;
 b=CS2DFQq0aEsjASXM1Dk6+ErP5o7snGziiLCetXKm/Pvr7GToTV1GZls98YXs2szf5e
 hfvWXzWRYMyhfgWqCT2McBRHb9oSWj/fgLSCbUa8MmRLU/Lay+MG4HebQdJU7qr83RAg
 zpeTVfbVR+jKexZImgLoD5sLfCPQvRm/xuBFRaleMt4pvUhoEpK7dTWPX+m+kjO5M2u3
 oz+voQX7FNRmUKdoVVppg4+bRyDjbPIL+LbFGiLHTOdVabOOW5qEHaLco2erjwGNvfbF
 nCIWXdJTkDjz2t1UTo5JDv723cBlup9FBIdUEnjex3PDNxNyPKz/1CDAf8zhyNvIgJdN
 +76w==
X-Gm-Message-State: APjAAAUYxAURSqLjU2dmNaR+M9lVPXwhTV4vd+GKmBMOWtY4J8XwwyNO
 w1r5bNupfCUo3VOny6rJn8htLArh
X-Google-Smtp-Source: APXvYqyzHBpkj9D+bbqvHn0vlsfmqpcvUclCQl9FrcDiZvrNwt/qBMWKc1RI+ORheKPpht6lmJ3UKQ==
X-Received: by 2002:aa7:8c4c:: with SMTP id e12mr47279018pfd.131.1559888457676; 
 Thu, 06 Jun 2019 23:20:57 -0700 (PDT)
Received: from bobo.local0.net ([202.125.30.143])
 by smtp.gmail.com with ESMTPSA id w24sm1215748pga.90.2019.06.06.23.20.55
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 06 Jun 2019 23:20:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/64s/radix: Enable HAVE_ARCH_HUGE_VMAP
Date: Fri,  7 Jun 2019 16:19:21 +1000
Message-Id: <20190607061922.20542-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This sets the HAVE_ARCH_HUGE_VMAP option, and defines the required
page table functions.

This will not enable huge iomaps, because powerpc/64 ioremap does not
call ioremap_page_range. That is done in a later change.

HAVE_ARCH_HUGE_VMAP facilities will be used to enable huge pages for
vmalloc memory in a set of generic kernel changes. Combined, this
improves cached `git diff` performance by about 5% on a 2-node POWER9
with 32MB dentry cache hash, by allowing the dentry/inode hashes to
be mapped with 2MB pages:

  Profiling git diff dTLB misses with a vanilla kernel:

  81.75%  git      [kernel.vmlinux]    [k] __d_lookup_rcu
   7.21%  git      [kernel.vmlinux]    [k] strncpy_from_user
   1.77%  git      [kernel.vmlinux]    [k] find_get_entry
   1.59%  git      [kernel.vmlinux]    [k] kmem_cache_free

            40,168      dTLB-miss
       0.100342754 seconds time elapsed

  With powerpc huge vmap and generic huge vmap vmalloc:

             2,987      dTLB-miss
       0.095933138 seconds time elapsed

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                     |  1 +
 arch/powerpc/mm/book3s64/radix_pgtable.c | 93 ++++++++++++++++++++++++
 2 files changed, 94 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8c1c636308c8..f0e5b38d52e8 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -167,6 +167,7 @@ config PPC
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

