Return-Path: <linuxppc-dev+bounces-4818-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2101AA05400
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 08:03:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSf5D62xDz30h7;
	Wed,  8 Jan 2025 18:03:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319792;
	cv=none; b=kxJ8ErpVsuShlTvPp8dpbnmGBCEsDvDRbSaovfKFNVPcmpo4lMxw0DjhzemkPxSZqtXoZaYAgO1flJLpr/onTDhPwgs6Au3AxRb2sbyQ2qqcC1y0xfrogkOCKOoZOJx7EPsqAz8JRADmcELVjYpQ9GAKo4RVVLT+U2WPbiXfhAAQ9e1CN3i9p3eepXHJesJEZyv/t/eLASPp47iR4lC09njFGEpjuDU2xatXbUBHNKgiLYim8NWNitC4r10T+1j0oRF4EwZ8mnlvw8LGIt7XYoWbMeD/t1+h0W2pVfKc3XO8a+a+9r5eJCfGPUHCk+fgS7rQPYKpEg9rzgzQBe7ysg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319792; c=relaxed/relaxed;
	bh=SzpcYcAmR7wIjJMr9qjJ0ueu9TAADg8s+gPSbWL3su4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WJO24+N+klMURWJ2L+TDHLSdFgU2xjCJkefRUqxE+X4xX5FC3L5QDq99bmB1IncEIMKSzdXagjPM9bhF3XQvtfZ/br4HYlW2pGe/B4nuFek9i/PpjQYjO/e6l4/n7+Mnzh/qAcenOf/R2kkf7zWhpc0v2k6Ocr4uTpIy7bKPoy+AYDeCybBIEhqHXcOqe4zywmJuATFjUPu+/1rTWD988hADRupraik+oyzRmYR7kS9DoMFTPL/MTyYwC6ODqXCzPTJKFl0YDxO/MhzEFoPYiWHVc+AZ1sP16YIHFAx9z+JQQEMSu/vX4xB+byli6bz4JiR+4GIbip93Z5zgY6ftxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SRI6yt58; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SRI6yt58;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSf5C4MNzz30h5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 18:03:11 +1100 (AEDT)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21a1e6fd923so29795125ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 23:03:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319789; x=1736924589; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SzpcYcAmR7wIjJMr9qjJ0ueu9TAADg8s+gPSbWL3su4=;
        b=SRI6yt58Jt/bWjnrYbOtyyP5Ktk2eHcgAHY6VD33DFXjy62UIxWowUTOOQWDaAVjhl
         DpOq7dKVgqOqM495lJBcrUL1d0BmrC+HVINtMBCAhXJImaiVif7aMyVt/1e8XfDD8st+
         1m7d71h+8jwunDhHOqLqpiEwPJQuPvOp+Zq7QFlIrHeIRu3/QT/VQ7Dr4g4RbL/gmfOP
         UuMzLz6RxuSGRe/1k1wkI2GgF4IMsqOxnlBsjAWMHDsjbECsQANZrc7U/m6fs8eZ3EPK
         NtX4qMHsWkQbGbynvihxxuig7jq+2dk4Ih6QG58ejceLHpEuNOmG3uSQlB4WEMjGMXf6
         K3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319790; x=1736924590;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SzpcYcAmR7wIjJMr9qjJ0ueu9TAADg8s+gPSbWL3su4=;
        b=lws2HtVYgAqT0hJfoUnKiuvRsdPq6nf3U1JtLxwfyLTAaeYCyLiWcDw08Hsh5sF3pH
         1MMkEuXXr/46TGJ4UmitL/qTPkimaOuRN29a8bvSXyaGFtSW4NShJB+JUEtotVqtWHwM
         IJR5az2F4IjQEXFzAYn3ah3hyFxteKXXKvxT+72HmJ0qmZU39NMgRIt9OR/493HMrBJ1
         G5NnKQpFcGyqPYOwE38fKltZhrRa2b88Mo4TkIezSX2XwLGHeIzezaKSeXPfKjasuW1+
         6mdATNLvfJXoPTQN8wGulPz3FnlLOZR4Utpd1tp32ZyFs2BCAHHoDgT4rkQoViQvzd0h
         1aHg==
