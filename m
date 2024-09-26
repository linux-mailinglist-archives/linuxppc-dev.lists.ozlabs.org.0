Return-Path: <linuxppc-dev+bounces-1609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B51986CC6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:47:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkg53GmCz2yR9;
	Thu, 26 Sep 2024 16:47:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::829"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333249;
	cv=none; b=Vv3ZDf07LTtDthQqMGEXpkcfOANfo154FilkTAyDlXDlta6zhejGtv7RqYiAMEFca071nVkTM2ZNq+7JE+aadavbnzlRcBoMMqPVdBo5xFEgCe8mEcFsd751pTdiA+jwBSAlNcqQTPcI8IRLwAf0WnbN7p65HoRNIYLGdAOP065mbIYxFl+SQCce9ACU2RBUk90cqqTwUvMouANnnPf+0G3BF/2ME1gXt137qG1zuWjwPkVDLWtQM03Y9pmCLZbBcgIDjRHZDVl32hKaQh3MyX1mjArl0QfLsYFdVS/YHFytRQ8Cds8WVmdhX8B9E7IplP32sXA10qdvZLGeBwK7Pw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333249; c=relaxed/relaxed;
	bh=VXy51M36oXFNN3kWVEF6T1v76BlvE2cEswNH4MTPbjU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hSl6Ug0VLar0+W3uwNMGmDw4DNpxTOP4fSTqX+WCESup+hIHyyMQUo626GZR0dFpwydm+TAgYdsBuLDD3YNRYoi7O58l9iTPOG8U4ZOc7S0oueNb/KIkhAGOG0/9kmVFR9Qo/mn7NjkfdyizejleuKNE1SUgGV0ZOvG2mSKtWCt8+mJZXgdgu8pMzI7aBh4DYqbMTbM/5lTkZW7lKTE4GosTqJBvR6VSSuO7UhBSSNRI/z1WUJLWk1X8qftgA6PI+MZ1aKl+MtH8u4WIh1TUFnNWaCVMSeJ9FjeECLGC6xdlg+du0TUSigwLM6WA0hRCSK2o/kCvWpS9Kqpc1EG2aQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TCmBHdQv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=TCmBHdQv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::829; helo=mail-qt1-x829.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkg51JCwz2xF0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:47:28 +1000 (AEST)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-458362e898aso4395541cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333246; x=1727938046; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VXy51M36oXFNN3kWVEF6T1v76BlvE2cEswNH4MTPbjU=;
        b=TCmBHdQvdGjhxnXYaryLaJ314VZGjyp++WMHxvAnrRzC0QdqkIwNh3MB8MIaadXrBG
         FAfnrB4UwPXOYcQtNm25hIJLiydPTEe/ADAhO+zjNMwkc2EDI3ar2cBfS7KW9F07g34x
         xA6/4jZK5+J3lLgmryXmwnRU8WqWdySWWgiP2RzsvpgHmKH4c7BchgB6meh58ZGELUE3
         sku2U6KkaKi2SYABY8zIPZpQRzZeNqjDFd2qWQxcqnW90fMtbF8LR39yM74FZ5fbEH1M
         x40a07iUI33b4iMEOwWa6dB9/lzgXdGvRTTlGJha8VPrquNXfT4sg4tDsNbXmzT7H47w
         jDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333246; x=1727938046;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VXy51M36oXFNN3kWVEF6T1v76BlvE2cEswNH4MTPbjU=;
        b=eq8VpuNS/QDC8CO+A8ga/JuAaO3iCT/fgdi7WXT/m0ha54AIVVj96h9X3n0r6hQ4EX
         dT3MbyabckFccFEo6Pqo6yyrWEN5yIMKEMwY+QpiJ9lyke3/iWc8XnPRe28SR3Y2Wk4+
         o4yBz6KadYuHMthxCiups6fCdw6SwZzb4TDnpu9Gm4JE+tehUOifpu924WALsKXF48Ib
         U27BrxXKiq+EKp3Ej4OBzjKGyJZCg0Sn78Su0he0npWwwvYM7Be1BtcsmkQlimN26tHr
         OSw0+OqWaRV1aMSPAn8xNcPeAxXoTT0fDK2Yfn5LsDm1C8HKPOjTAx+/JidzIfOV9zCL
         BJag==
X-Forwarded-Encrypted: i=1; AJvYcCWM2t1gXBqbN96Tn6IvVvI26bF4liIjeJyHgtwLlNQXyxqZqAUuOSTinekWVQRfvspu2Jb8vXWCPFlaIWs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YznyfF+W51sW7tKviVidfSM0VeSBbWgeu4WmKE+uRKJV6nwYOFz
	zq+cRuQBJh7LHjXryPeImZvD+CuFC6qHob1019vq8/H5oOIPgWZxIVDEj3xjWM4=
X-Google-Smtp-Source: AGHT+IGInGARMP6O0lOtN8I02J26ctBRW9WAU/Ifxw0RvFOYg2EOnEie2juwEDAOYLUuf+d4v6O7qQ==
X-Received: by 2002:ac8:5885:0:b0:456:94fe:dcdf with SMTP id d75a77b69052e-45b5def4674mr66807991cf.35.1727333246109;
        Wed, 25 Sep 2024 23:47:26 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.47.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:47:25 -0700 (PDT)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: david@redhat.com,
	hughd@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	vishal.moola@gmail.com,
	peterx@redhat.com,
	ryan.roberts@arm.com,
	christophe.leroy2@cs-soprasteria.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v5 05/13] arm: adjust_pte() use pte_offset_map_rw_nolock()
