Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B2E8382423
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 08:19:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk89M31VJz2ymM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 16:19:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZTBfs3/6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZTBfs3/6; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk8780GdXz301K
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 16:17:23 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 lj11-20020a17090b344bb029015bc3073608so3089467pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 23:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rnHtyBZ9C+ghLNg1vuNoOMqFnVJ1wzVM0UN01jzFvm8=;
 b=ZTBfs3/6FbJ5/KysRr70ITwc7ZQdNHyKm01UPQQbQoDtzHWjrnFqoIE9gq4tR4ahmB
 Nl3by/H4y3OWyqBHsun7uem4qH/5qjLiyo8iZejA7fDa/YGaO6yDuaxFGv4O38PJo7VF
 E3YbGIw3HHPHAiHDUy0DxxAV72vHHlI4YJyJ9hf1STSwh3W1M5KbVYW6iNr3ULap6G4E
 vv2nCa5EDlPRRxFu/30W/RbrFdjMZR5es/UHTtl/tk1ujID9jWGXycn491mrrSENGiIF
 OOa6DcXnuCfRNS6UficpkGpiag9eE/RFhwXN2chNfTLMcOaSqXz8FJid/bUYIdLVEMSH
 4Wiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rnHtyBZ9C+ghLNg1vuNoOMqFnVJ1wzVM0UN01jzFvm8=;
 b=bxFr/Q0YrevRUo5RD4/NbG94i4+g0DPj+abE2ErWDZgH0jrZiiigpaDo/OOtL0AuMO
 L/aSBuQ9ag3Ed10zxtdSsjoVfom9uMG99mu5PtJAafRefHBLtViPl+3fjBTUoXusAhK6
 YcF0zHYF/q0Rpmtow2GvmjJ70nZBog33TzohjuZi6++owCj7amuMyc3xIiozjNSYf8yY
 U5WQZ0Kondu5g/pkH2GqLO32lGoxWppjCuPwZB0kqNOFow67ieYQQyeb6m36yjxcGgZH
 f6Lq9QIyrFB6hRVYGGgChP3z5UTD8C3gV/H0ENAEBo/1jTynJka78sMxQgpzWlnIONoe
 a7cg==
X-Gm-Message-State: AOAM532JcjJpN6TsHp+jjQJDpdpOoo2xJYAmegZfuootX71fUb6zaXBP
 z++IA1IYe0EqETRmJEAu/gw8JRkH0LU=
X-Google-Smtp-Source: ABdhPJyrRVg995VGziBn0CQW2S8QEEW+AzX0NkmaH9jyZSxoWQj94rjAo7BMhEezql6Ji7IvQ6HK2g==
X-Received: by 2002:a17:90a:7306:: with SMTP id
 m6mr25041257pjk.217.1621232241471; 
 Sun, 16 May 2021 23:17:21 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id gg2sm1505327pjb.45.2021.05.16.23.17.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 23:17:21 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc: Enable KFENCE on BOOK3S/64
Date: Mon, 17 May 2021 16:16:58 +1000
Message-Id: <20210517061658.194708-5-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210517061658.194708-1-jniethe5@gmail.com>
References: <20210517061658.194708-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

This reuses the DEBUG_PAGEALLOC logic.

Tested with CONFIG_KFENCE + CONFIG_KUNIT + CONFIG_KFENCE_KUNIT_TEST on
radix and hash.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
[jpn: Handle radix]
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/Kconfig                         |  2 +-
 arch/powerpc/include/asm/book3s/64/pgtable.h |  2 +-
 arch/powerpc/include/asm/kfence.h            | 19 +++++++++++++++++++
 arch/powerpc/mm/book3s64/hash_utils.c        | 12 ++++++------
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  8 +++++---
 5 files changed, 32 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6df64d6815df..1743364d7370 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -196,7 +196,7 @@ config PPC
 	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <= 14
 	select HAVE_ARCH_KGDB
-	select HAVE_ARCH_KFENCE			if PPC32
+	select HAVE_ARCH_KFENCE			if ARCH_SUPPORTS_DEBUG_PAGEALLOC
 	select HAVE_ARCH_MMAP_RND_BITS
 	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
 	select HAVE_ARCH_NVRAM_OPS
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index b89482aed82a..35300f2ee5d0 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -822,7 +822,7 @@ static inline bool check_pte_access(unsigned long access, unsigned long ptev)
  * Generic functions with hash/radix callbacks
  */
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
+#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 static inline void __kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	if (radix_enabled())
diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
index a9846b68c6b9..9d388df7c1a8 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -11,11 +11,29 @@
 #include <linux/mm.h>
 #include <asm/pgtable.h>
 
