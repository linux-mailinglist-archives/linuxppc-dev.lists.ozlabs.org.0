Return-Path: <linuxppc-dev+bounces-1437-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F366497C2EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:56:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Kt90k4dz2yDw;
	Thu, 19 Sep 2024 12:56:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714609;
	cv=none; b=ISvrhqYX+hnYMxBfqDA6NOEayLH/JgxImpMxpCtbk6X/Jg84UDKR53ik4xkSAwro0101mBDMlMwfWMm1UWV1G9JQ7uY3VNLskccnPuZDukEscrKp1KDGR1MmqBfUceYY+JU/1a3ZOmLRu0d7o5L+CMX6QzlMzRiENNpm0tNZawjlXoLB+AE975R7vwQ/aY2AlS5BcEqqNFM4nA5Qr1R7rq5ZHmIzjLakhWIQi8p/R2GtPEovxMYtRVKPEb7rna1kgV5jpNSLW6bEf6c34rI0y9mnP1GIZbAJy6yo+sMFDDYiWj5TY5fJWT38aYIsKx2ws6VtPdQDuZuEUHPSJ0oZOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714609; c=relaxed/relaxed;
	bh=axWsqNzIpvlhLR7DqrnxUdvbHKQsISEkZ4mTeZAqu9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GvrxVlU0jQhShEI6J3tLPPRVbJk9OioWKlzbCnJX/FxdWO12ueTi6EpqfaDGyQ5auTvtYxk/weP2rX6/pGhZn+qmtebY+4a8scHyzdy3mA8zwzbHMxmGbZJ4u0sN5SVT8RFemll46rgM6b46/qepf5gwc4leWhU67cz8YP2EzKwD5fCosyM3aeo6wUHadlRYdV7GHraxSegsOER41EjVofKm3PWt9nYrXf2acTI+IXyaYmS/cbVnKnKd/GnrJYJ0Gk0eirCFgXjNkO97nO+Hhc/r3+5utvDXcWhEGSCPBeKoB6EllembKt4CQnttZKFUPr+LN0VbNWrcT2/FSkI7AA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aSVRr9kk; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aSVRr9kk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Kt85Hlrz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:56:48 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-20551e2f1f8so4668595ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714605; x=1727319405; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=axWsqNzIpvlhLR7DqrnxUdvbHKQsISEkZ4mTeZAqu9w=;
        b=aSVRr9kk1HVD1ACyVQIZyIztWypdKEdwRe6VUpj59XVRmG4d5GWJc+M8n0f3vA71xD
         xJ3s7dKIpXB5Ac1rTviOg9yjHtW02RaMdnWQ5qRHG/dOpauFR9ZlV2tUVs3pkh1PxzPl
         tzb4cp3FOkc4aOfAb0gv8mk5iK+8lNXvnUwPq7HPqXr8v9Og0HJjL/ObuZ5w2JB5ReDz
         wVo+v+8T5bCzzLCt6DOvthtKzHWYmgleEPCE+B76eDQvFb2qlooCT8VU0iGZo3yqYGWY
         bwSXhPuPjn2HF4iqDsRn/Yo+8PYJf+gAVvcpfSz5T3O+z2BjGDYfmUalTFaAK4jkOXgE
         BOGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714605; x=1727319405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=axWsqNzIpvlhLR7DqrnxUdvbHKQsISEkZ4mTeZAqu9w=;
        b=vvxMIIitDFq05b28uxQZk5uqOxlMMXRhzS0sO59y3KS9+061VdrVWKJ0USGeiWVKx3
         P8r9GBOW6JDaSyoBgmuyxHQtFja1BmVdMTQz5HQEIDPUkw07JhV2u1GUXLOJJu7SU33Y
         pRhYmNfS4etp4gADi06NNkdohX3GMIjKUKojCf1tch9WDMYpx8cKTxYtOolYvPCUFKW2
         3FvlVgUunaalktdR8No88HtTLkarXpYlBvYJhq0Ck71164IY0ht96MXT8blqQNcaumdj
         Q3qQbRSunI7MCvg7Bo67C/Ag0Tl7vNfnI/BxeD2BUMVVbsMIDeDdUnDx/OktCPi59z6Z
         EAQw==
