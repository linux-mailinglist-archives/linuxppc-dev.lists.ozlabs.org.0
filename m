Return-Path: <linuxppc-dev+bounces-324-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E1BBD95AEB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:16:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDwt0sq1z2ytV;
	Thu, 22 Aug 2024 17:14:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::232"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Nrg+QyPZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::232; helo=mail-oi1-x232.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDws58Ynz2ysd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:53 +1000 (AEST)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3db16b2c1d2so306875b6e.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310891; x=1724915691; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wvuIpVK8M95P7HYfgMO/FZeMoPfoEIc6BtRbN48KOY=;
        b=Nrg+QyPZRo7HAbdfrHvMAOTK/ugOWyPnbUj8atL/DZAHAGUR9x9Wx5RtIE3ZARG0OS
         k/rjmQRdLcGyueWIVWdJCAixzVhw64LDN4q8uCueOqD2iQGBQHEM68L7mXOzUputg4rt
         6bEhjeSpmLOaB1lNoKVqXrD1pBdj7XVtCet4LEQ69RpbK49ICXQc5e0CIibS0gXsL2oN
         d+po/AUPScIxh8WyeT45ns1Lni+6KLQkBcNNjC9RcQhQy6baBzPKs86dGTfwr2DBHnoF
         nfQxisF/pH32C9t76lswwicqaVKCexeW+ilMe6+Ytmcx8UtCfu3yMwxeSoV8T+A2mOAM
         xacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310891; x=1724915691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7wvuIpVK8M95P7HYfgMO/FZeMoPfoEIc6BtRbN48KOY=;
        b=gIki08nSLdsWZdsyMvK16mz3BoXO/Ql3Fq1SP5U7JVRKddMPi+4FAGVRxy6Lu1jKhy
         SE9qfK7bL0uifsK5EEq/oKEJchkdfSGKwi6N7ryMB12eISRgKbLpf9zeMHD0Skrc7c1q
         B8RLe5TP/aR6rc+EeREDEAAURFH8X7PrcP6tm8SqUMS+xXlKk01Cp7ByDDw8v9k1QErh
         yUxJhmZNEtOEUz2xhHNXDDOLVNV7d0NS9X2SvVEeD41ab5x2p9M25Qz93BbM53azJw0Y
         1HZXT+66zK3itrf9vvCvNF3H3q8cUgrD1vyp2qdCc7BlWcbegpPIq2FLWyr5CDuHjAEN
         0hmg==
X-Forwarded-Encrypted: i=1; AJvYcCUAXEH1NV6jSWrYGXKJPnfVEc7kv4y4HksvEF4GPss5Ya7iuAEe9u93h6qqg98ybhLthvdyhXGvEfE9KVw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yxgyxjmt+wlbYZGfCu4cjNJMls0bLMsJQ1HgeVay+ZBaC8H518A
	SssRQPNL76T2ffXOnDv68WL8t2rwNL7g2WC0jMoXnYjSGWDrcue9ual2I0CKM75rHLO+apREJxb
	it3Y=
X-Google-Smtp-Source: AGHT+IH3dTXEnimLAtKAfnTveP36n8fQueYjLUMvugh9RpWMjyLI+ldrjyQ+VF2Ub3qToXnGQhbMbg==
X-Received: by 2002:a05:6808:3847:b0:3d6:2b12:7dc0 with SMTP id 5614622812f47-3de22ff6ae0mr1325714b6e.20.1724310890896;
        Thu, 22 Aug 2024 00:14:50 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.14.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:14:50 -0700 (PDT)
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
Subject: [PATCH v2 11/14] mm: userfaultfd: move_pages_pte() use pte_offset_map_rw_nolock()
Date: Thu, 22 Aug 2024 15:13:26 +0800
Message-Id: <d4e0c8970662ecc88352822e6d81a11b4dd72b1e.1724310149.git.zhengqi.arch@bytedance.com>
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

In move_pages_pte(), we may modify the dst_pte and src_pte after acquiring
the ptl, so convert it to using pte_offset_map_rw_nolock(). But since we
already do the pte_same() check, there is no need to get pmdval to do
pmd_same() check, just pass a dummy variable to it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/userfaultfd.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index 6ef42d9cd482e..414ee744257b7 100644
--- a/mm/userfaultfd.c
+++ b/mm/userfaultfd.c
@@ -1135,7 +1135,7 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 	spinlock_t *src_ptl, *dst_ptl;
 	pte_t *src_pte = NULL;
 	pte_t *dst_pte = NULL;
-
+	pmd_t dummy_pmdval;
 	struct folio *src_folio = NULL;
 	struct anon_vma *src_anon_vma = NULL;
 	struct mmu_notifier_range range;
@@ -1146,7 +1146,14 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 				src_addr, src_addr + PAGE_SIZE);
 	mmu_notifier_invalidate_range_start(&range);
 retry:
-	dst_pte = pte_offset_map_nolock(mm, dst_pmd, dst_addr, &dst_ptl);
+	/*
+	 * Use the maywrite version to indicate that dst_pte will be modified,
+	 * but since we will use pte_same() to detect the change of the pte
+	 * entry, there is no need to get pmdval, so just pass a dummy variable
+	 * to it.
+	 */
+	dst_pte = pte_offset_map_rw_nolock(mm, dst_pmd, dst_addr, &dummy_pmdval,
+					   &dst_ptl);
 
 	/* Retry if a huge pmd materialized from under us */
 	if (unlikely(!dst_pte)) {
@@ -1154,7 +1161,9 @@ static int move_pages_pte(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd,
 		goto out;
 	}
 
-	src_pte = pte_offset_map_nolock(mm, src_pmd, src_addr, &src_ptl);
+	/* same as dst_pte */
+	src_pte = pte_offset_map_rw_nolock(mm, src_pmd, src_addr, &dummy_pmdval,
+					   &src_ptl);
 
 	/*
 	 * We held the mmap_lock for reading so MADV_DONTNEED
-- 
2.20.1


