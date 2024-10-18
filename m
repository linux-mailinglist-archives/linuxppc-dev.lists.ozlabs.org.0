Return-Path: <linuxppc-dev+bounces-2385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4B99A44AC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:31:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVWvH12Z9z3br7;
	Sat, 19 Oct 2024 04:30:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729272651;
	cv=none; b=jCAqrqojABCpxQ4zFu3qc+UTn/AZwi9qsEHalW2bOeXIzBXZcQL9LAtwnb66kvVVqkktWIumoaFfyxKo/dgxXgJWx8UsOSKgnZ2tVBnYnEKwfcjsBWuCjC93XHQ0xA3FTHu5rveLwJlMLjxweYeSIILpqjFeyB0Y9Ev9F1d44SGXAUN1oUnW6KZ1DyhZxmu6zDvefodQnJYi9Nb9nchj997mD7BmlOE2wXRfFjjY3YTSchGncQzgarsRT4G+RqewL8gWnTjszzJ800kZTHkhWFq+hD+3xLk0gVcaZ3J9c5ggvKs39Q3Hxof38kgbI9MF74ziyAcC/lIywbZhiqnfdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729272651; c=relaxed/relaxed;
	bh=DfUSdtWOnTBS3aUaneALBJjz6yO/1MpkxmVLk8hKBQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jxDl1eXr1DOHaeCWXCAibVFqI+70cDAadAxwlGycXd4HY+DPaJLbTF9XS1wlScZAE+2py4243akcGIGYaZHHcYFY41QVpAamnFudDH/nDj+Z3iikdCF4oycsGp/2AtftE72ttXlvmA12AC5g/cWKUa8FNNVsOGcF2LpxavamBnhcH1EKYzyFE+LN+VGbw9rD+7ck/zFYnUgxl5kDx9RzWDypqiIBh8pS/Y+xNo50NKB31JT9e+Db548TBYC+QobPEwg2rHF97EP9/Uy0aKR4bwKQ9ozVTOVR31OJe6S4XCevjO3wjr1AH+jQstbikcqwubGW3VeoNLX92zdTo/Zf+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J34nHRdH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=J34nHRdH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVWvG289Gz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:30:50 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e579abb99so1707102b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729272646; x=1729877446; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DfUSdtWOnTBS3aUaneALBJjz6yO/1MpkxmVLk8hKBQI=;
        b=J34nHRdHKFIlsNcY2rHZjj18dz9Yjm9QvuRQHqBk+vw/7DJ3QBn2fWWpdnCMChedLy
         0bra/7982igwcKyC1fxqt7WQFfdjY5R8jtdgP8I8ve2nH1hAAS3YrQvwnJtJFtbD7Y2A
         w2WTctqrIj6xk1f3rSxMMhLQgaAB9yS01dR1KpbaaBwpVbv8Hz6r4jaLlsI3rUFp3qwP
         oWcAp0yTqR/ra5J2X/cCbihOLDAikmUDEst9cFUDkulT8C3sMx0B/+/GbxWLnUm5GPwo
         ct73uoyu1cHvtwpBD0KAf4m6Qncgb3//dtDAX0Ta4xmsV6sz+2EDdWX8T/OOgu6e/YsD
         7ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272646; x=1729877446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DfUSdtWOnTBS3aUaneALBJjz6yO/1MpkxmVLk8hKBQI=;
        b=m5NqwpqVraw5j/TngEo3ni2EiFLrmJ/M/9Ds8I6hb8H/DM+6oP5fBVxNsuZ21U21jx
         wF7ZFZ4fDp77deyTsCFBWxBPBr4SFYveOHkO7I5J9H16hA1xNmNhFy/WjdFBDcPyIIMc
         PydlkktiGDUnJMToX15hxUQ5kPQd18y5bOd9rn2V5VAoFwAidCdbRvjAmGbUDozNdyFE
         i2vBh8QYam4ycYhAS1S1uqTWJxw01d10ym0gf3WLm44ATN2PTVmk2GlRSYgDwUYNm2Z0
         ieoqQ3Zg5HeNdSCtlvqpHFWWlGULV6yIqErrkFBZ0ujWjaPAJzjlOdMCzpXKwJs9G+15
         Fz+A==
X-Gm-Message-State: AOJu0YyA3CP/9W7QFduGgVTs401T0Jrvfz6SltnSNh7du6AVhgt2qhrq
	lECyDAX/hmUHoYj/LYxIK+3VMg3FvsgyYBrOhf5tX2f5mNaxVFH+LFisFzsU
X-Google-Smtp-Source: AGHT+IEH/PHoy0SvfRofUPBZ0xaaeQuP6mqbjcomFuXt7qmLHoVJL01TXC7JEI5XORTcA+JdNts71g==
X-Received: by 2002:a05:6a00:6618:b0:71e:4e2a:38c4 with SMTP id d2e1a72fcca58-71ea31e53d5mr3448284b3a.14.1729272646416;
        Fri, 18 Oct 2024 10:30:46 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f51sm1725242b3a.36.2024.10.18.10.30.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:30:45 -0700 (PDT)
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
Subject: [PATCH v3 05/12] book3s64/hash: Add hash_debug_pagealloc_alloc_slots() function
Date: Fri, 18 Oct 2024 22:59:46 +0530
Message-ID: <d1d5aabe1e4c693a983e59ccf3de08e3c28c5161.1729271995.git.ritesh.list@gmail.com>
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
index de3cabd66812..0b63acf62d1d 100644
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


