Return-Path: <linuxppc-dev+bounces-2382-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 281A99A44A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:30:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVWtx3yhqz3brB;
	Sat, 19 Oct 2024 04:30:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729272633;
	cv=none; b=mX1TGoD7jEt2OS64vlkC4ks2rR9jVy70ighuYfAT0yqYRz7s1Jgw4GjyNL8Q5ar9JXFAyobYLppqx8cl5IjBqIwa9padK7a/sVrCIDI5c70xfLrOQ0cF9NKdHjPzfk3aJyoeZcmQB5akmu4T3INU/Qkkg/DsCvfuPTmYV8sQ9uWSynA/yRKd7Zb3bU8+c/2unI529UZG/RK7SiRBp0yq40Wvwg1V2T/AzOUkWGaKjmhyiXTIiWckZsuzCJkAA0ekoDySsBqP5/ilEChcgg77gpbmOYQl2ogh2ufE4LQY1EVqkHIhJIawpCdORTB1eYrvJ30u/TlHuD43yYiPPrLV7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729272633; c=relaxed/relaxed;
	bh=Y7m6nw0SlLNWzWwVTYubL573BHmMjcLP6yP7O1snSbI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e5Vhqbv8Svi9A7jAiJuF0my09IubkHfKHy8kYKKnM0lRhppSCGZFRecQxqGQk/OvZg5SVxIzOWzx5n1MSpi4hlMPQOpuK10KmmSpc9O3SByuSGKwTo1OC1ibCnM0MSpzm4tYR41AVMwl0zBcFkGDNetei1mdpQ6vDXfsZy/hONU9SJleSHwB/jKGGAay3t3J/VqbjJTGmnFwSbN+qeeDBaUbpnaaofivrNtE2JkHJCND+pxLUFqyYHlRg3ZKdJ4MaO7+gqbtBA70ukaT84TVjdwdtsyvCAqbLR5AmQiK1t7dWo/ai+eXmxVw7rMqLZlfeIWyFwExyqBXuj4oRVdF2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BNKr+vvI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BNKr+vvI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVWtw49t3z2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:30:32 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-71e4fa3ea7cso1942330b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729272629; x=1729877429; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7m6nw0SlLNWzWwVTYubL573BHmMjcLP6yP7O1snSbI=;
        b=BNKr+vvIy5HypMuLwG7OG0DuUbOzsgYVPIc9P5VSIayIIzu7zG3ZD73F0zGRrpkOxn
         75YgwYTLU1zLvzX4ld0FcIi7PCqNkjqWNM0Hg5TDXeZj02c5atLZGhgSENvXGHdortBK
         9uaEzhPtXpnm8ZxGUF7801QKQriEjPjJv+aMpz1bdkTf1fp3Mey4HcVSm/PkARgcHhmH
         WgO+0CFHryPjdJT1GLX+EyUiZUa7injMvoKwQ14Jd7DDmeh4Q/4I87XBXeUPKDsQRTFL
         TRtWqpuIivJDPVIwpevaVQiNpPCGdzObRFygAy9fxxdo3laH1E2CHsp4M3fhI/A0mik4
         o0RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272629; x=1729877429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y7m6nw0SlLNWzWwVTYubL573BHmMjcLP6yP7O1snSbI=;
        b=LsBulpSfMyoQqPs9wDZlIHuMTEgcfz3++iQJ1rZcTQG8572QwuFM5sE3kYKnDf6Ggt
         FdmKusvfyilDT9X/2yJ6Be9+lCFKyFn2exoOwxRcD9nXfBtt9N5jdrQByzx42OFAq6OW
         o8nNwNAIwIwVD5zg0ZRa7njUXZ1L1rp/dmpw7NAHMfpP/k8i2ehFPsuj3wPxuzGBOAoF
         Xquce1x5RebhS6X4hagjptcFtcdGSgZK0b3tKb2n9vX0VJj3kkRurcW6N8UO7NkRc5E9
         aaZMT+PNdMirTrgFpZqD6Ik0xlDlpomFIHcoL/bmjOe5e35VFEBXaaLMGMIgU0UYWLBP
         XSTw==
X-Gm-Message-State: AOJu0YydzZ159iG1jXTbuEmwR3xRhrWfe4JjsN3I3Gm8BrRyN7+RfUMf
	odhUzhSe6eqm9M9ZbkPyt7pVAaqSeVIb2oTQ3uMF9VHnAUyuYFcF/eIvuALS
X-Google-Smtp-Source: AGHT+IH29uhXoWddJW63rmOfdUmm3F60bMAd8Lb1nxktQLiJXibpBjYFtPZvdFulLgU3PQV9sp2ESA==
X-Received: by 2002:a05:6a00:3e0f:b0:71e:4a1b:2204 with SMTP id d2e1a72fcca58-71ea331b398mr4152501b3a.25.1729272629392;
        Fri, 18 Oct 2024 10:30:29 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f51sm1725242b3a.36.2024.10.18.10.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:30:28 -0700 (PDT)
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
Subject: [PATCH v3 02/12] book3s64/hash: Remove kfence support temporarily
Date: Fri, 18 Oct 2024 22:59:43 +0530
Message-ID: <1761bc39674473c8878dedca15e0d9a0d3a1b528.1729271995.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1729271995.git.ritesh.list@gmail.com>
References: <cover.1729271995.git.ritesh.list@gmail.com>
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
index a408ef7d850e..e22a8f540193 100644
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


