Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94514382410
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 08:18:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk87x3lfVz3bvq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 16:18:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ktCuwK55;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630;
 helo=mail-pl1-x630.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ktCuwK55; dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk86y6ZZZz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 16:17:14 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id t4so2538426plc.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 23:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QVQqcOw1udKH2xbvg+LP4+0cXic2VEgD5nU98kv9Fo4=;
 b=ktCuwK55zyGL0tiLiao4ClIXNWifLzQKH789v9/7vLyK34FFqjrHYq48k5LjGC1/NI
 v5j4QTlJXrjOoVdeSxFszAQgQ9lSMeDFj+NfaATb5gBE5Th28l3Nhe3Sz5d+g+T6U4D5
 fEcdMiM+uac66onxyWfaoDZYxcc58qvtaZRAlygFi6XWHx20KXMuJoAb99UcELJqZcu2
 EQ45deKvgFXJACvvtuFQXkMJ/Ah1h8mX0Yu+q7hCRBahTKYp9/ItyRdcHJqtkcgZ3tFQ
 Rvcd5UQuNlHrudhhMhskNzEQyi68sXHILlwmtjHDgiHUp6tD/YHaTIILEwm+tk2i98bP
 pP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QVQqcOw1udKH2xbvg+LP4+0cXic2VEgD5nU98kv9Fo4=;
 b=JKOitk//pOm822vung86jSnHvz2pUre5j+cG5EhhkxhMz37QAXnSe5FkMcClRDqdS4
 rrm0OI1GD+U0ZAIfs2Ym6/yh319if/9MUb8iKD/XareAYB83MnldtzsadavzotFqyJxI
 VmQZ4WfmHIb8GCunk8Es9PtKGOMfPml9kqmDu6jwJ4meZ6n3dns7y5HUSMWI61GUYhic
 zwpq1JAggVcmmDNN9PIaDJ4oVRBPKdPrdSwXwaZ9OGc9GSBw2zlmwe5m9DlzVqH0lBnA
 feS5J8QHuV2DFaDimqCfwklgtal/654SBIYwW3n2IA+StTnjzAD2WJL7l4swp7xfMw+U
 obsw==
X-Gm-Message-State: AOAM530X6cOPuz5e4llzMmEebK/6qkEmvqtVytSvbYzm8hZfxvuz5KAn
 hHtzKK/6kIqtD/zHeIVI4eZnHjV9qTE=
X-Google-Smtp-Source: ABdhPJzVMCFVQCvIxTTlXIiTtyylnc4SPnWNhbNVwXWQdJMQ6W1qLQRQNZqjoC4zpM3o5BZu5ifBqQ==
X-Received: by 2002:a17:90b:3b8a:: with SMTP id
 pc10mr65410524pjb.203.1621232231760; 
 Sun, 16 May 2021 23:17:11 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id gg2sm1505327pjb.45.2021.05.16.23.17.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 23:17:11 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/64s: Add DEBUG_PAGEALLOC for radix
Date: Mon, 17 May 2021 16:16:55 +1000
Message-Id: <20210517061658.194708-2-jniethe5@gmail.com>
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

There is support for DEBUG_PAGEALLOC on hash but not on radix.
Add support on radix.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 10 ++++++++
 arch/powerpc/include/asm/book3s/64/hash.h    |  2 ++
 arch/powerpc/include/asm/book3s/64/pgtable.h | 19 ++++++++++++++
 arch/powerpc/include/asm/book3s/64/radix.h   |  2 ++
 arch/powerpc/include/asm/nohash/pgtable.h    | 10 ++++++++
 arch/powerpc/include/asm/set_memory.h        |  2 ++
 arch/powerpc/mm/book3s64/hash_utils.c        |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 26 ++++++++++++++++++--
 arch/powerpc/mm/pageattr.c                   |  6 +++++
 9 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 83c65845a1a9..30533d409f7f 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -417,6 +417,16 @@ static inline unsigned long pte_pfn(pte_t pte)
 }
 
 /* Generic modifiers for PTE bits */
+static inline pte_t pte_mkabsent(pte_t pte)
+{
+	return __pte(pte_val(pte) & ~_PAGE_PRESENT);
+}
+
+static inline pte_t pte_mkpresent(pte_t pte)
+{
+	return __pte(pte_val(pte) | _PAGE_PRESENT);
+}
+
 static inline pte_t pte_wrprotect(pte_t pte)
 {
 	return __pte(pte_val(pte) & ~_PAGE_RW);
diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index d959b0195ad9..f6171633cdc2 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -179,6 +179,8 @@ static inline unsigned long hash__pte_update(struct mm_struct *mm,
 	return old;
 }
 
+void hash__kernel_map_pages(struct page *page, int numpages, int enable);
+
 /* Set the dirty and/or accessed bits atomically in a linux PTE, this
  * function doesn't need to flush the hash entry
  */
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index a666d561b44d..b89482aed82a 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -651,6 +651,16 @@ static inline unsigned long pte_pfn(pte_t pte)
 }
 
 /* Generic modifiers for PTE bits */
