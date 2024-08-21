Return-Path: <linuxppc-dev+bounces-265-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33CC09597CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:41:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjYB1Lpbz2yGs;
	Wed, 21 Aug 2024 20:41:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=UhhCcR5z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfQ60XFbz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:19:41 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-7aa7703cf08so4626432a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228379; x=1724833179; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=arLLKSkNLaMIjiTVBc0cMKPJV4f+y4Msx8WJt/66k5c=;
        b=UhhCcR5zLDcnq7OoDwum4hCVWHsCHXStZoG9pda+087OZFZLnu5e+V3VNrBU0gVh8U
         Wc8nS6p925hpnt3f5wFohQB80kyHk5XFHZN9nNTKU/9QLHWghqDKfITY2iUulo34p0L0
         OjOTKZHS++01KjzQdZRwSYYtLyha2w2Bf9Ha+If/EVmoJgohkWtnbtRWlNi12+DY7jg9
         14SXfk0Q6ED7clFg7vp9CTrMi4wgvDfn5S/wAR5tvhwxzr4RS1GB0qPX+12JwoPvbaQz
         JhNXx0A4b9NfDeI883UviI6S5HSAx/JfYVegIhSLkhbdxJ3Ddb0PDusgV+qfZmfv/swe
         R0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228379; x=1724833179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=arLLKSkNLaMIjiTVBc0cMKPJV4f+y4Msx8WJt/66k5c=;
        b=dRpAQughOzUnn3jfbdra7tOYDf7b7fLvyfe9htPxvOr84y3ACtjwmQXmV+OayPSSqK
         P320qe6yhl5DJIEXhTjGlLcvwUu1xCRW7QTnfFiyhXwFcYeJGMdJGUTbatAEI5xtl5ns
         Hu6CBtpbnXAF8SM7pp5JUUBzSHy8zsETLrK6Po1bfoFR+R5ZVs8v43RdGFb9CklJjgu7
         7/iJa4NPCTwqesfbqMWP4bGI/eECqoW8uM7sAI4yfMrjzPFLbeIsT3mF10SWlZYs8QeN
         sSNm6C8gKm6Mu/9S5zZIDynV0GoWB5LG90smfvnzjHivZZRwonMCqOorTawSWXNlzAnB
         U3fg==
X-Forwarded-Encrypted: i=1; AJvYcCXmWNrnNYz6kILJ5YbtXwKbD4ge7MLY6tqo/DDTIyf7Jb3wLLu0YCLiJHxTP+EsclSkxUjEW/He2Bs28R8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywngme3RwmkddanxJjtsggnuOqT5v5Xf7DGUdaZpDuxVsWV+BGU
	MKf6pBXd++385KmyqCOLLsFZ1H+RzTAffMS+VhkQOu3pDqnuF3UMPcqkOzmYN1g=
X-Google-Smtp-Source: AGHT+IEvHWRxH/KV5glvGK0Xiv2dJ13pnLs9scNXFJwmOSFepkjBPO6rW4EjBZpYY7GPQ4yq94i7jA==
X-Received: by 2002:a05:6a21:168e:b0:1c4:d05c:a967 with SMTP id adf61e73a8af0-1cada179499mr1734402637.51.1724228379371;
        Wed, 21 Aug 2024 01:19:39 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.19.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:19:38 -0700 (PDT)
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
Subject: [PATCH 02/14] arm: adjust_pte() use pte_offset_map_maywrite_nolock()
Date: Wed, 21 Aug 2024 16:18:45 +0800
Message-Id: <3d151aaf876b93a97fd3f070780345a3bf572123.1724226076.git.zhengqi.arch@bytedance.com>
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

In do_adjust_pte(), we may modify the pte entry. At this time, the write
lock of mmap_lock is not held, and the pte_same() check is not performed
after the PTL held. The corresponding pmd entry may have been modified
concurrently. Therefore, in order to ensure the stability if pmd entry,
use pte_offset_map_maywrite_nolock() to replace pte_offset_map_nolock(),
and do pmd_same() check after holding the PTL.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/arm/mm/fault-armv.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm/mm/fault-armv.c b/arch/arm/mm/fault-armv.c
index 831793cd6ff94..5371920ec0550 100644
--- a/arch/arm/mm/fault-armv.c
+++ b/arch/arm/mm/fault-armv.c
@@ -94,6 +94,7 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	pmd_t pmdval;
 	int ret;
 
 	pgd = pgd_offset(vma->vm_mm, address);
@@ -112,16 +113,22 @@ static int adjust_pte(struct vm_area_struct *vma, unsigned long address,
 	if (pmd_none_or_clear_bad(pmd))
 		return 0;
 
+again:
 	/*
 	 * This is called while another page table is mapped, so we
 	 * must use the nested version.  This also means we need to
 	 * open-code the spin-locking.
 	 */
-	pte = pte_offset_map_nolock(vma->vm_mm, pmd, address, &ptl);
+	pte = pte_offset_map_maywrite_nolock(vma->vm_mm, pmd, address, &pmdval, &ptl);
 	if (!pte)
 		return 0;
 
 	do_pte_lock(ptl);
+	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
+		do_pte_unlock(ptl);
+		pte_unmap(pte);
+		goto again;
+	}
 
 	ret = do_adjust_pte(vma, address, pfn, pte);
 
-- 
2.20.1


