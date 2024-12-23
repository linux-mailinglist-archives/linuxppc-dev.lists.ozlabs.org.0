Return-Path: <linuxppc-dev+bounces-4442-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 411E79FAC66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 10:45:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YGtS41BLBz2yys;
	Mon, 23 Dec 2024 20:45:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734947140;
	cv=none; b=DO68j6zMR418++MBFk7f6LzM4QepLodvr1ClmKljMabRH5cZsumczzi5ObfowTERC6SE3QDXZrBIPq4DL46s/sNsqTABJrwqrdjzW9Cc8CzElmwt3gYSHJ4bxvRZLIOpCkYknQ8KmQiH0rIhCPHasRY79/0QeAVUi5QmtwE3fzaP062Qozk9eoZKCYgyJp1Diw2x2M+w4nNSvYnmRAEh+2RXHNQDfnK3troTPEZHrxnLjK4IjcIFu08oWTP3RVJULx+VB2GT+yeW+SGJXn1Q9byMJBIsuH8JtNGb2dfmZ4YSOfiKfrf85W7ZhvCZj+ePgyQnIEnVG2NwqPvLCbAjmw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734947140; c=relaxed/relaxed;
	bh=jyEzElX2/Cl2Hb0vACePBo9dDp7jwROhL3d0Mq9f7ig=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WAsHc1pXCDwFautNudu8rEwMosq2kohLQ06u02hl4myTfnxzfHJ9N2eUPfaFI1+CmJnsXwoqOJL4ZAEVKxTxwroV46sf5VmmT2KXeUsHF1DCLOnoLmBLY6GI3YCZOlX9S9zJ7I3M3+bKgWaOn9D6ADY809q6/6U99ibN2gO8mEKUUshm4zycN9NpZwgzL5JtKbZrvvOdHcYa716i2GcAaQusjeZCWsngkmgJVCi8t7SQK357/aQBMhSXvLw8eDNhqyh+KxHtOyuA+/5ydC9vpR/TVG1qIVU4WwrK04MC0rEOVxxxSIa7zWpF0icHtc4zBU3a0GtHzL1uT14Z/C6ZPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Qor1fx8f; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Qor1fx8f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YGtS31Y9Kz305c
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 20:45:39 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-7273967f2f0so4675114b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Dec 2024 01:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1734947136; x=1735551936; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyEzElX2/Cl2Hb0vACePBo9dDp7jwROhL3d0Mq9f7ig=;
        b=Qor1fx8ftgq48QiqyIIM2aPSxaK99HLU4N2oL1c3UiX7wk3rWKBxq5RNJveQ3iL5N1
         DpyjQKIYBaPhpdTEUclEITB2wBVmZdL+dVvS4LEHjCrxBzeqjW2rc+3KM/keIfOKnS73
         4zEM1J6FGWL+ZFaxZf20cuR0gnWY3pXxLXpB9g6NuzeBc16in5O1+UXGWoIYEwhYvys8
         hm0BUu4t+ZNYRnN+Xvd5khgB3dsTkWitLokJ6TCcOrC2PFtag6oGd9yvn9A3pvLGZWl1
         uSOD5yi9V/26ZzHH0ZV5SSi7iq8qvxuq+BTFT31n3eKzSf8zaBbaqZ1Xe11jqFUpIMkZ
         J45w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734947136; x=1735551936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyEzElX2/Cl2Hb0vACePBo9dDp7jwROhL3d0Mq9f7ig=;
        b=ETqRwiCNMyhQN57ndiFJgf9OYLYcXS+hwKEBJCFtpUKzfGVc3JInbLV0XtQeFQpkFR
         jgGOI6jmIp8B35OzH0jeCgnlpgVXP1KdjmtiJGcunGTNOk87ULfJhqjiQj5eRb9+Kujr
         0r+GIRM5c4bXdZXLI1KFXiqTqtXg/kO4pQ6CxaKdH3QfOQxfzU0zo31Rn5o4ZEUKtORE
         liRRcHGHLHxDY3Dlg8wyW82qA0eZ0l/bUqaBth+nFu/twuqutgRh1yYOAUx/EcHPRRO+
         tZbJRoqLTJmFkwt3FXzKrI5fX/giEhlp4kpwDVyTbkhDU8EwdMZyXH00CP0BMRIakpW9
         aDDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5LzGRY6Ga9cziLlCpw6eHu9kISB5ZlHV0SxzGRY2VPdQGrf89hr5b1s1qot4CV5E8JV8e2uirkVX2IdY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwO2L7JKmrFJjeOX2ZC5Vb7lqR4KDw6BXRvXYbt04w4qen0gdOk
	6HmKokRXisiSaAmXrSQ1M1cfasHwzjWLV2e2003gZHq7HmrSR2zsDCBo4AFNbb7GrRxL4JLzJ2d
	R
X-Gm-Gg: ASbGncv4pwx9/Yx+MzUyvMvf3MCZgczqchvdYUJ7JzG9VSagIMgoeMnRMCNBbnR63hT
	ry8VaDTDMYSW6o13CkRZS1r5OLbOpIX2GiZj+rQUYEZwdltPcTXKPsd7OiTLMhPRmbRKxHyy691
	rCb3bGsiIgrP/vIt0UsXNMP4Hqfy8K9xsjF+kcnc4/VsxNzxKpIrqMQ0nPwgotRWNlKWMpOi5JN
	3AMHaO+ci9YhqYKcShVIMRpgrsy4zXfm/epHkLeLTeAsiCy+8wVKdJ2y3K6feEq80JO6RBU7u8r
	3265kze9yTW8I2Ri0vL02w==
X-Google-Smtp-Source: AGHT+IFFxsa0Y8D8QMIcsR8+VA1yaCfovsoDpuS31clip0UDjebZ+1TP8q/TeJDt5eTrdc0wzKH4iQ==
X-Received: by 2002:a05:6a00:399a:b0:725:b7dd:e668 with SMTP id d2e1a72fcca58-72abdebb868mr13954007b3a.17.1734947136545;
        Mon, 23 Dec 2024 01:45:36 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8486c6sm7468309b3a.85.2024.12.23.01.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 01:45:36 -0800 (PST)
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
Subject: [PATCH v3 12/17] s390: pgtable: also move pagetable_dtor() of PxD to __tlb_remove_table()
Date: Mon, 23 Dec 2024 17:40:58 +0800
Message-Id: <ad21b9392096336cf15aee46f68f9989a9cf877e.1734945104.git.zhengqi.arch@bytedance.com>
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

To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
PMD|PUD|P4D to __tlb_remove_table().

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Suggested-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: linux-s390@vger.kernel.org
---
 arch/s390/include/asm/tlb.h |  3 ---
 arch/s390/mm/pgalloc.c      | 14 ++++----------
 2 files changed, 4 insertions(+), 13 deletions(-)

diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
index 74b6fba4c2ee3..79df7c0932c56 100644
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
@@ -122,7 +121,6 @@ static inline void pud_free_tlb(struct mmu_gather *tlb, pud_t *pud,
 {
 	if (mm_pud_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(pud));
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
 	tlb->cleared_p4ds = 1;
@@ -141,7 +139,6 @@ static inline void p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d,
 {
 	if (mm_p4d_folded(tlb->mm))
 		return;
-	pagetable_dtor(virt_to_ptdesc(p4d));
 	__tlb_adjust_range(tlb, address, PAGE_SIZE);
 	tlb->mm->context.flush_mm = 1;
 	tlb->freed_tables = 1;
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


