Return-Path: <linuxppc-dev+bounces-968-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2633496B52D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:42:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGFl0VDcz2yVt;
	Wed,  4 Sep 2024 18:42:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439339;
	cv=none; b=Pll/7iQkr9wVOK3QEtz/Pz9cm8a3aNvHnfaDMn/f1pIBIOLEaKoUtMhTH+X33j/HYirWP1F/zPBQNhJyaui1PycrJB8vSJtk6KlxN4WAD+DEtopAxxvgjU/HsCYSEnxf8tsHoie+cnwlhsrBOIuXxOOIjnV+M/DNGKSoeNMFWI52BxxfeWHOs5SPQM7597WZDhD4RwDsxlTP3ED2PGFjWrha3GKAszcgPe+HilOcya8qFweb4kwiTKI2Dn3vtZadv+gx1YkBxE14RkHqM77bKWwpOkqG6eLJ/8BEIKPAyoCD4KGn/QIC8vOcAKAICGtMqqFqSK/JuBYUA7uyvAITPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439339; c=relaxed/relaxed;
	bh=ylbiZHnndQyBxRrEPbsYoqCd5Ue19pmhRhZr0okk+70=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=Mfx5HGohaT+k7wu4w0iZTc430fIRhQOgCQVidMYfgEqpr+cYPOIRCs4v5rIdUhEOyn4BaOm+fV5tZcHusrgowM5i5g5dHXzU3BjqB/AqReMK6qFZgfYTJBwTU+lghumHThoJD6x2uUW/A2ZS+f8b7dO73Ierv5/WWpAdw3vgABvDUNKbKlCAHb93bDQmJft8a4t3v5iMv7/2+Ch+HED/XKoKgmfh6TXXYdT7p0ZCecdooeVLwt3Vi61mFUtBAJgi0DB2Khlg0vnJTWcbeGg8A7tyDeUAPtisRhsqn9NloZrIdGNW47cLJmEKFjkC/f4kGA9YUr2/JkLDhNl3xmO4BQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F5P1cFfj; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=F5P1cFfj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGFk5MF6z2yR9
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:42:18 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20543fdb7acso28484515ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439336; x=1726044136; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ylbiZHnndQyBxRrEPbsYoqCd5Ue19pmhRhZr0okk+70=;
        b=F5P1cFfjcB/qPN5d8YLnueLr6Sd+dqPDCCHsmYxXxHmJsmL8qYCW+scdJfJ8AKGZ4Z
         /b7Abkr+qGE4gasaDDteqFIPWM7i6IhP/4d5AESBQAwsXb8sdnml9EjNFqQLsBZShE8/
         1VFboBus/mkdWEC/bJphFzV5q6aeYx4n1K7491AXSS6JeDzrIlRSbgwNLVnokmVvCxMj
         zXGc6uhwJ74iPhh6l4I5DgvrfAiu9o5qSOXocpgaRuQfFIMayQaZVtm6Ob4uMU5pl0of
         L9KSOXSkHwYzbuaM4kPpYi28cHa2ltTKYCcIrG/t9G5ByzMqccs2LyV4wUp2SmfZe6cy
         9a1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439336; x=1726044136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ylbiZHnndQyBxRrEPbsYoqCd5Ue19pmhRhZr0okk+70=;
        b=Upd2sXPHlJGHXRZp50M98UmLvFJZgLaNw56ro7LNjsgFR8nZscrL08qvEuGR1aTHdy
         eIJtgWpdQcQshjRb/me8+c0MQu9mULI4L+1df5D0NM2/uPagEykOZhp2uwNZIKvVwBuF
         3P2Cgs7rLx3aU6T+ZrjQ7W2EvO/lp6xupzrfteLkvc75pX64da3Ltns3QwZJb+5T59Ze
         EPPoTN4Igjuw5SYaqQ+h6MODraW1AIKD1+gpjZ69AnQT5lzQdKynVZwVVUvGVfxQm+ko
         sl/7g1bS0A9vnTdXUS+Hf5oQFGrxlWVa9x7tHCbxeoLJNxaHluzSov3ErWvaXsiax7aF
         RooA==
X-Forwarded-Encrypted: i=1; AJvYcCVn7pYp6QjUEd9sT0Zow1HoCThyo5j6lCsYM0EukCXVcrJJmaxc276LkMxKi9rwpankv0ug6s9cMWWAJxo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx6YpVMH9JDgse4MHxYpc8fMeju2I5CvFTI/y3Ky1HCPy8QcRw7
	6Vbx3DKztjhV4ZLx4ePNneypDTgDgemQN1MAJxhuyZoVRewCIhTMm1ZZ7BofeGk=
X-Google-Smtp-Source: AGHT+IGRRbNTDVHBE5FEDByUohEYiQ4MupDiF5X1fYOKyMaX8J1f74Xy7lHxJ4SbBUityp3jftUwsg==
X-Received: by 2002:a17:902:e848:b0:206:c43f:7896 with SMTP id d9443c01a7336-206c43f8dd5mr2410565ad.21.1725439336115;
        Wed, 04 Sep 2024 01:42:16 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:42:15 -0700 (PDT)
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
Subject: [PATCH v3 14/14] mm: khugepaged: retract_page_tables() use pte_offset_map_rw_nolock()
Date: Wed,  4 Sep 2024 16:40:22 +0800
Message-Id: <20240904084022.32728-15-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
References: <20240904084022.32728-1-zhengqi.arch@bytedance.com>
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

In retract_page_tables(), we may modify the pmd entry after acquiring the
pml and ptl, so we should also check whether the pmd entry is stable.
Using pte_offset_map_rw_nolock() + pmd_same() to do it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/khugepaged.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index a117d35f33aee..318cc3eefb040 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1724,6 +1724,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 		spinlock_t *pml;
 		spinlock_t *ptl;
 		bool skipped_uffd = false;
+		pte_t *pte;
 
 		/*
 		 * Check vma->anon_vma to exclude MAP_PRIVATE mappings that
@@ -1759,11 +1760,25 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 					addr, addr + HPAGE_PMD_SIZE);
 		mmu_notifier_invalidate_range_start(&range);
 
+		pte = pte_offset_map_rw_nolock(mm, pmd, addr, &pgt_pmd, &ptl);
+		if (!pte) {
+			mmu_notifier_invalidate_range_end(&range);
+			continue;
+		}
+
 		pml = pmd_lock(mm, pmd);
-		ptl = pte_lockptr(mm, pmd);
 		if (ptl != pml)
 			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
+		if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
+			pte_unmap_unlock(pte, ptl);
+			if (ptl != pml)
+				spin_unlock(pml);
+			mmu_notifier_invalidate_range_end(&range);
+			continue;
+		}
+		pte_unmap(pte);
+
 		/*
 		 * Huge page lock is still held, so normally the page table
 		 * must remain empty; and we have already skipped anon_vma
-- 
2.20.1


