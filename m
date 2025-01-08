Return-Path: <linuxppc-dev+bounces-4816-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A55B8A053E9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 08:02:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSf4d2bzRz2yNn;
	Wed,  8 Jan 2025 18:02:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319761;
	cv=none; b=jC4HvyHs03W2zUFJIgckxOsrryflxsBXYoZA3Ycxpu1DAdmIFLUFijo132QAARlQXF4VrR/C5DZePb1Pyjkuqy1LZQdFfYV1m8xIfLeV49XX0Esp/fjvEyU1EorytLJ54foBvjE8VNwCE6AfIDeHe2fig1yYA9Xe3QWv1GN+KBiRsxWL3XqlRtIN1re78B5dLl/XtHkJJdeNViS19MpeeC+kBM3DfRQ21VV8jaGLV+6vsIad4RwU5iifP2BppdMucMUDa2G5SxiY/9OWkdrmNwbEa8vHMUriMU0gwePAdBkzzMqBWomsMeUuY9z8e7c1+ft6OrlW86cILmzWYwIOKg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319761; c=relaxed/relaxed;
	bh=oFL9SGbXxYqRlw6G0JwTVWRijc5/6EOrJfB/UywRwlQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iDd0jzrfl5FISr0ccOhj+pBnDlpRQvz3NU2nshSor2rBMEqT03bAuYOLz8rBhn0LFyJ91i+YV0qmqSDK0s8a1UHxpZY34ikWPux3Id/lqPYUjo88Z2h54L7pEcSYTGf11FsJAiySUGzOXLGG3UyP10xXvsVhJ0LlXrnRb97rPuLmcd3r4w4alr+wLNMhvc3OmxDBCM6QERLzNqlqNN0IGKSX9kb+p4t+WCTqnNnQ0kYzT7xoorI86jiJAD5d88jpLkdYkGZEsj+uQGW2Ga8G24pTgvNqbsWnzlreqF//djngEVEM37o06eXx+ISkmNXlaOrNelQrLRtjmB9BEVx7xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SJc+6bux; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=SJc+6bux;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSf4c2MQzz2yK7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 18:02:40 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-21644aca3a0so69234755ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 23:02:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319757; x=1736924557; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oFL9SGbXxYqRlw6G0JwTVWRijc5/6EOrJfB/UywRwlQ=;
        b=SJc+6buxNITequMrplpEaZrgPUZOc8xZj1T4SHJlw9+F7/hKwUT792gQ2s/+Yqd4mt
         mD38bNzyo29gUUG0f5LzQMH9LcQlIeX99os6KHeZLIP1Q0xDQfs4Enn/GdOwwKnMBM0u
         C3Jw2vz4xotCdoujgY6NN1QiUgwdwnfmWuxIs85YvHwut51bosl94bO9kItJRsVUIlB8
         FS8rE4jbhMr2s4Qnfqhel5PpSyHBWT7LSqNraoYLlJLNFGb8jAsGuZRN1JIGUAgWi6tO
         7oGYWe77tLgA2atw4lddfwOOpYaNS3U71eeuOkAjnGBhuZOq+/H5FyiIcFkfZVHCEwvY
         lpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319757; x=1736924557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFL9SGbXxYqRlw6G0JwTVWRijc5/6EOrJfB/UywRwlQ=;
        b=nGj1z8YrwGz0iF4ZYA32so6KUk5ujaG6eXpzStqRoObi1qimRmebXFWx3lZEcutYpp
         0fKAWD9zGoXPobPfV7UmU3K3+gz/LZ4sA2NepZ+u2oTboeWHvgEJvU7lEJoUenWDTcQj
         U+xWCvN3vNTcIrjhE5OseBqAZ6Dt7dUdxnEaqsB3bfszDpJmZ1/JojLFe/Z6qVxiAG6g
         XeasOzGnh4drIOGOkUjPVZWnhjyQ/SJaMeDzphrVA8ur76acipvhPRCae7pNX/z+dm7M
         vb9gZ69oRtluaZCUE3qN1uH4HexcrXzuI5d5wsuKuIQTJvDxudo+jvHgMgIUOQndajVh
         vxvA==
