Return-Path: <linuxppc-dev+bounces-1543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01899983CB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:11:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTy23ZQ1z2xwH;
	Tue, 24 Sep 2024 16:11:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::635"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158266;
	cv=none; b=KbCdOHW6je51gXbBUGC0Y04ppXqYXRKDv/5ag/ZmE0A8yDkZCUjGoSTZDseY/rNdlXrezvfKXvtYMtjJyTmAay0xCmTcKlQiu4OCj4ORIuPM/K6zgyhDUgMNYenIsfG/SePvd1lRn7fzJW+CgcmfEbXNIvx660E+NHvinXNdkgAt7FvYr3cEkzR5YsdOhJ4vvcpIBcq3GLGq7daFa1L1y/YkTsAoaHIRkxJJMXEiz4eeDfxcFBF5OjM/P9dEGKa+Z79zWPuyUqlQG9y5SVUEkkSswW6AAxzOG63e61+eVISACiGjelR9Gl6/TarrxaOT1Lf+PtS1sYYUztjnekewMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158266; c=relaxed/relaxed;
	bh=WqTOjUnPHL3XRjrt8I2PlSfGhzwzG7n3dPRatvbgECo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BNaYxSQiUW0HD1dxTWY2ro2Xy85mhjiIoWQhSoKpwNE8/0pVvh7QVd5Lb3Pag1ee7MDMIHf2/UlbRks4cgYaPRWDpUK8ki0bJQIHwd2cOLuY+5k3g47Dga4Vu3g9awkELT2alMrb47cY6GsvkaQchQKPYZi6v/r0yn4KeQ1PtriDxDABPUqVtmoDRUFUqccw4eLnl+sZfYjHl2lLzf9GnpXLCrBOIZp3EYTY0fYQfvZX+B4ena7Ne+fBsbGbwzED6V/y3OFIbaZF6g0OW2qyTsgODbGzfl6Uk7GMBsUeY467B1hfb1cSll+oRKKyE3JCCI4dPTHTCcYOV3V0ll8uUA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BEhsSh1S; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BEhsSh1S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTy21FYPz2xMQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:11:06 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20536dcc6e9so32524095ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158264; x=1727763064; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqTOjUnPHL3XRjrt8I2PlSfGhzwzG7n3dPRatvbgECo=;
        b=BEhsSh1StkuPnncnF0iSNvzXTPizpZ6MwlKU4SwmM3k5v2dJjAV0iELf1PGD3uII9D
         Ed/CKAB6zuG9MCGCGPbveR0FY56fNHuZQcigNIuptEwgFUEb0+v/rEhZPR/SKrGNm+th
         2xLFNQX+CLvR4wr36RsbpH5D1Nk+SXgB3xY9N46fOu6R++6u+Sw3eG1VOju8Hj7Xjppw
         tRh6ZdEcuVEnjU6aCsyG9LqI0E1c3hYqr7MmihrdDvFeZ6kOBuw7+khpb5Sw5MgxFCFl
         l6eTWd1XPPMe5ggQXyCzA6BOcv0eviZSHmm2OEInyNtVPlRnLvYJIEg1LGtojWT0lCap
         fFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158264; x=1727763064;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqTOjUnPHL3XRjrt8I2PlSfGhzwzG7n3dPRatvbgECo=;
        b=aYPYrl3XVvDj+nX77LVQ0M72nCgNxY+GrGMbt9e1E9o69/ehpI83msHxdHjYsVv2Qq
         dhlRr2iorGQ7G58+E6GOIQcFHxdgXsBGAebBs1RaD096dBkpnBTEBLT70g5eBao7A486
         jJNDssFLrmGpUpl+5SVOg/Cu438z46K5z7/DXBuY3gCT48GJbsPVn/w8ccvy/7fHjL9r
         bnFaZzyE3BHdvUSEt1vzU5dvo7NuZlJHD4JYBFV7COKryzEERs32IiBpUOJiZEstF8s2
         0fv8M8MrlSB7MaS1OapFG3N+0JWJeaBezbLXG1jgQ5ALBmI2Q7sh7CCOR3pyZTchB+fn
         Brxg==
X-Forwarded-Encrypted: i=1; AJvYcCW5n9BFvawI7d4BvI5eClW52mDcQtBom0D68N4RtjdodBv/hmFqH/OV80BC20G6yZCp9n9I87M2xDk0VY4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzz47aZ64s7emkKmeEAqTJg+L7h9PXytEUlsyiO6wb73ZcYzPZf
	Dix5IrZS7+rNJSFXx/xGdEPXnzwI4DcFgG4QM7I0Z2agpTkfIlhtqHf66BYmm/I=
X-Google-Smtp-Source: AGHT+IGIKI1reF9Jfo+dWimmN1cyjgiGD8qn8mcbfIJc2tOglwlNFzTXQQXYEG1VSSXByHdLorgo7Q==
X-Received: by 2002:a17:903:944:b0:205:4e15:54c8 with SMTP id d9443c01a7336-208d8440f7amr165611365ad.61.1727158259613;
        Mon, 23 Sep 2024 23:10:59 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:10:59 -0700 (PDT)
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
Subject: [PATCH v4 05/13] arm: adjust_pte() use pte_offset_map_rw_nolock()
Date: Tue, 24 Sep 2024 14:09:57 +0800
Message-Id: <f2359e4fe8b9806e878e6b28c4594d741137faf9.1727148662.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1727148662.git.zhengqi.arch@bytedance.com>
References: <cover.1727148662.git.zhengqi.arch@bytedance.com>
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
Hi David and Muchun, I did not remove your Acked-by and Reviewed-by tags since
there is no functional change.

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


