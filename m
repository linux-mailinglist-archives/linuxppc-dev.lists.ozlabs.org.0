Return-Path: <linuxppc-dev+bounces-2251-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4FA99DB9E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 03:34:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSGq03wM3z3c1D;
	Tue, 15 Oct 2024 12:34:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728956060;
	cv=none; b=CXzEYXLPyCI/6i47pN0vD5qACWHdoC2Cnvw6mYMCpH7lPWVrTegPkVEkxxxeneZcSMLqLJzA6rqsFbztzO8Nmm7tkz7u5Z3sdas9rVIspRtPxGrX7LAZHP8ou6HXIENNZ6988nYzqi8GJSyOEg7ls0WJyjvSzEXs17wCqn84MF86qmeqfL/za84sxXKvvJ6BqXhFGnViydaTzVUs0oCtmA9cqtaZK+jh2XXKltqciVKxpssSWqyFo3/e+J3pTgtXfhJbcvUqNxSz0Gyim08iRO0RwN8gFHlHGY1YkVp1YMKNDHawzAfoD613XsCuh/blpBVkExbKNmPn5xBehtuVcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728956060; c=relaxed/relaxed;
	bh=/MHsxmP9bN1bxx4msR28qZ2la9zK0wSY8EDrce3K+zQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fX+UnA8t5uGmXq9PMH42QeoNSnyR02yUYWFappxd3Sqys+HXjjkxV9uaYwEr5CTGH+28fM12DcnYO8uqNXDyear1wBb4h9nZE7vf6/wtkCTJAVM8PjjW0wT9+z0XoYY876XMN9m4+nzhLMitcF9UlC8B6NQmtDNJuzLLPtq0P0V0nmtSf+jK+arBG8V7boMCherWq96C7z944bynQm/zt0wyoYK8DQjZ1Ilohg3R7JL3xSGnVyg/1fknPDyQyOb4dj6g0969BuLzAkqxYkTrABFD5x/dE6o4uNbf67I/hvUiF+Of4bobPenzBLWGolx1fWs1irY6++Sj4dh4b2s4yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MHjUIYOZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MHjUIYOZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSGpz4Fydz3bw9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 12:34:19 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-71e52582cf8so1557394b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 18:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956056; x=1729560856; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/MHsxmP9bN1bxx4msR28qZ2la9zK0wSY8EDrce3K+zQ=;
        b=MHjUIYOZH9nDEt3C8IPlYKL0bWhSbCw0zvky+4gLpCWILxsh7Q3DkbemuZZvbJ3MY4
         o6XSUDh19t0E11E6eeC86Qfj9e4Vv/XpyANdV9zmnGejgrqTRS6OPz2revQG1obv5whA
         RK02FqjsVEGlhTz2t+oHeGrdxQd3Dh7tzEQl5QbIsTfWeDqjSLPWyfGUzqDaycsY/BLA
         7qcvbMJ63+E6+R098MaUkn/OpGFIE3j4W5Ttc0nVQsMw9z0BGNMXAyzqdMipZpRozEli
         t7hNky+R9d8AnOpfR2+oZb5g39ioUyI6qSvwe049pFpvKCs4B8Fp21hHDe4ot7Zyxv5A
         kA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956056; x=1729560856;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MHsxmP9bN1bxx4msR28qZ2la9zK0wSY8EDrce3K+zQ=;
        b=qnxMjfTI2q4hU93lpuVhC4677VaoQagUzULcVL3TLqek6/TamtG6lUnVuUe5PWlSPF
         cE9eGJPZ8GU2THtVxcWEaGqMIWs/nmi8VEJtObITJbXkEkXCcx5b1E0d2YfMTNznztBd
         bGNcbq1hPHXuhEzn0jvJZdIf2fBi2e20CVzLBNyXer5/E6K+BEe6wiTsfc+YzfwLxcmK
         JzmlsIwTsz1M+ru5OxV1w3PxcYFTWFSHASulnQourakem0co34hVBF9WBGujyNJtE/Iw
         CJZ/Ln6s5VPwJPI8YEGyBH3JxQPUccf5etxEMwm3Lwbb1FKFZQ3AtLKlLpujJqe/xb03
         PIIw==
X-Gm-Message-State: AOJu0Yxm9B9uWfkyuIJk4o1BqWiNOoVXaAUKSZ4/MJL95m5ohWrBPMMc
	RGA7zuTw8Oi8JAu42ynsPpTOKNcid9iu5ekc7TvkKGsLfwlWxqAGG4fplQ==
X-Google-Smtp-Source: AGHT+IEaRbtvLZbSifnrZqi1CARugZbYpE5zHqXON9KkesVGZbR8E08Sd3QxolQeAT6rqf3d5xyTkQ==
X-Received: by 2002:a05:6a20:9f47:b0:1d0:7df2:cf39 with SMTP id adf61e73a8af0-1d8c9577ca1mr13971673637.7.1728956056191;
        Mon, 14 Oct 2024 18:34:16 -0700 (PDT)
Received: from dw-tp.. ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508562sm189349b3a.186.2024.10.14.18.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:34:15 -0700 (PDT)
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
Subject: [RFC RESEND v2 06/13] book3s64/hash: Add hash_debug_pagealloc_alloc_slots() function
Date: Tue, 15 Oct 2024 07:03:29 +0530
Message-ID: <4245e8392bdcb0ea168b9700d356f75575511536.1728954719.git.ritesh.list@gmail.com>
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


