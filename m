Return-Path: <linuxppc-dev+bounces-4446-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A3A9FAC7D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:46:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtT22xkSz30Q3;
	Mon, 23 Dec 2024 20:46:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::431"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947190;
	cv=none; b=cpgLwr+0duoOPDL0pZp0HzWKdYOCnmIXGbHVzxnh0De+chR1tOqM4C6eKxN35+l/DFUcdMCzK+5Em5Dq9+4b/0kymrw7sDK2uoP5SjhClBChOVcSn/+17LBQmWwQkAhACXTvvhFdOpkNWoVaYv4bSqKPgP3qppgTpYRhEQUuDfZv8qlXZIhGFr7b+U/kWIuXUjVgwWoEUbBAQAM6nAM0jwm6tj9hsjeA974AwXckNMQ0IffQAkTLlZ7xKyGkPQwwsUn03575hbC3+I1gse9YhOFT1lDW1pC3fzkzD7Vm6WChYEHoyUxkOKT7LLDiZnCnRh1JzCthh3MJ4Tfz7lWRUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947190; c=relaxed/relaxed;
	bh=6vzAxma0H0oGKVF+0yjfVv8ni44DJQgUTcLWSpNFGuY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D0gi2L/uqVf6PG9s4Zm01LkwAdPrUGz6C1cnsrRF2kPKsGva2dQyLK0TPImMCBweHikHjE/9EMABbDbMFhb0/weyjHrUG6B6vqiGSDp40f4SCpDzsPOjp10V6dIlRKlM47ztiayVZrvCJ+IOZE/+Crjjf/XhtMnTDQV4QQ+U+zPBjsWzTagLW/PpAYRxedS1C/QBzUa1nxmy3yUkqWWk5QNOAW5FdPc6XLorOctwmcuxZWqmZb7Zeb4WcF9oOtT8pWIILWZRLWO/y7/RkiOHfo/Lb/sEcPrBhNwCSNGGoazFJE97/Mb05WunIlJmIuqsRuTv8fFfscCaklkt9B1wlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Pi6h2qZZ; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Pi6h2qZZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtT13yNjz30Pp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:46:29 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-725f3594965so3283144b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947188; x=1735551988; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6vzAxma0H0oGKVF+0yjfVv8ni44DJQgUTcLWSpNFGuY=;
        b=Pi6h2qZZQnp0Didur40yB4ckJmCG04Yq0fGWavVSSZAx96nVKxgK7AU335GUGkAmx7
         fMqDa1Jj8vdRSfHQa35dCiz4oVa1NQeHTQlg1wKtmy5m2g+QfirZkG3kR7AzDxIwGHsM
         2zohh3qEWRNEeKit0/5sYNlKupKw8AlqRVLvwLiRB0IURm5xfkl1YNstkNhJk5uZHuq8
         itPMao86y3IOvWwe7s//+uNVb2FbBhRBlA6bDpE5YYRzBQ3UbIvQMEE2t3f2EQNOfT1n
         mQicai5rVeMDVOno1Tx3s68Ga9x5rtKyySlbsU0U8hf7yY9gR7Z39fEay2g8J3QBInIT
         +T1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947188; x=1735551988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6vzAxma0H0oGKVF+0yjfVv8ni44DJQgUTcLWSpNFGuY=;
        b=gCWMa1LOHKNh2MhEqYG5fYLaQ0OoQvbOJhU/ESdskv1hZ1Dq+L/nEhG8zvoH4q6Soq
         d6FptWBWxwM7FcCHv2lcCn234IOXSQXsOynwEM1zxkEx6z5k006O6eh74lbPHBo/izBJ
         iwmw76Wagcu6zq9er/u5V2ch+jhEurbrQ7vxp1XuNoDpV1R5DdFHDwBFLbeE4iSGMABX
         fSrdHeg9FGKewdCKk4jox9ZAUMjJU32p90K6pdIFM46T8rQ+SLyUJTa2xgxNL8ijRtDe
         p8yXvux8oPEIRo/dGiyUObXumF9r6juhvrr/AoeKVFUZALzfn8cRgVWGD3Zl3l3S3ls1
         JAAg==
X-Forwarded-Encrypted: i=1; AJvYcCU2lpbVmtQw8ah2w07Mf14rJhfk5pMkF+zR46/3Dy0qkF3wKFLjYkby5DCjgvViokkq9wZT0UbAwHlp8Bg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzZe6KCvnREg11RFgKVpYktxy327w3PEi1tiu+cyxiBfpZaCTyI
	XIL+laeU07IzRdo3424SIEtfda+i8FZpvy5IDu/DDkjhKqg6phUdp2gdjnavm1Q=
