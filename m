Return-Path: <linuxppc-dev+bounces-4438-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6749FAC4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:44:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtR43n3Nz2yyT;
	Mon, 23 Dec 2024 20:44:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::434"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947088;
	cv=none; b=oH5CmXkpBGK9WAaKEFiTATP85aWloYPSUZGHmeDnehiSUOkW2mVg5FbOH0piEwcAzKFVNHGs8UaE7LlRhhFX6BeSMt+9yqcIkR3457/8sqNyo7BAFXRq3HA7OL6Du7WMGUBga76e4g+SJfRVLy7uNLv3058lpv3IEfR9/RX8rx9aQaFUJFH9s9FsLrXBR2jVgWztme0s5yJ1+5q+uBWDANEk+F/isu4jrTl97s3sfZZR3oi4vZ1juouQXE6iRfacnI81Qb28WKqBpEIj9Aq6GdMyPUMm1ewUh6WtS9r3sUDrPNQYZOWiWdj4JTWuOohZMqv4uPmpKNosLAVvgKtXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947088; c=relaxed/relaxed;
	bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q2eSgVCoRALmRcTXi/yn/+mCbg4Dys/O4+4bbltTeByCmonyHdIn8e4iDlNTabxS3Y9YobChoA8duF4cvoMEAFrz72v3aYD5CyQ3TR1YRF/dqcDcAjl4Bsh0o+ZS9IDW4nNAC2Ejdx6IN8uBclQKHGOnLCtSoiFt0Z+CsfeRQhiJvYhfZbefUtYgMIML83fgwuALy3O/m7u6KykgyOeQ0PsDrOeUWlLd80L4a3ChPKYhioAaJMXGrOQureKBDQ87Jlav+ho0vc3c+qq30IOPxq/q8XqsG2NFi788lQKsMmsC3C9z602r7QbtZi3AwdJTQN0yfvk72SsvCWut+1v71Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fVIh3CbE; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=fVIh3CbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtR34DwJz2xbN
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:44:47 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-725abf74334so3354390b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:44:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947085; x=1735551885; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=fVIh3CbEcFG6o3tLpYkEA53s92sOkn8PF0psNcIXPAWV8OnEp3dlIuczrKNp2iX1W+
         hRRfPk4leVdR7oEVANAga9s3bTHd1/sBXVbIboCVXTYviVueAhw5si4LRhAkNXTR0hr7
         S6iJwPVtCqG0dNNa/ocXWJpMbNwp2E9kaZ5mpqJrpoEUvmAyc078WoWKwr43x4yc6kXj
         oPczxE4C22mSzgJCPqAUUzBwjo/oHcq3/bo/nie0MfS0Ob21Ccou1aRoxxW+4Pow5hn2
         WvIDyXtqBB7KG9Ug6+BYhXOFj7e4FIhlizYX/A3feHj4tcugkflE895QXDmicbzyVeci
         PCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947085; x=1735551885;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qA0mhWnXo6upWemI3POPEc6VJyAkyxFJggkOB6WNq2k=;
        b=uhGkp+iAKwhyVqQL2k+fmQmq8OAy6NlpaQ8AqlhNppYZ+wW7zAE1hS04JOeUY6gUYg
         DgnZm9aO/rFh1ebvJ2oUsRE9Nr+vGF12KP7Yj2GUgBxHR4LgeY6FTiQ69Gejx6PYmT0M
         eJupWMCcLj6k7OHdYTe3XoJuaGj59XwYec1xAEvhO5OLAZid5AdQK61bRGYEhmZyVXtb
         yhjeM+OCpVBqm2zb1xUp0FrKe+9LV/2jUBABxzebSXkEjga4cJ3QvCuUFXOmEGorE4kx
         d1DK6m+o7npij/dalm4rTPrbGATa/6mmw+wuksO39iW+l86NC9ODU3+H7g2QGagDq2eu
         3YPw==
X-Forwarded-Encrypted: i=1; AJvYcCVID74l4CcZfJepFZLXzs5b4K6mQlcylGr1ZW3ucwS7KJhkwn1ZG/U0u+XlLz7rvPYMH+T7b9vWbBTyCL0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy3oklVRfYR52GJ4iALtCP6iva8zf7AiGYh4QOpKj5Q7jEmT8R5
	zLr3XRmO9ZynWiOB1fpQkj4GYOumkSInTIZtSO55NzBOqQIKuijKORuVJonUiiU=
X-Gm-Gg: ASbGncvg2uiRbMoAjSl0Ev/Mt05zLeAwyfJjpoNsGR1USQxgDRFMVfeUKVBQ+q4hf+e
	kCAh1A5PLTyeQJCHjJVFcMNCX+VCO4cEl0lBIVZ8UFbVRnpp0L7UX4vm2tfslyBNw8/BpAK2cCu
	ZDGo2pOGO/KsbxIMEwpEkk7KuohsgTkR2SThjCQ/R0TbS348eCUeES9zeRrZO+1+lOQQ1F/Nj00
	bQMXvj8a5jiyEHJwba/LpP90sEHabe86wLrTAZm2Lrm7pf3TRGxygnXenuD1r5cTIhTsemZ6raZ
	Ohq4v52pPacy1xOQyzmOPw==
X-Google-Smtp-Source: AGHT+IEwnxNRxjpY566VNLJW6lRIrSoOOApqv/9DKS3yUbVNE+/391+nOnqyFIwO+T3gR5XgQach6A==
X-Received: by 2002:a05:6a00:330b:b0:728:e382:5f14 with SMTP id d2e1a72fcca58-72abdd7bae3mr14443469b3a.9.1734947085429;
        Mon, 23 Dec 2024 01:44:45 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:44:45 -0800 (PST)
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
Subject: [PATCH v3 08/17] arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:54 +0800
Message-Id: <955162bfbbcd9fbb3b074e1fe2aef4f64b61d6f9.1734945104.git.zhengqi.arch@bytedance.com>
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


