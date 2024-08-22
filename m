Return-Path: <linuxppc-dev+bounces-325-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB44A95AEB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 09:16:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqDwz1SBkz2ytm;
	Thu, 22 Aug 2024 17:14:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62c"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=LtgK/lsJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62c; helo=mail-pl1-x62c.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqDwy6Mh9z2ysd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:14:58 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-202089e57d8so3197855ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 00:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724310897; x=1724915697; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKuz+eT/BjM4oBQXjKjArJ5u0hGAcRe4llal02NX1d4=;
        b=LtgK/lsJk3/ahGjfxuGiDFPOCt1n9xIpLit235SLiM0S+NmTxV1dIALR2G9prhtOkp
         HWDBGLuijGo/NeHPgUbSi5k4xCInkfeNkJvlzGkjR3qopton0uZ4URvSRRKR9cNg98yJ
         Ia9SH9lA+PRGDyG0S1e/WtHh3ts4QV+mqIVIpnp6pN7T7SyzO/W0unJoxY2zDFQaAvNo
         TRY8Ipv+6cGDVOx3818mJ5Yv4gujIFQW1rZeP7NmA9QvMflqAhKf6w09Ewu+bcG3iW5C
         ma1uWqb4gw7ueH4r0Cy0S6mYC7U09vU61gH1QBpXOEaFzeDh6DIuZa6VcieuVWx+zCp1
         1scQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310897; x=1724915697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKuz+eT/BjM4oBQXjKjArJ5u0hGAcRe4llal02NX1d4=;
        b=F3W3e23r1BVk3zGSQwdu0B1PIncL7i/JMEuQGIuxG+vkxH540FXbJgj+Fyb8penPOj
         TJJxQ+QoYLX/mMalmsP/EGP8eG8eelnPUMNp/4uaFlykZPtZJr72qth2ZejTTMBC9pXC
         nHjNj6a7Xl5DlBdn8bVpXOywirYOU0LizS42s3F5dIXxMvCM6EB0mRCJeSpp8SyCLsu6
         +/3dVZ9KPQUK9/KF0V+FtjvZlnGLVR0J9IMFFgMiP56cBhNggIpNAaVEA06bOEgdKQX5
         dnosIA7BrU+iIs3yLE8tVlXxr3bXupfhvkK/wlRW3/xqNZlQLT3O1q9E9RIX1bzSQBg5
         Yuhw==
X-Forwarded-Encrypted: i=1; AJvYcCXJjb0vXT33XOaQn4Ij0zylui4hMeNmeK24CnWyd55g9o670c39Phh+pGjfNFnYA9j4QoZtttM+nh7pmLA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz4eUSqEKRmO/dUk72DnpcyrU9mrXOBeTGjLXne3Lg/DwFyXEmu
	vl7BBDLcJgu6T0FqFB7ILXcB/bohOD7m1o2cdIP5TvXFDBXw74lh705V0JoC6/k=
X-Google-Smtp-Source: AGHT+IF6H0tDfgQqKcPaVFXqnNnvtvkdaP6bepcTCK17Vph5rD33YztktUCyS9gQ0weOULsun7jJQw==
X-Received: by 2002:a17:902:e88d:b0:1ff:43a8:22f2 with SMTP id d9443c01a7336-2037fe188b8mr31159405ad.24.1724310896888;
        Thu, 22 Aug 2024 00:14:56 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([240e:473:c90:f96:d029:ea8a:4e6d:d272])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ac994a3sm695095a12.16.2024.08.22.00.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:14:56 -0700 (PDT)
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
Subject: [PATCH v2 12/14] mm: multi-gen LRU: walk_pte_range() use pte_offset_map_rw_nolock()
Date: Thu, 22 Aug 2024 15:13:27 +0800
Message-Id: <0e2980e9a31d3503a5dfb350c04f4ede4d05220e.1724310149.git.zhengqi.arch@bytedance.com>
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

In walk_pte_range(), we may modify the pte entry after holding the ptl, so
convert it to using pte_offset_map_rw_nolock(). At this time, the write
lock of mmap_lock is not held, and the pte_same() check is not performed
after the ptl held, so we should get pmdval and do pmd_same() check to
ensure the stability of pmd entry.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 mm/vmscan.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 5dc96a843466a..89ef1ac8eb1a6 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -3396,8 +3396,10 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 	struct pglist_data *pgdat = lruvec_pgdat(walk->lruvec);
 	DEFINE_MAX_SEQ(walk->lruvec);
 	int old_gen, new_gen = lru_gen_from_seq(max_seq);
+	pmd_t pmdval;
 
-	pte = pte_offset_map_nolock(args->mm, pmd, start & PMD_MASK, &ptl);
+	pte = pte_offset_map_rw_nolock(args->mm, pmd, start & PMD_MASK, &pmdval,
+				       &ptl);
 	if (!pte)
 		return false;
 	if (!spin_trylock(ptl)) {
@@ -3405,6 +3407,11 @@ static bool walk_pte_range(pmd_t *pmd, unsigned long start, unsigned long end,
 		return false;
 	}
 
+	if (unlikely(!pmd_same(pmdval, pmdp_get_lockless(pmd)))) {
+		pte_unmap_unlock(pte, ptl);
+		return false;
+	}
+
 	arch_enter_lazy_mmu_mode();
 restart:
 	for (i = pte_index(start), addr = start; addr != end; i++, addr += PAGE_SIZE) {
-- 
2.20.1


