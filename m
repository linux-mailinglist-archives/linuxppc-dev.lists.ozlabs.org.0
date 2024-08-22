Return-Path: <linuxppc-dev+bounces-321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8059A95AEAD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:16:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDwl2q68z2yp9;
	Thu, 22 Aug 2024 17:14:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::22c"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=gyhe6DEZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::22c; helo=mail-oi1-x22c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDwl04g4z2yps
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:47 +1000 (AEST)
Received: by mail-oi1-x22c.google.com with SMTP id 5614622812f47-3db145c8010so274223b6e.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:14:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310885; x=1724915685; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Crbz/R3rJcbpbcovfp9fh4ozsAEMZSaAxrx7zvZfRRw=;
        b=gyhe6DEZSH95h0MAnuhTnzacosoLdJ2D9yDsHcbuX6lCEFDxXAHEaZPKTOUUQ71+Sk
         Xrx7AtHiiBIQa/iFFzIQYPanq1USiA8wagx3wkXiblVvGrNiwIaVvnJr/5SdznAMdAsi
         pAjBhwQJ46oIL/6hse7tJaNBwLrBj3XUA3p0pWjyHGGzD4Wkon6QlA0NlSst8mb+n93n
         3jSm6HiYkGo1QVY4u1sGFJROez+DXVjwOUxZPLgiDc4sXDcoqN5IM03re5p8kwMcXmwm
         3qdmJtmaLX76zLyd+0i5/1E1OguN9mUGjOB5fH+MNq84hS4tZ4TkUoEGgzXGqzEtAQGn
         JLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310885; x=1724915685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Crbz/R3rJcbpbcovfp9fh4ozsAEMZSaAxrx7zvZfRRw=;
        b=pryqqKOQ1zdjsS0zxscbChpeU0q5TpjZkXcmEEpD9CwAR9buI1jUEwr8vxYdzEf3Xn
         LFPugTP/BpIBhEoF4Q+ckKDqNvgRUru5a59/pxgS3EmeGIsGUSA3Ghq9YHH6OjT2atdT
         IOLHaZIuh+/UTX4f/Jr3NJf2NU/rn4tOwts3+hPfsAPogbzekW+P9hz4XleDTUggkkMm
         JmHKjb+poq9RZhxvSDIHq9aK9l9aDTgBjSMclEvxck8pL5TV5JX9/raicikpmMmtvUQ5
         vl8EtIWFkhcgbcPNGypBHXm7pfi1qt3BNfu8ahYeo6Gpu1kAva5HakLIXeeZdxXbh+tB
         dcIw==
X-Forwarded-Encrypted: i=1; AJvYcCXOTsyvFtRKiaDBUSsLZLKGKWekq1195s7kZfvPS/5zDAUaKMNqEdG4nPKIgF+n2kgP7/eUhdJa3nGjTYM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyETsjQuhmLfGRNdiFukySCwJcxOjlhTCE1tBHYiDg58GT8IwGz
	SVmUtydNZKuWgKrPvhYMAqESjLYbHZZ9Lswb3pDt4rQmZcUdGqfzGo0I50m2M3w=
X-Google-Smtp-Source: AGHT+IF73IAzwqsx0nomJCVJryAV7cndKc0EgZ0+2TYoDy25bfQlq+9JSwXFUBQmZZcxXSkt111lxw==
X-Received: by 2002:a05:6808:d46:b0:3d9:29c1:be5c with SMTP id 5614622812f47-3de194fbf2bmr5329807b6e.12.1724310885053;
        Thu, 22 Aug 2024 00:14:45 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.14.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:14:44 -0700 (PDT)
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
Subject: [PATCH v2 10/14] mm: page_vma_mapped_walk: map_pte() use pte_offset_map_rw_nolock()
Date: Thu, 22 Aug 2024 15:13:25 +0800
Message-Id: <d200bf710fc6f11202ea2d777ac2eb9f7fb0c6c9.1724310149.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1724310149.git.zhengqi.arch@bytedance.com>
References: <cover.1724310149.git.zhengqi.arch@bytedance.com>
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
the pvmw->ptl, so convert it to using pte_offset_map_rw_nolock(). At
this time, the write lock of mmap_lock is not held, and the pte_same()
check is not performed after the pvmw->ptl held, so we should get pmdval
and do pmd_same() check to ensure the stability of pvmw->pmd.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/page_vma_mapped.c | 24 ++++++++++++++++++++----
 1 file changed, 20 insertions(+), 4 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index ae5cc42aa2087..f1d73fd448708 100644
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
+	pvmw->pte = pte_offset_map_rw_nolock(pvmw->vma->vm_mm, pvmw->pmd,
+					     pvmw->address, &pmdval, ptlp);
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


