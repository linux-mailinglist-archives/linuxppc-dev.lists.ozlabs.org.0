Return-Path: <linuxppc-dev+bounces-1443-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE497C2FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:57:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Kth70vrz2yLT;
	Thu, 19 Sep 2024 12:57:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714636;
	cv=none; b=D1XMd2XjDFPQcb8ARDPcVrVHlKmVszgP5lBJgTGJx7I8SxRXrM8V6hGfklLOsHG5KCdM5qKYq2SyJ7bX9ChCH+CnqK32958ZzH8/5AoGmJ+W2pqnMdADy9iMzAqDRsnDVvHvTve7HgluzZxsuF98OosJnpt2AQ74uAwo1M6g96dC71jfeGptGN1y67FcrD9dEcQPSTu0kE2u/PMpd5fX9M+HIfUVhyLd8Qfp6qv4gHe3dGhap+nqqCU6BGhQWxviwiBHCK9DiuYu2PRdSFvXIOocGN5hh9l9wmooxdviYhZnWdqYcztlVHGpknz0xzVWpX91JS/rLEMY74f5AHfg7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714636; c=relaxed/relaxed;
	bh=OpMDq1IEGMMPwRojJ8i4AsUukx9XqidcnS2hx9BDF5Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AandsNDzCjti3MqNQW4xeCAwoAPVELD0GtAK1B2BCPkK9VgaiNeSKN4pcRlHT4YCumiumQ6rRpuVZN7FRs2Zi/O0joUHdGQolNLhJ+3DQaPlhh7/GoUd9QiIrsbHgmlh81wd54MnPM6HwGqDFfowVRIUDARjFeLtcqDyhWCjWW11Un55nSke4eyhjbnfuRWXHn7Jc7TmcOvprb2AWJT5OSK5eRmkAmAbEGwDA2TfHty75HvVk9bW9ajeyRL8Bcs3iq6tBUxoLkii6JHY3LFRAgWic7q73pqecXgbcyOqDktDLuh2NlQOuV6S1Xv/hvpL8NF54BmA5sK9yitHioaj2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h3LU47zd; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=h3LU47zd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Kth4Lzbz2yLP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:57:16 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2053525bd90so4188025ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714634; x=1727319434; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OpMDq1IEGMMPwRojJ8i4AsUukx9XqidcnS2hx9BDF5Q=;
        b=h3LU47zd1AM/yH9wM9LuS+tN8ETCNVO0KE3y9c/QBe1/WMWdWCfBGbI6e+0Ps4hMQP
         /flLvX+RYs05qUcATS1l8um9yKFbRxHGnFBcGYUW3J4m0DtMgYi4hxyXIu23Inkdlw7p
         shUqNnVzsJMNuq57X1+3uoicdYZyHkWaiDJ5WyBrjLNVngl5HPdHYbXQVITLqXtfIwb6
         PR0XiURKJk0Y8RZ7xFhXCYddvCYnIIcbfCTci4b1BbWC/cBNFbHGY114ycU6J/856GtC
         8kJumy1rPnqyLGyhvMuhX4Re+YOR8g+CShX/y2cnDlqkUlFo2XnkaHkWtRwli13Hp8Fc
         EbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714634; x=1727319434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OpMDq1IEGMMPwRojJ8i4AsUukx9XqidcnS2hx9BDF5Q=;
        b=V70vaD8nEF9B89M8DqBKJLSADcvUdNFkblTkpKpzGU3HkyQyjTeBiqD8LT3cdsmxJp
         ZaKJ+ZZJsbc2SVP3CszXeblsiT77H5Xr40AXGoE2oGm3n/cRq8YIh25RdZxhL4fSXJhg
         3TEB4u71EMJhOu/fXWj/dqTd2Hi0GmNKudt5Z8Opkp4G3zki8ESCMy7uvu2RvMe7/RLn
         7S2wXXQjsQ0bL3LhAuGoQp2d5fra0bgL+EPoZ1HfZcT2rMKf2kESFDTS8B6EROElkldo
         lvi6xF6N9h5k9cXXE118pVqz8EYjQEg6wCJ/87r7NjhD1Zc4EsZys643NeQ6PiPJCY6c
         sP7g==
