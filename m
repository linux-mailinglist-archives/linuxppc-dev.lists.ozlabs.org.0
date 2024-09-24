Return-Path: <linuxppc-dev+bounces-1548-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA6A983CC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2024 08:11:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XCTyX4cfJz2xMQ;
	Tue, 24 Sep 2024 16:11:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::634"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727158292;
	cv=none; b=cPJGSB/6PR1qNgFvrKoocZHFZGKZU//8cdTWDHObS4XraF+UOCSh/OvciWp1l1wf23sy1nLXr9dy50YstZin4vf3ZYPZKFxzx70MBM2ugmRu2AtvfOpC1wr8OFSoSaGffQsIDwaQEre6mT4qL0rCLSyJWUidw0rq6PHfm7c42u99WXslOWnMw6BcwOiw9Zc7EA0c/OlpIxCkfgnLPJBj4MNs2CMta2NEcCchntN27MsmRrMY+fMWGPQ9c7pWQG2vtWxWLTLXTYN6Wkwd4ik1F7lzysFff2/6Kgvn6rAxop3FBAp/FoQeZEkAfNFquBYhE8N1zyYxbm1u16U3YDgvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727158292; c=relaxed/relaxed;
	bh=FxMRr8GFLSu76sONoxW9925XRbgCGcQv9BKiL/bcjLY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LymOT32MKVx88tqvD8mBkFUsxd4kyaZD10zqLbsHSY7X8Rr8hhGo/h5zIq7TyRwrGzgZDw/IzTTjYENBXO4etg29DtoNIlol9kwzu/S/x8gKrdyFQeiRP8WcOaxJmInY65xc7TX4nBQOZwpbx2AJLhRzm0v5OTKjydqMVx+1Z4MBkRejSMOv4g8FWeV9wvxpwI5Ird2/ksM9eh+vqcMqm3pHind8B42sgB0sWsxGOYFzOCJumRfhCzaC2KZLZXnOmE47RH49vOr0HB207g80XOAnCyc9m6GRslnu5alb++e/UcfZQmYwnNCZlcbsj5Dkp9rJfExcPwi4TztCq59+6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AtsJjTF/; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AtsJjTF/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XCTyX2NfCz2yDw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Sep 2024 16:11:32 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2055136b612so61987345ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 23:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727158290; x=1727763090; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FxMRr8GFLSu76sONoxW9925XRbgCGcQv9BKiL/bcjLY=;
        b=AtsJjTF//wsVFv21yfOKUcJBMEJken34UQKUDTM0hYS17YgoavwY70RWw77nrKXO3a
         XObMRpKqaYjU9j0E8O0rgbVA9wJd0urSxPzHFxCkiM4cuVpno8+qmTTRuLjBJuuIW8VT
         1RGpIUc6+b8rHc4c7IJksCZBUna65VWrvIlNIRGC89i5+ZO21Nicd8hXy+MMwl6yR8fF
         MqKeksVCVGL0bd45YSskaFnwC60eJpcaUHz1sLaarwS6lBIRbkiQEBLNN31KlC0PXEyD
         cU0xYO5S0PAPt+7iEpO6yXvEBIzjIiZSMSrWCxE3t0/2o1kFFmK2k1tZghRVzjrpF6ei
         docQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727158290; x=1727763090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FxMRr8GFLSu76sONoxW9925XRbgCGcQv9BKiL/bcjLY=;
        b=xQPmWAwiQc+nZ4CaFdQbVrCtXBn4WX3YXyz8z47IUKXBRXMS2XcNb0ik32VG8eEZbI
         0DZ9XBLq7gyi73DyaGn0tFhdr4/WUmKDQqQyYHLIdyvcQagJkyorpBJqieazlmRV95cD
         l2LWa5+FAiWQGKSo8GbIoKMaD1wo3ZEVy+oZhOTze4SbnSg/YdY/aKNAeS1j3K0+Q9mO
         K3ugN56YZ8E8y7Kd+nmI7HV6YzFI5C58sso3YQhWoUpTrT5EpaoonyGM2DdpGvd8b3je
         3aBBnBeJ+FNb7kWtXuWnYNpyC9UhVWgXPNTyZlaQHfKg/BVbPP8ilJ/pphXxKJbGG1F9
         5BeQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxZkLzKt+ctJZy0981cBC3GneHtBW/pIxeUkCoglgsib5OTTe9WkGc6AbnIawiIbj6Aa+njPZ7AnV4gz0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxotIA09j9nYKVwN8xQs+hIumxRVyA1IRH5Jup6KObszleUZcxJ
	5BUnaqNPZQKzqRD1pUCmzPvk5bqA/f3CnGnhx/dIkVBVLHfFFjTomuNm4gAdBSI=
X-Google-Smtp-Source: AGHT+IGuU8VFNPNElLsd/e1qu4NWf2AelC2dd7GFKvCMDCyRlgITelf6+XB9J1CmvT70UykrnIRqmQ==
X-Received: by 2002:a17:902:f542:b0:201:f70a:7492 with SMTP id d9443c01a7336-208d98603b2mr202721885ad.53.1727158290456;
        Mon, 23 Sep 2024 23:11:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([63.216.146.178])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20af17229c9sm4344885ad.85.2024.09.23.23.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 23:11:30 -0700 (PDT)
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
Subject: [PATCH v4 10/13] mm: page_vma_mapped_walk: map_pte() use pte_offset_map_rw_nolock()
Date: Tue, 24 Sep 2024 14:10:02 +0800
Message-Id: <ecffb7d71363fa79048c0a929780215e0fa93491.1727148662.git.zhengqi.arch@bytedance.com>
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

In the caller of map_pte(), we may modify the pvmw->pte after acquiring
the pvmw->ptl, so convert it to using pte_offset_map_rw_nolock(). At
this time, the pte_same() check is not performed after the pvmw->ptl held,
so we should get pmdval and do pmd_same() check to ensure the stability of
pvmw->pmd.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/page_vma_mapped.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index ae5cc42aa2087..6410f29b37c1b 100644
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
 
@@ -67,8 +71,13 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw, spinlock_t **ptlp)
 	} else if (!pte_present(ptent)) {
 		return false;
 	}
+	spin_lock(*ptlp);
+	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pvmw->pmd)))) {
+		pte_unmap_unlock(pvmw->pte, *ptlp);
+		goto again;
+	}
 	pvmw->ptl = *ptlp;
-	spin_lock(pvmw->ptl);
+
 	return true;
 }
 
@@ -278,7 +287,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			step_forward(pvmw, PMD_SIZE);
 			continue;
 		}
-		if (!map_pte(pvmw, &ptl)) {
+		if (!map_pte(pvmw, &pmde, &ptl)) {
 			if (!pvmw->pte)
 				goto restart;
 			goto next_pte;
@@ -307,6 +316,12 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
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


