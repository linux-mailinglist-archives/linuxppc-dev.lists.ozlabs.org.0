Return-Path: <linuxppc-dev+bounces-4813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E279DA053D2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 08:01:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSf3k4wMBz30TZ;
	Wed,  8 Jan 2025 18:01:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1033"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319714;
	cv=none; b=lkUrV+gp4bfy78YCyd2mFmmmUh4Cl2zpnoXrnYgFcuvgWR+Or1vo/baqj/uxL/g94IPtcfs4C43n/PfsE4ofva0oRgJqkX9IoRdk2hQ32vktXjqsDM0U3jbRTSYNTU+iVutmQAB9krXgIRpGqdQJlJNlNM2dq1EZI8ZA6yn9tXfJ6LpISExd4bQ3vlpU3g26rbKoUcvqrk8aBBX2MFZiyG4iaBHt2e0XFLPvHimOWc0OL9ypJj5KP6I7kM8MWCkE/ddW+QTkd87s+fo2anyBHY+LLoGwddqtipy5opadGjyKSetD1a78dTKkULv6Z5WDu2efY3e6hZt2/wsSVCH88A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319714; c=relaxed/relaxed;
	bh=xJFt+T0ZGRLwl7qj4QUye9dvBL3lzNJEqvkgjrbvemg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jluW3Xmutkx9s0gtRojnR8TEhrhK0uzuH5e3+iTljk7a8Xo+Ggf23dXb6kQFZk1xLm9gqZXgIxk/Sv0ZH4A4O8dBq8QbIT3e63tmUZVSTWc8pv55v0F8jNlyL4M9e+fA+C14mmQmppqU45jb/mYEN2H57b3FLFEB+SF+0QYxCXI1wzAxp6Uje2feWpmLVi/g9RyFFYwJy1JuL06/UEGvso6f7VjNzSLQWsdlM4S1vg6jOWxDX+wIPdlOT0h4m0jxKzIx5cDkusMaIUgwGdlzGAf7S+22lJYTD1lb31my5e7SGA76aDY3g+GYIn2tzKVOyzf8o3S2EkkxI2CMN6kbRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=b41ribx3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=b41ribx3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSf3j5FdXz30TY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 18:01:53 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2ee9a780de4so17922296a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 23:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319711; x=1736924511; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xJFt+T0ZGRLwl7qj4QUye9dvBL3lzNJEqvkgjrbvemg=;
        b=b41ribx38GtCgqNpXIJ2TG1ESzjyUash9OZvq71fqlc89s52T8mnfBUpfhmTfXaqnH
         fdWQECwMaSgmMr7DYQv1gx7RRQS7wyOFFR0fhuHrZ8mQTBqeNrghOlGKW+VbElSZYUZJ
         E7zJvh1ewQ73U/WNFcVPEm42zoXTv++gLHEJkGcxTYBsLQVykHDgb6WA/1fXZ+BcN90+
         /cq/yP6Z4HNQEFwg7cDcqA+O8MLBYVuG4Ei8JiDY3DepXDqJFxno2zIb4A6gByE5B3ey
         y5zMXFUpZxrTLOuLVPtTXZ9LqIEkNRHPgveSANvX/+54I7ImpviD3yugGOEPBnUREhqN
         8l/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319711; x=1736924511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJFt+T0ZGRLwl7qj4QUye9dvBL3lzNJEqvkgjrbvemg=;
        b=xLp/Px+rHD+pb1t/KeiNys13VVrNQWHPEsqY/MGcfRdN6y6QqP4zj3BPsKnaah4C6c
         X+Rl4RIK51gl5ts9pQIpbR9qSbVso6kCMvXP+wa0hDyTCBdEVCC5HjH2FiOlbN6bPtH3
         CSyH7MRaBBWXvVi9o3UvoznxAT68+TWDR/GJ6gdRkrrsJXL/X6Yaa1+Sqe6nEePVc1tN
         O6RKUzo0msJqQpbD7EN3RTkmhONib/cdjbyFvRD9l9rcQ1fq6gxqZIGRqWbDZriv5mj+
         yTyhmXmrh3JUI2cxs2bNS02zRjm9bbySgPmNswE5d0rYvUGP9XT+zz8VUvWMNiKtvXdj
         dgeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUrhZgGQIFRlyPoWDLF9Y406hi15IxIAWPyaA1sgzH7fNvof0Bgs8R40yhW+GKxQrfPrdGMjXCacbRGabk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzMPa9EMhtnWPUz6iwiRAtlLcARuxuiyfXKU5rUX8WWn0aSQzhX
	UcA1XBU2KJbx8bxKnEDIEYkhLDR71s6m3ts2ijEmAbct0zChucUF1docvJP3CjA=