Date: Thu, 26 Sep 2024 14:46:18 +0800
Message-Id: <0eaf6b69aeb2fe35092a633fed12537efe645303.1727332572.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1727332572.git.zhengqi.arch@bytedance.com>
References: <cover.1727332572.git.zhengqi.arch@bytedance.com>
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

In do_adjust_pte(), we may modify the pte entry. The corresponding pmd
entry may have been modified concurrently. Therefore, in order to ensure
the stability if pmd entry, use pte_offset_map_rw_nolock() to replace
pte_offset_map_nolock(), and do pmd_same() check after holding the PTL.

All callers of update_mmu_cache_range() hold the vmf->ptl, so we can
determined whether split PTE locks is being used by doing the following,
just as we do elsewhere in the kernel.

	ptl != vmf->ptl

And then we can delete the do_pte_lock() and do_pte_unlock().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 arch/arm/mm/fault-armv.c | 53 +++++++++++++++++-----------------------
 1 file changed, 22 insertions(+), 31 deletions(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 831793cd6ff94..2bec87c3327d2 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -61,32 +61,8 @@ static int do_adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	return ret;
 }
 
-#if defined(CONFIG_SPLIT_PTE_PTLOCKS)
-/*
- * If we are using split PTE locks, then we need to take the page
- * lock here.  Otherwise we are using shared mm->page_table_lock
- * which is already locked, thus cannot take it.
- */
-static inline void do_pte_lock(spinlock_t *ptl)
-{
-	/*
-	 * Use nested version here to indicate that we are already
-	 * holding one similar spinlock.
-	 */
-	spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
-}
-
-static inline void do_pte_unlock(spinlock_t *ptl)
-{
-	spin_unlock(ptl);
-}
-#else /* !defined(CONFIG_SPLIT_PTE_PTLOCKS) */
-static inline void do_pte_lock(spinlock_t *ptl) {}
-static inline void do_pte_unlock(spinlock_t *ptl) {}
-#endif /* defined(CONFIG_SPLIT_PTE_PTLOCKS) */
-
 static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
-	unsigned long pfn)
+		      unsigned long pfn, struct vm_fault *vmf)
 {
 	spinlock_t *ptl;
 	pgd_t *pgd;
@@ -94,6 +70,7 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	pmd_t pmdval;
 	int ret;
 
 	pgd = pgd_offset(vma->vm_mm, address);
@@ -112,20 +89,33 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	if (pmd_none_or_clear_bad(pmd))
 		return 0;
 
+again:
 	/*
 	 * This is called while another page table is mapped, so we
 	 * must use the nested version.  This also means we need to
 	 * open-code the spin-locking.
 	 */
-	pte = pte_offset_map_nolock(vma->vm_mm, pmd, address, &ptl);
+	pte = pte_offset_map_rw_nolock(vma->vm_mm, pmd, address, &pmdval, &ptl);
 	if (!pte)
 		return 0;
 
-	do_pte_lock(ptl);
+	/*
+	 * If we are using split PTE locks, then we need to take the page
+	 * lock here.  Otherwise we are using shared mm->page_table_lock
+	 * which is already locked, thus cannot take it.
+	 */
+	if (ptl != vmf->ptl) {
+		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
+		if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
+			pte_unmap_unlock(pte, ptl);
+			goto again;
+		}
+	}
 
 	ret = do_adjust_pte(vma, address, pfn, pte);
 
-	do_pte_unlock(ptl);
+	if (ptl != vmf->ptl)
+		spin_unlock(ptl);
 	pte_unmap(pte);
 
 	return ret;
@@ -133,7 +123,8 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 
 static void
 make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
-	unsigned long addr, pte_t *ptep, unsigned long pfn)
+	      unsigned long addr, pte_t *ptep, unsigned long pfn,
+	      struct vm_fault *vmf)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	struct vm_area_struct *mpnt;
@@ -160,7 +151,7 @@ make_coherent(struct address_space *mapping, struct vm_area_struct *vma,
 		if (!(mpnt->vm_flags & VM_MAYSHARE))
 			continue;
 		offset = (pgoff - mpnt->vm_pgoff) << PAGE_SHIFT;
-		aliases += adjust_pte(mpnt, mpnt->vm_start + offset, pfn);
+		aliases += adjust_pte(mpnt, mpnt->vm_start + offset, pfn, vmf);
 	}
 	flush_dcache_mmap_unlock(mapping);
 	if (aliases)
@@ -203,7 +194,7 @@ void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
 		__flush_dcache_folio(mapping, folio);
 	if (mapping) {
 		if (cache_is_vivt())
-			make_coherent(mapping, vma, addr, ptep, pfn);
+			make_coherent(mapping, vma, addr, ptep, pfn, vmf);
 		else if (vma->vm_flags & VM_EXEC)
 			__flush_icache_all();
 	}
-- 
2.20.1


