Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAF2A5AB4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2019 17:43:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46MZ9V04LNzDqCM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2019 01:43:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="dAAnb7+z"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46MYxT1LzBzDqf1
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2019 01:32:35 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id 4so4077746pgm.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Sep 2019 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N1Dbr4C+4pSAGJVIo09NynHwpN6O0xereRJOjrnA65c=;
 b=dAAnb7+zEpd+yjWy/vghRK2DE76hezFbIUbdPztV/ABkbwTRafPSSODtsKaHmpkXRI
 P2DK8Vq/jkX5ie6vXzhDTNMRDbWM4nwglyryNov4MRz8rmRoFUCTadiGzJUJk2ihDLTT
 WZ6qjCB8OshckDpEtOkDuplG4ob7eXOdcsohyslRbcF8bOaXvpR5x4OqKhASM+tqGGiW
 Jxy/wUeHGn3VsisI+UFrHofR+7IpRzVgRgcX5pVrylzxSkNXzpKFzqOzAwr6XW0KrRmI
 USFvUS6bebv/+xkdaDeRWYlN00M1vBAKqtP/kCsLqSU0Z9Gw/KftGD0YPNzS6plYQRji
 wMtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N1Dbr4C+4pSAGJVIo09NynHwpN6O0xereRJOjrnA65c=;
 b=ds5Aqgi0/mOI72MbsPI/bep9DJccq9QJ+V2iqLAo2J7sGASLMW0AK+Mt9/kZ536cN6
 DY+cCJoHkzKp7bbzT3Aak4jrN/Ak/nRm0HoF7TdjoBSVjP9g1HWrSdQAs+Z4wmOGeSob
 0rLA7OdPTvxOy9QdAg1OHdgndEIGuFIDmz1WcwcZrQ/JkHYrxSJfLzV4BWIDB/wn6MkG
 Lp7aQep8HtpkZFOk5rIiI4BqvuIf4d/QPGdf3E7GIeJWoYeGG1MQstti5qBES2qECtRr
 C3eiLpMrEYw/BdwmuSo4h/GiRGs0xmRTs6Kw8MocWAow0LMSpiv7jOKyeUEsUQnA2sOi
 hpbg==
X-Gm-Message-State: APjAAAUfBndZo7lZedhuq8fWZz+4pWGTsLjiqrl8+rFP/Ho5pKm+uMZl
 0BNs+O7W7DQmEAxa6EPuOJhaxcpS4ho=
X-Google-Smtp-Source: APXvYqwQFueT/EoieTTWKu0uwoNcOsyZf7Eq5Z5csExWHYfRSOM5Qxjwf1uV128/QLD3ycy4qhMNeA==
X-Received: by 2002:aa7:9d8e:: with SMTP id f14mr7563050pfq.217.1567438352473; 
 Mon, 02 Sep 2019 08:32:32 -0700 (PDT)
Received: from bobo.local0.net ([61.68.187.15])
 by smtp.gmail.com with ESMTPSA id b14sm15966033pfo.15.2019.09.02.08.32.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2019 08:32:32 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/6] powerpc/64s: remove register_process_table callback
Date: Tue,  3 Sep 2019 01:29:26 +1000
Message-Id: <20190902152931.17840-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190902152931.17840-1-npiggin@gmail.com>
References: <20190902152931.17840-1-npiggin@gmail.com>
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

This callback is only required because the partition table init comes
before process table allocation on powernv (aka bare metal aka native).

Change the order to allocate the process table first, and remove the
callback.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h |  4 ---
 arch/powerpc/mm/book3s64/hash_utils.c    |  6 ----
 arch/powerpc/mm/book3s64/pgtable.c       |  3 --
 arch/powerpc/mm/book3s64/radix_pgtable.c | 45 +++++++-----------------
 arch/powerpc/platforms/pseries/lpar.c    | 17 +++++++--
 5 files changed, 27 insertions(+), 48 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 23b83d3593e2..bb3deb76c951 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -206,7 +206,6 @@ extern int mmu_io_psize;
 void mmu_early_init_devtree(void);
 void hash__early_init_devtree(void);
 void radix__early_init_devtree(void);
-extern void radix_init_native(void);
 extern void hash__early_init_mmu(void);
 extern void radix__early_init_mmu(void);
 static inline void early_init_mmu(void)
@@ -238,9 +237,6 @@ static inline void setup_initial_memory_limit(phys_addr_t first_memblock_base,
 					   first_memblock_size);
 }
 
-extern int (*register_process_table)(unsigned long base, unsigned long page_size,
-				     unsigned long tbl_size);
-
 #ifdef CONFIG_PPC_PSERIES
 extern void radix_init_pseries(void);
 #else
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index fe99bba39b69..7aed27ea5361 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -859,12 +859,6 @@ static void __init htab_initialize(void)
 		/* Using a hypervisor which owns the htab */
 		htab_address = NULL;
 		_SDR1 = 0; 
