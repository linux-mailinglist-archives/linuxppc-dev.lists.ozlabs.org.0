Return-Path: <linuxppc-dev+bounces-964-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A7F096B525
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2024 10:41:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzGFD33M2z2yY9;
	Wed,  4 Sep 2024 18:41:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725439312;
	cv=none; b=iE+ikXJtyd1pOIE3Dy+1+qjRE/6TZw10avY/79+/1ZZcN9gZmfDCM+vp4Y7J94LtBMyPzLkHcKKVSCEhejxWKXV24RpxagT7xSFyCd7j4jBicJVZL/LgufcwokVEF5lHEl0igIk7XArkdREejUBF9Lfyo2Korb2vsSwJMs/qaG23saIRLWmCmFk/MG7a7iMIZ+l4zcQHOsSp2ImtLEsM+oHBiYELswzUqkmo70Upff7GIJ6tcPPy7rUc0sTI4fTh6BrBJZ76p6uxDtJgMnyypRs8mpOTINz/WSblXIrY36xij5Q5+RaSikK+IDTYVp/xvNpluGoBtaTnd84dv3ZpGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725439312; c=relaxed/relaxed;
	bh=DklgHNcyYpWTok/ex913aKZBAOiPUnESXBkqa0TTMVk=;
	h=DKIM-Signature:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version; b=XZ292SDKiqYnO7w9yNfJ+udfqYcSdzeeiog4mMqihsWQi4yREnij3+TF2sVhypS0Iy5oA/Hk6hkQDBkFZuYWLyCQwf+VNeJZXzQKuZDh+e4D6pZk51Rb+ndCZeJj3MlquyhETATN0Fao311THrW544/UiEX6H9FGThZF2EVx0ozXstP4MmpBEmWgfcH64a0qImxam2X3ChhiaW9ifgtPQrFCrUgTYAAgBfJSn2lqNi1sgDsIqdJJECuVNdkjFj3GUqniA879wxVkQYJXnqryJsWHzVjaZX0zrf1f/rANKemFtCpZyST4kHnWYC8kLal5rOyLqymky0vIhQG4qcx2Cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MtAzR9x+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MtAzR9x+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzGFD1SvTz2yY0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2024 18:41:52 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2055a3f80a4so23926005ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2024 01:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1725439309; x=1726044109; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DklgHNcyYpWTok/ex913aKZBAOiPUnESXBkqa0TTMVk=;
        b=MtAzR9x+HwKVqg/Ko6jFJP8+74xjvVzuZnBtiDD3z35EjqVSynRX1MxMlWn5LVa38p
         CbZRbmt9kldBFPWDtgiQEBQNpfd5i9xN1W2FJe5QExLzHaHi0/ONPwStA7NkYBubQ+w0
         KGC3txJ2b6G/Unbyj8sEpivfp6GtBbSF6VesBUKccDtOohS2KayRkwHWEzKlotTxXVrS
         1lV4WejguS7zzJvyfHHzjA2v6nFbLgbeCpKeaPpulxlhgVVy9h/FgzA+ffagoBg2R0fp
         8ilD8QYNepavAZExVMnnshUZ9bL0SUTNtXUJOS2HrbalkG8lJpet0Jdm6qy8LzibaGYX
         Trew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725439309; x=1726044109;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DklgHNcyYpWTok/ex913aKZBAOiPUnESXBkqa0TTMVk=;
        b=pjzWIPY9FYYwPqyMXnZy2Aa+pC1CetVxDeArZNOPqk42P0mhEyO3PoO2Ck2XOChBMh
         ljgwdk6DabTCwwCFXgJTsaTGq5opqrh/ksxteeWl02StEh7lin4wyz2FIMcNSSoyE/mu
         olFpScDU+oqH2GV7MqIOSOGZkNiFgE8eTA6GOejez7xax9f1dFv3JVdfaUWSiHYsHE2n
         oDn9SUlRkdyeRyM/zrX98+hiWJt8+JMBjoYy/5dWgGWKHNKhpsy/KxYYOX8M+5k/fUKw
         53kpyo/5ShPhtrU8QdqIS/a5RgllVfjoGQSIQz/QvKzkR8F1fg9h+4uOrjChovzsAZnF
         tjkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXA6nnQ4t2eoRdt6MJ1sV+Hc31X2yWQZMx2X9Rcfb6Oilduwdik5GwDM44YYQt57A1osTxeD2xoBjknH9I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwBXp8Ebqw6ZTXJweaJbAgRP+lX7nx/DNjFZ6Ta4WuUktukFaDA
	NDrM+tPsV0cljdLo+pt+cOPw54FPfME0pDOhOixa1GB6xtC5iM0CMI1yofh4zq4=
X-Google-Smtp-Source: AGHT+IErn+gfx0jNqN8oYReDzi5ALFGdG/LuObb3FXvUpU+trUkKEzs/YdM2MbdzLHq+FDgFhXw6+A==
X-Received: by 2002:a17:902:d50a:b0:205:6c25:fe12 with SMTP id d9443c01a7336-2056c25ffb5mr96453155ad.34.1725439309345;
        Wed, 04 Sep 2024 01:41:49 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206ae95a51csm9414045ad.117.2024.09.04.01.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 01:41:49 -0700 (PDT)
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
Subject: [PATCH v3 10/14] mm: page_vma_mapped_walk: map_pte() use pte_offset_map_rw_nolock()
Date: Wed,  4 Sep 2024 16:40:18 +0800
Message-Id: <20240904084022.32728-11-zhengqi.arch@bytedance.com>
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

In the caller of map_pte(), we may modify the pvmw->pte after acquiring
the pvmw->ptl, so convert it to using pte_offset_map_rw_nolock(). At
this time, the pte_same() check is not performed after the pvmw->ptl held,
so we should get pmdval and do pmd_same() check to ensure the stability of
pvmw->pmd.

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


