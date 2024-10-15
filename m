Return-Path: <linuxppc-dev+bounces-2248-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E5599DB95
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 03:34:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSGpk2Mgrz305n;
	Tue, 15 Oct 2024 12:34:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728956046;
	cv=none; b=Vm8QaHPufq663UKhzu8wn7zt6/ITMPDtWm5RaK82ihP94UJNmJLfFYBGDUfWH1BwSJCBF7YM8XTBmGWvFqAvoVJDhoWvZazcXEP21x90s38/SPs5ZQk1woevt88Fg6fEiPbdU0yLm8Wb6hmRpXRiWOoN6Nl88Z0WODbQ9m+ocpjRfpw63JLyK07Cjl2wtWHpBrZN2vvz1en1iGG/x45UyUCR4ZgAAFINhnS7iEAhAnhKaV781KhdGrt/jnbhq0P+2zmR7WHaD0z8trtrqIYbIUpnrUxW2j9liZWJYVHBz0NaBpG/dpv5y+Bmenwv0+cbvkPlo/JS5POOV3YD019bag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728956046; c=relaxed/relaxed;
	bh=9gdBU6NTSnQ45ASWgUOhpCdQmMAIjthCFPvKHCG5k1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agoJJ8H4qDDjM7k71S6aP5rQJXRusvVSxty4YM/opTQfLUY6T/58zVjq1ogsG5jJJU4sl6+wlFF8GDQQtETwVWXn+iRyxR5dXtEYK2dZ7yhCpq9GVgSwXJVtdZYANb5CHeBACH22znMMizR/pCgGTpVmptVth4uFEm78BK5vCjJQurF0aJf1gqEocuokGov/jHfXxoRY5Vr8sWt9Fa4cLjeR0gD4P/rwrs0k49tf/VZZbrKRs9t6etSRVqX5lmPU0ugQDnoy+mYqeq7vPDjBpk5SKvQJI7BuD81Fu2AY6DbM+ZhgUK9gXOZat183KfdEkGyy598vLG66d4mSXfu7Zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jZfose3Y; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=jZfose3Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSGpj2wHLz2yY0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 12:34:05 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-71e681bc315so921859b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 18:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956042; x=1729560842; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gdBU6NTSnQ45ASWgUOhpCdQmMAIjthCFPvKHCG5k1I=;
        b=jZfose3Y/PcvX66MLJf1dAdVa2hgqpr0AQol3vg42uVRTatfSJ3Yzi2nKlxtZ6jZKS
         5ZwWq99xiNhOxTp6PEid/Ha4J2sdIjEXyseyNctylBweTyAPEE2g0yVsChEoiCSm5Xhv
         pIaYfyCjYK3XYVqqvfjvLU5lD10yFXjxNXRnu177Mhsq6QKrNIMTzA/8oBUCT8y5QYYv
         cF/Z+EKY9RT7VwsqMTq3toSUK0urv7+EoKqNhQ7SmDpSJ2X+B9SptXqR02F87T1JS8NB
         3cykRGqTVTgX2iIIoM+o77IEF7SWqUgU2rmdXCJ2RcJPEs4bs+/9bPEC4bwK6M457zdD
         J8/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956042; x=1729560842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gdBU6NTSnQ45ASWgUOhpCdQmMAIjthCFPvKHCG5k1I=;
        b=HND0TmwD2BFulxdIiMi8gmQXYIQS2/fZid/rKZUZB9ezLrChyo/VLO3E2kP/0QC6lb
         g0sT5x1vL80O+c6QOsjiqmhiylRht/CO5fO+xeHLvLkab5/94Du8pp+7LTaKJ8KRg7Aa
         B3SsSmQ/qnUGVTqJVJMY8MWMk7hOcmEsVBMIO5tLQwclEzE/Y0fz6S65tNdwnfZGVcZ+
         gtJ2bkcPCjW69drx7qKu9yauwJ2QQquXuoBGpkMTNbyqS0PpL4iGEQefOsVvQZqMSx+G
         Z/2L6vZWTKbveQQXCdEy3F7l900XjUC0Jl32m8frV+rZZoASuFH6EKA/+cUd+0XU/wQk
         DNbg==
X-Gm-Message-State: AOJu0YwzbzQu37LLPI12uHkXRyF12Is+XLJwYHn48cLomo1NlQxVKltQ
	ST4GPwnhNdtFB3Wsl8T2O3YaNafwTS9q41pH58M2eaDLciDjNkKniIqKjw==
