Return-Path: <linuxppc-dev+bounces-273-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6949597EA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:42:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjbK3rMbz2yQL;
	Wed, 21 Aug 2024 20:42:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HjF5ItjY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfR91Gz6z2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:20:36 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2020e83eca1so43752575ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228435; x=1724833235; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MvwQXaavnjACpbuRjCPShfvJkJjZwFPa7EtFYmq5Q9U=;
        b=HjF5ItjYseB91OrfwVkLp26Qy6+Cl58KP7qv5e3mKZdc9YkP1BLerdnlqzXNWIlH2h
         u3RKVz/lqnDgQXLMt7O3kCN6oalEROW6fV+jEOKMFCt6Oj8QFBu6txEKvN2TQmXLBHt5
         4htoTdNju6qLwxUvmBKSGF/da49ZXidw52DprKbHF436ULE6AEWdk64t4kvpMzt2AM1y
         wZuyHtEzN2A2EOj7YeVRCo/Al3X9XtESocEBIOUGaUWDrI2pdWP0FiewBNYwF+Pf3Ss5
         l26DFn5sWrDF6sP5OBZ7ek6qazpPjUdQEQ3OXpoe2Ah5wSoEt3HCYKhruaK9rS6SZ0zY
         M5eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228435; x=1724833235;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MvwQXaavnjACpbuRjCPShfvJkJjZwFPa7EtFYmq5Q9U=;
        b=AhZTOROwZPERzNDl1pjBYbHOQLqQ0hU5oe6kYnSGqDY0gGkZ8iCWrR1TzrQNbBBmDo
         B0xHBXEC6F7o2BuFiLZtdS3xWgLeEjzp2aQDEBjm21KsFxzSf+E0KCeq7cSCBwa230jA
         Hg9B/IO9eB2V/ezpgk+F95OFhhd3M2RRAn5Hgve4/FJ13ssXEyOBEvP+wp68EW9BeZ/b
         +lasiYvzHMQMOglaVbw5A05TxpC6hXpiDeLdxsoUmGWN1NXni1HYqjA0lFVmqoNbef/6
         lcY6aprAn9pjCecXgaumtJS427rmUi0AUnSZzKyeJ6Q+ZpLMEet3kFM39Qmikn2RFihD
         0H5g==
X-Forwarded-Encrypted: i=1; AJvYcCXshCK07oXzoYa7MaoURzpaAJh7poceiV6jQE4MWSnpFaw3I4HFnV7g+QwE8UqLzgHep5CWMBiSZcHT10k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzFqL7giYDPHCwpp4idCz/hPuDa4jBQ5tJZHPyhNck2Rq2661OB
	3jXQob1iwjKrT/2/Akvnnxb6ICJDJKJtmMCKNewjbcmuayFGQ5ETYObywehHj4Q=
X-Google-Smtp-Source: AGHT+IF3P/4155uMvmGYpoowuXrhy2v6aHwudYM9PJFMCLkX9j2rCBHO6+Z7X1wkaLdhxTlExnQxpQ==
X-Received: by 2002:a17:90b:3b41:b0:2d3:b5ca:dedf with SMTP id 98e67ed59e1d1-2d5e9a0db5cmr1626393a91.17.1724228434854;
        Wed, 21 Aug 2024 01:20:34 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.20.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:20:34 -0700 (PDT)
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
Subject: [PATCH 10/14] mm: page_vma_mapped_walk: map_pte() use pte_offset_map_maywrite_nolock()
Date: Wed, 21 Aug 2024 16:18:53 +0800
Message-Id: <e23662d6be464b6ed89d6abde13df1b4694f6583.1724226076.git.zhengqi.arch@bytedance.com>
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

In the caller of map_pte(), we may modify the pvmw->pte after acquiring
the pvmw->ptl, so convert it to using pte_offset_map_maywrite_nolock(). At
this time, the write lock of mmap_lock is not held, and the pte_same()
check is not performed after the pvmw->ptl held, so we should get pmdval
and do pmd_same() check to ensure the stability of pvmw->pmd.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/page_vma_mapped.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index ae5cc42aa2087..da806f3a5047d 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -13,9 +13,11 @@ static inline bool not_found(struct page_vma_mapped_walk *pvmw)
 	return false;
 }
 
-static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
+static bool map_pte(struct page_vma_mapped_walk *pvmw, pmd_t *pmdvalp,
+		    spinlock_t **ptlp)
 {
 	pte_t ptent;
+	pmd_t pmdval;
 
 	if (pvmw->flags & PVMW_SYNC) {
 		/* Use the stricter lookup */
@@ -25,6 +27,7 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
 		return !!pvmw->pte;
 	}
 
+again:
 	/*
 	 * It is important to return the ptl corresponding to pte,
 	 * in case *pvmw->pmd changes underneath us; so we need to
@@ -32,10 +35,11 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
 	 * proceeds to loop over next ptes, and finds a match later.
 	 * Though, in most cases, page lock already protects this.
 	 */
-	pvmw->pte = pte_offset_map_nolock(pvmw->vma->vm_mm, pvmw->pmd,
-					  pvmw->address, ptlp);
+	pvmw->pte = pte_offset_map_maywrite_nolock(pvmw->vma->vm_mm, pvmw->pmd,
+						   pvmw->address, &pmdval, ptlp);
 	if (!pvmw->pte)
 		return false;
+	*pmdvalp = pmdval;
 
 	ptent = ptep_get(pvmw->pte);
 
@@ -69,6 +73,12 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
 	}
 	pvmw->ptl = *ptlp;
 	spin_lock(pvmw->ptl);
+
+	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pvmw->pmd)))) {
+		spin_unlock(pvmw->ptl);
+		goto again;
+	}
+
 	return true;
 }
 
@@ -278,7 +288,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			step_forward(pvmw, PMD_SIZE);
 			continue;
 		}
-		if (!map_pte(pvmw, &ptl)) {
+		if (!map_pte(pvmw, &pmde, &ptl)) {
 			if (!pvmw->pte)
 				goto restart;
 			goto next_pte;
@@ -307,6 +317,12 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 		if (!pvmw->ptl) {
 			pvmw->ptl = ptl;
 			spin_lock(pvmw->ptl);
+			if (unlikely(!pmd_same(pmde, pmdp_get_lockless(pvmw->pmd)))) {
+				pte_unmap_unlock(pvmw->pte, pvmw->ptl);
+				pvmw->ptl = NULL;
+				pvmw->pte = NULL;
+				goto restart;
+			}
 		}
 		goto this_pte;
 	} while (pvmw->address < end);
-- 
2.20.1