X-Gm-Gg: ASbGnctlWeKQQoCb42EEAMRmd0taqQFCh+uxX/u32lWDd7AJTdFE7aFiEh+ILvGxHnO
	xXFdl2ocpd1QUtmdzaBpCH+XSYDU1v73mLzKEXhwFmMNzsHnZKNZFgt/rgybzlrkLvGH1TdqdXd
	7x8e5gpgpdiFcoWQonHtg1XPVhdgFGwdxqbMmGQa1xSDm5afCHNGIYocS9PMmYH+8MmWSowinzO
	kBGsLboIwNLFucW4216zAX1k9juA/8R2ZlDIj8vb9hI5lEdybu78cG5S1zaAmTgbvLPJJjnr25x
	gxN2aOpHeh7peZ4389ZrTg==
X-Google-Smtp-Source: AGHT+IGqxRLXXsgzbTBUt4P8wMbb/CAKHFN0NH0iCzAzNT/ELUdunTp3cz3Ieuj7L8l/gUjxiL3RMw==
X-Received: by 2002:aa7:888c:0:b0:72a:a9b5:ed91 with SMTP id d2e1a72fcca58-72abde0e6b7mr17804649b3a.13.1734947187839;
        Mon, 23 Dec 2024 01:46:27 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.46.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:46:27 -0800 (PST)
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
Subject: [PATCH v3 16/17] mm: pgtable: remove tlb_remove_ptdesc()
Date: Mon, 23 Dec 2024 17:41:02 +0800
Message-Id: <93cce93bf8be04f3a5cd828cc0a48750fb90af44.1734945104.git.zhengqi.arch@bytedance.com>
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

Just like removing tlb_remove_page_ptdesc(), remove tlb_remove_ptdesc() as
well, and make callers call tlb_remove_table() directly.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Originally-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/arm/include/asm/tlb.h       |  8 ++------
 arch/arm64/include/asm/tlb.h     | 16 ++++------------
 arch/riscv/include/asm/pgalloc.h | 14 +++++++-------
 arch/s390/include/asm/tlb.h      |  8 ++++----
 include/asm-generic/tlb.h        |  7 +------
 mm/mmu_gather.c                  | 11 +++++------
 6 files changed, 23 insertions(+), 41 deletions(-)

diff --git a/arch/arm/include/asm/tlb.h b/arch/arm/include/asm/tlb.h
index ea4fbe7b17f6f..ac3881ec342f1 100644
--- a/arch/arm/include/asm/tlb.h
+++ b/arch/arm/include/asm/tlb.h
@@ -32,8 +32,6 @@
 static inline void
 __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte);
-
 #ifndef CONFIG_ARM_LPAE
 	/*
 	 * With the classic ARM MMU, a pte page has two corresponding pmd
@@ -43,16 +41,14 @@ __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte, unsigned long addr)
 	__tlb_adjust_range(tlb, addr - PAGE_SIZE, 2 * PAGE_SIZE);
 #endif
 
-	tlb_remove_ptdesc(tlb, ptdesc);
+	tlb_remove_table(tlb, pte);
 }
 
 static inline void
 __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp, unsigned long addr)
 {
 #ifdef CONFIG_ARM_LPAE
-	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
-
-	tlb_remove_ptdesc(tlb, ptdesc);
+	tlb_remove_table(tlb, virt_to_page(pmdp));
 #endif
 }
 
diff --git a/arch/arm64/include/asm/tlb.h b/arch/arm64/include/asm/tlb.h
index 8d762607285cc..4a60569fed696 100644
--- a/arch/arm64/include/asm/tlb.h
+++ b/arch/arm64/include/asm/tlb.h
@@ -75,18 +75,14 @@ static inline void tlb_flush(struct mmu_gather *tlb)
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte);
-
-	tlb_remove_ptdesc(tlb, ptdesc);
+	tlb_remove_table(tlb, pte);
 }
 
 #if CONFIG_PGTABLE_LEVELS > 2
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pmdp);
-
-	tlb_remove_ptdesc(tlb, ptdesc);
+	tlb_remove_table(tlb, virt_to_page(pmdp));
 }
 #endif
 
@@ -94,12 +90,10 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmdp,
 static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pudp);
-
 	if (!pgtable_l4_enabled())
 		return;
 
-	tlb_remove_ptdesc(tlb, ptdesc);
+	tlb_remove_table(tlb, virt_to_page(pudp));
 }
 #endif
 
@@ -107,12 +101,10 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pudp,
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4dp,
 				  unsigned long addr)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(p4dp);
-
 	if (!pgtable_l5_enabled())
 		return;
 
-	tlb_remove_ptdesc(tlb, ptdesc);
+	tlb_remove_table(tlb, virt_to_page(p4dp));
 }
 #endif
 
diff --git a/arch/riscv/include/asm/pgalloc.h b/arch/riscv/include/asm/pgalloc.h
index ab4f9b2cf9e11..25c2e2f262810 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -26,10 +26,10 @@
 static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
 {
 	if (riscv_use_sbi_for_rfence()) {
-		tlb_remove_ptdesc(tlb, pt);
+		tlb_remove_table(tlb, pt);
 	} else {
-		pagetable_dtor(pt);
-		tlb_remove_page(tlb, ptdesc_page((struct ptdesc *)pt));
+		pagetable_dtor(page_ptdesc((struct page *)pt));
+		tlb_remove_page(tlb, pt);
 	}
 }
 
@@ -108,14 +108,14 @@ static inline void __pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 				  unsigned long addr)
 {
 	if (pgtable_l4_enabled)
-		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
+		riscv_tlb_remove_ptdesc(tlb, virt_to_page(pud));
 }
 
 static inline void __p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 				  unsigned long addr)
 {
 	if (pgtable_l5_enabled)
-		riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
+		riscv_tlb_remove_ptdesc(tlb, virt_to_page(p4d));
 }
 #endif /* __PAGETABLE_PMD_FOLDED */
 
