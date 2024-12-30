Return-Path: <linuxppc-dev+bounces-4529-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 507DB9FE471
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 10:11:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM9Lr0S79z3050;
	Mon, 30 Dec 2024 20:11:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735549860;
	cv=none; b=NKBkKsq9vh2GPU0sUrLgkGuvNLWd0U7I6ZlLXBaNxopUtdEyrsBGi8ShL6J1yeAWFP/lmo8eZguDkzisGNJgUrSNRSIXjDWx0Muubz2DAVZVxdZAbeLdZp+UondeqI0b8GUw8GETRMUm9PZIWRaavRzf0BgR1Wzw2yWJWQ/kwLxfx+C7O5JfVjQHN8no/taJlmArWnVot/5tkbsMbb/FW8c884PW6qw3F74PyuFWuPWI3hrpbTqUJ231kYiJQyiv/xWtJ+HivxonQjrlZHUWzi/rO21zjaDKU5GTrF9m9I4/jbpdQPIJc/8QMVcIQt0V8hHx1vbGAaUTM1PR4T5+4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735549860; c=relaxed/relaxed;
	bh=Rs6Lkouarv58ZoKb+WtHLVo9G63kikGgJGrD7ursbxc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jXLTaJT44KmUFXhbOOHKHXJ12dFiqQNKl5z3WeGDr18WfC1owqwSZUjtKJ/TEjl8MwkZAHOqEJXqLXXgfg+HhLIaxJL7ze5MNXfj0et2bznf/0H5GuLSgSyMUYDgbmwPTQppUT4yWu95gYrX31JPWuHjP28pYrsTAxNu+TCdjLHbwY0zsO5HvVPkDMZ94wkbEqr2SxJeWUbB+LZJUcY8BHE5AB03utAEZ4dA7d7LPkQZCV+jVY6HWKkG0sy/YjoalWlPF4ts2n4suFZbA/8xcM4q01ftWxhPXdXRsUFDAnvsF8EjTdvEN0OhvETsvFFhCrHhjONGAV5X6LwvJAkFxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IXdBGJvO; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=IXdBGJvO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM9Lq0WQXz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 20:10:58 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21a1e6fd923so58866105ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 01:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735549857; x=1736154657; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rs6Lkouarv58ZoKb+WtHLVo9G63kikGgJGrD7ursbxc=;
        b=IXdBGJvORGAe/mYE0bfShMRLGiRXBpU1SfT+/YEG/gkFSdFqlFEUTXDlCUOhmhPYi6
         d4aGql6jlTTRGP8gHNbCD7SSp726fCNe8ZoPk20XOgNe0Y/0MV29iBlMMAFFGxm6WUdU
         q6tdydfwR86i5aJwJWLjxHg8BDbyow+cW9xYO/l0qhEdng9F2Qk47HVxXjR46bd0BWgV
         yqUEB6nlL+g+q4sY81yotxzLMbRQzdiY3OOcU6dx/yoHucuFwAud5iXj/+6aEMOKz1CP
         rEq61C50qXgQXxYHphXgw+9G+h3ZTu0G5g6mC5/6jDVFQX6rlW5KtBNyfFGYt53JTcRs
         Pkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735549857; x=1736154657;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rs6Lkouarv58ZoKb+WtHLVo9G63kikGgJGrD7ursbxc=;
        b=GgPKFAT/f4tXZ8CJNctP+jJz+3z6byZ2QjGGN/ol8a0rzDXd2n1ZCs+FRjnEJ7muEj
         UkX/+XbmKq42Lk0c4I8LMbh30H7/zy1aWvx90ktwoo5POyf7tjJwyk/viNvRP4W3KcpX
         PyfTP5HiQpQ8OJAxh2Suj6l0VW6gAojVu66fECfFcD8mXyDxU9JTItOVauAEikKDrQ/k
         Ybz+iPbF+3xRaMeFMC03rQ6cTTOCjiJdjQ43LMl5tI/QQz4lHBRrKj21vRpPHyuWIrD9
         NwZE9/3iQFdXgm9r8ylwv0kCgZoKGHwr/uk/XKR+ycDJSG3Tqxfz7QVmEqTUQ56FWYkU
         SyLg==
X-Forwarded-Encrypted: i=1; AJvYcCXwQN8frvNmNcHTurAPstC6EPFsIqIrmiSjzkbD6s2I161GDumxgWQAlVkKCQfDvK6VNR/LmShvSqN4LUg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw6kL5UwEIXb3V+zTuhbef5R9lWGLstoqutKvsfvmAD5N/Izw1b
	RG6VTJFIO8AkfspvcAX/KOuuMN9maXPsgvs8TJTahmLsfncfglkUV+y99VbLCCs=
