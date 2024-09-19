Return-Path: <linuxppc-dev+bounces-1446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1913B97C302
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:57:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Ktx5nn6z2yF6;
	Thu, 19 Sep 2024 12:57:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714649;
	cv=none; b=AsiTHeiQpGyfr4HXqGgmQXAW9uv8QTncGsxTUmtdvXxS2Zd4GoIhnT35x+u+BoD4Mdbt8N03mJcrPLVX5dhVQpi9TnewR5qT0XykYwCVzb3o/5Vu5lr+BxbCmqLZ0mst7c0VbGHVJOZeXWxRtpG9JKWJEh5AY+/mDo4pSSwleU4s2q1E0fS3G19WcDRKz+pw16S9CDcYua1PKF3nyuqJfSvUYOumUSXIJVMUd1l7ej3L2RFlN9qdpUJnsoYn4dQJxZcB0RdQWcKNd91FBxGy+Avd7yoNNshhT2QLBwAwK5wt7LGWSXGRRveFHHaQyYa69ehEViQWu4nrFa7yyl//1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714649; c=relaxed/relaxed;
	bh=rG0rlJ7RpNnGy840avhtCY+OIP6FbV4qxEoUkbOoVC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C2bfwgo6QfT3ILrAy3AS/ztEwR3nzRQUTAZj1nsOBebGYjUFvAe4RB+5QbDdPy6KFWxPtBstgDkvEfd7Wd71Fnl2f8xjwvLGWrDrnj23yl0Y4m5AxKGtZElSmyhKHFkMnu35GDk1s+JhSH4nJzcA+ms82OLGQSFCmJSbllTspG2rgqm08hwipHa9gsB8pE1Dv5zFsMAsTmTsvGxnBcO3jSMNCBAZPc6lGG6tlVUcLf/q5PFzDf63jAl1qibTivRdS6/DMLaI5+p38G/hEaIp04Yo/uIUPtf3Zipc2VZP643Dp61OxAW7UkSXS9GB3idURscSLVM3ECFEZV90bDj4FQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FpgvniAt; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FpgvniAt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Ktx3WJSz2xmk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:57:29 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20551eeba95so4017565ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714646; x=1727319446; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG0rlJ7RpNnGy840avhtCY+OIP6FbV4qxEoUkbOoVC0=;
        b=FpgvniAtpXCjjFTo55J9TXdBN5gHvnt9zrYvdBeAWjJ1+rd0geI3jjj81hUfVl4tVZ
         ryTU1t57gtR5vrk2VXhDvxfIg+kjFA+BBLlISc1d5EzshveWTJ/W/dqA5HZKEe8e0OF4
         VSqhMRlx+SVaUWgMVXpIS8R/VDQYCuDOi27AkPniseIQ7ITtWeHzvcBLxpRNqjdfmxM9
         Lf4itnl6bdqyn/Mx8vFH/6/APyGGnrr5yJTZji0FKL21HNdDATNF+5NypBAVVARqk15h
         uTmuSl+wre6o9CUApGCKc1OO+FT384iPNfymaXm+kh1AJ46ZqfbpbbII7H1hoEIWkkeC
         1HfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714646; x=1727319446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rG0rlJ7RpNnGy840avhtCY+OIP6FbV4qxEoUkbOoVC0=;
        b=GjnUz4do/HKxAWWyIF6TTfxsUj4NRN+vSax1MhRx1Pca30Dlp9lTnFVfsKROLYIdHo
         cfizl8zzj+vSrWivTB57pfKty/H/h9fkMv2XZOFa5W4oGnAFJS+FuzQX+ApPIF4HsBOz
         GnDLV2CQPB9xHtyST2yZcA7m3IPnr0c39wqf9lmA5DsEdTFyZCKCERp7uM2VTyjpTFQ3
         vIFQvhcqZ4shPtoamSvwkCO+GTCS218OZeu0KAZUN5U7qZqQ2Lm+i/vugrcFPfqf9ART
         kQSYs1mpH+yzURc84t4pR4kr8FNefDgfTirXRUSSHgT6L3CPvAt+sc5pLIcC3bc1BVW+
         uqew==
X-Gm-Message-State: AOJu0YwHzHKfATBwsvEf+Kq5ky8QkuMnjp10dZA5W0Fc55jXXeIVRxmV
	l2QLWE4wmNgJtYnDG7TNMNib17UIg9kqcA1Fkl1XFbZxJJTB7jA73KziZQ==
X-Google-Smtp-Source: AGHT+IE34eW0PHWVkirCwr75sAQsAEQKWo1G+ukba10mNkf/9dp+AGD30+GUy1tuone82B+yBz345Q==
X-Received: by 2002:a17:903:32c9:b0:206:ae39:9f4 with SMTP id d9443c01a7336-20781d5f6fcmr301143135ad.20.1726714646433;
        Wed, 18 Sep 2024 19:57:26 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.57.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:57:25 -0700 (PDT)
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
Subject: [RFC v2 13/13] book3s64/hash: Early detect debug_pagealloc size requirement
Date: Thu, 19 Sep 2024 08:26:11 +0530
Message-ID: <616bf94910b0c77323ea9ccb86571f78ebfd421b.1726571179.git.ritesh.list@gmail.com>
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

Add hash_supports_debug_pagealloc() helper to detect whether
debug_pagealloc can be supported on hash or not. This checks for both,
whether debug_pagealloc config is enabled and the linear map should
fit within rma_size/4 region size.

This can then be used early during htab_init_page_sizes() to decide
linear map pagesize if hash supports either debug_pagealloc or
kfence.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index b6da25719e37..3ffc98b3deb1 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -329,25 +329,26 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long idx,
 }
 #endif

+static inline bool hash_supports_debug_pagealloc(void)
+{
+	unsigned long max_hash_count = ppc64_rma_size / 4;
+	unsigned long linear_map_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
+
+	if (!debug_pagealloc_enabled() || linear_map_count > max_hash_count)
+		return false;
+	return true;
+}
+
 #ifdef CONFIG_DEBUG_PAGEALLOC
 static u8 *linear_map_hash_slots;
 static unsigned long linear_map_hash_count;
 static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
 static void hash_debug_pagealloc_alloc_slots(void)
 {
-	unsigned long max_hash_count = ppc64_rma_size / 4;
-
-	if (!debug_pagealloc_enabled())
-		return;
-	linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
-	if (unlikely(linear_map_hash_count > max_hash_count)) {
-		pr_info("linear map size (%llu) greater than 4 times RMA region (%llu). Disabling debug_pagealloc\n",
-			((u64)linear_map_hash_count << PAGE_SHIFT),
-			ppc64_rma_size);
-		linear_map_hash_count = 0;
+	if (!hash_supports_debug_pagealloc())
 		return;
-	}

+	linear_map_hash_count = memblock_end_of_DRAM() >> PAGE_SHIFT;
 	linear_map_hash_slots = memblock_alloc_try_nid(
 			linear_map_hash_count, 1, MEMBLOCK_LOW_LIMIT,
 			ppc64_rma_size,	NUMA_NO_NODE);
@@ -1076,7 +1077,7 @@ static void __init htab_init_page_sizes(void)
 	bool aligned = true;
 	init_hpte_page_sizes();

-	if (!debug_pagealloc_enabled() && !kfence_early_init_enabled()) {
+	if (!hash_supports_debug_pagealloc() && !kfence_early_init_enabled()) {
 		/*
 		 * Pick a size for the linear mapping. Currently, we only
 		 * support 16M, 1M and 4K which is the default
--
2.46.0


