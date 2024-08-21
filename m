Return-Path: <linuxppc-dev+bounces-268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7992B9597D5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:41:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjYn2qXJz2yM6;
	Wed, 21 Aug 2024 20:41:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52f"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hWqPruzl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfQW0Pwbz2xX3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:20:02 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7cd8afc9ff3so221023a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228400; x=1724833200; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWBymtmrK19rfh+o6mKAIf3qo5pwJHde1CNDuWd4778=;
        b=hWqPruzlFvWE3XsY5g+oGLVih72ZpmgkYC1ERZlZXrx5reMNWguPq6QPEP5Gecl9hL
         ibrxLOBrgnd6M1ZsCWwW5Vu93mIVw7DUMwmS1DrYk0OKNxB9E+rQM4VHdHW0GRhuuLII
         mUlzuIgLU6aA9QMGFIEWopKk+tevaXO1sQRaeJhNrWo7tG7zC+Xg35FumGMyg5q7RnBX
         /SCNRO/EP57e9ZL5eSeHteqrjn8CRQv8rrmwGdCAswXJlyZ2grqX1SpSf23Q8qPn5Qae
         IvLrh/URJa/NzyhMJV8cAqInFQMTfz1LDPG5ODcmcu0fHg508szBHm164hBce0kUnnUp
         lLlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228400; x=1724833200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AWBymtmrK19rfh+o6mKAIf3qo5pwJHde1CNDuWd4778=;
        b=MlWF3+kg1GpZaCPaBxJvUeBdUCV7UZcA48G/x4We84nTsZ8YUTuQd3zhSWGCwuj5h5
         0I0UrPxFgfuQ66TreQLEgNqyEzyJPU1bxN/vMT/Dz7YFX0A/DbC9LI5Z/cOYRYKEzTbm
         8x+PvaoWScwLaulD4dKNe0l9pmU4h36tR7y++AID9h+77bFj+PjsbIhbn26WeOtoeFjs
         no7CQvdSoXrsUxKIWrIu/2kqdGXlJALFNCaU2xwsoK9mw8j/SCv8Nwz4Q1H5qnofbHuQ
         gi/DJjOqAedYQSExvkcDYkO4fTEoq0gRLOFxehgj+PjX6RV3QwSIUz+5Wr4UF5eMVX50
         S+wA==
X-Forwarded-Encrypted: i=1; AJvYcCUc2msz+gveeHKs5S0PDWib5xQashwW0nKVojyf1vXFsS3uj2CBWHFUNocVllYQ9zMOO86aerfPQdbPdhs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyfsmA/9IL9zxw5XGUkVpf/I9UtsZaOz7IaW3bDRASaEzNcu62d
	0bnQyKDVLtQIdf5QTM1fDVBuCC+PQAWb78CmzUDSebJY5XsRwVVZsGjjnqGZKh+4Lq0DJ5Qdgng
	x
X-Google-Smtp-Source: AGHT+IETLNjbMtdResL0gCQrMShCwCpeGL/L1zL6e1zJRM+ER4woSJMvk4wtR2Cz+Z4m4+aIJL98tA==
X-Received: by 2002:a17:90b:4c8d:b0:2cb:50b8:e59d with SMTP id 98e67ed59e1d1-2d5e99a5e05mr2805975a91.12.1724228400217;
        Wed, 21 Aug 2024 01:20:00 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:19:59 -0700 (PDT)
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
Subject: [PATCH 05/14] mm: khugepaged: __collapse_huge_page_swapin() use pte_offset_map_readonly_nolock()
Date: Wed, 21 Aug 2024 16:18:48 +0800
Message-Id: <e920b08e92471a5a3601cc463a3cf6a1254353e0.1724226076.git.zhengqi.arch@bytedance.com>
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

In __collapse_huge_page_swapin(), we just use the ptl for pte_same() check
in do_swap_page(). In other places, we directly use pte_offset_map_lock(),
so convert it to using pte_offset_map_readonly_nolock().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/khugepaged.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index cdd1d8655a76b..26c083c59f03f 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1009,7 +1009,11 @@ static int __collapse_huge_page_swapin(struct mm_struct *mm,
 		};
 
 		if (!pte++) {
-			pte = pte_offset_map_nolock(mm, pmd, address, &ptl);
+			/*
+			 * Here the ptl is only used to check pte_same() in
+			 * do_swap_page(), so readonly version is enough.
+			 */
+			pte = pte_offset_map_readonly_nolock(mm, pmd, address, &ptl);
 			if (!pte) {
 				mmap_read_unlock(mm);
 				result = SCAN_PMD_NULL;
-- 
2.20.1


