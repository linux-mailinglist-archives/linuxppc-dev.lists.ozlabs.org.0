Return-Path: <linuxppc-dev+bounces-1439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4679697C2F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8KtL31F9z2yFK;
	Thu, 19 Sep 2024 12:56:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714618;
	cv=none; b=DsDJTQWxefxyLpB/XYy7UrWu00HYEQXhvd5fM+xM4Kjg6mKilD1Pcz4os1nFPhukSMuFa/1nfJAgWib8sM+jprJeLu4C66m5qWRdGjdGrt2U9uX665888hHpvZCqx5U/yhWJGx7X+98cZ3gL9lifCAj9QtWBDp9IIsprmsxXzrpTAVGgxjiTlQQDgo1Wp3bD6x94EUJDK6bL6sPGtjZ2myn45+RIB3/bXJtJB1tiV2nacOk+LShAcsF7yReCTx+R5U1za0xGD0mJG6/lTKw32bOGxQ0tkCfdy8z2FiDLn9SdLqtudMoBA7lbhxtx43DXFRBylUJqC4J+I5DAzGVMNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714618; c=relaxed/relaxed;
	bh=/MHsxmP9bN1bxx4msR28qZ2la9zK0wSY8EDrce3K+zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VktdnUtj2/YvSMbmPL7bSy7qFMxkJ8dKzePbMLd+0QwUQ8w2zN0KpSZcoU1CiqvO+XbLAsr5JxHdfEDR3i3BsqVyOeNWx5zK7qe8cWfoi2oLsHNH7VcC6fNdMza5JhzfAYiyAqRLwO+NGR/0hUR0iiJIC+r09kqtptoCUN3xUz32TCRscj0BjGLwvNt5WPAgzr7JrUWz2IO1UHGd/KZsZHmmJx0H7wDRCYJ8qcE/G/Wpt/I5A/kT9b1M9jvCaLIuPHTkTt7VkO6wHxbMsUOp8eu3OTME7dig2AjbXJ4VCAzYecTD8yBwb5Iamb5bBAaFiSE+XruVOpdn/++8Ss6vhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EvNuf52f; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=EvNuf52f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8KtL1F30z2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:56:58 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-206e614953aso4774565ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714615; x=1727319415; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MHsxmP9bN1bxx4msR28qZ2la9zK0wSY8EDrce3K+zQ=;
        b=EvNuf52foIRNsnD25tiyaDMIMBO2FckMuJ5J0Oi737r8GVA6y1zsmy9YiDzQkzv2SY
         +2BgwHkn+Byrk+zTWtX/nGFoPowFHFACMCN1wbigF2UpBwpzO5VUQMWnr0JmC4xfBrr0
         5s5AvhxH0c0Avwd8vfk2mXmMVYvTC9iBsR60YGXUQ+jjjsk1oeLVK9/08yejYQcFpFGa
         pD+3Ojj4vHIQiO4YUNyyimrrqFDTluCDgXeq37Kdu8uvY+A1zDVuZ/9QpF+5eCKphl8Z
         I1m4IKlR2wxxN6Idr5AzycctyoyJzPSX9DQQkzE1FyxSTXFZgD7ArbCJt7R6WWxLpjIM
         cQZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714615; x=1727319415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MHsxmP9bN1bxx4msR28qZ2la9zK0wSY8EDrce3K+zQ=;
        b=eAufHXJdTWjQn//pT4/y+HOTDdqDM8XK0ka/Y49ulLjy2O1C3yYWcnqtpxzvqoOF0h
         L1DhgDdUehl+z5zyYqpZKML5l7Vqnv7KwXTdLQKEklR+kNvnGmY7JbY380HYsHQVq0hc
         nujTwK34Q6hnQuTBNhqp9piv79or57LQwcI8NwQQtGqZC5DEZe+M3KPIKKvG3fJvf43e
         orLl0A2biFm5Udm49bxtxHNbWSR5FhQyx80vYD8G+nEMgx3qIgTO36m69EG+C9E6nea0
         ZTncK8jiknBUQZ0gRLeOTGHbad5S2tIadoSAr84krGI+jt1pg4zKw5nI8QDjFdDzLLNC
         IdHg==
