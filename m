Return-Path: <linuxppc-dev+bounces-2258-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0153C99DBAF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2024 03:35:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XSGqd4Qhbz2xBb;
	Tue, 15 Oct 2024 12:34:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728956093;
	cv=none; b=H+SgMg0xURpgyirr9/9wM9ASE25i1tQVl1iDclfCRjuDA2IfGIrxn+9P/ixkNjPZEaBaUq+4PGC4PzNZfwB62xrLz3gTH3o/xXa90RWITfFWwvOeA9ZhX5NzfKNIWJ9NZaSB/WYczuy4dotnARtAaWWoNqCJx6QyTIrK0KkOO+EzTw6cvg6OBashdaaZgskBEP7qh6A1TLEVkLIAbe9GlmlsGeln2685upFYAEGToDzR2SGWLl7bmNeWnYW+kEXYeJRvynRG6WXlExohE4eakmmE9AU0JJCoEQngN3DZf3IiPJ6zUtluGfULq9ZIKRi91Ci23kdq06M0F70zzIFjcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728956093; c=relaxed/relaxed;
	bh=rG0rlJ7RpNnGy840avhtCY+OIP6FbV4qxEoUkbOoVC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=buaTnzFlSgIcqlTVJAF+zmPNOQTsNsKr8nyFf9KWmrt2IJEZWiemeA5sDMihlPHYNpXgQTnTyAGN+84ib1TFZOzjhCFCGt1IYmcRpVJlhyDgFA/7EVDhOtBIu8I3hCjZlgvULpp0pUwN8Z2hof4FN2wvelVm1/TQB+k3vD3TnEqMW1dLktGaUL+GwWRKvjHB6xvlrVcq5iBWKfMrtD3VsVbQKl7rl2HOl3LY5RWOqGa1bMuLLvGCTaXI4FXMCSamzUlrD29ZrEEheTHePb0FvB157e8H7ZbqfsIjk3soqpQCeEzTRFzi97a1ZZtRWEOl8+Q5Bak8SIuyM0DhTq6GrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K3iChlCn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=K3iChlCn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XSGqc4rGsz3bps
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 12:34:52 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so717921b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 18:34:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728956090; x=1729560890; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG0rlJ7RpNnGy840avhtCY+OIP6FbV4qxEoUkbOoVC0=;
        b=K3iChlCnLxGG9tWcyYCrmnPYz7uql1SGq/vLIWZtuSpiQA4H++mT4DGaq0FxBM4cmb
         0qXkisZPvmjR4Gb6N0rq3nOnbcz6/bK43XE5J6LCcyF4b9XVGfIMeHkFghPdj7pwb1bp
         e+eZCebSwbCKtFcuoUQ5cPWzlUFv8FfGT8b5HtjKHu3LucuplQFs8QkKnQIx4+0OetCB
         2CS/dY1i3RlY1CO3eEhdRV40K5zfgOyoOL7AIT4O+jnv/MSYTFfKkjGjPb+v4K9IX5UM
         j3b1qIWcT9hESh+Eux4Ft5FS0j0DfDRHf5u1a3wmN+pzFGoaUro71Z+ANxQtp5NTU1iL
         Kj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728956090; x=1729560890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rG0rlJ7RpNnGy840avhtCY+OIP6FbV4qxEoUkbOoVC0=;
        b=e9IWJlgqzRc6ros5XIKEqyb3C2KMQZLC66O93rmRZtuZH+gJJL58ZxlBo+d4t90Bms
         RAzrhh5pNTsZ1YQ12CBZRXDcJMj1lzzgmpsudXYAJ4HRqM8QtO2j1FKymwrZ6VX/73V3
         K/u8vzWqIgM32dpGg7QudakL8+Q51sjDU32fbXkttu0cIMNMvpQNn4/bRWWXG9ncfNp4
         olozeEt2ql0hjpEGBFcvE52riu41vCM4m5N2Z3oX8SSC+MlSdFyOybEMZIhmwcyZs3Hw
         Je2OVV6IDYNZ1eWoMNmrh14NYg3gwHWygIpGxZIqy3BwSdi5NRTDWx3BosiEFKeE35b+
         RQDA==
X-Gm-Message-State: AOJu0Yx6OEU98glW56bkbWiUzBvlKN0ERiFeepPP+CXQ1bu1UhgiNOSB
	R9bCA+xrAJU70R6cnbJGzVigVO+B/FFtke0Fg8VTYX0XMlQUbT8QsMnBVQ==
X-Google-Smtp-Source: AGHT+IFvESYA3zS1GBFZJxbiWhM237fiGLHeDy47xUMjk/AhsGWJAlSSfmCDieCeQukhtrPpShvuWQ==
X-Received: by 2002:a05:6a00:1404:b0:71e:5033:c5 with SMTP id d2e1a72fcca58-71e50330377mr13492824b3a.14.1728956090001;
        Mon, 14 Oct 2024 18:34:50 -0700 (PDT)
Received: from dw-tp.. ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77508562sm189349b3a.186.2024.10.14.18.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 18:34:49 -0700 (PDT)
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
Subject: [RFC RESEND v2 13/13] book3s64/hash: Early detect debug_pagealloc size requirement
Date: Tue, 15 Oct 2024 07:03:36 +0530
Message-ID: <6b5deb16494e80703577e20fbb150789c83076a9.1728954719.git.ritesh.list@gmail.com>
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


