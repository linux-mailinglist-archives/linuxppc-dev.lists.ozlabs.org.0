Return-Path: <linuxppc-dev+bounces-1615-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 978F7986CD0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Sep 2024 08:48:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XDkgz4QmQz2yk8;
	Thu, 26 Sep 2024 16:48:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::92c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727333295;
	cv=none; b=jtdK18nABriTYuGSWRZ1rFntp5chhZe9e1TqAkxVm/U6c8TuXXGECFDLMv9V41FhwMA7fi0E4OgyKCuXHq4VJVtloavtF2dq9x7eDkX+8fbbgiTsteWn+Nytm+KNVhzNtKp9E7Dzj0Y76M9qzj7Z+xd8J21RYWWtTQnbhSbE8O/fV475mr0ogg+/5Rrna0fJlonMUI8i9cGz/WvqUNgnPEkWNIxWaKUObq4gxkCoJ4KMQCRKxoX74xfRlxuZK4mMvgvd5bRQy4V5BN0JmiMMEbWS3X1KkQuv4dkeba7u3rYw7xGZEd0VMc4l+cqg4EkpMBpNfEoPVIh+kfF2dpbqlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727333295; c=relaxed/relaxed;
	bh=RnMCKwBqnYl3LJbu0M9HQTu7wcymlNTkAYqiZlfWQ7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h7TcmiCFXjnakKEU6fd86lnSs0ftzxnM9hUhe7Bkc0MqcneUBXLKqiP6hROcoiTWCr3wHM++Og7hQaUa9+w7zU4pipmRgI2qbH9//t5XlqY10sgUsct44rLcfmf2X1cJzkIEgbOIdjUlNK3B5kcdNXkP4GyaOQS94IWkKu6MGyEuIphbQhkJ5aMmsq9Er3md3ciriIgo7G3UPl1yK1wgwbEYyQaAgqWHt0e+j9M0CKjr0N59VV41HPgdqcPO0hvsr+ZIivCAaWN38W5AutDZJuAjvNC5M6QT2rdPG+ajaI71KSNt+NhTj+D3bYTE1n/O77QLV3nhiI5A9bGJF3O+sQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DcKq+tsl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=DcKq+tsl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::92c; helo=mail-ua1-x92c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XDkgz13d6z2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Sep 2024 16:48:14 +1000 (AEST)
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-84e842c1673so249576241.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 23:48:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1727333292; x=1727938092; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RnMCKwBqnYl3LJbu0M9HQTu7wcymlNTkAYqiZlfWQ7I=;
        b=DcKq+tsl8/Mxa6zgGoDSvr5DwaPu668nWn1Ms/Hp2CIWpRd0S/mSpxKqZahOBX0pTH
         mf3G1QpGVICNXXjRE9Ww/tsjTEhsMCPX9TLdVmo/wneGs2D8HCkgDMUFVk0KoRa30+bo
         0uM8YSmX3KZw1y3DY4dM25qghXvq1PwXufxUZ9BboeKvUtrwyUF5S23A2TyNIjGw3Qcp
         bsAkA48lmRqdLZrcTPCNIw0TAAabIeXC+AZQFxZ5OG3FHrJRGnT4ixpg3OnJBW1jIHuS
         RZ/X2eSr2MpuT5Z8LIWSDlmeQBr6J6mkgJX+K8p/McT8TIODu3vnz+4fwEwLlTRKayik
         QHyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333292; x=1727938092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RnMCKwBqnYl3LJbu0M9HQTu7wcymlNTkAYqiZlfWQ7I=;
        b=Qo3AkLXM5n2Nx8ZHAVZdX5BDuebQeMp7PH1wEuB5EQqqMQY1fhfbgWmGfytesd366J
         QCZUzjmuwerJZgsl445pOZhz9GlomVS3GEITXEf7MvOG4n9tsLdqoPB/QXd8C12+dMbF
         QD2HyLHaObXCyxGc1ng2PF+TAA2rg6Fg0R6pfBXAD41hYHQQG3ZXYnPkwCcjBt0scVnN
         vgvfQ5x2jZAbd3FZLPD1S9O+jVYnVEIa4V/1RVBLz/SbniQlPFaE59XauqrfOBgN+7pu
         3RXVtySP0kXjSy6sWCY9Rc2XuDxHCYeFzpECHw5NJjp4NUHDPLBP6eX1Nxg2zbRxqRqA
         2HDw==
X-Forwarded-Encrypted: i=1; AJvYcCWTqBBWBVB0QU8vImBn+RLFibkN1N/P0J7DnnL/BoiJLTHxaJU3WNVyDSNmf7AHLGFwgqiUXZ/qvo+0ebU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzRYJq/gjPdVUGr8+N9BuM126YcGfALch7dRe9CQj7KPsI8ubC3
	eep1qaREoYI5ENCHaZ5F7iugXVrlsrW5/RgqFt9bTVV/fmso1nIyTFKFjAjjMEg=
X-Google-Smtp-Source: AGHT+IEjiufoSG+9f7J9DudEHL9YuIq0UaJx7YZ52pOk+qHYx73DXmea6YZQnzcRnEEhuuY+i+vKHw==
X-Received: by 2002:a05:6102:e06:b0:493:b055:bf56 with SMTP id ada2fe7eead31-4a15dc39965mr6802341137.2.1727333291940;
        Wed, 25 Sep 2024 23:48:11 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b5257ff1esm23024611cf.38.2024.09.25.23.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:48:11 -0700 (PDT)
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
Subject: [PATCH v5 11/13] mm: userfaultfd: move_pages_pte() use pte_offset_map_rw_nolock()
Date: Thu, 26 Sep 2024 14:46:24 +0800
Message-Id: <1530e8fdbfc72eacf3b095babe139ce3d715600a.1727332572.git.zhengqi.arch@bytedance.com>
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

In move_pages_pte(), we may modify the dst_pte and src_pte after acquiring
the ptl, so convert it to using pte_offset_map_rw_nolock(). But since we
will use pte_same() to detect the change of the pte entry, there is no
need to get pmdval, so just pass a dummy variable to it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <muchun.song@linux.dev>
---
 mm/userfaultfd.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/mm/userfaultfd.c b/mm/userfaultfd.c
index ce13c40626472..48b87c62fc3dd 100644
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


