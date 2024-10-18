Return-Path: <linuxppc-dev+bounces-2388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D88C9A44B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:31:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVWvX5F7Gz3btk;
	Sat, 19 Oct 2024 04:31:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::533"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729272664;
	cv=none; b=KgVtD45AHt2VdRMajkCi6yZcUHgNY3qschmsvNBh0I1pVewfAnh8Le47Ms0EWtqsMk24JaUvfRp4vsaJfx9HkT3yHy7U2Yv4bAZPGacU9LSUFgRkURAr8zZBxFHNGpvS+Q8phSULZ6KkHhhG/l3bAfpTttan3Es1lHbQ+YjAH7gB0s/91ugu4+iN/eKUUdlQL85VqignWPoqW58L1HZPimIQp9sY0AYJqqw7M/xobgjc1lD2LWCy4tOHpej799oe+WUxJNVpv8+UFM8ozQWI4+DyaTA0EeFAlbvBVR4Hv5UT17qm5qQhVOH1DdRGv26pHVVqHZ/MwAU5vTiRS0QDiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729272664; c=relaxed/relaxed;
	bh=c7nu+U6UkRZF2cuN8FLbB8nvBf84Wg4YjQThyWhRKHk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dn7rOSYLGVMxsrldXQAQ2oJMvDk/UG1hzu1TAzRl2eQqLOi4L/eEDasKL6smJCcqCG4Ywfzhr+vxK/oD/GEPeZWTR4UqUKObRePO3LOFLOZCdwWoaCO9HQf6krULuYFmJgg+mlfY5uhVxuEtj0LljH5y4euDb6gt/QMaS82v6WhHPEURl1rIn9MVgtP5WDYjsrasPFCeiFLSfCBW8JOF1LyXsY9VSZSL2MLhXjIjDglF1vzJhRaKEVlp4nim2JmhF2vOV6z5FRTJbr/yzIHO/2N6NdmT9HT9K8+Sej8fUbfsrHX3gVGDFiJs6dpK6IW+33l1Ssmr2AESyeVc8/oyfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z0C6WDxr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Z0C6WDxr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::533; helo=mail-pg1-x533.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVWvW6Dgrz3btj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:31:03 +1100 (AEDT)
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7e9e38dd5f1so1840973a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729272661; x=1729877461; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c7nu+U6UkRZF2cuN8FLbB8nvBf84Wg4YjQThyWhRKHk=;
        b=Z0C6WDxrM3VWxvHlBdRXE7ZiF9KZn+Kxyg9rC7BRtKzpDvjLimzz6PxISU+qNZyJnv
         hvBHpmH0q2tFB9NvVRWSXP0lXTxFtc2gCXDAhby1sxG5dCEoc8xJVYrP2whQspaenhN6
         8CpjHiSPkVtVdh+q2D+mRKLPmk/5sAVxHK3q1KcSkjZbdpipjGofhm8TsX51TOiMVp3I
         JzBPOOZoKgt/LXsFPRhpXCrBhfsS3ZpSv6GRUfkcEwi+BF9MOhbqTYEatjdchamp80M4
         jpDxvX9dhSLi2BUIzjXG5anajrVhCnCU5/nCI72xK29ozofRhZVww0MbjIqOHJ6IN0ss
         dH8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272661; x=1729877461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c7nu+U6UkRZF2cuN8FLbB8nvBf84Wg4YjQThyWhRKHk=;
        b=p/MubBIAlD/re+yhGw1DxlKkd65jgOcm1AIAMtvNYTLDvh7ESJXMdnm6QUKD/TQhAF
         HEesBGAYoYEnafFvkfFdQcrw/btt1Qj5qBuvCj/t6Gn++xE5s6keWV/CkfZqsyZ7CT0N
         YdyhoVMOtr72jJdAj/+DeFE8pOZhgZp9gQb8JEFyy4vICn+sp8wgqT+UCykOPjW038nd
         WBQtrHvS/hJoGi9nvTnWsPPihVGE7wRtm+QKKuvBtoJjuZIl3QzxJglGm+Q/3PZ00ZIa
         N6PPQ4sDllceD8rEVBg9lhSXIVgJ761Ae1bIaWNK9QUDGSn1c1lr8pWg8JgXo0NP270i
         XHCQ==
X-Gm-Message-State: AOJu0YzDYAqZfWwgBnZOmMVleou1KIZYNAi4bQtcsCW/DngeTaAmcYXq
	kxK790Nh9hoCM7dDnmlIlzrQGEDehenAAE11FkrOOZOqszcqXc57RCoOigFJ
X-Google-Smtp-Source: AGHT+IHJYrrrqJRfAumO9Q20FqjOKsTO5quh/OtUWisgh37hgw56Q3PPkpt1yyNYXV1te9hYA/UiKQ==
X-Received: by 2002:a05:6a21:1519:b0:1d8:a3ab:7228 with SMTP id adf61e73a8af0-1d92c3323d2mr4881461637.0.1729272661553;
        Fri, 18 Oct 2024 10:31:01 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f51sm1725242b3a.36.2024.10.18.10.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:31:00 -0700 (PDT)
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
Subject: [PATCH v3 08/12] book3s64/hash: Disable debug_pagealloc if it requires more memory
Date: Fri, 18 Oct 2024 22:59:49 +0530
Message-ID: <e1ef66f32a1fe63bcbb89d5c11d86c65beef5ded.1729271995.git.ritesh.list@gmail.com>
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

Make size of the linear map to be allocated in RMA region to be of
ppc64_rma_size / 4. If debug_pagealloc requires more memory than that
then do not allocate any memory and disable debug_pagealloc.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 11975a2f7403..f51f2cd9bf22 100644
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