X-Gm-Message-State: AOJu0YwUj+K7IZIZ1kKMK6P85suRoemaEN0XmDGlZWp8ZlVB+aRvt4ZL
	DGy43Cd302ZnpGUAey7RFeVfoVWYLR0fCc2A4iVc5oE0rYg77teDKED9jQ==
X-Google-Smtp-Source: AGHT+IF4quvbfkZ0rJHqO+7BogiiWf+cQnNI1id44Yv+kHDK3MIlFucEVogC7B736x0cPugHmuek8Q==
X-Received: by 2002:a17:902:e80a:b0:202:190e:2adb with SMTP id d9443c01a7336-2078253791bmr316942145ad.36.1726714633762;
        Wed, 18 Sep 2024 19:57:13 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:57:13 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	Nirjhar Roy <nirjhar@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kasan-dev@googlegroups.com,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC v2 10/13] book3s64/hash: Add kfence functionality
Date: Thu, 19 Sep 2024 08:26:08 +0530
Message-ID: <449e751d8c64538076079a8fcb19749260817e62.1726571179.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726571179.git.ritesh.list@gmail.com>
References: <cover.1726571179.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that linear map functionality of debug_pagealloc is made generic,
enable kfence to use this generic infrastructure.

1. Define kfence related linear map variables.
   - u8 *linear_map_kf_hash_slots;
   - unsigned long linear_map_kf_hash_count;
   - DEFINE_RAW_SPINLOCK(linear_map_kf_hash_lock);
2. The linear map size allocated in RMA region is quite small
   (KFENCE_POOL_SIZE >> PAGE_SHIFT) which is 512 bytes by default.
3. kfence pool memory is reserved using memblock_phys_alloc() which has
   can come from anywhere.
   (default 255 objects => ((1+255) * 2) << PAGE_SHIFT = 32MB)
4. The hash slot information for kfence memory gets added in linear map
   in hash_linear_map_add_slot() (which also adds for debug_pagealloc).

Reported-by: Pavithra Prakash <pavrampu@linux.vnet.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/kfence.h     |   5 -
 arch/powerpc/mm/book3s64/hash_utils.c | 162 +++++++++++++++++++++++---
 2 files changed, 149 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
index f3a9476a71b3..fab124ada1c7 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -10,7 +10,6 @@
 
 #include <linux/mm.h>
 #include <asm/pgtable.h>
-#include <asm/mmu.h>
 
 #ifdef CONFIG_PPC64_ELF_ABI_V1
 #define ARCH_FUNC_PREFIX "."
@@ -26,10 +25,6 @@ static inline void disable_kfence(void)
 
 static inline bool arch_kfence_init_pool(void)
 {
-#ifdef CONFIG_PPC64
-	if (!radix_enabled())
-		return false;
-#endif
 	return !kfence_disabled;
 }
 #endif
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index cffbb6499ac4..53e6f3a524eb 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -40,6 +40,7 @@
 #include <linux/random.h>
 #include <linux/elf-randomize.h>
 #include <linux/of_fdt.h>
+#include <linux/kfence.h>
 
 #include <asm/interrupt.h>
 #include <asm/processor.h>
@@ -66,6 +67,7 @@
 #include <asm/pte-walk.h>
 #include <asm/asm-prototypes.h>
 #include <asm/ultravisor.h>
+#include <asm/kfence.h>
 
 #include <mm/mmu_decl.h>
 
@@ -271,7 +273,7 @@ void hash__tlbiel_all(unsigned int action)
 		WARN(1, "%s called on pre-POWER7 CPU\n", __func__);
 }
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
+#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 static void kernel_map_linear_page(unsigned long vaddr, unsigned long idx,
 				   u8 *slots, raw_spinlock_t *lock)
 {
@@ -325,11 +327,13 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long idx,
 				     mmu_linear_psize,
 				     mmu_kernel_ssize, 0);
 }
+#endif
 
+#ifdef CONFIG_DEBUG_PAGEALLOC
 static u8 *linear_map_hash_slots;
 static unsigned long linear_map_hash_count;
 static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
