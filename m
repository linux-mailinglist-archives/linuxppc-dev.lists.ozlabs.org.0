Return-Path: <linuxppc-dev+bounces-1441-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE04797C2F9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:57:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8KtX41W3z2yGf;
	Thu, 19 Sep 2024 12:57:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714628;
	cv=none; b=CFspOxDGmT83qxUke2dcdUQ2CzAlPdb3oqVtbonSBDmZTKJuLWCDZ2HwpOl6KZ0rj8i6S00zii0hXpyhhZ/ptM5TbmtDbu0W581p2pYGBslffE9kLHzddgIzvjQQMRMpxsiUM3CeqghHTSc7fCb+zPgOJjRj+dU17SsMWbswpXD45NArm2vBYQ3BzkYutUH2xh21QNuFjQ7PmL+SqxMUOm0QAVQBAkP/C77PU8YZCjhqAi1DgFCsd64aLhzT0Ml4CuDD6Drpc9pTeKfB34EURYqhLKHNdmrsG8q5Q57dOgEAoakrJpj8U8j92lZ12+WRv1FLjPn7fcG6hVjcfgfTWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714628; c=relaxed/relaxed;
	bh=ww6ZbzhcNbPuRWG0GzwKnAEreEL780mKVa0cmRg0+f0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C6UutIp2BNDcfXD2WYy+/mcf27LhuJJX+JSH9yBNkR7WDyyGxIh43eh9a0PoQN/0yCRAP//Bh6WCGexwFBI0WAhFDNNPfUrW7XKdm6+7vGEhyzm1QE/23fdQZX5/UUV01JYclCPqNsN+Wtnd7MIl2OagiQE/F8dtFOIhhzEGSt486UPx2dk/+hXlhh2A+6C7tEU38I7Wev2nekP4VTIEJEthJ2645LlJ3wGBVDAh1+MHEvIDuNV+hqa3MxrHvluWPThveupow25MxK2tl2Q9IWcw72KQd3CJQwCvVJgEFrC+EuJrUPb/AciGWRXu1TF0TDdlCGHhR8RujrGuanQT/g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HH+/izkY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HH+/izkY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8KtX1YlFz2xJ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:57:07 +1000 (AEST)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2053616fa36so5560175ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714625; x=1727319425; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ww6ZbzhcNbPuRWG0GzwKnAEreEL780mKVa0cmRg0+f0=;
        b=HH+/izkY7/VHqCo9yPVLYnY51BRfZlohnBWfUbNqmplF9P3KjDuFBv3+2oTnTbCE1W
         1EhHlUDtE0zhhGTJTYAT8yCr8OQ5OOJAo0b/sMUamnU9xzajLfnrPegKeShvPHlAZbnn
         z7rmSzZZA09OcNUK6g0YNQYfv+3RavZfGYzS56eUtG2nJVLIt0ViYHFWCRb/kcN/CWkK
         pzr71NX7I/ZMqclDkPBBrvAwGf9yBS5VPyfuLjG+wYVlrr4c1TJSN34QU0D/K0ne8IRi
         usCT5uOCQgE6qJMJImDAuUcaWSbt85k1GQLXGEn9YwgJYF7FGHFl9szqVSG+mxZ44cOh
         VZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714625; x=1727319425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ww6ZbzhcNbPuRWG0GzwKnAEreEL780mKVa0cmRg0+f0=;
        b=D5Nqijq9am5j1OavQjYCzSaH+EUlAXERdXrSOcuEBr2w4GIl0OrNAF7dLyFN7wYgu0
         zyFIRKUYp7ERJn74czRde6GbKg+USG8AIwwCDGRZISlrLgi172EJnfAlJeyeMbg2LzPP
         9YCcTesC1tcSx8fWlVO1qX76KWxTbDRAZbJqRv27DR6CZuPKqq2Th43V48nrVnr5b6Sq
         Ba1c2I2oY5UF24aAOOHNJPpU9byBzLsX05ms5k2uxyJYuCQhU3UYR26Hqx159IY/XPY3
         rK9VxFWFVdW4oyMTbKlp5+RS8KN8tysQDdBIhhtl+k8iM6fxQ2zQKjh6aQIdTtkvoxXz
         vVsA==
X-Gm-Message-State: AOJu0YyMtAIY/oS901y7OOJZ6jl79h5g6erAf3jGFVPsqmt+N0FW2P6g
	4vzuzPTp+Zy7eSKL5pkgupJwkfmKCa0pxKpjPcKmIFKGl/pZQEfh2sRCgQ==