+static inline pte_t pte_mkabsent(pte_t pte)
+{
+	return __pte_raw(pte_raw(pte) & cpu_to_be64(~_PAGE_PRESENT));
+}
+
+static inline pte_t pte_mkpresent(pte_t pte)
+{
+	return __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_PRESENT));
+}
+
 static inline pte_t pte_wrprotect(pte_t pte)
 {
 	if (unlikely(pte_savedwrite(pte)))
@@ -812,6 +822,15 @@ static inline bool check_pte_access(unsigned long access, unsigned long ptev)
  * Generic functions with hash/radix callbacks
  */
 
+#ifdef CONFIG_DEBUG_PAGEALLOC
+static inline void __kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	if (radix_enabled())
+		radix__kernel_map_pages(page, numpages, enable);
+	hash__kernel_map_pages(page, numpages, enable);
+}
+#endif
+
 static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 					   pte_t *ptep, pte_t entry,
 					   unsigned long address,
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 59cab558e2f0..d4fa28a77cc6 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -137,6 +137,8 @@ extern void radix__mark_rodata_ro(void);
 extern void radix__mark_initmem_nx(void);
 #endif
 
+void radix__kernel_map_pages(struct page *page, int numpages, int enable);
+
 extern void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
 					 pte_t entry, unsigned long address,
 					 int psize);
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index ac75f4ab0dba..2a57bbb5820a 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -125,6 +125,16 @@ static inline unsigned long pte_pfn(pte_t pte)	{
 	return pte_val(pte) >> PTE_RPN_SHIFT; }
 
 /* Generic modifiers for PTE bits */
+static inline pte_t pte_mkabsent(pte_t pte)
+{
+	return __pte(pte_val(pte) & ~_PAGE_PRESENT);
+}
+
+static inline pte_t pte_mkpresent(pte_t pte)
+{
+	return __pte(pte_val(pte) | _PAGE_PRESENT);
+}
+
 static inline pte_t pte_exprotect(pte_t pte)
 {
 	return __pte(pte_val(pte) & ~_PAGE_EXEC);
diff --git a/arch/powerpc/include/asm/set_memory.h b/arch/powerpc/include/asm/set_memory.h
index b040094f7920..4b6dfaad4cc9 100644
--- a/arch/powerpc/include/asm/set_memory.h
+++ b/arch/powerpc/include/asm/set_memory.h
@@ -6,6 +6,8 @@
 #define SET_MEMORY_RW	1
 #define SET_MEMORY_NX	2
 #define SET_MEMORY_X	3
+#define SET_MEMORY_EN	4
+#define SET_MEMORY_DIS	5
 
 int change_memory_attr(unsigned long addr, int numpages, long action);
 
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 96d9aa164007..5b9709075fbd 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1990,7 +1990,7 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
 				     mmu_kernel_ssize, 0);
 }
 
-void __kernel_map_pages(struct page *page, int numpages, int enable)
+void hash__kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	unsigned long flags, vaddr, lmi;
 	int i;
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 5fef8db3b463..2aa81b9e354a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -16,6 +16,7 @@
 #include <linux/hugetlb.h>
 #include <linux/string_helpers.h>
 #include <linux/memory.h>
+#include <linux/set_memory.h>
 
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
@@ -330,9 +331,13 @@ static int __meminit create_physical_mapping(unsigned long start,
 static void __init radix_init_pgtable(void)
 {
 	unsigned long rts_field;
+	unsigned long size = radix_mem_block_size;
 	phys_addr_t start, end;
 	u64 i;
 
+	if (debug_pagealloc_enabled())
+		size = PAGE_SIZE;
+
 	/* We don't support slb for radix */
 	mmu_slb_size = 0;
 
@@ -352,7 +357,7 @@ static void __init radix_init_pgtable(void)
 		}
 
 		WARN_ON(create_physical_mapping(start, end,
-						radix_mem_block_size,
+						size,
 						-1, PAGE_KERNEL));
 	}
 
@@ -872,13 +877,18 @@ int __meminit radix__create_section_mapping(unsigned long start,
 					    unsigned long end, int nid,
 					    pgprot_t prot)
 {
+	unsigned long size = radix_mem_block_size;
+
+	if (debug_pagealloc_enabled())
+		size = PAGE_SIZE;
+
 	if (end >= RADIX_VMALLOC_START) {
 		pr_warn("Outside the supported range\n");
 		return -1;
 	}
 
 	return create_physical_mapping(__pa(start), __pa(end),
-				       radix_mem_block_size, nid, prot);
+				       size, nid, prot);
 }
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
@@ -1165,3 +1175,15 @@ int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 
 	return 1;
 }
+
+#ifdef CONFIG_DEBUG_PAGEALLOC
+void radix__kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	unsigned long addr = (unsigned long)page_address(page);
+
+	if (enable)
+		change_memory_attr(addr, numpages, SET_MEMORY_EN);
+	else
+		change_memory_attr(addr, numpages, SET_MEMORY_DIS);
+}
+#endif
diff --git a/arch/powerpc/mm/pageattr.c b/arch/powerpc/mm/pageattr.c
index 0876216ceee6..d3db09447fa6 100644
--- a/arch/powerpc/mm/pageattr.c
+++ b/arch/powerpc/mm/pageattr.c
@@ -54,6 +54,12 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
 	case SET_MEMORY_X:
 		pte = pte_mkexec(pte);
 		break;
+	case SET_MEMORY_DIS:
+		pte = pte_mkabsent(pte);
+		break;
+	case SET_MEMORY_EN:
+		pte = pte_mkpresent(pte);
+		break;
 	default:
 		WARN_ON_ONCE(1);
 		break;
-- 
2.25.1