-static inline void hash_debug_pagealloc_alloc_slots(void)
+static void hash_debug_pagealloc_alloc_slots(void)
 {
 	unsigned long max_hash_count = ppc64_rma_size / 4;
 
@@ -352,7 +356,8 @@ static inline void hash_debug_pagealloc_alloc_slots(void)
 		      __func__, linear_map_hash_count, &ppc64_rma_size);
 }
 
-static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot)
+static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr,
+							int slot)
 {
 	if (!debug_pagealloc_enabled() || !linear_map_hash_count)
 		return;
@@ -386,20 +391,148 @@ static int hash_debug_pagealloc_map_pages(struct page *page, int numpages,
 	return 0;
 }
 
-int hash__kernel_map_pages(struct page *page, int numpages, int enable)
+#else /* CONFIG_DEBUG_PAGEALLOC */
+static inline void hash_debug_pagealloc_alloc_slots(void) {}
+static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot) {}
+static int __maybe_unused
+hash_debug_pagealloc_map_pages(struct page *page, int numpages, int enable)
 {
-	return hash_debug_pagealloc_map_pages(page, numpages, enable);
+	return 0;
 }
+#endif /* CONFIG_DEBUG_PAGEALLOC */
 
-#else /* CONFIG_DEBUG_PAGEALLOC */
-int hash__kernel_map_pages(struct page *page, int numpages,
-					 int enable)
+#ifdef CONFIG_KFENCE
+static u8 *linear_map_kf_hash_slots;
+static unsigned long linear_map_kf_hash_count;
+static DEFINE_RAW_SPINLOCK(linear_map_kf_hash_lock);
+
+static phys_addr_t kfence_pool;
+
+static inline void hash_kfence_alloc_pool(void)
+{
+
+	// allocate linear map for kfence within RMA region
+	linear_map_kf_hash_count = KFENCE_POOL_SIZE >> PAGE_SHIFT;
+	linear_map_kf_hash_slots = memblock_alloc_try_nid(
+					linear_map_kf_hash_count, 1,
+					MEMBLOCK_LOW_LIMIT, ppc64_rma_size,
+					NUMA_NO_NODE);
+	if (!linear_map_kf_hash_slots) {
+		pr_err("%s: memblock for linear map (%lu) failed\n", __func__,
+				linear_map_kf_hash_count);
+		goto err;
+	}
+
+	// allocate kfence pool early
+	kfence_pool = memblock_phys_alloc_range(KFENCE_POOL_SIZE, PAGE_SIZE,
+				MEMBLOCK_LOW_LIMIT, MEMBLOCK_ALLOC_ANYWHERE);
+	if (!kfence_pool) {
+		pr_err("%s: memblock for kfence pool (%lu) failed\n", __func__,
+				KFENCE_POOL_SIZE);
+		memblock_free(linear_map_kf_hash_slots,
+				linear_map_kf_hash_count);
+		linear_map_kf_hash_count = 0;
+		goto err;
+	}
+	memblock_mark_nomap(kfence_pool, KFENCE_POOL_SIZE);
+
+	return;
+err:
+	pr_info("Disabling kfence\n");
+	disable_kfence();
+}
+
+static inline void hash_kfence_map_pool(void)
+{
+	unsigned long kfence_pool_start, kfence_pool_end;
+	unsigned long prot = pgprot_val(PAGE_KERNEL);
+
+	if (!kfence_pool)
+		return;
+
+	kfence_pool_start = (unsigned long) __va(kfence_pool);
+	kfence_pool_end = kfence_pool_start + KFENCE_POOL_SIZE;
+	__kfence_pool = (char *) kfence_pool_start;
+	BUG_ON(htab_bolt_mapping(kfence_pool_start, kfence_pool_end,
+				    kfence_pool, prot, mmu_linear_psize,
+				    mmu_kernel_ssize));
+	memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
+}
+
+static inline void hash_kfence_add_slot(phys_addr_t paddr, int slot)
 {
+	unsigned long vaddr = (unsigned long) __va(paddr);
+	unsigned long lmi = (vaddr - (unsigned long)__kfence_pool)
+					>> PAGE_SHIFT;
+
+	if (!kfence_pool)
+		return;
+	BUG_ON(!is_kfence_address((void *)vaddr));
+	BUG_ON(lmi >= linear_map_kf_hash_count);
+	linear_map_kf_hash_slots[lmi] = slot | 0x80;
+}
+
+static int hash_kfence_map_pages(struct page *page, int numpages, int enable)
+{
+	unsigned long flags, vaddr, lmi;
+	int i;
+
+	WARN_ON_ONCE(!linear_map_kf_hash_count);
+	local_irq_save(flags);
+	for (i = 0; i < numpages; i++, page++) {
+		vaddr = (unsigned long)page_address(page);
+		lmi = (vaddr - (unsigned long)__kfence_pool) >> PAGE_SHIFT;
+
+		/* Ideally this should never happen */
+		if (lmi >= linear_map_kf_hash_count) {
+			WARN_ON_ONCE(1);
+			continue;
+		}
+
+		if (enable)
+			kernel_map_linear_page(vaddr, lmi,
+					       linear_map_kf_hash_slots,
+					       &linear_map_kf_hash_lock);
+		else
+			kernel_unmap_linear_page(vaddr, lmi,
+						 linear_map_kf_hash_slots,
+						 &linear_map_kf_hash_lock);
+	}
+	local_irq_restore(flags);
 	return 0;
 }
