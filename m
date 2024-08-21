Return-Path: <linuxppc-dev+bounces-270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7355B9597DB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:41:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjZ82PcCz2yNB;
	Wed, 21 Aug 2024 20:41:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102c"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UKjFS8Ys;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfQn1BpVz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:20:16 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2d41b082ab8so2511550a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228414; x=1724833214; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ATsR6rCpxZFOFORcauHss5xESVmegH/7Abibhpgyw90=;
        b=UKjFS8YsjVO6O5pn+se1rrFO4hMfOb1Cd8CQu95OhBwI74BCS3qeeIaIBDVyVxv6xH
         etGYk+lXDOL7fPVeZx7etGUGT9wlOwqPS4NmT4X8RkocmYkNDusonI0PpiYrx9eIoYqI
         tj8sbE+dtu8Da45RgDuKjPy86bDPOvHNVm8LlEd8ifUd96Z+NLfH0dkzf2CxhBBSuFYR
         zTbaJ8xRfHrWuGdoj96fzbTyXgE1nVvpkO1UJyoWqL+Jnhigrgf3FSIh/ldeGtKhzMVc
         VWzejsC7Y2MBMGB3mpJbIwyXx08qFhItAqhcnBGfaz7e+OmZZ/jEccgpmlSaK+G8F1pr
         JP+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228414; x=1724833214;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ATsR6rCpxZFOFORcauHss5xESVmegH/7Abibhpgyw90=;
        b=fcOog+cRgEpI/NHTOrPe1Bc2AXP1gjwl4yE2CkBB8vKfyjh2Srtr1xA25lFsb+Yi8C
         rKzYefp3jS/FBLdE6tNAe4FCQ7fv621vusJltKZ72ehQlBsaJxinq4kbq4GZs5BYkPD+
         bQ/7se11kwxhImUFLTiAFaju2Yxb4mugMvtv5ZasCy6acx6YQV3Nd3XEMaEbKuNnGUvA
         IDGyEi8Jpg0j+tWtTD0TkAd6qRqraEUO8g87BZOzDvEMschWSv0B+QGZ2D3/KNZqCl5k
         6BxiBWJMcbjHHxLApmvenco/hrGMKe3i95KX4aDzGowJQFyPFjXiwvY8vOpizlBC4E9T
         N/Fg==
X-Forwarded-Encrypted: i=1; AJvYcCU56TzC773xUdTmkn7MrNajZwnhoD933tR/rV2ve42esHE1rCd09dwQCYv371hRZnToVvcIHabewvlxAYU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwH/I4G8T1R4aHTgN3P1nBKpXHgMHgIxZ4kdJQjLftg6mwHRGot
	ubU+JJrxq0Kh/QMPmmaZZPh/2df3/23qsJYXHo8edghzbiHnROVgs+Tch8PykQA=
X-Google-Smtp-Source: AGHT+IEASO/tYfbmKEqODBO5ptoLkIYqajvyb9bjTzXqrTBGFe58odiOJRUvoUKiSb3oI+1Cc8Ov6A==
X-Received: by 2002:a17:90b:1c01:b0:2c9:9658:d704 with SMTP id 98e67ed59e1d1-2d5ea4c9ab9mr1366119a91.40.1724228414402;
        Wed, 21 Aug 2024 01:20:14 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:20:14 -0700 (PDT)
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
	ryan.roberts@arm.com
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH 07/14] mm: khugepaged: collapse_pte_mapped_thp() use pte_offset_map_maywrite_nolock()
Date: Wed, 21 Aug 2024 16:18:50 +0800
Message-Id: <b71a4053e28d1b0858b6315fb78b9918948b595e.1724226076.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1724226076.git.zhengqi.arch@bytedance.com>
References: <cover.1724226076.git.zhengqi.arch@bytedance.com>
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
acquring the ptl, so convert it to using pte_offset_map_maywrite_nolock().
At this time, the write lock of mmap_lock is not held, and the pte_same()
check is not performed after the PTL held. So we should get pgt_pmd and do
pmd_same() check after the ptl held.

For the case where the ptl is released first and then the pml is acquired,
the PTE page may have been freed, so we must do pmd_same() check before
reacquiring the ptl.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/khugepaged.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 26c083c59f03f..8fcad0b368a08 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1602,7 +1602,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	if (userfaultfd_armed(vma) && !(vma->vm_flags & VM_SHARED))
 		pml = pmd_lock(mm, pmd);
 
-	start_pte = pte_offset_map_nolock(mm, pmd, haddr, &ptl);
+	start_pte = pte_offset_map_maywrite_nolock(mm, pmd, haddr, &pgt_pmd, &ptl);
 	if (!start_pte)		/* mmap_lock + page lock should prevent this */
 		goto abort;
 	if (!pml)
@@ -1610,6 +1610,9 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	else if (ptl != pml)
 		spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
+	if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd))))
+		goto abort;
+
 	/* step 2: clear page table and adjust rmap */
 	for (i = 0, addr = haddr, pte = start_pte;
 	     i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE, pte++) {
@@ -1655,6 +1658,16 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 	/* step 4: remove empty page table */
 	if (!pml) {
 		pml = pmd_lock(mm, pmd);
+		/*
+		 * We called pte_unmap() and release the ptl before acquiring
+		 * the pml, which means we left the RCU critical section, so the
+		 * PTE page may have been freed, so we must do pmd_same() check
+		 * before reacquiring the ptl.
+		 */
+		if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
+			spin_unlock(pml);
+			goto pmd_change;
+		}
 		if (ptl != pml)
 			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 	}
@@ -1686,6 +1699,7 @@ int collapse_pte_mapped_thp(struct mm_struct *mm, unsigned long addr,
 		pte_unmap_unlock(start_pte, ptl);
 	if (pml && pml != ptl)
 		spin_unlock(pml);
+pmd_change:
 	if (notified)
 		mmu_notifier_invalidate_range_end(&range);
 drop_folio:
-- 
2.20.1


