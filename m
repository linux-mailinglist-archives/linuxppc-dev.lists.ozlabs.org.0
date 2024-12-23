Return-Path: <linuxppc-dev+bounces-4439-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 140059FAC52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:45:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtRJ6s7Kz304f;
	Mon, 23 Dec 2024 20:45:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947100;
	cv=none; b=NHeeqVQ/Rm6U+eLfdQtrXWMPdloeeX/sRMzq58AMSkY3nmxwwjmuR8iNGIB7kse8LE2TJT6dKkem7Kf/nxr5rzLYVLsSTewWd5sFy3UZhZziQk9fXU8WAheZ5H37g6fgxjYHGfaGsDkscL4kycLwBulRwaLMN/qk4QLe5ZhwNm5k1509IWMCBrt1nPB8yfern14jup2pmlXKmEHSMY8QE3VpovuJfGbSthIHJ7Uib2LbUDd9cVOs3TnCLbdP5nH019eFgoW7F+g86lQ4alN2bx0ObHUC3+uaG33vu4sl4ti+su4VN6WAaXvYfFxCYt4bkN25Bm9x9bdyFCj/cdOQ0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947100; c=relaxed/relaxed;
	bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hvNt/dcyHPCIoh+2p/tDNrvY3BO2v6xBYb7/C9RNwuBZKb2a3UMuDab6utX4tDuW2Z2/guO4b8LXrRyFvREHJiDisxWsgOuNAnKpOgae4ubI4OP41iej7wJ+AXdI2BkfOcb+4x66FKXglUZZdGttUgJOeqkRDVNxKieGgO3tLng5VjozSeO4m7ihCph390Hj5y470XhPPHoedswxtbXRxGFlfmE3czeemqd3crgHqyNi8HGQOnbLLC3JABl6y2RGzpa1ecvZqg/yF/lDmDpcGjGwU9WN9MHugNWYJM3Mk7Sn8rul7Z2qSmbmju876HB5/S39m4P0jeE2HtkK0QUo1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HB3hTL6U; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=HB3hTL6U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtRH5SRcz300C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:44:59 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-728f1e66418so3210245b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947098; x=1735551898; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=HB3hTL6Ur2mi8ZSqMFFBXn5Fv1UiEAnax61Rfyqpvgf4pRLsBntpqmC8skVUdyExr2
         iOzlG6enLJnZFSqfq3WlprryB6Q0t7qYmqQiiCKstrhQCqCV8SeL4jEUuz0yoXaEGJXj
         h12TAyVhavUxzPFsD2FtaS5o4iodCM46CyJN1epb9i3AFq32LQ8YtyMwjSYgaNooODz4
         k1m5aAcE1B4g2xbOQgHTgNkdxAjyQBhpUbh6CEu8643h93xlP+VijVxgMCY9Qbhk874X
         WsutumNeYLDbC4AVMHxM86i7KFDKhgv0ATnxZ95qQlLFzzlHKhePXkF2jnijtvTqP3V7
         fFvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947098; x=1735551898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0nJ0bdEaVLB0+13gaCQHdoBfFkuXXT3Pqta7GOjv8Bo=;
        b=W8iSNtdpLf+M1Je6HDMvFfVHTdp8YbifwOAKx/H2MVrG7Xu+sFqZrrLYKx2rXqApdP
         5cYdqA/e71LlFO/uPNmcy3OJGsq5xYgKd80/J0B/wJaUG6iMPnMVC4ojLSz762Biw8Ld
         HP0cWOHesWF7l3HEgBIlfIY7nbY80lNZc1cFjdd6OApQCsxppfym+m2FKLrTodE7lm1c
         TajZjtJONdD9cTIuHuuGlRU99oVrgUV03mGaH6crqlt7YViPnHK7zuLID2cSFbxtnDso
         B6pjWHD1ipiPfnebeQQ/stQEN/dqoccyR1YK8UbbHhWSIWcO8EagxO7ZhELYwa7aUpdP
         sbxA==
X-Forwarded-Encrypted: i=1; AJvYcCXUzPIb/5SxLYUqCtogSgZVy+5SK7sQm+Yy5NSj4ILHrbHCRL8FAEYI8zlfigiBxtE7H8lYiOMzbHFrnQo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyEYL52cGtA5l1g3n8a+NddyWIS2YGyJuOTl9Ma7978fusXEHgP
	4WMT1rvpocz89qkZ8GCa0vEyplXDMeem5fKulJ3WA2EzeZUWHOQIc8jyykNgcSs=
X-Gm-Gg: ASbGncuGSDc/v1tLWslCBoE7Y7hiPZRfkM/lKqsj/ZoPEqPEnQIFw9yMxhqH7HW8eBq
	2uOxF+Yxk3CABMgLM64Fm3a8LXRXQtrlVhDDCOiGUle7SlHHPGNE/KRs1thzrBoFzaKo9bNRXyM
	+yP6SfBrpl+PzRpse3/piml4xvBwD552p5dITY1k7AXkif73eBnQ9004XkllucibT0YvXMFe0Vh
	U+CgjnMjAQQHQzc+s/2HFW5jxQ+6GhhLRnvf8ateCoc8j67xVdagNFmrXrHVoWgyuTt/iahVC5M
	KFXRe2vww7w0prDfTx6QfQ==
X-Google-Smtp-Source: AGHT+IH27a1l8kT42WYYi2KTFhW6smXjjCcrkYYj/EF7HLDGUXcMfllZ3ayHCCSFU+IsHMUxZvkRwQ==
X-Received: by 2002:a05:6a21:6f87:b0:1db:c20f:2c4d with SMTP id adf61e73a8af0-1e5e044b1c1mr19165305637.2.1734947098042;
        Mon, 23 Dec 2024 01:44:58 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:57 -0800 (PST)
From: Qi Zheng <zhengqi.arch@bytedance.com>
To: peterz@infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
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
Subject: [PATCH v3 09/17] arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:55 +0800
Message-Id: <df71d1bd87ace445383b8ae62087ae14e35eac3b.1734945104.git.zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <cover.1734945104.git.zhengqi.arch@bytedance.com>
References: <cover.1734945104.git.zhengqi.arch@bytedance.com>
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


