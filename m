Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCB994287D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 09:58:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BtcJnGcn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYkxP1sCRz3dFy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 17:58:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BtcJnGcn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYkvV1P8Tz3dBq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 17:56:53 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-70d18d4b94cso3980788b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 00:56:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722412611; x=1723017411; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=65ywP7/O6fQAO9Uxn3NOVkm8J4vsqs8B0sDGst0fbN0=;
        b=BtcJnGcnpQPb57got4A+Ny4BPxlw4wN6SL6V+r9xifZ8Z1l9cmV/wz9N+ZVQdli8BL
         LSGc6ntHRvVfwrRRhmuy2iTdG3k8ucTrgqBO3RZm5TRx1f+kCj00YTdYWeWCI3B3ibun
         yLIwg9Uc9Q6fVdxG7Wc6coJqEa9IfrA0KasPTch6Vz8wb4eKXUzaHM4WLelmdWAMtvME
         7h4MUv1G/gXIlVE2eZ8rkQpgOi6tgWHmROsRkT9xeoLVLRzWlp3RocAR++GfICXSYe9E
         acgiXHkEE9z98rKjZ9FAsgqX6kSVYkinGo7j7G7DZKHkuMDuiKmahytMtSR53Fovg9Vk
         U0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722412611; x=1723017411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=65ywP7/O6fQAO9Uxn3NOVkm8J4vsqs8B0sDGst0fbN0=;
        b=nYklKOLkn/2LjbLqfc7LVtutUEzgsjxKIw9WdheiKKCSYRh0MBOpsVTW0fmGsLcNU1
         a9ubT5FYqecsGuVkY0t5WpbJVpUq20Yb2BMjCtN+zDtmXP1RC3AmFJzmux7osy75y/kU
         GxoQ5pLtPkdio4PmfuJ7FjkBte8ECtQhV8w3CnGoLZj2E5d57B+1IIjrd3Hp5Rzw17Hj
         QcditxXrwawpQmL6cy8XJ9Ig8fwnXYjhaYmgBxWXGx+Z4XZ+El1vjvaX9cbTjZA9OPja
         aMHPJ9DSF7LOcNDtHjnkkwm5iqci8iiwMm1jGSkPXUqHBi0tD/POak9JHpHX3t+TBlCc
         0TZg==
X-Gm-Message-State: AOJu0YwW5/l87SUG2UWRi6Jpug9XnzR+8g5Vqq2pYRcLtETaOj/Vakv/
	6nZBSQgqtPuRNMJ8rlnJ56ecHWQm0jZPn6qLekYD7+d15qRgI59ZYg/1zA==
X-Google-Smtp-Source: AGHT+IFWuWgg8/OtIwgco2BJ+kY4lwdnIJJmdcufARbpnK82Rfv+NqBTW6bkkEKQP2wPKcclw0fhHQ==
X-Received: by 2002:a05:6a21:3992:b0:1c4:a55b:8146 with SMTP id adf61e73a8af0-1c4a55ba9e3mr11835793637.26.1722412610683;
        Wed, 31 Jul 2024 00:56:50 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.83.154])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead6e16fbsm9788372b3a.19.2024.07.31.00.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 00:56:50 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [RFC v1 02/10] book3s64/hash: Refactor kernel linear map related calls
Date: Wed, 31 Jul 2024 13:26:06 +0530
Message-ID: <3e764710d8097965b00fc2ed7b54f4f0e1487781.1722408881.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1722408881.git.ritesh.list@gmail.com>
References: <cover.1722408881.git.ritesh.list@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Donet Tom <donettom@linux.vnet.ibm.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, "Ritesh Harjani \(IBM\)" <ritesh.list@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This just brings all linear map related handling at one place instead of
having those functions scattered in hash_utils file.
Makes it easy for review.

No functionality changes in this patch.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 164 +++++++++++++-------------
 1 file changed, 82 insertions(+), 82 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 1a1b50735fa0..b6ae955971bf 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -273,6 +273,88 @@ void hash__tlbiel_all(unsigned int action)
 		WARN(1, "%s called on pre-POWER7 CPU\n", __func__);
 }
 
+#if defined(CONFIG_DEBUG_PAGEALLOC)
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
@@ -2117,88 +2199,6 @@ void hpt_do_stress(unsigned long ea, unsigned long hpte_group)
 	}
 }
 
-#if defined(CONFIG_DEBUG_PAGEALLOC)
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
2.45.2

