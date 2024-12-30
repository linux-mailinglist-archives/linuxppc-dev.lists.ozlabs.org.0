Return-Path: <linuxppc-dev+bounces-4526-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50C9FE458
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 10:10:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM9L66hylz2ypP;
	Mon, 30 Dec 2024 20:10:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735549822;
	cv=none; b=O7C9V8m7Fl8GjB1vQp5HkYKBgBKLNBhxEtKDjlsrT3LLz+wzmm3GBG2MxlV1uWownfg8zjR7dN4Yzuz49r5uRIZR9ULrzvFASSsaFiajLIAM5/8LIu/bmSNV7Hitsn8RVcaaCcgmVK5lq+vsRp5BMUAEGrzrWKBeK/hxq2D+Gmj7ndNaMhYw2phXe0vpIdNGaSGnvOFxRhXsjY/ijlbwOINsCW4jqeOuWo2uKpao5KVCp09uqzCNH4hJQd40vGLHfSpzsFM5YBtguWZoMP6nuU0GNgblzwIbtvE5mHxe4ECrS84IRBdmDMwoKB7GsyKxYnG7XYcrHso5/6X9KeqAXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735549822; c=relaxed/relaxed;
	bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YrPx0e+2K95lHRP1jsEyZuU6zpCS0VzpEMqdaM8BJIbx/sDlaERhmCd7y5K09VLzYmqQA7qb8KH6kUcCMsF0Z96jBqwMPvaNifBqZdPWeOH74qB2+OjwHPWEnX6M5bqkGtnT5Xwdk2FAZ4l3Th/V2AHK5YMJtcsJhYo4CAHaO0MGTaqC3U178NN23HsIwtRgUMx+I8HCzvhJdBNAAI3dt1ddzS/EVMj0L6IyxfJx/+++Q3ubTKK1jqg+EkxGm2W0293raIudoYsmcJqlHd0g8BFSrREsWEmtS3uXdpJui0ynoJ5SQ52IDouNTrUibTbwpR34QUuIx9rf0VgbFg3ceQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Cpt8XaU8; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Cpt8XaU8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM9L56RM0z2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 20:10:21 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-215770613dbso83813635ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 01:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549820; x=1736154620; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=Cpt8XaU8X6zz/hc6JRbV3k//H0G7pA6mNkZPqlIDXSCOIQQVhe7Riuj1uLqI8GOEi6
         pAa+3BfXPNM+SuOKSIWZbNUVZhzlQNaE8nT5KZrIwrhfrL9PObW0CZu/2m9noG99yxj6
         fXZ3xO9nUKSsHLod1Dm63ZK28LY0hT0O+BjYzayX7XhvLR2jt+mKuYGhe4SNmHx7p4Yc
         1eSi0xj7EJxsAd/R4+VfqtizuVelHW3vN90nfCJfffEQENe+ioKTMzDn0byq2MOVVQ3r
         7lQFkcjpTPG/Px6EQBlv99MMUGumLniSk8MG0GIexiQLcDjn+bixQJJVjDoJQl15Ziwq
         IQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549820; x=1736154620;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=BNuIijWQ0EIrW71aoRwfKGXs0sCwQcdcXRnSt+OLm9n3PhywRLXXxUKxF8YnmOPElo
         UYIYrAQwPmhTRnHp91UENYoRlDQZokLkecu/j0TFgNJ8BWRAfIUjHLM8MoWZ29bajscF
         tMWJ/2ZNRbpwWPLQNhKELT0OOZkSb4vQvmcNimTVILoWAw0R07/J6wipbSPD0OOsGt0L
         0Ba2x/4mk+iifyht25EZPKem1Aj+j+RuDnyFCoVekidyhVA+9E6YXFz2jNHDrt1fOckG
         aPyX9VNv0AiS3CJ/guJHu1tjV7L9BwKygUDIux+a8Ava/H88Dhtk6xX5iahG0VRFzoM9
         rnGQ==
X-Forwarded-Encrypted: i=1; AJvYcCURAhaV8AOUJqLzHnp8qghUCSZ/qtWMc3Eh7tKWOQNaRFp99/3L2BXnPcJhz/uTnuV95cnKY1FY6Bvh+BY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzrXPr/HXN0u68+9bhgVhzCF7tZ77jPsEwkae/OI8mDfTXfpSav
	2VTq/c3Wk/yWuNY7HSGHOwmHdeOpYpP0pqxRfsApGeQoQyIZ3IVY0WqFYGZZl5Y=
X-Gm-Gg: ASbGncudcCPafoCO0XmHVagzTL7169EADgekotXVCgIG0qn+uHEak2o9IK4H/YaQNxn
	XgXCYKcb58qxiLhkdOyqEV0+kWLX46kt9P9vTNMpwk4cicNTWXNNyLTJlx7Jpuk2vgzOW8IIV3p
	zznEAfXqB/uAY5974Pd7o7mXy+tmtQy8HtNFxv1KQ5Z0xgXfmHVWrpy4wuMcNK2WLVLllaS2eeC
	WAl+3VlIk/PnqltAw9b0QAMp6MbZV6hwSDQ62Ksx9sy7GVDYGUVpTm+Uf7RwkgUolXQ2oQJrV7S
	fzRtXc9kFCYfeKBZ/05iHg==
X-Google-Smtp-Source: AGHT+IFX/3Df8AQRXbgF3uoP6h0ZSX98E/foDuPWt5IdgjLk00IpLZqU8w+lhMMb/JJOCncpjT7B0g==
X-Received: by 2002:a05:6a21:670b:b0:1dc:7907:6d67 with SMTP id adf61e73a8af0-1e5e081c8d0mr60502051637.40.1735549820172;
        Mon, 30 Dec 2024 01:10:20 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.10.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:10:19 -0800 (PST)
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
Subject: [PATCH v4 08/15] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 30 Dec 2024 17:07:43 +0800
Message-Id: <955162bfbbcd9fbb3b074e1fe2aef4f64b61d6f9.1735549103.git.zhengqi.arch@bytedance.com>
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
 arch/arm/include/asm/tlb.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..264ab635e807a 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -26,12 +26,14 @@
 
 #else /* !CONFIG_MMU */
 
-#include <linux/swap.h>
 #include <asm/tlbflush.h>
 
 static inline void __tlb_remove_table(void *_table)
 {
-	free_page_and_swap_cache((struct page *)_table);
+	struct ptdesc *ptdesc = (struct ptdesc *)_table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #include <asm-generic/tlb.h>
@@ -41,8 +43,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-	pagetable_dtor(ptdesc);
-
 #ifndef CONFIG_ARM_LPAE
 	/*
 	 * With the classic ARM MMU, a pte page has two corresponding pmd
@@ -61,7 +61,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1


