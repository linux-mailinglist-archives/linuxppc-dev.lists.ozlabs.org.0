Return-Path: <linuxppc-dev+bounces-1442-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E24D97C2FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:57:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Ktc3772z2yJL;
	Thu, 19 Sep 2024 12:57:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714632;
	cv=none; b=dYYK8YnPNC0JI889SfiHc1e1a3oPzZu2jxik9IeA2PV/lLn9eGyEKdHe2KesWspCadKOh1ECiv9hHutl+h+ZpsTNjx47REEzzGlq7JgRutfRrWhlPVN7nvvnDfoXluUcXqANtdteIsO8J4RZR2mFl1Z68Vpuk8U66QiBBJwUqaVLBEC0rdwJIV7JqDSmDwhPuyhWXyyWRv0MDmjdcSlK+9sSfjRWOaLGfraQilrlPHBGDBSF/9HVscVmqWIbKoQuF/Y1Wkr72Wy7wo6+S8lObLSUMnBSnwI80F4v1dirtuC7rLGsJpdW3mvZJN7BFH49j/Y+WpdYbBtKNEns9htN6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714632; c=relaxed/relaxed;
	bh=jpwPGGqxMjTTALmPRltkI2obnVC0TIxSM0BTVcrrVEU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RmUQySGH0g/F6pcZWZRZkQHQ3CdV4y5ZgauZQZu5n3mFkyY2XcLzwbyy4kvrK+Mk3aGSCDEJL8XamUabRHa7KuB9Fb6GGf0ugXSeCH654z7KMmRxiefZZhyGDpI/FvnEJkBeBgAyskGiArbw39e7UpIN4EbPDGH8M9hzIcM5MAQQLvgXa5vKGMS/za6JceOYkt2bbaMmccQtRke+nLtKMBWTZW0Vp1qoK2ksf0pOiAQsXKXKD8lf1b7NLTCnBI0Gmvxdr77MfuFTRqwjyYnKY5J7dYbFhjfOmksEh0mBUQE5reUKWA1ed+8U+ZcntY/cn/mZ5XvEElYqwqQFnorSng==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ORqgh0mM; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ORqgh0mM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Ktc0rhsz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:57:12 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1fee6435a34so4605755ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714629; x=1727319429; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpwPGGqxMjTTALmPRltkI2obnVC0TIxSM0BTVcrrVEU=;
        b=ORqgh0mMDYF2thyzfxj7I5CZgpQtuQostKfdIKfbwN38Mhi5u/YcvKmvBhq3wJ/Va5
         95wfkcCGg6e+jhPCkAKR9h1pFNgtSRNZywYRtJ9KuS7CnkV7HiOHD0oLLV9cxXzpvMS/
         AiO2aZ/fR0JyngCp+ih6Qexgx41fhXV475qX0ids8DRLXhtYw0IGdXoaOdmorjSNmp+D
         9s3FKwBVKeKY9vOXn+icavfNRfgmLtyUM8LRtJdOe3/zq0A1Zru7Q12ZbPt5w+LPSI7R
         BVsO7ApOjVLKaSQ3scXGuQopOc5gTH101ZElPq/A4kmBcHpRpfgc+ITPWo9GkjXV4CT8
         oUIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714629; x=1727319429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpwPGGqxMjTTALmPRltkI2obnVC0TIxSM0BTVcrrVEU=;
        b=A9khgy2g4uOmAKXCPmas9id3nXp08VoIQ8hiaw/FdRMjdOK+wFW2JT5lubpIAHKlXy
         UMhPsjPrbRjQqUrtYkEVtgAgABpm4gRY7Mp6yvNyeMRrG7hHtjt2YWUi1HtCxbNxXZDv
         xnjwAoOh68AVBYB9qfJ35YsCI+aVxx/UzLDS6dDxr/vH2rJfLpcXKYy9uXolfRl52zIl
         NJrjxFaG8WxCfzIuMM4FjE/2TTt+bhPI0M0YbS/9runUKlhNm+A4VqyHj5wl8Zte1uH8
         ChwQNgGU4DFicgBYvpPDA/KvW1lTKGtTQOvyEFX4pj3FiixlYGR5L9+q9r0CFRtt+ODw
         1vIQ==
X-Gm-Message-State: AOJu0Yy1lXFZWPs7eIGsU7MpqucdpQC5e6Az1RNpXX8FhkD5hzFfGDO9
	so2wPnHeEloHXRSc+P7L8Tfb89mvxmprRaz/vJ9F2b79Bd5H84GJkzia3Q==
X-Google-Smtp-Source: AGHT+IEYcIlRMeaSd/gWkrGWTytjNF8qHos36tFlvKj7R9gv/PIoeETu5a0NdQvLU3Umw0/gtUoAEg==
X-Received: by 2002:a17:903:2b0d:b0:205:9220:aa37 with SMTP id d9443c01a7336-2076e35f0a0mr358517625ad.22.1726714629566;
        Wed, 18 Sep 2024 19:57:09 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:57:09 -0700 (PDT)
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
Subject: [RFC v2 09/13] book3s64/hash: Disable debug_pagealloc if it requires more memory
Date: Thu, 19 Sep 2024 08:26:07 +0530
Message-ID: <8fa0c82332bfaa4c4766372ca0573021dbd8a85e.1726571179.git.ritesh.list@gmail.com>
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

Make size of the linear map to be allocated in RMA region to be of
ppc64_rma_size / 4. If debug_pagealloc requires more memory than that
then do not allocate any memory and disable debug_pagealloc.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index cc2eaa97982c..cffbb6499ac4 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -331,9 +331,19 @@ static unsigned long linear_map_hash_count;
 static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
 static inline void hash_debug_pagealloc_alloc_slots(void)
 {
+	unsigned long max_hash_count = ppc64_rma_size / 4;
+
 	if (!debug_pagealloc_enabled())
 		return;
 	linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
+	if (unlikely(linear_map_hash_count > max_hash_count)) {
+		pr_info("linear map size (%llu) greater than 4 times RMA region (%llu). Disabling debug_pagealloc\n",
+			((u64)linear_map_hash_count << PAGE_SHIFT),
+			ppc64_rma_size);
+		linear_map_hash_count = 0;
+		return;
+	}
+
 	linear_map_hash_slots = memblock_alloc_try_nid(
 			linear_map_hash_count, 1, MEMBLOCK_LOW_LIMIT,
 			ppc64_rma_size,	NUMA_NO_NODE);
@@ -344,7 +354,7 @@ static inline void hash_debug_pagealloc_alloc_slots(void)
 
 static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot)
 {
-	if (!debug_pagealloc_enabled())
+	if (!debug_pagealloc_enabled() || !linear_map_hash_count)
 		return;
 	if ((paddr >> PAGE_SHIFT) < linear_map_hash_count)
 		linear_map_hash_slots[paddr >> PAGE_SHIFT] = slot | 0x80;
@@ -356,6 +366,9 @@ static int hash_debug_pagealloc_map_pages(struct page *page, int numpages,
 	unsigned long flags, vaddr, lmi;
 	int i;
 
+	if (!debug_pagealloc_enabled() || !linear_map_hash_count)
+		return 0;
+
 	local_irq_save(flags);
 	for (i = 0; i < numpages; i++, page++) {
 		vaddr = (unsigned long)page_address(page);
-- 
2.46.0