X-Gm-Gg: ASbGncstUg0U02NDRlkf8CCvfE0IFveU0/loMWU/KNEVsEF/Z1KBJRyDt4qax9JKN4s
	tL4HVW08aDjWrw/VzZZj81TfuaY53vQOzAUUemkcu3FDP9SvBqAZopNaazxKX7Y7yeAD2SWXG7/
	JPuiBwJn1kifR4F0vTukQT4n/xw2B8ZGNpBuUEhw+SMXAMGHZh6b62v6A7GMSvAB2HB0xSyPyxi
	pnUIFkDFbSf2YvTtdPF33CT79PnEEF8q7sr7pIAvbelEHeoHtI8tN1GTtxUH/93BypsWxNyD9hs
	96T9f360NqL7IxRq/OEL1A==
X-Google-Smtp-Source: AGHT+IGZk471dqtvPjYzzhjuNb2uivM1pgmRrcDve4hlPbWGQce+RD+FtIOnCoiYNP05sabQ4PQAQA==
X-Received: by 2002:a05:6a21:8cc2:b0:1e1:f281:8d36 with SMTP id adf61e73a8af0-1e5e0458dbdmr51544115637.10.1735549857384;
        Mon, 30 Dec 2024 01:10:57 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba72f7csm17057841a12.4.2024.12.30.01.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Dec 2024 01:10:56 -0800 (PST)
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
Subject: [PATCH v4 11/15] x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
Date: Mon, 30 Dec 2024 17:07:46 +0800
Message-Id: <0dc5a3bf5a692e24379c1d3b879a6d4396f0dbbd.1735549103.git.zhengqi.arch@bytedance.com>
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
Cc: x86@kernel.org
---
 arch/x86/include/asm/tlb.h | 17 ++++++++++-------
 arch/x86/kernel/paravirt.c |  1 +
 arch/x86/mm/pgtable.c      | 12 ++----------
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 73f0786181cc9..f64730be5ad67 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -31,24 +31,27 @@ static inline void tlb_flush(struct mmu_gather *tlb)
  */
 static inline void __tlb_remove_table(void *table)
 {
-	free_page_and_swap_cache(table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	pagetable_dtor(ptdesc);
+	pagetable_free(ptdesc);
 }
 
 #ifdef CONFIG_PT_RECLAIM
 static inline void __tlb_remove_table_one_rcu(struct rcu_head *head)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 
-	page = container_of(head, struct page, rcu_head);
-	put_page(page);
+	ptdesc = container_of(head, struct ptdesc, pt_rcu_head);
+	__tlb_remove_table(ptdesc);
 }
 
 static inline void __tlb_remove_table_one(void *table)
 {
-	struct page *page;
+	struct ptdesc *ptdesc;
 
-	page = table;
-	call_rcu(&page->rcu_head, __tlb_remove_table_one_rcu);
+	ptdesc = table;
+	call_rcu(&ptdesc->pt_rcu_head, __tlb_remove_table_one_rcu);
 }
 #define __tlb_remove_table_one __tlb_remove_table_one
 #endif /* CONFIG_PT_RECLAIM */
diff --git a/arch/x86/kernel/paravirt.c b/arch/x86/kernel/paravirt.c
index 7bdcf152778c0..46d5d325483b0 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -62,6 +62,7 @@ void __init native_pv_lock_init(void)
 #ifndef CONFIG_PT_RECLAIM
 static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
+	pagetable_dtor(table);
 	tlb_remove_page(tlb, table);
 }
 #else
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index a6cd9660e29ec..a0b0e501ba663 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -23,6 +23,7 @@ EXPORT_SYMBOL(physical_mask);
 static inline
 void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
+	pagetable_dtor(table);
 	tlb_remove_page(tlb, table);
 }
 #else
@@ -60,7 +61,6 @@ early_param("userpte", setup_userpte);
 
 void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 {
-	pagetable_dtor(page_ptdesc(pte));
 	paravirt_release_pte(page_to_pfn(pte));
 	paravirt_tlb_remove_table(tlb, pte);
 }
@@ -68,7 +68,6 @@ void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 #if CONFIG_PGTABLE_LEVELS > 2
 void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pmd);
 	paravirt_release_pmd(__pa(pmd) >> PAGE_SHIFT);
 	/*
 	 * NOTE! For PAE, any changes to the top page-directory-pointer-table
@@ -77,16 +76,12 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 #ifdef CONFIG_X86_PAE
 	tlb->need_flush_all = 1;
 #endif
-	pagetable_dtor(ptdesc);
-	paravirt_tlb_remove_table(tlb, ptdesc_page(ptdesc));
+	paravirt_tlb_remove_table(tlb, virt_to_page(pmd));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 3
 void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(pud);
-
-	pagetable_dtor(ptdesc);
 	paravirt_release_pud(__pa(pud) >> PAGE_SHIFT);
 	paravirt_tlb_remove_table(tlb, virt_to_page(pud));
 }
@@ -94,9 +89,6 @@ void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 #if CONFIG_PGTABLE_LEVELS > 4
 void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 {
-	struct ptdesc *ptdesc = virt_to_ptdesc(p4d);
-
-	pagetable_dtor(ptdesc);
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
 	paravirt_tlb_remove_table(tlb, virt_to_page(p4d));
 }
-- 
2.20.1