X-Forwarded-Encrypted: i=1; AJvYcCUM+QkfdAqVZqpDIvkoxIBg/ZDECcP9+/f7W7QsVrdlXA0MR7bxI97nmZG8yCG37TymxyPZyI5CnTvYK9k=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzx1WgNAhjJHKi2taGNoIjajh2H09eGYfqzvArUhEcSdztk2U05
	43kjH52JImUjRV6VYzc08nYR/gZ6DutrPG7X4KSxdKX+NIvSI2Ktuh5dBRV4Dg0=
X-Gm-Gg: ASbGncswNbWz+kpCN9eD22lgDRy8EaQiSt600ndn0osbHiEgTL/Qj4TbssgFt59L02N
	UXoDn+rrQwduvhD1Us5guNYsCHdd9Uzm24l6eKuLe198pA1WhXUkBcsNnnWhdVdSRga9G/be1nV
	k9wctitcPbkDOK5aBzJZy/l18yrXOzLFD+r+TmBp0wQoP21NldwdCFrJobOOUsM8JbeL4Bxcg72
	PkJNTcb/LuWM7f+aVY7nSRdqt7AwYgRSpBwVQvPesUJA01fZ3NQIiODAkD9zFG8HBU0ZILnR+uT
	sZMZJnmjVs7OmnFx2vQ4sQPm6oc=
X-Google-Smtp-Source: AGHT+IGLH2wnugoAqXpKOjRMOcNm05e1d3DjACkQOqMsLyNNJS4LCZNqibWg6/9XtyaXTuj3byMh6A==
X-Received: by 2002:a17:902:e74f:b0:216:7cde:523 with SMTP id d9443c01a7336-21a83f6710dmr31869555ad.32.1736319789694;
        Tue, 07 Jan 2025 23:03:09 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:03:09 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	alex@ghiti.fr,
	andreas@gaisler.com,
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
Subject: [PATCH v5 15/17] mm: pgtable: completely move pagetable_dtor() to generic tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:31 +0800
Message-Id: <0c733ac867b287ec08190676496d1decebf49da2.1736317725.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
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

For the generic tlb_remove_table(), it is implemented in the following two
forms:

1) CONFIG_MMU_GATHER_TABLE_FREE is enabled

tlb_remove_table
--> generic __tlb_remove_table()

2) CONFIG_MMU_GATHER_TABLE_FREE is disabled

tlb_remove_table
--> tlb_remove_page

For case 1), the pagetable_dtor() has already been moved to generic
__tlb_remove_table().

For case 2), now only arm will call tlb_remove_table()/tlb_remove_ptdesc()
when CONFIG_MMU_GATHER_TABLE_FREE is disabled. Let's move pagetable_dtor()
completely to generic tlb_remove_table(), so that the architectures can
follow more easily.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
---
 arch/arm/include/asm/tlb.h |  4 ----
 include/asm-generic/tlb.h  | 10 ++++++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index b8eebdb598631..ea4fbe7b17f6f 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -34,10 +34,6 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
-#ifndef CONFIG_MMU_GATHER_TABLE_FREE
-	pagetable_dtor(ptdesc);
-#endif
-
 #ifndef CONFIG_ARM_LPAE
 	/*
 	 * With the classic ARM MMU, a pte page has two corresponding pmd
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 69de47c7ef3c5..53ae7748f555b 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -220,14 +220,20 @@ static inline void __tlb_remove_table(void *table)
 
 extern void tlb_remove_table(struct mmu_gather *tlb, void *table);
 
-#else /* !CONFIG_MMU_GATHER_HAVE_TABLE_FREE */
+#else /* !CONFIG_MMU_GATHER_TABLE_FREE */
 
+static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page);
 /*
  * Without MMU_GATHER_TABLE_FREE the architecture is assumed to have page based
  * page directories and we can use the normal page batching to free them.
  */
-#define tlb_remove_table(tlb, page) tlb_remove_page((tlb), (page))
+static inline void tlb_remove_table(struct mmu_gather *tlb, void *table)
+{
+	struct page *page = (struct page *)table;
 
+	pagetable_dtor(page_ptdesc(page));
+	tlb_remove_page(tlb, page);
+}
 #endif /* CONFIG_MMU_GATHER_TABLE_FREE */
 
 #ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE
-- 
2.20.1