X-Google-Smtp-Source: AGHT+IEGqIOz4HsQttBODX4offSohXpn6nX19SV5HvK4k8qFlVoDJsalsJ6Y9uSYNEbB3JibzB2xxg==
X-Received: by 2002:a17:902:f689:b0:206:96bf:b0d6 with SMTP id d9443c01a7336-2076e41703amr412516255ad.51.1726714624534;
        Wed, 18 Sep 2024 19:57:04 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:57:03 -0700 (PDT)
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
Subject: [RFC v2 08/13] book3s64/hash: Make kernel_map_linear_page() generic
Date: Thu, 19 Sep 2024 08:26:06 +0530
Message-ID: <8d06f263a903b5867fb23c319c4ddf7db7b7a431.1726571179.git.ritesh.list@gmail.com>
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

Currently kernel_map_linear_page() function assumes to be working on
linear_map_hash_slots array. But since in later patches we need a
separate linear map array for kfence, hence make
kernel_map_linear_page() take a linear map array and lock in it's
function argument.

This is needed to separate out kfence from debug_pagealloc
infrastructure.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 47 ++++++++++++++-------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index da9b089c8e8b..cc2eaa97982c 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -272,11 +272,8 @@ void hash__tlbiel_all(unsigned int action)
 }
 
 #ifdef CONFIG_DEBUG_PAGEALLOC
-static u8 *linear_map_hash_slots;
-static unsigned long linear_map_hash_count;
-static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
-
-static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
+static void kernel_map_linear_page(unsigned long vaddr, unsigned long idx,
+				   u8 *slots, raw_spinlock_t *lock)
 {
 	unsigned long hash;
 	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
@@ -290,7 +287,7 @@ static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 	if (!vsid)
 		return;
 
-	if (linear_map_hash_slots[lmi] & 0x80)
+	if (slots[idx] & 0x80)
 		return;
 
 	ret = hpte_insert_repeating(hash, vpn, __pa(vaddr), mode,
@@ -298,36 +295,40 @@ static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
 				    mmu_linear_psize, mmu_kernel_ssize);
 
 	BUG_ON (ret < 0);
-	raw_spin_lock(&linear_map_hash_lock);
-	BUG_ON(linear_map_hash_slots[lmi] & 0x80);
-	linear_map_hash_slots[lmi] = ret | 0x80;
-	raw_spin_unlock(&linear_map_hash_lock);
+	raw_spin_lock(lock);
+	BUG_ON(slots[idx] & 0x80);
+	slots[idx] = ret | 0x80;
+	raw_spin_unlock(lock);
 }
 
-static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
+static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long idx,
+				     u8 *slots, raw_spinlock_t *lock)
 {
-	unsigned long hash, hidx, slot;
+	unsigned long hash, hslot, slot;
 	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
 	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
 
 	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
-	raw_spin_lock(&linear_map_hash_lock);
-	if (!(linear_map_hash_slots[lmi] & 0x80)) {
-		raw_spin_unlock(&linear_map_hash_lock);
+	raw_spin_lock(lock);
+	if (!(slots[idx] & 0x80)) {
+		raw_spin_unlock(lock);
 		return;
 	}
-	hidx = linear_map_hash_slots[lmi] & 0x7f;
-	linear_map_hash_slots[lmi] = 0;
-	raw_spin_unlock(&linear_map_hash_lock);
-	if (hidx & _PTEIDX_SECONDARY)
+	hslot = slots[idx] & 0x7f;
+	slots[idx] = 0;
+	raw_spin_unlock(lock);
+	if (hslot & _PTEIDX_SECONDARY)
 		hash = ~hash;
 	slot = (hash & htab_hash_mask) * HPTES_PER_GROUP;
-	slot += hidx & _PTEIDX_GROUP_IX;
+	slot += hslot & _PTEIDX_GROUP_IX;
 	mmu_hash_ops.hpte_invalidate(slot, vpn, mmu_linear_psize,
 				     mmu_linear_psize,
 				     mmu_kernel_ssize, 0);
 }
 
+static u8 *linear_map_hash_slots;
+static unsigned long linear_map_hash_count;
+static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
 static inline void hash_debug_pagealloc_alloc_slots(void)
 {
 	if (!debug_pagealloc_enabled())
@@ -362,9 +363,11 @@ static int hash_debug_pagealloc_map_pages(struct page *page, int numpages,
 		if (lmi >= linear_map_hash_count)
 			continue;
 		if (enable)
-			kernel_map_linear_page(vaddr, lmi);
+			kernel_map_linear_page(vaddr, lmi,
+				linear_map_hash_slots, &linear_map_hash_lock);
 		else
-			kernel_unmap_linear_page(vaddr, lmi);
+			kernel_unmap_linear_page(vaddr, lmi,
+				linear_map_hash_slots, &linear_map_hash_lock);
 	}
 	local_irq_restore(flags);
 	return 0;
-- 
2.46.0


