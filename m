Return-Path: <linuxppc-dev+bounces-277-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0FA9597FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2024 12:43:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WpjcH3Fs5z2yVd;
	Wed, 21 Aug 2024 20:43:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102b"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Wous8dAw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WpfRg4lKTz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 18:21:03 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2d3d662631aso4423363a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2024 01:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724228461; x=1724833261; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9nMMKQBovMbpHaGn8Lvg/undANxxFw84odzUdkp5IAc=;
        b=Wous8dAwZv+RRMRhtj0Knl7jfXJKexDcvcVrS7SapK065lDoqy9fuqT2VAprPgnqhd
         18XyWwR55H1uHVCMOExYbqoEj4F83YaQ/tJ1dZg/+nLrZuzILEsgKUBDOcfzCaOFLc7I
         jpUfavj1hJfl7qKiBd1wCtJfY106Ch/N661O6TSMQUX5qyr4UYCwrL9/UxsfEEbA9Mw2
         Mu+AsOxmBn11A9SrZPVWcQrEffX5eY0pOL32/eVzb5SbGL8DYBkEOaOJ6+Z+XyuW1xdV
         zovHVGrsEyo5q0ZYA5jOcY51Xso8oduRa5/J0S1hSoWv5xX9MVKN2L0RCHXcwug7MSRn
         GpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724228461; x=1724833261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9nMMKQBovMbpHaGn8Lvg/undANxxFw84odzUdkp5IAc=;
        b=iAwph/ObdgfAjKblCtwrelyqFLkdzEjnA+4ZTzJkt+m+u02YcjpXnf6o8bV1iSnL5W
         LlBKsGwhDdoRIlyaaegbXgcZUQwJp8skEEwfiCzL1B7S4wZc6WazPLRNlXQlsSP36YU0
         yRzC/0wCkDcYSvt/ClqXS9yz8vPs6YhuRzjp68ax5BMofGHN0vb2UdMzwkHy4kPGd2+Z
         JIU+nIqfWasS3vqO0YRzLMblawfV/oX58rv+6YVWDInNRANzsNFmpMES+/etsL6ohw0j
         ELr2HRCzwZdr4OXOnX6llvR1vc9Fp2N8450zeUv+FMqUiCQkeRQDJy8GhxTu66TUm/Wd
         ycKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiP5gQfjXA6esY+S9T+oysw84aBNfqc6rWScbOwYQfM4UBo4aZ00pFqswXKOkLvhLr2qcjPn2bs8jVjog=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzik5FthZ1qqE0p5kOJzfwm3YT67Q7Y8/WtpJs9QYLrz60Yu8Sr
	GR06a9T+2vu/Azf+SjqWVoln2p89ng+VxE8+KPkBJ3deZPDr52VIX/OIIi4Twak=
X-Google-Smtp-Source: AGHT+IGVCW7LuSOfGhGGSqonUfZfQEf1Y51LpMxCXHDPBrQX3ltYUdmnoycYhvy3ErzvacrcFVYd1w==
X-Received: by 2002:a17:90b:3851:b0:2d3:d239:24c2 with SMTP id 98e67ed59e1d1-2d5e9b99f57mr1469884a91.19.1724228461120;
        Wed, 21 Aug 2024 01:21:01 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5eb9049b0sm1091453a91.17.2024.08.21.01.20.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2024 01:21:00 -0700 (PDT)
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
Subject: [PATCH 14/14] mm: khugepaged: retract_page_tables() use pte_offset_map_maywrite_nolock()
Date: Wed, 21 Aug 2024 16:18:57 +0800
Message-Id: <c72aab4401c890a2b348eae119ec395e30a2f805.1724226076.git.zhengqi.arch@bytedance.com>
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

In retract_page_tables(), we may modify the pmd entry after acquiring the
pml and ptl, so we should also check whether the pmd entry is stable.
Using pte_offset_map_maywrite_nolock() + pmd_same() to do it.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/khugepaged.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 8fcad0b368a08..821c840b5b593 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1721,6 +1721,7 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 		spinlock_t *pml;
 		spinlock_t *ptl;
 		bool skipped_uffd = false;
+		pte_t *pte;
 
 		/*
 		 * Check vma->anon_vma to exclude MAP_PRIVATE mappings that
@@ -1756,11 +1757,25 @@ static void retract_page_tables(struct address_space *mapping, pgoff_t pgoff)
 					addr, addr + HPAGE_PMD_SIZE);
 		mmu_notifier_invalidate_range_start(&range);
 
+		pte = pte_offset_map_maywrite_nolock(mm, pmd, addr, &pgt_pmd, &ptl);
+		if (!pte) {
+			mmu_notifier_invalidate_range_end(&range);
+			continue;
+		}
+
 		pml = pmd_lock(mm, pmd);
-		ptl = pte_lockptr(mm, pmd);
 		if (ptl != pml)
 			spin_lock_nested(ptl, SINGLE_DEPTH_NESTING);
 
+		if (unlikely(!pmd_same(pgt_pmd, pmdp_get_lockless(pmd)))) {
+			pte_unmap_unlock(pte, ptl);
+			if (ptl != pml)
+				spin_unlock(pml);
+			mmu_notifier_invalidate_range_end(&range);
+			continue;
+		}
+		pte_unmap(pte);
+
 		/*
 		 * Huge page lock is still held, so normally the page table
 		 * must remain empty; and we have already skipped anon_vma
-- 
2.20.1


