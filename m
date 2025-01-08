Return-Path: <linuxppc-dev+bounces-4811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53595A053C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 08:01:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSf370msVz30TQ;
	Wed,  8 Jan 2025 18:01:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319683;
	cv=none; b=NsaSzXM5QEYr/nY3TD6Y3R9o6zqW2lKsNvmuiG5M/9uP8GGUyx3A6U1xcNs9Mg1UCMOC/DnSp/tXyIUAAAeHh3nhFcpv/BDXpSqb8evOj5+6mZ4EMV9bmViyVX/eitr8Biaoi5C2PjUadi5F1EvLqFPU6YA1h06ipohiZZxVzfCo8wF8oq3s5YDWhcgbAytJMycJlSxsnU4hfsSwFeP7JfhIxiUAedpWo4A0yEF1m/xfJeMiDIaJKJuHKr9F2Z+BhvDq6sPT3S+h+ysKrhXXdp0RMQZ2jwIGNBd1EbKfiUwynvi/p+t40igMKOM0dI6cZKFsdZf3e8uKmJx7/p4UyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319683; c=relaxed/relaxed;
	bh=xRYydr57EpvJJkVepk/VS3bq1fMuYMijkZdKL5zejaA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oBRbT6ugqUdsv4ng4Pqqsjam6bbHx70buVn6OyQK7T7Ri6TSwWOKoqGkMKXl1Bg2zYpuHmaRqdSt6YP2gpegQrI0mX/mXA3wcQIMNtLE4mtchd1PNw7gMGtcDxWF3zUH/9H9pWfGmiWC226oIy9PhhijzBi5eCCRUsqYxChVG3yByWoeYgRPQbH56k2d28jFO4lVYOppj/M0vOYPvOn+SoY/rMt6+qSOsH3Q1enLHWpLdQdjCbrsbXJucAeILv13Un8IaJUsCIpphmICtA1w1MDQvMyeNO/6ZEPoMyAnlxW1XtvvLZ7GjBVhs/eZGeccyFIQgc9HeX1BFEZl54JcJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MZtAgSqY; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MZtAgSqY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSf3611ycz2yDx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 18:01:22 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2163dc5155fso239942835ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 23:01:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319680; x=1736924480; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xRYydr57EpvJJkVepk/VS3bq1fMuYMijkZdKL5zejaA=;
        b=MZtAgSqYOfJ8BKXcqHSjzEBle6Ah6Swpq8d44FrFiLizLG9gBkyVZAF0mUjtrvLul+
         MDUUB7Od/Sks/7KhIIb29AiiF7W5f5UDue0NTkHmHgtXLrjlaHPydt+HFyp+Q+M+ytZV
         YcMT2npobyfaPYvKrh7FW3tW1QM882almkkJSG3tFYpTsbT1vnmoeBa4oSUZMDP7PjLT
         tlee7bJg2/zTlP7aJAo3jAIbftxPG7mVDwPf44xS7xyxXzKM6irke1d4ywwqwkCVq923
         ff0RfxzlTiTZQciXitzwkEXjB6LUHUNwg9pvA7CG6a0AY1M8c2q4qDtwLLzPNl1ZGY4r
         RtqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319680; x=1736924480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xRYydr57EpvJJkVepk/VS3bq1fMuYMijkZdKL5zejaA=;
        b=MxcZr++C/vqRpHQyES02pYcY61xDPtvXc9iCfyXcXzIZuMmexC6lsDK3OUDGB6xuWP
         vgjW56vXFpK9a85BVZRd5ZGKDBvItC1WWlbMu/v9Vpiwgm0sDaTDpMV7lvyIxCixNxEl
         ES/VxlLK5cjzu88Qmn7cXMZ4JbK2BZ2nHfXLhPPgxXZFR8HweHBUHt8wCKmJEjO3+uJh
         yVHThLZXsRPLvvHUk2aDo+Joo8JsLjP2LPG5o1qICFKT0prLz4e6/PLZPpJHLyecTUb/
         wlqzuyPqwpOBKKeqwQpIQqaxejc7ef98Mi/unWn7JldRf48FE15GddUrp6WVmraSQB/C
         nGmA==
X-Forwarded-Encrypted: i=1; AJvYcCV5tKACZ41a1yiai3Y+xexGdWK9X62zGn1XO9E0COVhR5E4hjiC+sZ4hTHD4vtnK21IMjF0Yjgr05U5kH8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyISoGyKk1jtdF2TjwTOhrB4xyU/jU9rHW9mYkLKbw9vxuJ5jAX
	gxU408fin2ToSK8uFo57777Lj8loydHJMRzaHA7CmgkKSlVqH7d9Ywsn3IrSN2E=
X-Gm-Gg: ASbGncsROKaxAfLIQtHqcFkcgwSiHUdEgiKqUqlgWEbTiaKKY2oOck18FDzCi7F0QSu
	5IVoJ4dRY+FKcjXFqVWk++Bea8fzYwYyNE3CZ3wVc6e9Wo/rgLF4AXC7VUujS0LtbXM4piXzTXm
	caujt6ph72hTbsZiYBjaZ9JDepx1IzQszy5U1zdfa09YAKZf5/i6W3Z+ETUaVVjZYCue7Zg4SwR
	QMe8fK2JKWdCesYk+Jiq+WuQ/2lvV2CqY32vjRQdkSJnfYCtzV/X1kw29YEFJFEJEZLyw1u/WXG
	pI+07dJm/vxfL22vQgH1dportwI=
X-Google-Smtp-Source: AGHT+IGA+MEO+KKVHOehVcxKdAaP4kVFc+4x/MGW5FidU7ZYZhG+ejtfRbHdQiRj7WdzfqmV0LUjgQ==
X-Received: by 2002:a17:902:d352:b0:215:8847:435c with SMTP id d9443c01a7336-21a83f4b133mr25527805ad.12.1736319679689;
        Tue, 07 Jan 2025 23:01:19 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:01:19 -0800 (PST)
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
Subject: [PATCH v5 08/17] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:24 +0800
Message-Id: <327b4b8990729edd4ce97d9d5acbdaff2d9fa1d1.1736317725.git.zhengqi.arch@bytedance.com>
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

Move pagetable_dtor() to __tlb_remove_table(), so that ptlock and page
table pages can be freed together (regardless of whether RCU is used).
This prevents the use-after-free problem where the ptlock is freed
immediately but the page table pages is freed later via RCU.

Page tables shouldn't have swap cache, so use pagetable_free() instead of
free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm/include/asm/tlb.h | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ef79bf1e8563f..59854c6b97bc5 100644
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
@@ -41,7 +43,9 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
 	struct ptdesc *ptdesc = page_ptdesc(pte);
 
+#ifndef CONFIG_MMU_GATHER_TABLE_FREE
 	pagetable_dtor(ptdesc);
+#endif
 
 #ifndef CONFIG_ARM_LPAE
 	/*
@@ -61,7 +65,6 @@ __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 #ifdef CONFIG_ARM_LPAE
 	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
 
-	pagetable_dtor(ptdesc);
 	tlb_remove_ptdesc(tlb, ptdesc);
 #endif
 }
-- 
2.20.1