X-Gm-Message-State: AOJu0YxXs5F5gyOKcwX5Mu9Xg6Zu04hUKNhcoZjtwH/6JGgghwVdgKp4
	H9JfpQ3oPYUhOVAQ8Crf5yIZvJPDmpzs6idHKqivUz3tSwteTBo4CHKW8Q==
X-Google-Smtp-Source: AGHT+IEGxeiVxZh5o9vYhwB8mBVBHLv/pSg64zA2+3t1GDmylunq7BBEStCgtPZymo2nVWUT4NL8Bw==
X-Received: by 2002:a17:902:f70c:b0:206:8acc:8871 with SMTP id d9443c01a7336-2076e39c331mr311700805ad.31.1726714614667;
        Wed, 18 Sep 2024 19:56:54 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.56.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:56:54 -0700 (PDT)
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
Subject: [RFC v2 06/13] book3s64/hash: Add hash_debug_pagealloc_alloc_slots() function
Date: Thu, 19 Sep 2024 08:26:04 +0530
Message-ID: <47af6bef68ce0a82da4694174f004d11519e8757.1726571179.git.ritesh.list@gmail.com>
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

This adds hash_debug_pagealloc_alloc_slots() function instead of open
coding that in htab_initialize(). This is required since we will be
separating the kfence functionality to not depend upon debug_pagealloc.

Now that everything required for debug_pagealloc is under a #ifdef
config. Bring in linear_map_hash_slots and linear_map_hash_count
variables under the same config too.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 29 ++++++++++++++++-----------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 6e3860224351..030c120d1399 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -123,8 +123,6 @@ EXPORT_SYMBOL_GPL(mmu_slb_size);
 #ifdef CONFIG_PPC_64K_PAGES
 int mmu_ci_restrictions;
 #endif
-static u8 *linear_map_hash_slots;
-static unsigned long linear_map_hash_count;
 struct mmu_hash_ops mmu_hash_ops __ro_after_init;
 EXPORT_SYMBOL(mmu_hash_ops);
 
@@ -274,6 +272,8 @@ void hash__tlbiel_all(unsigned int action)
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
+static u8 *linear_map_hash_slots;
+static unsigned long linear_map_hash_count;
 static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
 
 static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
@@ -328,6 +328,19 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
 				     mmu_kernel_ssize, 0);
 }
 
+static inline void hash_debug_pagealloc_alloc_slots(void)
+{
+	if (!debug_pagealloc_enabled())
+		return;
+	linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
+	linear_map_hash_slots = memblock_alloc_try_nid(
+			linear_map_hash_count, 1, MEMBLOCK_LOW_LIMIT,
+			ppc64_rma_size,	NUMA_NO_NODE);
+	if (!linear_map_hash_slots)
+		panic("%s: Failed to allocate %lu bytes max_addr=%pa\n",
+		      __func__, linear_map_hash_count, &ppc64_rma_size);
+}
+
 static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot)
 {
 	if (!debug_pagealloc_enabled())
@@ -361,6 +374,7 @@ int hash__kernel_map_pages(struct page *page, int numpages,
 {
 	return 0;
 }
+static inline void hash_debug_pagealloc_alloc_slots(void) {}
 static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot) {}
 #endif /* CONFIG_DEBUG_PAGEALLOC */
 
@@ -1223,16 +1237,7 @@ static void __init htab_initialize(void)
 
 	prot = pgprot_val(PAGE_KERNEL);
 
-	if (debug_pagealloc_enabled()) {
-		linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
-		linear_map_hash_slots = memblock_alloc_try_nid(
-				linear_map_hash_count, 1, MEMBLOCK_LOW_LIMIT,
-				ppc64_rma_size,	NUMA_NO_NODE);
-		if (!linear_map_hash_slots)
-			panic("%s: Failed to allocate %lu bytes max_addr=%pa\n",
-			      __func__, linear_map_hash_count, &ppc64_rma_size);
-	}
-
+	hash_debug_pagealloc_alloc_slots();
 	/* create bolted the linear mapping in the hash table */
 	for_each_mem_range(i, &base, &end) {
 		size = end - base;
-- 
2.46.0


