Return-Path: <linuxppc-dev+bounces-1436-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A58E97C2EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:56:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Kt43MpBz2yDY;
	Thu, 19 Sep 2024 12:56:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714604;
	cv=none; b=fc81+Fvw3mnkQw2EPqjxWhPZfdaRVhKk1DWZWjqyrxwgQW6Rj7uYBhagZsDV48C2/WpFm4yvF+SiDOtXhn4An71Pcv3uXnbynvkjSnZNiG2YTH2z/ZjrQX3IrDms3era3jN7p7Y+Dx7vq+qgmvAKIAESggximYJ55hzXqPisJ7GEDS5e5Oi91YIrrAB087obreyEvhDOKpH24MATQ2gKc9TnlXzKLEayvstxliaCyH2NcmH+yVKAeDS3FZ4hhcsYyl9p5U5IYnFd5uDwFvMTDTGaz8lJvVI2zxO2zFnJmw+jPO6AlyaOOmlTwF6ZHEBQSEGmAScYv1mXjw4Bf/BGFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714604; c=relaxed/relaxed;
	bh=9gdBU6NTSnQ45ASWgUOhpCdQmMAIjthCFPvKHCG5k1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RonDm+9Ybt6ojoRQd7Fua2dMw6utotrWqea60TqRHzNNe8jwWN0d5czabuBBvuo8iYULrKWHKAqHdsBTdEDLKrzSsePHiMdKWb3j2q72AfEUG3bPgiSxfpI1pPj968/RDvw04TLKpHllQUqpJVJ5UmCsa8FVuSzEQ9x1Izu/SNBKl96IK2+vOFbXOiOUDJpE2DoZ2gil+HOR4xzXjMF22PB0Qu4AdxMKgbHSN7MjIdeuDOsEMy0DpMm3hFg/czURAjVl24dkWTlvsRXUH4ok7VQWiNXqgKKbHuc7U8M/5RPpo4360oDzsS+tM1OmLmoPPLHeaSUgsXMn7gny+bbPPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QQJDsqz4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QQJDsqz4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Kt40tXtz2xHl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:56:43 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2053616fa36so5557755ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714600; x=1727319400; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9gdBU6NTSnQ45ASWgUOhpCdQmMAIjthCFPvKHCG5k1I=;
        b=QQJDsqz4r15m5B/aa4HNLzdU139TjzHOfhydmmXByFhhcT0qMywxpiPcCDlcYBXnEN
         M0p1ztjCjFVwBckmatEWqbYUrgcgHPPxakYy/+VkgWvPKSPH8AAtQk3muE4urTanAQZc
         6G2c8b6w3zcv7tcWFHqCnMxDUTrBAWO0V3VsXxaJR6YNjyfHFATL+s/nU5Q02kOPM9u+
         QmAxykrOjX8/5+y57nNSYKl1e0eg0UWuEJcaAXZvdzGL8jQcsAIONvq9U9Wkeki2RnZ+
         76/Aw6+TT8+DD0NVoR8ZlS0nY+lDp4h2Oz0Z4lSAMqwxZ9p8GEVKybY83E7JaP2QPLDF
         84lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714600; x=1727319400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9gdBU6NTSnQ45ASWgUOhpCdQmMAIjthCFPvKHCG5k1I=;
        b=QtbI2av4bnEANabbTqrJQm+vOmDMu6CfPQevTI5R1RoTWIXXIXgNjsDkl8Ch5fmCw4
         PkLDQNA9AiEJF2R6pC5xLuvROXYDdM9IPvwVyMWuIWop+rFIS/+7bmV24zWTya7Jk7B1
         jhrJmVTiLeE7cbagp6jocW+5/AoaWBAQwWQ9dhvYK9vqMc6m9AXbhU2Wa1GRZB+/AAhF
         2uCE0tu5tJggio6kw1fKWzyZkhZn7dq3G20KPjB0lcP5KpMGFRdedyi50RKdnQjjx1xs
         j3dKhzmLMf2aNpQjwOJQ3wCroSnhg59GfozX5xXpuwJCgstjAE1mfBbhEMk2SzLbN4Am
         hfSQ==
X-Gm-Message-State: AOJu0YxXxJ6IGE4F5qNnTZh+pHvYQtphi5L9chuOOUcQQiC9EIyFuZ7P
	2shGhtfHugTRq4zitdV25Mq4OwwQu6TEfKOqpm/RwSei0zJulRpHIGhBRg==
X-Google-Smtp-Source: AGHT+IEErXbCyxVJ/WoGn8BSiRcCs9SEMeQSmif53htHavGlyC9/1FoEX9bAXEfU4wjU0v/bb5Bxuw==
X-Received: by 2002:a17:902:e812:b0:206:c75a:29d9 with SMTP id d9443c01a7336-2076e3eb0cbmr391823725ad.42.1726714600089;
        Wed, 18 Sep 2024 19:56:40 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:56:39 -0700 (PDT)
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
Subject: [RFC v2 03/13] book3s64/hash: Remove kfence support temporarily
Date: Thu, 19 Sep 2024 08:26:01 +0530
Message-ID: <5f6809f3881d5929eedc33deac4847bf41a063b9.1726571179.git.ritesh.list@gmail.com>
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


