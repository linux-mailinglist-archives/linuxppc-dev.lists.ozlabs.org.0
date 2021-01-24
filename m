Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A322A301AA7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 09:37:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNmb76XLxzDqJS
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 19:37:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o5l/DCVS; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNmGw2KFKzDqkB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 19:23:36 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id 31so5722224plb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Jan 2021 00:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XdOBo5hMulSSxEYd/6YmwlJTZSrkouBXlfopwP0/Zc4=;
 b=o5l/DCVSCaxUEl6ZWA1anhN4/cxw3MkSyb+QZwdaivP6WeAYkl8rUCScGtQxmbJDDA
 n+MhvBH/u3vKGyrqfIs/NROmznkxDGeLh77YSkfE90KH4IAcp7XF40rgXHpPJXh/FtVx
 QBWJjW1+RxiBCRJswIDB+VySgrbidOM5UUl7stEEWOXo2UgtRpQTIF86xL5v8R1XiP0M
 O80Zq64Gro5u4QhH/tHJj1dbKyMjjc9THLxn2k4GnWiAtTsO44QJFz/28tOod0FOX6SX
 Q/wryIF0ZxiAFSz2jSvlmoJO/78asliunkKRZSorL/5BicTxWS1TTX2fr4PVWxmkPz6f
 Pqcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XdOBo5hMulSSxEYd/6YmwlJTZSrkouBXlfopwP0/Zc4=;
 b=aBKmiOfuYHrd4dsellfv8bSRFdEr6KR4kz6L1MNhwGjiMNM1w/iWG3hyTU23CN4N8E
 EaGgczycI9eU9ltSoeM2DIVuMMH6WUGBIsqeiB3UbcZYNDaYZqtg5xnYWYSdpErq2Bq3
 D65+j1iTIjVA5YY23/qNHBFmNtyfUtqWppalnxrIK28rHJSidT/Yt7llHSUQZhniKoju
 R/YD1jR0IdYfAM9aDZHayzvuJJqla1ssw7aEyP+B06c41M5Lk43RXFtsVIhcbXwzQ1z9
 ARkoXNo1Qtn+WAlkbsSQ3N2vNSRhKA09luPw+sUSNyznxJWjllhg60/rIpKDDGIwIFti
 8Hfw==
X-Gm-Message-State: AOAM533lHQyLp4JWxSTGQ2aGzm9Efx1FgtBuz9xGot96XFp8DgFPwkCv
 ovNzkdPXrjCW7UQwFqmxbS4=
X-Google-Smtp-Source: ABdhPJx6GFbCQ6szgbTg/K7X7HKG3gfdSjXkRRdgzuwadHjoBdmePc1daU9pjAxjKKOpTJ6Vyv2z/Q==
X-Received: by 2002:a17:902:d2c1:b029:de:7c38:f86a with SMTP id
 n1-20020a170902d2c1b02900de7c38f86amr4700511plc.83.1611476613887; 
 Sun, 24 Jan 2021 00:23:33 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([124.170.13.62])
 by smtp.gmail.com with ESMTPSA id gb12sm11799757pjb.51.2021.01.24.00.23.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Jan 2021 00:23:33 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v10 07/12] arm64: inline huge vmap supported functions
Date: Sun, 24 Jan 2021 18:22:25 +1000
Message-Id: <20210124082230.2118861-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210124082230.2118861-1-npiggin@gmail.com>
References: <20210124082230.2118861-1-npiggin@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ding Tianhong <dingtianhong@huawei.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows unsupported levels to be constant folded away, and so
p4d_free_pud_page can be removed because it's no longer linked to.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/arm64/include/asm/vmalloc.h | 23 ++++++++++++++++++++---
 arch/arm64/mm/mmu.c              | 26 --------------------------
 2 files changed, 20 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 597b40405319..fc9a12d6cc1a 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -4,9 +4,26 @@
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
+	/*
+	 * Only 4k granule supports level 1 block mappings.
+	 * SW table walks can't handle removal of intermediate entries.
+	 */
+	return IS_ENABLED(CONFIG_ARM64_4K_PAGES) &&
+	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
+}
+
+static inline bool arch_vmap_pmd_supported(pgprot_t prot)
+{
+	/* See arch_vmap_pud_supported() */
+	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
+}
 #endif
 
 #endif /* _ASM_ARM64_VMALLOC_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index f6614c378792..ab9ba7c36dae 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1313,27 +1313,6 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
 	return dt_virt;
 }
 
-bool arch_vmap_p4d_supported(pgprot_t prot)
-{
-	return false;
-}
-
-bool arch_vmap_pud_supported(pgprot_t prot);
-{
-	/*
-	 * Only 4k granule supports level 1 block mappings.
-	 * SW table walks can't handle removal of intermediate entries.
-	 */
-	return IS_ENABLED(CONFIG_ARM64_4K_PAGES) &&
-	       !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
-}
-
-bool arch_vmap_pmd_supported(pgprot_t prot)
-{
-	/* See arch_vmap_pud_supported() */
-	return !IS_ENABLED(CONFIG_PTDUMP_DEBUGFS);
-}
-
 int pud_set_huge(pud_t *pudp, phys_addr_t phys, pgprot_t prot)
 {
 	pud_t new_pud = pfn_pud(__phys_to_pfn(phys), mk_pud_sect_prot(prot));
@@ -1425,11 +1404,6 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
 	return 1;
 }
 
-int p4d_free_pud_page(p4d_t *p4d, unsigned long addr)
-{
-	return 0;	/* Don't attempt a block mapping */
-}
-
 #ifdef CONFIG_MEMORY_HOTPLUG
 static void __remove_pgd_mapping(pgd_t *pgdir, unsigned long start, u64 size)
 {
-- 
2.23.0

