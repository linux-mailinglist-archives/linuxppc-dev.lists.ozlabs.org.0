Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B153A476B7D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:12:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4bT3zzBz3cRj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:12:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d1EX+1lI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=d1EX+1lI; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgJx4CQrz2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:21 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id m192so20497221qke.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6L0Hs5bCivSmN7AoUkjs7tux4629psd/EbCtH/QBUI8=;
 b=d1EX+1lIRcKXi+JDFhUdaPKzNwd3teeXHItR7DzpJ20WVoC7OMfkZuK3ZiotFPQUo5
 B+UUeiHdYDq0hWDENneTjoo8dXlv9Cjrkhilie6DFZqLjee7oqnaIj9nvwld1eQvDJlQ
 0ID2093jDbQTAn10B/DUolpCdAJAYP7aBgpHfU10jJq3/W3Cn5hS59u+lYXGA6C/pNqK
 8YksWUTq3Mj9mBHzlzYrgYqq9c8DD9M6KYmzsC8YGEXS1CJRKMqni6RdwgLNLUI1Xd+n
 UlncxXLHV9Crv9x8jAN1YPrHKqh19PQlGK6pKXbnjKhIPLqyYzFRTEzly2rSpGK+yee1
 q94g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6L0Hs5bCivSmN7AoUkjs7tux4629psd/EbCtH/QBUI8=;
 b=G+fy05KfYI4zsgG3su1gZulc6AUFLzC84ADmnKjitq2v7FPOq/XwpXH+zyQSeWzh/P
 OqOkBMcPv7VtfF2MfswqZ+srPQWGygyyun6lMBE9M0IcJ0/EmdkF2NX+79bGqV7GrZWG
 eaOC0s/QvGCSJSpnpzz8uSm2TnA3lbeDUsd/pnAXJVZcsUDxMd+78a/xddw+Pf55FGFq
 BRt3iIMmuaiQCxsKWChUx/AYBY0sZ5+kMFFEuFZnilr2RviPEcU0ZpQimnX5Z26V4A1A
 01lEhlOOZilem8HH/b4HoFsZ/eR0KMNT7mZwO6IJBKgH7Pv2nAfG84cwJOdi0JpydhyM
 UzTA==
X-Gm-Message-State: AOAM530j5bX/U48JPycriqM0s38WznaFDvKNAJBuNcSsuE8LNf8rLfZP
 oeHxybFN2gdjb1JzhgITpB33OPmeVPc=
X-Google-Smtp-Source: ABdhPJxAhaPDSzjAHQH6/y9CkVTVa8xE/cxL7aoYfYPS3ZakTpyukd7u90v9DymL9q2vIE08ASZ/Vg==
X-Received: by 2002:a37:a10b:: with SMTP id k11mr8680240qke.63.1639584798128; 
 Wed, 15 Dec 2021 08:13:18 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:17 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/20] powerpc/mm: Add __init attribute to eligible functions
Date: Wed, 15 Dec 2021 11:12:26 -0500
Message-Id: <20211215161243.16396-4-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
References: <20211215161243.16396-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/mm' are deserving of an
`__init` macro attribute. These functions are only called by other
initialization functions and therefore should inherit the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/include/asm/hugetlb.h          | 2 +-
 arch/powerpc/include/asm/mmu_context.h      | 2 +-
 arch/powerpc/mm/book3s32/mmu.c              | 2 +-
 arch/powerpc/mm/book3s64/hash_hugetlbpage.c | 2 +-
 arch/powerpc/mm/book3s64/hash_utils.c       | 6 +++---
 arch/powerpc/mm/book3s64/mmu_context.c      | 2 +-
 arch/powerpc/mm/book3s64/pkeys.c            | 2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c    | 4 ++--
 arch/powerpc/mm/nohash/44x.c                | 4 ++--
 arch/powerpc/mm/nohash/fsl_book3e.c         | 2 +-
 arch/powerpc/mm/nohash/tlb.c                | 4 ++--
 arch/powerpc/mm/numa.c                      | 6 +++---
 arch/powerpc/mm/ptdump/ptdump.c             | 2 +-
 13 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index f18c543bc01d..a6fce12a7006 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -15,7 +15,7 @@
 
 extern bool hugetlb_disabled;
 
-void hugetlbpage_init_default(void);
+void hugetlbpage_init_default(void) __init;
 
 int slice_is_hugepage_only_range(struct mm_struct *mm, unsigned long addr,
 			   unsigned long len);