-		/*
-		 * On POWER9, we need to do a H_REGISTER_PROC_TBL hcall
-		 * to inform the hypervisor that we wish to use the HPT.
-		 */
-		if (cpu_has_feature(CPU_FTR_ARCH_300))
-			register_process_table(0, 0, 0);
 #ifdef CONFIG_FA_DUMP
 		/*
 		 * If firmware assisted dump is active firmware preserves
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 206b43ae4000..97f3be778c79 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -23,9 +23,6 @@ EXPORT_SYMBOL(__pmd_frag_nr);
 unsigned long __pmd_frag_size_shift;
 EXPORT_SYMBOL(__pmd_frag_size_shift);
 
-int (*register_process_table)(unsigned long base, unsigned long page_size,
-			      unsigned long tbl_size);
-
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
  * This is called when relaxing access to a hugepage. It's also called in the page
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 71b649473045..83fa7864e8f4 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -34,19 +34,6 @@
 unsigned int mmu_pid_bits;
 unsigned int mmu_base_pid;
 
-static int native_register_process_table(unsigned long base, unsigned long pg_sz,
-					 unsigned long table_size)
-{
-	unsigned long patb0, patb1;
-
-	patb0 = be64_to_cpu(partition_tb[0].patb0);
-	patb1 = base | table_size | PATB_GR;
-
-	mmu_partition_table_set_entry(0, patb0, patb1);
-
-	return 0;
-}
-
 static __ref void *early_alloc_pgtable(unsigned long size, int nid,
 			unsigned long region_start, unsigned long region_end)
 {
@@ -381,18 +368,8 @@ static void __init radix_init_pgtable(void)
 	 */
 	rts_field = radix__get_tree_size();
 	process_tb->prtb0 = cpu_to_be64(rts_field | __pa(init_mm.pgd) | RADIX_PGD_INDEX_SIZE);
-	/*
-	 * Fill in the partition table. We are suppose to use effective address
-	 * of process table here. But our linear mapping also enable us to use
-	 * physical address here.
-	 */
-	register_process_table(__pa(process_tb), 0, PRTB_SIZE_SHIFT - 12);
+
 	pr_info("Process table %p and radix root for kernel: %p\n", process_tb, init_mm.pgd);
-	asm volatile("ptesync" : : : "memory");
-	asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
-		     "r" (TLBIEL_INVAL_SET_LPID), "r" (0));
-	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
-	trace_tlbie(0, 0, TLBIEL_INVAL_SET_LPID, 0, 2, 1, 1);
 
 	/*
 	 * The init_mm context is given the first available (non-zero) PID,
@@ -413,22 +390,24 @@ static void __init radix_init_pgtable(void)
 
 static void __init radix_init_partition_table(void)
 {
-	unsigned long rts_field, dw0;
+	unsigned long rts_field, dw0, dw1;
 
 	mmu_partition_table_init();
 	rts_field = radix__get_tree_size();
 	dw0 = rts_field | __pa(init_mm.pgd) | RADIX_PGD_INDEX_SIZE | PATB_HR;
-	mmu_partition_table_set_entry(0, dw0, 0);
+	dw1 = __pa(process_tb) | (PRTB_SIZE_SHIFT - 12) | PATB_GR;
+	mmu_partition_table_set_entry(0, dw0, dw1);
+
+	asm volatile("ptesync" : : : "memory");
+	asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
+		     "r" (TLBIEL_INVAL_SET_LPID), "r" (0));
+	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
+	trace_tlbie(0, 0, TLBIEL_INVAL_SET_LPID, 0, 2, 1, 1);
 
 	pr_info("Initializing Radix MMU\n");
 	pr_info("Partition table %p\n", partition_tb);
 }
 
-void __init radix_init_native(void)
-{
-	register_process_table = native_register_process_table;
-}
-
 static int __init get_idx_from_shift(unsigned int shift)
 {
 	int idx = -1;
@@ -622,8 +601,9 @@ void __init radix__early_init_mmu(void)
 	__pmd_frag_nr = RADIX_PMD_FRAG_NR;
 	__pmd_frag_size_shift = RADIX_PMD_FRAG_SIZE_SHIFT;
 
+	radix_init_pgtable();
+
 	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
-		radix_init_native();
 		lpcr = mfspr(SPRN_LPCR);
 		mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
 		radix_init_partition_table();
@@ -634,7 +614,6 @@ void __init radix__early_init_mmu(void)
 
 	memblock_set_current_limit(MEMBLOCK_ALLOC_ANYWHERE);
 
-	radix_init_pgtable();
 	/* Switch to the guard PID before turning on MMU */
 	radix__switch_mmu_context(NULL, &init_mm);
 	if (cpu_has_feature(CPU_FTR_HVMODE))
diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index 4f76e5f30c97..b3205a6c950c 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -1531,16 +1531,29 @@ void __init hpte_init_pseries(void)
 	mmu_hash_ops.flush_hash_range	 = pSeries_lpar_flush_hash_range;
 	mmu_hash_ops.hpte_clear_all      = pseries_hpte_clear_all;
 	mmu_hash_ops.hugepage_invalidate = pSeries_lpar_hugepage_invalidate;
-	register_process_table		 = pseries_lpar_register_process_table;
 
 	if (firmware_has_feature(FW_FEATURE_HPT_RESIZE))
 		mmu_hash_ops.resize_hpt = pseries_lpar_resize_hpt;
+
+	/*
+	 * On POWER9, we need to do a H_REGISTER_PROC_TBL hcall
+	 * to inform the hypervisor that we wish to use the HPT.
+	 */
+	if (cpu_has_feature(CPU_FTR_ARCH_300))
+		pseries_lpar_register_process_table(0, 0, 0);
 }
 
 void radix_init_pseries(void)
 {
 	pr_info("Using radix MMU under hypervisor\n");
-	register_process_table = pseries_lpar_register_process_table;
+
+	pseries_lpar_register_process_table(__pa(process_tb),
+						0, PRTB_SIZE_SHIFT - 12);
+	asm volatile("ptesync" : : : "memory");
+	asm volatile(PPC_TLBIE_5(%0,%1,2,1,1) : :
+		     "r" (TLBIEL_INVAL_SET_LPID), "r" (0));
+	asm volatile("eieio; tlbsync; ptesync" : : : "memory");
+	trace_tlbie(0, 0, TLBIEL_INVAL_SET_LPID, 0, 2, 1, 1);
 }
 
 #ifdef CONFIG_PPC_SMLPAR
-- 
2.22.0