X-Google-Smtp-Source: AGHT+IEiFeaAHOWvlSRTf6MSOaFyHyrBNKW3yk4oAKnnkBoJktpp0QXSxa/Okqxxx4ycP0dnhBWBFw==
X-Received: by 2002:a62:f252:0:b0:71e:5709:2330 with SMTP id d2e1a72fcca58-71e570923afmr12036633b3a.7.1728956041587;
        Mon, 14 Oct 2024 18:34:01 -0700 (PDT)
Received: from dw-tp.. ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508562sm189349b3a.186.2024.10.14.18.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:34:01 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [RFC RESEND v2 03/13] book3s64/hash: Remove kfence support temporarily
Date: Tue, 15 Oct 2024 07:03:26 +0530
Message-ID: <00ba1fdbf7e135fab9d3d1c8872674079452446a.1728954719.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1728954719.git.ritesh.list@gmail.com>
References: <cover.1728954719.git.ritesh.list@gmail.com>
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Kfence on book3s Hash on pseries is anyways broken. It fails to boot
due to RMA size limitation. That is because, kfence with Hash uses
debug_pagealloc infrastructure. debug_pagealloc allocates linear map
for entire dram size instead of just kfence relevant objects.
This means for 16TB of DRAM it will require (16TB >> PAGE_SHIFT)
which is 256MB which is half of RMA region on P8.
crash kernel reserves 256MB and we also need 2048 * 16KB * 3 for
emergency stack and some more for paca allocations.
That means there is not enough memory for reserving the full linear map
in the RMA region, if the DRAM size is too big (>=16TB)
(The issue is seen above 8TB with crash kernel 256 MB reservation).

Now Kfence does not require linear memory map for entire DRAM.
It only needs for kfence objects. So this patch temporarily removes the
kfence functionality since debug_pagealloc code needs some refactoring.
We will bring in kfence on Hash support in later patches.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/include/asm/kfence.h     |  5 +++++
 arch/powerpc/mm/book3s64/hash_utils.c | 16 +++++++++++-----
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
index fab124ada1c7..f3a9476a71b3 100644
--- a/arch/powerpc/include/asm/kfence.h
+++ b/arch/powerpc/include/asm/kfence.h
@@ -10,6 +10,7 @@

 #include <linux/mm.h>
 #include <asm/pgtable.h>
+#include <asm/mmu.h>

 #ifdef CONFIG_PPC64_ELF_ABI_V1
 #define ARCH_FUNC_PREFIX "."
@@ -25,6 +26,10 @@ static inline void disable_kfence(void)

 static inline bool arch_kfence_init_pool(void)
 {
+#ifdef CONFIG_PPC64
+	if (!radix_enabled())
+		return false;
+#endif
 	return !kfence_disabled;
 }
 #endif
diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index e1eadd03f133..296bb74dbf40 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -431,7 +431,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 			break;

 		cond_resched();
-		if (debug_pagealloc_enabled_or_kfence() &&
+		if (debug_pagealloc_enabled() &&
 			(paddr >> PAGE_SHIFT) < linear_map_hash_count)
 			linear_map_hash_slots[paddr >> PAGE_SHIFT] = ret | 0x80;
 	}
@@ -814,7 +814,7 @@ static void __init htab_init_page_sizes(void)
 	bool aligned = true;
 	init_hpte_page_sizes();

-	if (!debug_pagealloc_enabled_or_kfence()) {
+	if (!debug_pagealloc_enabled()) {
 		/*
 		 * Pick a size for the linear mapping. Currently, we only
 		 * support 16M, 1M and 4K which is the default
@@ -1134,7 +1134,7 @@ static void __init htab_initialize(void)

 	prot = pgprot_val(PAGE_KERNEL);

-	if (debug_pagealloc_enabled_or_kfence()) {
+	if (debug_pagealloc_enabled()) {
 		linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
 		linear_map_hash_slots = memblock_alloc_try_nid(
 				linear_map_hash_count, 1, MEMBLOCK_LOW_LIMIT,
@@ -2120,7 +2120,7 @@ void hpt_do_stress(unsigned long ea, unsigned long hpte_group)
 	}
 }

-#if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_KFENCE)
+#ifdef CONFIG_DEBUG_PAGEALLOC
 static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);

 static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
@@ -2194,7 +2194,13 @@ int hash__kernel_map_pages(struct page *page, int numpages, int enable)
 	local_irq_restore(flags);
 	return 0;
 }
-#endif /* CONFIG_DEBUG_PAGEALLOC || CONFIG_KFENCE */
+#else /* CONFIG_DEBUG_PAGEALLOC */
+int hash__kernel_map_pages(struct page *page, int numpages,
+					 int enable)
+{
+	return 0;
+}
+#endif /* CONFIG_DEBUG_PAGEALLOC */

 void hash__setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				phys_addr_t first_memblock_size)
--
2.46.0