diff --git a/arch/powerpc/include/asm/mmu_context.h b/arch/powerpc/include/asm/mmu_context.h
index 9ba6b585337f..ee1dc3978ecb 100644
--- a/arch/powerpc/include/asm/mmu_context.h
+++ b/arch/powerpc/include/asm/mmu_context.h
@@ -71,7 +71,7 @@ static inline void switch_mmu_context(struct mm_struct *prev,
 }
 
 extern int hash__alloc_context_id(void);
-extern void hash__reserve_context_id(int id);
+extern void hash__reserve_context_id(int id) __init;
 extern void __destroy_context(int context_id);
 static inline void mmu_context_init(void) { }
 
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index 27061583a010..f41051c33c5e 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -76,7 +76,7 @@ unsigned long p_block_mapped(phys_addr_t pa)
 	return 0;
 }
 
-static int find_free_bat(void)
+static int __init find_free_bat(void)
 {
 	int b;
 	int n = mmu_has_feature(MMU_FTR_USE_HIGH_BATS) ? 8 : 4;
diff --git a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c b/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
index a688e1324ae5..12787978d746 100644
--- a/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
+++ b/arch/powerpc/mm/book3s64/hash_hugetlbpage.c
@@ -148,7 +148,7 @@ void huge_ptep_modify_prot_commit(struct vm_area_struct *vma, unsigned long addr
 	set_huge_pte_at(vma->vm_mm, addr, ptep, pte);
 }
 
-void hugetlbpage_init_default(void)
+void __init hugetlbpage_init_default(void)
 {
 	/* Set default large page size. Currently, we pick 16M or 1M
 	 * depending on what is available
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index cfd45245d009..eecc7e86bfea 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -563,7 +563,7 @@ static int __init htab_dt_scan_hugepage_blocks(unsigned long node,
 }
 #endif /* CONFIG_HUGETLB_PAGE */
 
-static void mmu_psize_set_default_penc(void)
+static void __init mmu_psize_set_default_penc(void)
 {
 	int bpsize, apsize;
 	for (bpsize = 0; bpsize < MMU_PAGE_COUNT; bpsize++)
@@ -573,7 +573,7 @@ static void mmu_psize_set_default_penc(void)
 
 #ifdef CONFIG_PPC_64K_PAGES
 
-static bool might_have_hea(void)
+static bool __init might_have_hea(void)
 {
 	/*
 	 * The HEA ethernet adapter requires awareness of the
@@ -644,7 +644,7 @@ static void __init htab_scan_page_sizes(void)
  * low-order N bits as the encoding for the 2^(12+N) byte page size
  * (if it exists).
  */
-static void init_hpte_page_sizes(void)
+static void __init init_hpte_page_sizes(void)
 {
 	long int ap, bp;
 	long int shift, penc;
diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
index c10fc8a72fb3..73fd5b4abc0c 100644
--- a/arch/powerpc/mm/book3s64/mmu_context.c
+++ b/arch/powerpc/mm/book3s64/mmu_context.c
@@ -31,7 +31,7 @@ static int alloc_context_id(int min_id, int max_id)
 	return ida_alloc_range(&mmu_context_ida, min_id, max_id, GFP_KERNEL);
 }
 
-void hash__reserve_context_id(int id)
+void __init hash__reserve_context_id(int id)
 {
 	int result = ida_alloc_range(&mmu_context_ida, id, id, GFP_KERNEL);
 
diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
index a2d9ad138709..753e62ba67af 100644
--- a/arch/powerpc/mm/book3s64/pkeys.c
+++ b/arch/powerpc/mm/book3s64/pkeys.c
@@ -66,7 +66,7 @@ static int __init dt_scan_storage_keys(unsigned long node,
 	return 1;
 }
 
-static int scan_pkey_feature(void)
+static int __init scan_pkey_feature(void)
 {
 	int ret;
 	int pkeys_total = 0;
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 77820036c722..5e4a118f9865 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -510,7 +510,7 @@ static int __init probe_memory_block_size(unsigned long node, const char *uname,
 	return 1;
 }
 
-static unsigned long radix_memory_block_size(void)
+static unsigned long __init radix_memory_block_size(void)
 {
 	unsigned long mem_block_size = MIN_MEMORY_BLOCK_SIZE;
 
@@ -528,7 +528,7 @@ static unsigned long radix_memory_block_size(void)
 
 #else   /* CONFIG_MEMORY_HOTPLUG */
 
-static unsigned long radix_memory_block_size(void)
+static unsigned long __init radix_memory_block_size(void)
 {
 	return 1UL * 1024 * 1024 * 1024;
 }
diff --git a/arch/powerpc/mm/nohash/44x.c b/arch/powerpc/mm/nohash/44x.c
index e079f26b267e..21a2580eb170 100644
--- a/arch/powerpc/mm/nohash/44x.c
+++ b/arch/powerpc/mm/nohash/44x.c
@@ -38,7 +38,7 @@ int icache_44x_need_flush;
 
 unsigned long tlb_47x_boltmap[1024/8];
 
-static void ppc44x_update_tlb_hwater(void)
+static void __init ppc44x_update_tlb_hwater(void)
 {
 	/* The TLB miss handlers hard codes the watermark in a cmpli
 	 * instruction to improve performances rather than loading it
@@ -122,7 +122,7 @@ static void __init ppc47x_update_boltmap(void)
 /*
  * "Pins" a 256MB TLB entry in AS0 for kernel lowmem for 47x type MMU
  */
-static void ppc47x_pin_tlb(unsigned int virt, unsigned int phys)
+static void __init ppc47x_pin_tlb(unsigned int virt, unsigned int phys)
 {
 	unsigned int rA;
 	int bolted;
diff --git a/arch/powerpc/mm/nohash/fsl_book3e.c b/arch/powerpc/mm/nohash/fsl_book3e.c
index b231a54f540c..bcf8a7314c05 100644
--- a/arch/powerpc/mm/nohash/fsl_book3e.c
+++ b/arch/powerpc/mm/nohash/fsl_book3e.c
@@ -60,7 +60,7 @@ struct tlbcamrange {
 	phys_addr_t phys;
 } tlbcam_addrs[NUM_TLBCAMS];
 
-unsigned long tlbcam_sz(int idx)
+unsigned long __init tlbcam_sz(int idx)
 {
 	return tlbcam_addrs[idx].limit - tlbcam_addrs[idx].start + 1;
 }
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 647bf454a0fa..95c9f46dc3b9 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -433,7 +433,7 @@ void tlb_flush_pgtable(struct mmu_gather *tlb, unsigned long address)
 	}
 }
 
-static void setup_page_sizes(void)
+static void __init setup_page_sizes(void)
 {
 	unsigned int tlb0cfg;
 	unsigned int tlb0ps;
@@ -571,7 +571,7 @@ static void setup_page_sizes(void)
 	}
 }
 
-static void setup_mmu_htw(void)
+static void __init setup_mmu_htw(void)
 {
 	/*
 	 * If we want to use HW tablewalk, enable it by patching the TLB miss
diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 59d3cfcd7887..9d5f710d2c20 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -134,7 +134,7 @@ static int __init fake_numa_create_new_node(unsigned long end_pfn,
 	return 0;
 }
 
-static void reset_numa_cpu_lookup_table(void)
+static void __init reset_numa_cpu_lookup_table(void)
 {
 	unsigned int cpu;
 
@@ -372,7 +372,7 @@ void update_numa_distance(struct device_node *node)
  * ibm,numa-lookup-index-table= {N, domainid1, domainid2, ..... domainidN}
  * ibm,numa-distance-table = { N, 1, 2, 4, 5, 1, 6, .... N elements}
  */
-static void initialize_form2_numa_distance_lookup_table(void)
+static void __init initialize_form2_numa_distance_lookup_table(void)
 {
 	int i, j;
 	struct device_node *root;
@@ -581,7 +581,7 @@ static int of_get_assoc_arrays(struct assoc_arrays *aa)
 	return 0;
 }
 
-static int get_nid_and_numa_distance(struct drmem_lmb *lmb)
+static int __init get_nid_and_numa_distance(struct drmem_lmb *lmb)
 {
 	struct assoc_arrays aa = { .arrays = NULL };
 	int default_nid = NUMA_NO_NODE;
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index bf251191e78d..41f1252dcf73 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -315,7 +315,7 @@ static int ptdump_show(struct seq_file *m, void *v)
 
 DEFINE_SHOW_ATTRIBUTE(ptdump);
 
-static void build_pgtable_complete_mask(void)
+static void __init build_pgtable_complete_mask(void)
 {
 	unsigned int i, j;
 
-- 
2.25.1