X-Gm-Message-State: AOJu0YxgyMBuv8KzziAWYZ4KcTJerPvUVqMUISUv46pNlgwshRfU08s4
	ZLTU5piUDCKTHvJsts8oEQlZxsru30Paddz5I2xaA5PkHWIE8Dl3pu4rMA==
X-Google-Smtp-Source: AGHT+IHA1Q2JlW37EA2VKdDDVikQbbi1MnJIFVGu950hUG+dA+q41WmFWBJe/jOOl1HWU88lYqBIzQ==
X-Received: by 2002:a17:902:d4d2:b0:206:f065:f45d with SMTP id d9443c01a7336-2078252bd1emr238945975ad.31.1726714605103;
        Wed, 18 Sep 2024 19:56:45 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:56:44 -0700 (PDT)
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
Subject: [RFC v2 04/13] book3s64/hash: Refactor kernel linear map related calls
Date: Thu, 19 Sep 2024 08:26:02 +0530
Message-ID: <ee519d5927ca4e141d2b1570384ebe39e0ca850a.1726571179.git.ritesh.list@gmail.com>
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

This just brings all linear map related handling at one place instead of
having those functions scattered in hash_utils file.
Makes it easy for review.

No functionality changes in this patch.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 164 +++++++++++++-------------
 1 file changed, 82 insertions(+), 82 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 296bb74dbf40..82151fff9648 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -273,6 +273,88 @@ void hash__tlbiel_all(unsigned int action)
 		WARN(1, "%s called on pre-POWER7 CPU\n", __func__);
 }
 
