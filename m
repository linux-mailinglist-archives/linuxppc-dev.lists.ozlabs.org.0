Return-Path: <linuxppc-dev+bounces-1611-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 322A8986CCA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:47:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkgP1KsFz2yV3;
	Thu, 26 Sep 2024 16:47:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::833"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333265;
	cv=none; b=lrgOrAu5vNG7Yt288WAuZJZLrFqvkEy6U7gQVQUnBavdzNA4Oqv/CmKVKETAMupF0jnRzXZQaFE2VCY36tyXVxfqU4+rd8bjN2EZNbgbyU8iAm8EtNJOQ15et497HcbDv9G8d0Eau2gUbkHqA4Vv1zNPchqi/nSTkgPh1Oh/byEFQ4iKYd+Pr5hQVPTAfrTb+LTlzYEIX1J++RFaXY0f8U+DjP1buV8DCnExTUYg/hFlV/2kSHUMIOG06nxcssYhA1lDz4rBh7YxNcwssCGx9kIszAbBA2EFq5ppcAz9Oyg+kyaRtDoZp5H28GGSdp5JUPPtHenu6ChUwX+5WOrzaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333265; c=relaxed/relaxed;
	bh=ffdIJrLHJ9HLo1zmy1fROVnOG/sDLfcmik2lSMoQorU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OgG3AsN+09pLKu64CPVSPnekOP1aSv7ZLDxCosbrekiXjRllZJLza6kyCa0mi26lu0RPXX09wbK2TbEJ2GqCNtpe+gpOcbFN4+S8nzZwJ+lneAxwwlm6t/+kjkPFIp7SHRligcKiopc1gX8IABzAJtaGoTKYcKZZzh9Ndxe5Ms/dI2sftLdxKS49ob0AXy8Gg0weVI4s9Knn2RB4xFvJbnoz4voNn+BxpZ4dpirVTfFsgpQVi18/HU0/tvmzAG0HxDKtYSamsafn+8ZucH/jEK6/LhiXcwVSTAjY9vvRJmND3fmyV4YYlcQC0GdW1/gHKoDbs8fmGj01c+ZEKaVL/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DIvJIVgv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DIvJIVgv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::833; helo=mail-qt1-x833.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkgN5FQ6z2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:47:44 +1000 (AEST)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-45816db2939so4046211cf.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333262; x=1727938062; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ffdIJrLHJ9HLo1zmy1fROVnOG/sDLfcmik2lSMoQorU=;
        b=DIvJIVgvmrwDx49Ozbx1Npq3FNMFhRlnQ/X4EvfYYXSwRt2iukFh3zP2C2+dAlF4ym
         0mAqa3WpUiTR8MaI97yaDvEDxAHmhmPI6ZIKjf34FJ04KYe0+0nV3WRpDs+Dnr/RUkvN
         /CgmCcX1jO5Su8OlmR/AnBL53RoLvqowFrnxQhy87MKG8BhX9rzuqwILgh1mKCvOG3Fl
         ldClPZkQfQSIctJilIzyUCymEPy8k5cBbF5ObA0N0Lo6wUT9KEn5sjxTEG48FMMuWMeK
         Y67pq34aggItW+QUh3/4v7FR53bEVc/w9toDvdc6FTYqzq1LxAQq73UQ3VuOdYd4RvS2
         CcUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333262; x=1727938062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ffdIJrLHJ9HLo1zmy1fROVnOG/sDLfcmik2lSMoQorU=;
        b=peeGmqOLzLRtnNf4eRzABSWwxTTgz2l0OZrcoQ5z9y1G2r51+x58wfMeYpK1C4Zn9o
         M7e8vN0UYw2l1/wkXKM2vzQUn5nl0TPoxlpiKeLAKUAmYjT0VZX77jf3NcbDjBEfhW4v
         IPNRA47uMUEIx9gkdutu+yeFqIWiyQXvtS1r4ChtrF51e4/XIprWxW4vG+KrwE+4c5Sa
         /2th9IuhqM4coVqRhqbNlab7ceol2KxiNXxjyId8ClmKrJJ52BRYxt/Vyhvwq8r0jofM
         VnfwTUjmNI2bvP0O8q5kboeJFgxiGsHLk+nT0pLHtyQsMFWR9nc2N2kQHI3TGU5lIsk8
         OmEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTX19rDT077ti5Ss2A57sWkSYmdnmqUvrnH+bzIm8UTtl0yawLyIlVCDKCQHkkbQEXav4JKdvjmATvaUo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwUfIuVdSu0B0p8/IrNdCNCXgjfbVBU+lO9dM9s2qDgknAmCYRz
	NV4/bWhprBqYwb8iz31krFRcXO6853roeJRgcBtz0TOf/af0GUtyW4bgzPTyKzU=
