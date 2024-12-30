Return-Path: <linuxppc-dev+bounces-4527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1999FE464
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 10:10:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM9LM4Pk4z301Y;
	Mon, 30 Dec 2024 20:10:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735549835;
	cv=none; b=i1DkUF9GiQtWZKwgE4mm0bJeidhdDPO/kwvHKpxGSd0Xx7CjlP7BYXgVBK6TTYU4j3e17fUBx5oBmQcVbGo1CsqTQdF+bsFek6yCyEisumnYxO2R5FmKgHTMbQT7LfNQTpBOvwArlsWKppUPtl+fnhienm2OfO6aPp7e/4m/b7JNoOvUyYzn31Aslnyd1r33qO3dgrJLNwUz2xHTPKMWxc2vB+RHreC36tZ07GHQYhqbC1+bGMHzAuLA/clYhkk0t0ZRF65PeduYplve+C1QqUFg7YOyuKn9LaXJ3O6epXQ9Yyg17fLgICrnzx0BqUuggPhdN0F/+GZSzfLuQAEJPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735549835; c=relaxed/relaxed;
	bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f7IUjpDc6NHagzI0T4eBMf5yE8s3zi8pFKTiNPUscMOrXT9+g2ddocFYCBxl4CFZ3mRHCye27LQVtRUEgdZg9a6R0QlMIYF0VXZpZ2dILbZOLntNTjC0hrfEHRWriLQnthhrnQBIcRdluYMnjnurrk4LhECqVhCaxEdDYAc0JE+o5r/u4YHEtwWXYT1D/wPz20SR33YgikvLBeFeKp3YEt/72n9IifSX5yNmhrE7+2ST/i+z0v6rwKTUC3lPlRbqhAO7w2EfWUM+uX5dXG8qPAzbCIGWF27+f6BHvsOtwQadUjwXZPJ1dswpVQZu7WUrhvIlab+tUtjaTYHhmLr+Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Z/IrbUNE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Z/IrbUNE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM9LL47pXz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 20:10:34 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21619108a6bso107031635ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 01:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549833; x=1736154633; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=Z/IrbUNEV4qgPf+aDcxtgjbQk/3XdOYCY7f5D/60AoG0s09N4HOTn0k48BImJYCEFC
         PvB4gkKsZ4VFag6miZk1rNAb/wIEOsHOV5Ge0+1lWzf0cM6xD7GEOXTlTSnXN0rAGvST
         XZHof6XcwRjQxrQp1UDXUn9YoJh/dmV643N0TTowgLp7Cw3pGDXA7ft04b+UUoAVldyY
         wJAMAGHc03FwbOCwNdKM6uFbC346jI1YG566hdrhRXiGwV5n5DKg52hBUeL795dTb1fS
         7sSsMsw7Ss5mFpn3I7yISUNBKf0mMVCQqCt2i0arjVYfo72s1J8D6cT5wuIwW+8BcGwF
         +5fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549833; x=1736154633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=rxm39EiuRvNrWGyMRhV4gJ13//4eJdFwSeSmwjzwZKZFm5uHWAdcYbQGk6R2ymC6GK
         M5kC5bilU7aL1IEMRy4absJFb5cVKeEmeSuRcFT1dJfgRyIOgXQRCBb2Az6mmCJFasVA
         PQtqL5kRT9Kcb3Bm7WW4vxwJ8gbbRF9FVbSZ0ptnbT4zkxD8DNlCnOiQHFZXyk4vTpIv
         +W3YFtMDd0lYCyXK//dvz/Y8qTDiney18+yRtmFBS04a1JigGt2GV2ktmLlUdVGq+xwU
         N2tfvSN2kmhUaqcyERFE2AxqKcBG6J/lp4JcinagWhO0/+j/V2dJIcocuRffQGFj+4Nw
         a0Hw==
X-Forwarded-Encrypted: i=1; AJvYcCX76GjbuEt/pQN214HvSKPxPlXKSbDMYiIxQJiNsvgWJUNDsdbg0vzeJ0Y6QLvKJJ5tnBM0FMh/BblqsgQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2dLq3/gNoYCVjumhOHGMVcs/+MOzUFfTy22FwRm3SbVfWnUeT
	9ijS2JdBMGlL6WM/QpnPHy916YYVGeJRtoHNqkCaHJEhVL7Cj0xPXp/PCGYSA8A=
X-Gm-Gg: ASbGncse22mscDqkU8na2G6RkofW7g/8+meDKIcWKOSsye0gk0UWQu63wPOAbgEky/X
	KdQ5Ir7WVxumnVIFNBFy0cXqOFxnYGlWMjcAsh3pyAkuRO5h9j4DYtCwxNtNJ3FXmp1VOciutyx
	L1/KG2WKtNBOW5RufQWmx0a+BLCs333LXQ7wl8imZZN1OLZahj1gULREW+Th9TaQZuEef0KK3jF
	XU+Ht4bCtfMzFrUqLvDMbHqQk7m8tIP6+RLIMzbLVXY4zrpa8/ymGB/oF/2J5FcqlC2zCDaI5BN
	niWgo80ktPy9TdFntHA3pw==
X-Google-Smtp-Source: AGHT+IGwnjGmNRtsc6wvIZAIM8FV7PRxiURIME1KaVRQ0EplG8wu3sXxm46oGULh37KJjV0x+YOVDQ==
X-Received: by 2002:a05:6a00:2181:b0:725:8c0f:6fa3 with SMTP id d2e1a72fcca58-72abdebb85dmr42631070b3a.22.1735549832564;
        Mon, 30 Dec 2024 01:10:32 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:10:32 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	palmer@dabbelt.com,
	tglx@linutronix.de,
	david@redhat.com,
	jannh@google.com,
	hughd@google.com,
	yuzhao@google.com,
	willy@infradead.org,
	muchun.song@linux.dev,
	vbabka@kernel.org,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	rientjes@google.com,
	vishal.moola@gmail.com,
	arnd@arndb.de,
	will@kernel.org,
	aneesh.kumar@kernel.org,
	npiggin@gmail.com,
	dave.hansen@linux.intel.com,
	rppt@kernel.org,
	ryan.roberts@arm.com
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-um@lists.infradead.org,
	Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [PATCH v4 09/15] arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 30 Dec 2024 17:07:44 +0800
Message-Id: <df71d1bd87ace445383b8ae62087ae14e35eac3b.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1735549103.git.zhengqi.arch@bytedance.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/include/asm/tlb.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 408d0f36a8a8f..93591a80b5bfb 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -9,11 +9,13 @@
 #define __ASM_TLB_H
 
 #include <linux/pagemap.h>
-#include <linux/swap.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #define tlb_flush tlb_flush
@@ -82,7 +84,6 @@ static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 
@@ -92,7 +93,6 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -106,7 +106,6 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 	if (!pgtable_l4_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
@@ -120,7 +119,6 @@ static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
 	if (!pgtable_l5_enabled())
 		return;
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 }
 #endif
-- 
2.20.1


