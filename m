Return-Path: <linuxppc-dev+bounces-1612-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9E5986CCB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:47:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkgW5j3Qz2yY9;
	Thu, 26 Sep 2024 16:47:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::732"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333271;
	cv=none; b=LoQbMCbvOPs3gsFYASFutXNHMj9LtgrhIP3Y0Vus0vzkTEhNd83sOnZjFETZ5wynOgb7f5d0ssaHb9yacmp61vM+kZkl9XeE3k9J5yU4B4+9mspbmvwef2OoxJVO88R1aLjAS1AVO03NCmmyUrK1xfgzSQ4Xb7xvWhVnfzkV5qoUi+s33hFhtbG9YKK4LIjsGnaT7fXcraww5w7P9unoku9Yk4Aezd4SWlv4NlFOUEYr8LtGSFunRamYKlIDv0VQvejzittIH4+kbMTqItQjbznQDXx+i1KN1NSFpJj5EccOP9fFgoZ0YGSgg/HZ+xgWqsnByn7903hVqb8ceNdf8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333271; c=relaxed/relaxed;
	bh=3DwHdqVJkGu7HChE1YzlDZaDZvpQCVqvAB2HVgACkHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iyGdKZPXrdzNeqo+aRMmC+9ERrehNhtX39YBKBalxvF8RjZ2Dan7OQo3PC0AGHdMTy5oiMrrFR6G/YsjBuamuMFYO8V81t7DaBujfEddQyThtiPLREFB4EmmtsEpcV3bA+RXoCTckd+vpvwunIgNhHIu2NAFCG97TkWHQvo6CZq05/F9+iSiQASTEU8KkrjY9pFu1KLjpGNs7PmtlzZNYTfDt4jSmAXWcQ2y6//AwZz2Ta19PNuYnsT0PkvK4ci6XMYiZoOYlFY9IZhCu7BTPZ8sXAybt8CtGcEI+rWu887QdbqtofyUrsZOmYO9eYGPMCyeucdWY92Lpxk5gJDK8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Q7YlhNPE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Q7YlhNPE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkgW3D3qz2yTy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:47:51 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7a7f8b0b7d0so34240585a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333269; x=1727938069; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DwHdqVJkGu7HChE1YzlDZaDZvpQCVqvAB2HVgACkHs=;
        b=Q7YlhNPEG5A1yHkifPQ3PwmKEV6g8tysVZiF1NJAQHSGpFboJQAWiICW8RVFNa5REX
         pn9ngOY+5apzYEpuf8o7G72pvsTvFpTNRYfzPRsMF1OqN7afjot15ipSKxo2ZpdFCmW4
         7W92KND5oqblwiCOTixV7BXETmIj7DhX93lpudq26vcxsR+3/+6gXwlryr5sZzNbmWiT
         MO3hyJGLXLz//e31naCN5JUPC7eHRPhvrai9pWtfcezUZpPXMh8nrz7OBO55N6Yi5o9w
         Ync1y1Z9ER2/ZfY4pCo2VXzrfKdlCilQcZyY0ev+3Lb7mE/Q8sET41cDFwj8Q7cIQ9rT
         rRKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333269; x=1727938069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DwHdqVJkGu7HChE1YzlDZaDZvpQCVqvAB2HVgACkHs=;
        b=mwi0OCV3L6HA1YQnpJYad9a+E9Z2PvczJcbx0j0TJaIWneI2DBJeeG30gbXmiqBEyh
         x4OmbgDSxb/Asr/vVeO98NUSozI3CFE/EYnVuznXW5Ez4Bb5Z1gWDD1XouvS2eEs1e5O
         vNTR1mpVlxYmHkvuRtHlA76i1oDa0UPTyfBq5iHlmHWDXgG9L8hlhwunbFKEUWwYekBb
         QpsB9Lh97QkS8ZrfQxHh2Eu8iQv3gMRmE3iunvtI3dItNWOIqVGqnmjZTv+zRVMhkE3W
         JvhL7I8TmSqrnypuE/bvMxLvmpfmF/hC8xFuFDlLMi8sGve3M+Y15WOYqvelZocLRTrf
         eUiw==
X-Forwarded-Encrypted: i=1; AJvYcCU3te531BpGFvjm1cOJ7S6+fyE/Au3aNE3k+hBfo5Akpr2//041w2TlRR0dDNjJEV82Q1jh+nAn1ZIXJIA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw+F80ks5SGVqzzuTgymc45iG7SyP65lHLXRmvlxklsPGVz4sqp
	a+qCHIWK0Qv2Y6NoN9fRB2LCaJ4nsIt2drzVLfP2+zclklv1V7+kPenLz0sFm+o=
X-Google-Smtp-Source: AGHT+IGf6yhFgM7V9dSkmNMD310kmtT4NpPr6tml7YSLsMbfjuBNhYOZWImI0+hdwHwJZd31DH/Ogg==
X-Received: by 2002:a05:620a:4009:b0:7a7:f18a:e46f with SMTP id af79cd13be357-7ace744e486mr712325485a.43.1727333269291;
        Wed, 25 Sep 2024 23:47:49 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.47.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:47:48 -0700 (PDT)
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
Subject: [PATCH v5 08/13] mm: copy_pte_range() use pte_offset_map_rw_nolock()
Date: Thu, 26 Sep 2024 14:46:21 +0800
Message-Id: <9166f6fad806efbca72e318ab6f0f8af458056a9.1727332572.git.zhengqi.arch@bytedance.com>
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

In copy_pte_range(), we may modify the src_pte entry after holding the
src_ptl, so convert it to using pte_offset_map_rw_nolock(). Since we
already hold the exclusive mmap_lock, and the copy_pte_range() and
retract_page_tables() are using vma->anon_vma to be exclusive, so the PTE
page is stable, there is no need to get pmdval and do pmd_same() check.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 mm/memory.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/mm/memory.c b/mm/memory.c
index 6432b636d1ba7..c19cf14e1c565 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -1086,6 +1086,7 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 	struct mm_struct *src_mm = src_vma->vm_mm;
 	pte_t *orig_src_pte, *orig_dst_pte;
 	pte_t *src_pte, *dst_pte;
+	pmd_t dummy_pmdval;
 	pte_t ptent;
 	spinlock_t *src_ptl, *dst_ptl;
 	int progress, max_nr, ret = 0;
@@ -1111,7 +1112,15 @@ copy_pte_range(struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma,
 		ret = -ENOMEM;
 		goto out;
 	}
-	src_pte = pte_offset_map_nolock(src_mm, src_pmd, addr, &src_ptl);
+
+	/*
+	 * We already hold the exclusive mmap_lock, the copy_pte_range() and
+	 * retract_page_tables() are using vma->anon_vma to be exclusive, so
+	 * the PTE page is stable, and there is no need to get pmdval and do
+	 * pmd_same() check.
+	 */
+	src_pte = pte_offset_map_rw_nolock(src_mm, src_pmd, addr, &dummy_pmdval,
+					   &src_ptl);
 	if (!src_pte) {
 		pte_unmap_unlock(dst_pte, dst_ptl);
 		/* ret == 0 */
-- 
2.20.1


