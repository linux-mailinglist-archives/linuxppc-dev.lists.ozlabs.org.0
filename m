Return-Path: <linuxppc-dev+bounces-274-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EC39597EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:43:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wpjbf4DQCz2yRF;
	Wed, 21 Aug 2024 20:43:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42e"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=OB9jfpFk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfRJ2hS4z2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:20:44 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7141b04e7a3so935242b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228442; x=1724833242; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOO3xScatAPPPb8tw2FfV0S/NtjYDESd+MYV0EHgGGs=;
        b=OB9jfpFkETcyMURpbr4iLdmB2nAdc7YdAPaLZFgFk5Sz6rTPz9bhDpXpL/1eRQrmEs
         RWE66Yq6HRgvuQ9Gc/N8GrhRuMFDIDKYJRdUszXpUSsK6vy8GcStCTv9rhkWJnmP+UGh
         oKRzR4ABl6haeODfeOc2v/NxC/krvwLntHD2mscFh0B2+QaPoaWjRgg13RoE3IxwrWv8
         prGXHmHD28zduNWAI5Yp/v3K/RGOP0RSSi2v5dkKBa2oaySOd5CcFAaCY02llaM61//D
         vxdW26Z4Nj/w/EVtcKCpi+WTQoIi2avA6biqUj/zBndu2ZJKSzSl1ntL7vJTbg20GBs6
         LUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228442; x=1724833242;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jOO3xScatAPPPb8tw2FfV0S/NtjYDESd+MYV0EHgGGs=;
        b=J/z5L1L6hxobhPBi7iFMmdZHSkBQktMu3LB7OALKGiPZ/hSjWz09FbtPFHY/x8sygF
         WREQllY9XrOa+7X25h1ks0CmIibfl4bjn1emJHrr1hT01Xqdr6bVT1YhZ5aCq6cynI3H
         3TRlKfic3rOANp4u9S9RUuCcO+HZZA4kNTue2+GwqKfuEUXx5xi99rpU+M6xBbOGnbrc
         uxo+7QNJ3CxBuXwdABkkMkCqN8qsWc1Oxpcfoy3FkD5DdRRXlrzpOY5HizJQ1p/mMV/y
         lzkufvqli+CVrv18uhN2ngjRoqFOav6fkI3Ca4Nh8J4rgd0hK/i32k/UzPih5ldod+48
         9SfA==
X-Forwarded-Encrypted: i=1; AJvYcCX2HvSFBAdEAm2zosYtreNn9fryi54C8OICzwLwWHFuF03e3U7P4SWSKgaNFV2TrLRtUP7aJn6MGm4N+/Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwD4nss+eZGEd4WXX+ZNYlheTmIUN4gJ4BFbn9klqGdX2ZOrhtj
	SHP+jnKWztNvLtt9PbUwjum0A1HxDUPNV+RK8GGukAzuw3NhfwAmq05227lenV4=
X-Google-Smtp-Source: AGHT+IFM+x1tDjPFZswDxs94u/u9nyN6BfWsdj/MLtJd+fBRDvg5mEN2O6omshjTkNyUCHM1AQzwKQ==
X-Received: by 2002:a05:6a20:e605:b0:1c3:ce0f:bfb7 with SMTP id adf61e73a8af0-1cada055937mr1798278637.21.1724228441599;
        Wed, 21 Aug 2024 01:20:41 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:20:41 -0700 (PDT)
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
Subject: [PATCH 11/14] mm: userfaultfd: move_pages_pte() use pte_offset_map_maywrite_nolock()
Date: Wed, 21 Aug 2024 16:18:54 +0800
Message-Id: <efcf6bed86afb586217dee89551200c33e51c085.1724226076.git.zhengqi.arch@bytedance.com>
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

In move_pages_pte(), we may modify the dst_pte and src_pte after acquiring
the ptl, so convert it to using pte_offset_map_maywrite_nolock(). But
since we already do the pte_same() check, there is no need to get pmdval
to do pmd_same() check, just pass NULL to pmdvalp parameter.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/userfaultfd.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 6ef42d9cd482e..310289fad2b32 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1146,7 +1146,13 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 				src_addr, src_addr + PAGE_SIZE);
 	mmu_notifier_invalidate_range_start(&range);
 retry:
-	dst_pte = pte_offset_map_nolock(mm, dst_pmd, dst_addr, &dst_ptl);
+	/*
+	 * Use the maywrite version to indicate that dst_pte will be modified,
+	 * but since we will use pte_same() to detect the change of the pte
+	 * entry, there is no need to get pmdval.
+	 */
+	dst_pte = pte_offset_map_maywrite_nolock(mm, dst_pmd, dst_addr, NULL,
+						 &dst_ptl);
 
 	/* Retry if a huge pmd materialized from under us */
 	if (unlikely(!dst_pte)) {
@@ -1154,7 +1160,9 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 		goto out;
 	}
 
-	src_pte = pte_offset_map_nolock(mm, src_pmd, src_addr, &src_ptl);
+	/* same as dst_pte */
+	src_pte = pte_offset_map_maywrite_nolock(mm, src_pmd, src_addr, NULL,
+						 &src_ptl);
 
 	/*
 	 * We held the mmap_lock for reading so MADV_DONTNEED
-- 
2.20.1