@@ -144,7 +144,7 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)
 static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 				  unsigned long addr)
 {
-	riscv_tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
+	riscv_tlb_remove_ptdesc(tlb, virt_to_page(pmd));
 }
 
 #endif /* __PAGETABLE_PMD_FOLDED */
@@ -152,7 +152,7 @@ static inline void __pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 static inline void __pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 				  unsigned long addr)
 {
-	riscv_tlb_remove_ptdesc(tlb, page_ptdesc(pte));
+	riscv_tlb_remove_ptdesc(tlb, pte);
 }
 #endif /* CONFIG_MMU */
 
diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index da4a7d175f69c..5eed6300f3d72 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -86,7 +86,7 @@ static inline void pte_free_tlb(struct mmu_gather *tlb, pgtable_t pte,
 	tlb->cleared_pmds = 1;
 	if (mm_alloc_pgste(tlb->mm))
 		gmap_unlink(tlb->mm, (unsigned long *)pte, address);
-	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pte));
+	tlb_remove_table(tlb, virt_to_page(pte));
 }
 
 /*
@@ -105,7 +105,7 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_puds = 1;
-	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pmd));
+	tlb_remove_table(tlb, virt_to_page(pmd));
 }
 
 /*
@@ -123,7 +123,7 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
-	tlb_remove_ptdesc(tlb, virt_to_ptdesc(pud));
+	tlb_remove_table(tlb, virt_to_page(pud));
 }
 
 /*
@@ -141,7 +141,7 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
-	tlb_remove_ptdesc(tlb, virt_to_ptdesc(p4d));
+	tlb_remove_table(tlb, virt_to_page(p4d));
 }
 
 #endif /* _S390_TLB_H */
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 8d6cfe5058543..583e95568f52b 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -211,7 +211,7 @@ struct mmu_table_batch {
 #ifndef __HAVE_ARCH_TLB_REMOVE_TABLE
 static inline void __tlb_remove_table(void *table)
 {
-	struct ptdesc *ptdesc = (struct ptdesc *)table;
+	struct ptdesc *ptdesc = page_ptdesc((struct page *)table);
 
 	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
@@ -499,11 +499,6 @@ static inline void tlb_remove_page(struct mmu_gather *tlb, struct page *page)
 	return tlb_remove_page_size(tlb, page, PAGE_SIZE);
 }
 
-static inline void tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
-{
-	tlb_remove_table(tlb, pt);
-}
-
 static inline void tlb_change_page_size(struct mmu_gather *tlb,
 						     unsigned int page_size)
 {
diff --git a/mm/mmu_gather.c b/mm/mmu_gather.c
index 7aa6f18c500b2..c58ce4539c56f 100644
--- a/mm/mmu_gather.c
+++ b/mm/mmu_gather.c
@@ -314,18 +314,17 @@ static inline void tlb_table_invalidate(struct mmu_gather *tlb)
 #ifdef CONFIG_PT_RECLAIM
 static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
 {
-	struct ptdesc *ptdesc;
+	struct page *page;
 
-	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
-	__tlb_remove_table(ptdesc);
+	page = container_of(head, struct page, rcu_head);
+	__tlb_remove_table(page);
 }
 
 static inline void __tlb_remove_table_one(void *table)
 {
-	struct ptdesc *ptdesc;
+	struct page *page = (struct page *)table;
 
-	ptdesc = table;
-	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
+	call_rcu(&page->rcu_head, __tlb_remove_table_one_rcu);
 }
 #else
 static inline void __tlb_remove_table_one(void *table)
-- 
2.20.1


