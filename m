Return-Path: <linuxppc-dev+bounces-4447-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3372C9FAC80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:46:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtTJ0kNHz30T9;
	Mon, 23 Dec 2024 20:46:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947204;
	cv=none; b=oYqeDllYXchrP6AyHhGwaPNSbKXDym/yA6OJwXMz8of+Em4d0JDKHFLL4cSwjAYXkDp1Z9OGhDa6ucEAm7HTuvxsErReTos0faEoHvPyZ7muAab+2SXA1KFXImlzD+EriYPdFgPAFRUlZidyfF5IlMIOuHD06qkI9VsbRE9IqZhWCIouk2gAFgExXC8PH39AfFQlig0Sda55xZJAMoXPOFGapp+w0zyEHM5qHxouYZSkz16bLlYWhMMLzzoxrlcQljjmjiDKYC+F3QGNPvmJFyTV4IhxYCg19zhR+6vdG00iH/6dAzxHmZd65hegeEkcVQF0nhyKlbKts4dGoY+pjA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947204; c=relaxed/relaxed;
	bh=/Vy7m3PQdTp9s3cHn2TFUEZi29ZbV6wwwxQw/bfJltk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MgrBD8mCkh2q/nhmROK8A+Fowm+BCIPh0FFxYHG/0T5lHFRgrmJw8Lnm6J7NgipCQv1tofesTeGoARuUyXOFISeNrk/vTY7JPNYrUKcaxx6JOsOxvKSsN/uijcvkMgumTs5GzJl4CNxLtdNVQdFt4MY/XE1mG3kxhHitW9GjojtgpMiCHGqWSZ1LH8mTQX4eLEMidwWFPp21UE3Bb1HxCo3OHxOg675na9UwL63tghi16fDFEuNHSoattOLPbEV8FZVSd9U3+RaeMZoFteJNCir18RQt8vyHCYcwlaysjnMvqrGhBaFZ611SKmNK91ILjJlbxrh8fHlvfzeENPhOcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MwoiqCjp; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=MwoiqCjp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtTH0kDCz30Sy
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:46:42 +1100 (AEDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-725ed193c9eso3397018b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947200; x=1735552000; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Vy7m3PQdTp9s3cHn2TFUEZi29ZbV6wwwxQw/bfJltk=;
        b=MwoiqCjpm3U2VnvUPM8ALFLpMpc4r2n5zUMlcWOAG6LnOlunEw3f1b3JgvxZizbLFe
         rnUa0+8g9NfXGCbXg8fsG6cIwRwF4GtYd5aaOsHjLL6ZQ9Zr+r6YPIVGfktD7buzRIQW
         XrrS4VXTUYM4pAN+NnoodnccRL2ZIfe+lCA8YJGFuBqIuhdnqWJc9NYZVMWL6FDwLE6S
         k6pyzGKv6gOWbfp2koNPvQna70h4TPHAEhbQV4iMaJduPkxrs/uDbB4s7AKP5on/I96n
         uyxRzcirUCvs6Q7vp4HlEl8D/GM1p4LDvqaHTEaOVayiDq0JybLTLbM2GjIKYb6ysICk
         EjOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947200; x=1735552000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Vy7m3PQdTp9s3cHn2TFUEZi29ZbV6wwwxQw/bfJltk=;
        b=E4IVuKhrFGbvFnc9yEUsQx2p5ujGiLFiK5HIy89FKFdMVIlfEHOBhbYbDZaUn/t38F
         OZ0SW6uuhv56SfsVJ9myoxwMTxxoeHnH12VTji9CRIsKfklsfQrIPojMUI8T3F8S+VbB
         UXEIkXQK6rHLxBaaYschAzPO+oot4Tu91gGC7gNO0VdU0n4evVT7xj+PKVUwrg+wDCNM
         ch3NgJdIyXch5lWQma3T7HU4WYpMCnTLhCwVZbt2UT4efuRde57Pb/w7mBncZ3NhK3ck
         qQlUaHdXFIalEAq+sZX+kqClLrfAS2bCv9psXnXsLUuTqcg/eAn5On73GVVLu69cjbmh
         1StQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiIQHn8vBkQAY8V6wP2qKN8B2WSeZpsG2gWGema/Qnn1nlwdul9cPSmA/VoVVoNwP8ZvtjOJb04ehuX6U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzse7q5D23MxBBLcAW61Eg1Ms4TxVb9xpgUo/Ot5MJ+GFUA8mGi
	nX6W2Nc5BZdavbUVutwvqDf7wS0W4aj88UkYKK9aYufpg/6Y8sdmKfjKQ1+8uAw=
X-Gm-Gg: ASbGncvf61xJxB0a3mMtCgHA6PztNUlJSt1aVXDKHlY6csp4c9dMOfvvsTNE4MZCbej
	PNbXEmMo2Xx6aQ4gUpWmeLPFUfTtK1bIGs3xstsCg6e672OLkYKubbcEOLOtalqaD85exUB214n
	iyLxtjio0Dzuv3W5O0lbYXBnzdey+dmEH99nGh63PEo9E0n6o1G7S1AtCJITKDiyud+UDJOKRcm
	y9neel9/9cWSbkbK6LPJUUMpEa/XVJ8lI3YpK4LpwVJtUaLgwWtIaYagBNg9vKcEIY4SvR2yOxz
	1zkCaTGRGt6upYlJhNcRpA==
X-Google-Smtp-Source: AGHT+IHTlP+hesMysY/dnyw4k1T/aSGpJ0FSxzWG+ektln9VxnC2FaHlf9zeRwOgabkwOIXU2HSkPg==
X-Received: by 2002:a05:6a00:2407:b0:729:597:4faa with SMTP id d2e1a72fcca58-72abde9c004mr15027146b3a.16.1734947200520;
        Mon, 23 Dec 2024 01:46:40 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:46:40 -0800 (PST)
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
Subject: [PATCH v3 17/17] mm: pgtable: introduce generic pagetable_dtor_free()
Date: Mon, 23 Dec 2024 17:41:03 +0800
Message-Id: <3ade33c5049f465dc2f0b95edc2d68c80f2048c9.1734945104.git.zhengqi.arch@bytedance.com>
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

The pte_free(), pmd_free(), __pud_free() and __p4d_free() in
asm-generic/pgalloc.h and the generic __tlb_remove_table() are basically
the same, so let's introduce pagetable_dtor_free() to deduplicate them.

In addition, the pagetable_dtor_free() in s390 actually does the same
thing, so let's s390 also calls generic pagetable_dtor_free().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/s390/mm/pgalloc.c        | 18 ++++++------------
 include/asm-generic/pgalloc.h | 23 ++++-------------------
 include/asm-generic/tlb.h     |  5 +----
 include/linux/mm.h            |  8 ++++++++
 4 files changed, 19 insertions(+), 35 deletions(-)

diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 3e002dea6278f..1e0727be48eaf 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -180,32 +180,26 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 	return table;
 }
 