X-Gm-Gg: ASbGnctHr8eXSjtmGEWLHB5rHAVtuJo7NDst0cITqd7vzNSMt/2SZn3EfjE07ELe+6S
	QqbOwb0T4LNTtWhCySy18JLUnZUdGBusOV/2kCZFpkmRvgDMAXnVrqCoOa+qoqsuVmV2m90Z3Tw
	Kulo/LEwK4zgl0ofzSaLIOkyzkfapudw5Q4Tam0V4TdSG7WulELC9dRb8tkw9lTo67x2QqjlIkh
	pSKpphn9CYMV9DAVLmbiZZHK2m6cLkPAFzhxlsfb+xeQDCnos7zMx/3Br255MALLFtKVGEZf+WZ
	oBkZFYGuDkifdLgoakvE883ZV70=
X-Google-Smtp-Source: AGHT+IHbJSdEFlMcYFI5dK7LOGyjdYP9+xvlrgbj38Eli2e60ze0npY5GY+Stk/tuNQHFcVXscZRAQ==
X-Received: by 2002:a17:90b:2dc2:b0:2ee:863e:9ffc with SMTP id 98e67ed59e1d1-2f548ee5378mr2382141a91.21.1736319711135;
        Tue, 07 Jan 2025 23:01:51 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:01:50 -0800 (PST)
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
Subject: [PATCH v5 10/17] riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Wed,  8 Jan 2025 14:57:26 +0800
Message-Id: <b89d77c965507b1b102cbabe988e69365cb288b6.1736317725.git.zhengqi.arch@bytedance.com>
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

By the way, move the comment above __tlb_remove_table() to
riscv_tlb_remove_ptdesc(), it will be more appropriate.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/include/asm/pgalloc.h | 38 ++++++++++++++------------------
 arch/riscv/include/asm/tlb.h     | 14 ++++--------
 2 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index b6793c5c99296..c8907b8317115 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -15,12 +15,22 @@
 #define __HAVE_ARCH_PUD_FREE
 #include <asm-generic/pgalloc.h>
 
+/*
+ * While riscv platforms with riscv_ipi_for_rfence as true require an IPI to
+ * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as false use
+ * SBI to perform TLB shootdown. To keep software pagetable walkers safe in this
+ * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
+ * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
+ * for more details.
+ */
 static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
 {
-	if (riscv_use_sbi_for_rfence())
+	if (riscv_use_sbi_for_rfence()) {
 		tlb_remove_ptdesc(tlb, pt);
-	else
+	} else {
+		pagetable_dtor(pt);
 		tlb_remove_page_ptdesc(tlb, pt);
+	}
 }
 
 static inline void pmd_populate_kernel(struct mm_struct *mm,
@@ -97,23 +107,15 @@ static inline void pud_free(struct mm_struct *mm, pud_t *pud)
 static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 				  unsigned long addr)
 {
-	if (pgtable_l4_enabled) {
-		struct ptdesc *ptdesc = virt_to_ptdesc(pud);
-
-		pagetable_dtor(ptdesc);
-		riscv_tlb_remove_ptdesc(tlb, ptdesc);
-	}
+	if (pgtable_l4_enabled)
+		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
 }
 
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
-	if (pgtable_l5_enabled) {
-		struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
-
-		pagetable_dtor(ptdesc);
+	if (pgtable_l5_enabled)
 		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
-	}
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
@@ -142,10 +144,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
-
-	pagetable_dtor(ptdesc);
-	riscv_tlb_remove_ptdesc(tlb, ptdesc);
+	riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
 }
 
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -153,10 +152,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte);
-
-	pagetable_dtor(ptdesc);
-	riscv_tlb_remove_ptdesc(tlb, ptdesc);
+	riscv_tlb_remove_ptdesc(tlb, page_ptdesc(pte));
 }
 #endif /* CONFIG_MMU */
 
diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index 1f6c38420d8e0..ded8724b3c4f7 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -11,19 +11,13 @@ struct mmu_gather;
 static void tlb_flush(struct mmu_gather *tlb);
 
 #ifdef CONFIG_MMU
-#include <linux/swap.h>
 
-/*
- * While riscv platforms with riscv_ipi_for_rfence as true require an IPI to
- * perform TLB shootdown, some platforms with riscv_ipi_for_rfence as false use
- * SBI to perform TLB shootdown. To keep software pagetable walkers safe in this
- * case we switch to RCU based table free (MMU_GATHER_RCU_TABLE_FREE). See the
- * comment below 'ifdef CONFIG_MMU_GATHER_RCU_TABLE_FREE' in include/asm-generic/tlb.h
- * for more details.
- */
 static inline void __tlb_remove_table(void *table)
 {
-	free_page_and_swap_cache(table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #endif /* CONFIG_MMU */
-- 
2.20.1