+#if defined(CONFIG_PPC64) && !defined(PPC64_ELF_ABI_v2)
+#define ARCH_FUNC_PREFIX "."
+#endif
+
 static inline bool arch_kfence_init_pool(void)
 {
 	return true;
 }
 
+#ifdef CONFIG_PPC64
+static inline bool kfence_protect_page(unsigned long addr, bool protect)
+{
+	struct page *page;
+
+	page = virt_to_page(addr);
+	if (protect)
+		__kernel_map_pages(page, 1, 0);
+	else
+		__kernel_map_pages(page, 1, 1);
+
+	return true;
+}
+#else
 static inline bool kfence_protect_page(unsigned long addr, bool protect)
 {
 	pte_t *kpte = virt_to_kpte(addr);
@@ -29,5 +47,6 @@ static inline bool kfence_protect_page(unsigned long addr, bool protect)
 
 	return true;
 }
+#endif
 
 #endif /* __ASM_POWERPC_KFENCE_H */
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index fe5cf1cf4dd5..fecb379426e7 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -323,8 +323,8 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 			break;
 
 		cond_resched();
-		if (debug_pagealloc_enabled() &&
-			(paddr >> PAGE_SHIFT) < linear_map_hash_count)
+		if (debug_pagealloc_enabled_or_kfence() &&
+		    (paddr >> PAGE_SHIFT) < linear_map_hash_count)
 			linear_map_hash_slots[paddr >> PAGE_SHIFT] = ret | 0x80;
 	}
 	return ret < 0 ? ret : 0;
@@ -672,7 +672,7 @@ static void __init htab_init_page_sizes(void)
 	bool aligned = true;
 	init_hpte_page_sizes();
 
-	if (!debug_pagealloc_enabled()) {
+	if (!debug_pagealloc_enabled_or_kfence()) {
 		/*
 		 * Pick a size for the linear mapping. Currently, we only
 		 * support 16M, 1M and 4K which is the default
@@ -960,7 +960,7 @@ static void __init htab_initialize(void)
 
 	prot = pgprot_val(PAGE_KERNEL);
 
-	if (debug_pagealloc_enabled()) {
+	if (debug_pagealloc_enabled_or_kfence()) {
 		linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
 		linear_map_hash_slots = memblock_alloc_try_nid(
 				linear_map_hash_count, 1, MEMBLOCK_LOW_LIMIT,
@@ -1936,7 +1936,7 @@ long hpte_insert_repeating(unsigned long hash, unsigned long vpn,
 	return slot;
 }
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
+#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 static DEFINE_SPINLOCK(linear_map_hash_lock);
 
 static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
@@ -2009,7 +2009,7 @@ void hash__kernel_map_pages(struct page *page, int numpages, int enable)
 	}
 	local_irq_restore(flags);
 }
-#endif /* CONFIG_DEBUG_PAGEALLOC */
+#endif /* CONFIG_DEBUG_PAGEALLOC || CONFIG_KFENCE */
 
 void hash__setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				phys_addr_t first_memblock_size)
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 2aa81b9e354a..b984876ff1ca 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -33,6 +33,8 @@
 
 #include <trace/events/thp.h>
 
+#include <mm/mmu_decl.h>
+
 unsigned int mmu_pid_bits;
 unsigned int mmu_base_pid;
 unsigned long radix_mem_block_size __ro_after_init;
@@ -335,7 +337,7 @@ static void __init radix_init_pgtable(void)
 	phys_addr_t start, end;
 	u64 i;
 
-	if (debug_pagealloc_enabled())
+	if (debug_pagealloc_enabled_or_kfence())
 		size = PAGE_SIZE;
 
 	/* We don't support slb for radix */
@@ -879,7 +881,7 @@ int __meminit radix__create_section_mapping(unsigned long start,
 {
 	unsigned long size = radix_mem_block_size;
 
-	if (debug_pagealloc_enabled())
+	if (debug_pagealloc_enabled_or_kfence())
 		size = PAGE_SIZE;
 
 	if (end >= RADIX_VMALLOC_START) {
@@ -1176,7 +1178,7 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 	return 1;
 }
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
+#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
 void radix__kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	unsigned long addr = (unsigned long)page_address(page);
-- 
2.25.1