-static void pagetable_dtor_free(struct ptdesc *ptdesc)
-{
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
-}
-
 void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(table);
+	struct page *page = virt_to_page(table);
 
-	pagetable_dtor_free(ptdesc);
+	pagetable_dtor_free(page);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void pte_free_now(struct rcu_head *head)
 {
-	struct ptdesc *ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	struct page *page = container_of(head, struct page, rcu_head);
 
-	pagetable_dtor_free(ptdesc);
+	pagetable_dtor_free(page);
 }
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pgtable);
+	struct page *page = virt_to_page(pgtable);
 
-	call_rcu(&ptdesc->pt_rcu_head, pte_free_now);
+	call_rcu(&page->rcu_head, pte_free_now);
 	/*
 	 * THPs are not allowed for KVM guests. Warn if pgste ever reaches here.
 	 * Turn to the generic pte_free_defer() version once gmap is removed.
diff --git a/include/asm-generic/pgalloc.h b/include/asm-generic/pgalloc.h
index 4afb346eae255..7d327889df306 100644
--- a/include/asm-generic/pgalloc.h
+++ b/include/asm-generic/pgalloc.h
@@ -107,10 +107,7 @@ static inline pgtable_t pte_alloc_one_noprof(struct mm_struct *mm)
  */
 static inline void pte_free(struct mm_struct *mm, struct page *pte_page)
 {
-	struct ptdesc *ptdesc = page_ptdesc(pte_page);
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(pte_page);
 }
 
 
@@ -150,11 +147,7 @@ static inline pmd_t *pmd_alloc_one_noprof(struct mm_struct *mm, unsigned long ad
 #ifndef __HAVE_ARCH_PMD_FREE
 static inline void pmd_free(struct mm_struct *mm, pmd_t *pmd)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
-
-	BUG_ON((unsigned long)pmd & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(virt_to_page(pmd));
 }
 #endif
 
@@ -199,11 +192,7 @@ static inline pud_t *pud_alloc_one_noprof(struct mm_struct *mm, unsigned long ad
 
 static inline void __pud_free(struct mm_struct *mm, pud_t *pud)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
-
-	BUG_ON((unsigned long)pud & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(virt_to_page(pud));
 }
 
 #ifndef __HAVE_ARCH_PUD_FREE
@@ -245,11 +234,7 @@ static inline p4d_t *p4d_alloc_one_noprof(struct mm_struct *mm, unsigned long ad
 
 static inline void __p4d_free(struct mm_struct *mm, p4d_t *p4d)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
-
-	BUG_ON((unsigned long)p4d & (PAGE_SIZE-1));
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(virt_to_page(p4d));
 }
 
 #ifndef __HAVE_ARCH_P4D_FREE
diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index 583e95568f52b..ef25169523602 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -211,10 +211,7 @@ struct mmu_table_batch {
 #ifndef __HAVE_ARCH_TLB_REMOVE_TABLE
 static inline void __tlb_remove_table(void *table)
 {
-	struct ptdesc *ptdesc = page_ptdesc((struct page *)table);
-
-	pagetable_dtor(ptdesc);
-	pagetable_free(ptdesc);
+	pagetable_dtor_free(table);
 }
 #endif
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index cad11fa10c192..cd078d51f47c7 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -3001,6 +3001,14 @@ static inline void pagetable_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
+static inline void pagetable_dtor_free(void *table)
+{
+	struct ptdesc *ptdesc = page_ptdesc((struct page *)table);
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
+}
+
 static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
-- 
2.20.1