+#ifdef CONFIG_DEBUG_PAGEALLOC
+static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
+
+static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
+{
+	unsigned long hash;
+	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
+	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
+	unsigned long mode = htab_convert_pte_flags(pgprot_val(PAGE_KERNEL), HPTE_USE_KERNEL_KEY);
+	long ret;
+
+	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
+
+	/* Don't create HPTE entries for bad address */
+	if (!vsid)
+		return;
+
+	if (linear_map_hash_slots[lmi] & 0x80)
+		return;
+
+	ret = hpte_insert_repeating(hash, vpn, __pa(vaddr), mode,
+				    HPTE_V_BOLTED,
+				    mmu_linear_psize, mmu_kernel_ssize);
+
+	BUG_ON (ret < 0);
+	raw_spin_lock(&linear_map_hash_lock);
+	BUG_ON(linear_map_hash_slots[lmi] & 0x80);
+	linear_map_hash_slots[lmi] = ret | 0x80;
+	raw_spin_unlock(&linear_map_hash_lock);
+}
+
+static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
+{
+	unsigned long hash, hidx, slot;
+	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
+	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
+
+	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
+	raw_spin_lock(&linear_map_hash_lock);
+	if (!(linear_map_hash_slots[lmi] & 0x80)) {
+		raw_spin_unlock(&linear_map_hash_lock);
+		return;
+	}
+	hidx = linear_map_hash_slots[lmi] & 0x7f;
+	linear_map_hash_slots[lmi] = 0;
+	raw_spin_unlock(&linear_map_hash_lock);
+	if (hidx & _PTEIDX_SECONDARY)
+		hash = ~hash;
+	slot = (hash & htab_hash_mask) * HPTES_PER_GROUP;
+	slot += hidx & _PTEIDX_GROUP_IX;
+	mmu_hash_ops.hpte_invalidate(slot, vpn, mmu_linear_psize,
+				     mmu_linear_psize,
+				     mmu_kernel_ssize, 0);
+}
+
+int hash__kernel_map_pages(struct page *page, int numpages, int enable)
+{
+	unsigned long flags, vaddr, lmi;
+	int i;
+
+	local_irq_save(flags);
+	for (i = 0; i < numpages; i++, page++) {
+		vaddr = (unsigned long)page_address(page);
+		lmi = __pa(vaddr) >> PAGE_SHIFT;
+		if (lmi >= linear_map_hash_count)
+			continue;
+		if (enable)
+			kernel_map_linear_page(vaddr, lmi);
+		else
+			kernel_unmap_linear_page(vaddr, lmi);
+	}
+	local_irq_restore(flags);
+	return 0;
+}
+#else /* CONFIG_DEBUG_PAGEALLOC */
+int hash__kernel_map_pages(struct page *page, int numpages,
+					 int enable)
+{
+	return 0;
+}
+#endif /* CONFIG_DEBUG_PAGEALLOC */
+
 /*
  * 'R' and 'C' update notes:
  *  - Under pHyp or KVM, the updatepp path will not set C, thus it *will*
@@ -2120,88 +2202,6 @@ void hpt_do_stress(unsigned long ea, unsigned long hpte_group)
 	}
 }
 
-#ifdef CONFIG_DEBUG_PAGEALLOC
-static DEFINE_RAW_SPINLOCK(linear_map_hash_lock);
-
-static void kernel_map_linear_page(unsigned long vaddr, unsigned long lmi)
-{
-	unsigned long hash;
-	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
-	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
-	unsigned long mode = htab_convert_pte_flags(pgprot_val(PAGE_KERNEL), HPTE_USE_KERNEL_KEY);
-	long ret;
-
-	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
-
-	/* Don't create HPTE entries for bad address */
-	if (!vsid)
-		return;
-
-	if (linear_map_hash_slots[lmi] & 0x80)
-		return;
-
-	ret = hpte_insert_repeating(hash, vpn, __pa(vaddr), mode,
-				    HPTE_V_BOLTED,
-				    mmu_linear_psize, mmu_kernel_ssize);
-
-	BUG_ON (ret < 0);
-	raw_spin_lock(&linear_map_hash_lock);
-	BUG_ON(linear_map_hash_slots[lmi] & 0x80);
-	linear_map_hash_slots[lmi] = ret | 0x80;
-	raw_spin_unlock(&linear_map_hash_lock);
-}
-
-static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
-{
-	unsigned long hash, hidx, slot;
-	unsigned long vsid = get_kernel_vsid(vaddr, mmu_kernel_ssize);
-	unsigned long vpn = hpt_vpn(vaddr, vsid, mmu_kernel_ssize);
-
-	hash = hpt_hash(vpn, PAGE_SHIFT, mmu_kernel_ssize);
-	raw_spin_lock(&linear_map_hash_lock);
-	if (!(linear_map_hash_slots[lmi] & 0x80)) {
-		raw_spin_unlock(&linear_map_hash_lock);
-		return;
-	}
-	hidx = linear_map_hash_slots[lmi] & 0x7f;
-	linear_map_hash_slots[lmi] = 0;
-	raw_spin_unlock(&linear_map_hash_lock);
-	if (hidx & _PTEIDX_SECONDARY)
-		hash = ~hash;
-	slot = (hash & htab_hash_mask) * HPTES_PER_GROUP;
-	slot += hidx & _PTEIDX_GROUP_IX;
-	mmu_hash_ops.hpte_invalidate(slot, vpn, mmu_linear_psize,
-				     mmu_linear_psize,
-				     mmu_kernel_ssize, 0);
-}
-
-int hash__kernel_map_pages(struct page *page, int numpages, int enable)
-{
-	unsigned long flags, vaddr, lmi;
-	int i;
-
-	local_irq_save(flags);
-	for (i = 0; i < numpages; i++, page++) {
-		vaddr = (unsigned long)page_address(page);
-		lmi = __pa(vaddr) >> PAGE_SHIFT;
-		if (lmi >= linear_map_hash_count)
-			continue;
-		if (enable)
-			kernel_map_linear_page(vaddr, lmi);
-		else
-			kernel_unmap_linear_page(vaddr, lmi);
-	}
-	local_irq_restore(flags);
-	return 0;
-}
-#else /* CONFIG_DEBUG_PAGEALLOC */
-int hash__kernel_map_pages(struct page *page, int numpages,
-					 int enable)
-{
-	return 0;
-}
-#endif /* CONFIG_DEBUG_PAGEALLOC */
-
 void hash__setup_initial_memory_limit(phys_addr_t first_memblock_base,
 				phys_addr_t first_memblock_size)
 {
-- 
2.46.0