X-Forwarded-Encrypted: i=1; AJvYcCVPJzKS3etVS5reeRch2cvKQ1hich9iTefk0UMUM+BqjBPIDXf4hJ4GvmjQyQyoV1MYA1US9sgl+PcwfLU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzwnCp/fKa2J4/RTgTcefV7lihubqIBZAFjDJfWlaz0O3NFtwG7
	UFXjf/Hbvb4/CxqvgDgDVwh3BGWzpHRGHq4CseZv9amuTqapFhDNJA8D1+JEdq4=
X-Gm-Gg: ASbGncvO962vq7vGHkZjrlqRSIqYx6+ImWj2P+g14EQGjn/uQABNQ832CKByK+6B1jV
	/64MSpgVtoSr+UAilfx/xILycr0xwOvbwnIy5VPbcjIMzUF+uA8PXCVHn1jgwbKVlPIpPBTggUU
	EqgoEobY/oCjdft6xAdXpaibW88T0IV2EFs5EnxTRy1585K1xFuY3FpRK3sQgadnzN+d3j4C33T
	NppSXACJa3Ii1NEMGLEQLS/QZF4lQquaK+3qOpr5fRf+50lCNxMsfz6zKhi6tsGDuUabiTnYSRY
	PToLlfpwskFQZxSHBicyJmbskMg=
X-Google-Smtp-Source: AGHT+IFBkkoQabtOk36FtfqYc8ZUQnhLYoik+Qreb3ophWoDY5tLIXttH+D63mfzQSCD0xoXOJPU5A==
X-Received: by 2002:a17:902:dac8:b0:215:773a:c168 with SMTP id d9443c01a7336-21a83f48cf9mr30903435ad.1.1736319757144;
        Tue, 07 Jan 2025 23:02:37 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:02:36 -0800 (PST)
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
Subject: [PATCH v5 13/17] s390: pgtable: consolidate PxD and PTE TLB free paths
Date: Wed,  8 Jan 2025 14:57:29 +0800
Message-Id: <ac69360a5f3350ebb2f63cd14b7b45316a130ee4.1736317725.git.zhengqi.arch@bytedance.com>
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

Call pagetable_dtor() for PMD|PUD|P4D tables just before ptdesc is
freed - same as it is done for PTE tables. That allows consolidating
TLB free paths for all table types.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/tlb.h |  3 ---
 arch/s390/mm/pgalloc.c      | 14 ++++----------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index dde847a5be545..d5b27a2445c96 100644
--- a/arch/s390/include/asm/tlb.h
+++ b/arch/s390/include/asm/tlb.h
@@ -102,7 +102,6 @@ static inline void pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd,
 {
 	if (mm_pmd_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(pmd));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
@@ -122,7 +121,6 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 {
 	if (mm_p4d_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(p4d));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
@@ -141,7 +139,6 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 {
 	if (mm_pud_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(pud));
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
index 569de24d33761..c73b89811a264 100644
--- a/arch/s390/mm/pgalloc.c
+++ b/arch/s390/mm/pgalloc.c
@@ -180,7 +180,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
 	return table;
 }
 
-static void pagetable_pte_dtor_free(struct ptdesc *ptdesc)
+static void pagetable_dtor_free(struct ptdesc *ptdesc)
 {
 	pagetable_dtor(ptdesc);
 	pagetable_free(ptdesc);
@@ -190,20 +190,14 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
 
-	pagetable_pte_dtor_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 void __tlb_remove_table(void *table)
 {
 	struct ptdesc *ptdesc = virt_to_ptdesc(table);
-	struct page *page = ptdesc_page(ptdesc);
 
-	if (compound_order(page) == CRST_ALLOC_ORDER) {
-		/* pmd, pud, or p4d */
-		pagetable_free(ptdesc);
-		return;
-	}
-	pagetable_pte_dtor_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
@@ -211,7 +205,7 @@ static void pte_free_now(struct rcu_head *head)
 {
 	struct ptdesc *ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
 
-	pagetable_pte_dtor_free(ptdesc);
+	pagetable_dtor_free(ptdesc);
 }
 
 void pte_free_defer(struct mm_struct *mm, pgtable_t pgtable)
-- 
2.20.1