X-Google-Smtp-Source: AGHT+IFPPE2WMfZ0ye6LGa3/R8zXQ/6KjVtS14uw6772ox/YEy7cH2DCZDAwEci91jHXPd4jVDRFUg==
X-Received: by 2002:a05:622a:1493:b0:457:c747:cf3c with SMTP id d75a77b69052e-45b5e0534ebmr99370671cf.57.1727333261763;
        Wed, 25 Sep 2024 23:47:41 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:47:41 -0700 (PDT)
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
Subject: [PATCH v5 07/13] mm: khugepaged: collapse_pte_mapped_thp() use pte_offset_map_rw_nolock()
Date: Thu, 26 Sep 2024 14:46:20 +0800
Message-Id: <055e42db68da00ac8ecab94bd2633c7cd965eb1c.1727332572.git.zhengqi.arch@bytedance.com>
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

In collapse_pte_mapped_thp(), we may modify the pte and pmd entry after
acquring the ptl, so convert it to using pte_offset_map_rw_nolock(). At
this time, the pte_same() check is not performed after the PTL held. So we
should get pgt_pmd and do pmd_same() check after the ptl held.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/khugepaged.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 6498721d4783a..854577f39957d 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1605,7 +1605,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
 		pml = pmd_lock(mm, pmd);
 
-	start_pte = pte_offset_map_nolock(mm, pmd, haddr, &ptl);
+	start_pte = pte_offset_map_rw_nolock(mm, pmd, haddr, &pgt_pmd, &ptl);
 	if (!start_pte)		/* mmap_lock + page lock should prevent this */
 		goto abort;
 	if (!pml)
@@ -1613,6 +1613,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	else if (ptl != pml)
 		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
+	if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
+		goto abort;
+
 	/* step 2: clear page table and adjust rmap */
 	for (i = 0, addr = haddr, pte = start_pte;
 	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
@@ -1645,7 +1648,6 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		nr_ptes++;
 	}
 
-	pte_unmap(start_pte);
 	if (!pml)
 		spin_unlock(ptl);
 
@@ -1658,14 +1660,19 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	/* step 4: remove empty page table */
 	if (!pml) {
 		pml = pmd_lock(mm, pmd);
-		if (ptl != pml)
+		if (ptl != pml) {
 			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
+			if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
+				flush_tlb_mm(mm);
+				goto unlock;
+			}
+		}
 	}
 	pgt_pmd = pmdp_collapse_flush(vma, haddr, pmd);
 	pmdp_get_lockless_sync();
+	pte_unmap_unlock(start_pte, ptl);
 	if (ptl != pml)
-		spin_unlock(ptl);
-	spin_unlock(pml);
+		spin_unlock(pml);
 
 	mmu_notifier_invalidate_range_end(&range);
 
@@ -1685,6 +1692,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		folio_ref_sub(folio, nr_ptes);
 		add_mm_counter(mm, mm_counter_file(folio), -nr_ptes);
 	}
+unlock:
 	if (start_pte)
 		pte_unmap_unlock(start_pte, ptl);
 	if (pml && pml != ptl)
-- 
2.20.1