-static inline void hash_debug_pagealloc_alloc_slots(void) {}
-static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot) {}
-#endif /* CONFIG_DEBUG_PAGEALLOC */
+#else
+static inline void hash_kfence_alloc_pool(void) {}
+static inline void hash_kfence_map_pool(void) {}
+static inline void hash_kfence_add_slot(phys_addr_t paddr, int slot) {}
+static int __maybe_unused
+hash_kfence_map_pages(struct page *page, int numpages, int enable)
+{
+	return 0;
+}
+#endif
+
+#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
+int hash__kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	void *vaddr = page_address(page);
+
+	if (is_kfence_address(vaddr))
+		return hash_kfence_map_pages(page, numpages, enable);
+	else
+		return hash_debug_pagealloc_map_pages(page, numpages, enable);
+}
+
+static void hash_linear_map_add_slot(phys_addr_t paddr, int slot)
+{
+	if (is_kfence_address(__va(paddr)))
+		hash_kfence_add_slot(paddr, slot);
+	else
+		hash_debug_pagealloc_add_slot(paddr, slot);
+}
+#else
+static void hash_linear_map_add_slot(phys_addr_t paddr, int slot) {}
+#endif
 
 /*
  * 'R' and 'C' update notes:
@@ -559,7 +692,8 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 			break;
 
 		cond_resched();
-		hash_debug_pagealloc_add_slot(paddr, ret);
+		// add slot info in debug_pagealloc / kfence linear map
+		hash_linear_map_add_slot(paddr, ret);
 	}
 	return ret < 0 ? ret : 0;
 }
@@ -940,7 +1074,7 @@ static void __init htab_init_page_sizes(void)
 	bool aligned = true;
 	init_hpte_page_sizes();
 
-	if (!debug_pagealloc_enabled()) {
+	if (!debug_pagealloc_enabled_or_kfence()) {
 		/*
 		 * Pick a size for the linear mapping. Currently, we only
 		 * support 16M, 1M and 4K which is the default
@@ -1261,6 +1395,7 @@ static void __init htab_initialize(void)
 	prot = pgprot_val(PAGE_KERNEL);
 
 	hash_debug_pagealloc_alloc_slots();
+	hash_kfence_alloc_pool();
 	/* create bolted the linear mapping in the hash table */
 	for_each_mem_range(i, &base, &end) {
 		size = end - base;
@@ -1277,6 +1412,7 @@ static void __init htab_initialize(void)
 		BUG_ON(htab_bolt_mapping(base, base + size, __pa(base),
 				prot, mmu_linear_psize, mmu_kernel_ssize));
 	}
+	hash_kfence_map_pool();
 	memblock_set_current_limit(MEMBLOCK_ALLOC_ANYWHERE);
 
 	/*
-- 
2.46.0


