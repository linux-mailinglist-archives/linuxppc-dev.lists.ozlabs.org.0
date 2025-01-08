Return-Path: <linuxppc-dev+bounces-4814-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47167A053D5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 08:02:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSf420M7wz30Wm;
	Wed,  8 Jan 2025 18:02:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736319730;
	cv=none; b=Z1s0RXPCLLdh7XGavLdyDZtIBd5pryVRYhZXbo9otoBPw7Zgd64Ez0kCBT9Bcxn6TNCPfyrIRBJ4AXebsAQiwxYX0C5TDW/2yaZCG1lhC62XmeRULnWV4FuIvT8KtlHxNKh6sorxKXtbR2eyBt+6HJTm0k731CspDmUMojfL65a84MZttGB45oQbwNUBJnhMtb/YBOQYBu/xPSeAlbx1sFq6hajEIvuicxDPhzh1ylrFEIXDNUYPf6BUe9oiO0lOPev18tNLdzQ8ZLBhJt4cXbkH+E5soXn3/exlZn9q4LdM+YAgZWs3DRQG01kvLzeBSQBPbZZHPMk1y+X+DLmFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736319730; c=relaxed/relaxed;
	bh=0duyzCo9dAwX01bCrGbAFGgpbJyQOIdvGclplTLFMvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EtKYlN774mMvKJbIJW8I2HaP48DFahxJJag5wdKmLX3ZBSTGGutG4ZP3BH+6r3wmSFw3L9Q51BrfON5ko6kJ6jgLJ/anMSLp2PeehB+zJaZIulCRdAxBW/rBjckyz3rgy31l3iI3adJEVrU7hJAZ29/OsLcCOhogrKBAKOg5r07JpsYvqoAbZHhhrf+tf9L2CexW5CFUb8g0SDGp56+Z7bK34fFNeHtXVQwemvuj86+Z/wHoXnXtSUMgFRy7tymD0NA3jIcF7msSMW0w9tRP5uN076aOKT0oiBx+z4Jo5CWOlmS9kz9NrPF0/b9RUuknClA4HlQcEtq/h+3bsXTcag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Uw74zF13; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=Uw74zF13;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSf4119W3z30TY
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 18:02:09 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21634338cfdso29972975ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Jan 2025 23:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1736319727; x=1736924527; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0duyzCo9dAwX01bCrGbAFGgpbJyQOIdvGclplTLFMvs=;
        b=Uw74zF13qwJBgq68Kirq1IHnaz8J+LYov1l55JoTTg5TjwOm+wyufsGoQtgqeViThL
         u4Qa8K+FyHssCVlSgq9Khdhg96YVFfsFf4a72DAzT+UQaB3HURVBvWYfGOWnL5vpS6/1
         QSvr5O4sRJgiGtHHh389PP3ETSHEX1MYsclAxABA7qCXIQU7BLlzx+FyipvKMtet3bCB
         rtSyi33benHoT+t6KZNLICKue6XSqZ11t0zBsrq4b1zHUEO81lX5qi0+uk9xivA5Bk6i
         UWI+4Z5U9cCHzlXyqDMCdzipttNe2HVW6gGRtCbCDenuffNRZ3j5XcxhuuhRUgeM4z8j
         ORyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736319727; x=1736924527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0duyzCo9dAwX01bCrGbAFGgpbJyQOIdvGclplTLFMvs=;
        b=gwW0uTyuaJImtA3qk/Q+TnpgJdpOm9ca3VHJketxYhWxboivIWjepYzLyWtkxxRY8a
         wVkMwybxp3Jz/1f4JJ2WzY3L8QtZmS2yEiuM6AVJ/TwLfrKFNg0LtYZoRtnEWydTNSrA
         OPPgEKz6VNgwLlM8XouAEhO7Bav74yXMvLURc3LvrEhVcDEvRIJVlwnQRL2fMkudb8Ch
         vNY6nSpEkW3LLN9t5MbS8LjPAoJ3wjVGUWU80WWWm43aGW6bGULwvNx3hnzOpmIYee2g
         G8ct6nk4qM53M6iiTt/zubLcAD9IlKLmEsBS2kkqJYDBaE/vBhtmB8nXKcaBVkAWOXt7
         WqMw==
X-Forwarded-Encrypted: i=1; AJvYcCWw1ItkwrVQf7zmPdqBtCRylgAOYeJRIp+2Q3BAgR1/lbY/LeeblX3S9eQWjlcxEWzTuAaHX6OeGXc5Lds=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwwpXrkUM1vgvi6nhWoLBt1JrZNLNJsXHq4BRbbeXXX47ABsh7Z
	4BF9B8fJ//5IVM5qOZY4C4oaEHpbuSLghKyCfVRaWbFO3bKwCm503fFR2hg6zS4=
X-Gm-Gg: ASbGncsFbVQBbVBYAoEbiY5ykTr+fYfs52+oEfFQUKW5m5On5Cki0ctptI+wfLkwr4I
	UwGH9R+7aPB2aM6u/dQQjAzlzcNaasrRZfEhiivPBE6rRSbPMew+f59hH1qQP2txaO2DdLt5imV
	Vj8Hf7iSnzY4eqD4LbxBBZjU4fS/tWpTq/izupafB4Rb4UstqjkmZfOMUel1pQwVV+z8LrHn4rB
	Mddes9SUARVjvwjUizDvlUZZ+Pi0ByFf1z2YQueJRO7xIx6q8/yoQcnRIVwmA3z7liWdPKveCCc
	DVhT8y2+eAF6oXZMLnEh7+lh2YE=
X-Google-Smtp-Source: AGHT+IFHWir1ocwTjoDZn2JicpigLOS4g472SxX6v3Yl/J2b2LHmsbTHHj3CMM+1OfXcdbPj30xuWQ==
X-Received: by 2002:a17:902:c406:b0:216:7ee9:21ff with SMTP id d9443c01a7336-21a83fdf307mr27262725ad.49.1736319726731;
        Tue, 07 Jan 2025 23:02:06 -0800 (PST)
Received: from C02DW0BEMD6R.bytedance.net ([139.177.225.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dca023a3sm320067275ad.250.2025.01.07.23.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jan 2025 23:02:06 -0800 (PST)
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
Subject: [PATCH v5 11/17] x86: pgtable: convert __tlb_remove_table() to use struct ptdesc
Date: Wed,  8 Jan 2025 14:57:27 +0800
Message-Id: <39f60f93143ff77cf5d6b3c3e75af0ffc1480adb.1736317725.git.zhengqi.arch@bytedance.com>
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

Convert __tlb_remove_table() to use struct ptdesc, which will help to move
pagetable_dtor() to __tlb_remove_table().

And page tables shouldn't have swap cache, so use pagetable_free() instead
of free_page_and_swap_cache() to free page table pages.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/include/asm/tlb.h | 16 +++++++++-------
 arch/x86/kernel/paravirt.c |  4 +++-
 arch/x86/mm/pgtable.c      | 12 +++++++-----
 3 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/arch/x86/include/asm/tlb.h b/arch/x86/include/asm/tlb.h
index 73f0786181cc9..680ec3d47915a 100644
--- a/arch/x86/include/asm/tlb.h
+++ b/arch/x86/include/asm/tlb.h
@@ -31,24 +31,26 @@ static inline void tlb_flush(struct mmu_gather *tlb)
  */
 static inline void __tlb_remove_table(void *table)
 {
-	free_page_and_swap_cache(table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
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
index 7bdcf152778c0..dc1ab9301d2c6 100644
--- a/arch/x86/kernel/paravirt.c
+++ b/arch/x86/kernel/paravirt.c
@@ -62,7 +62,9 @@ void __init native_pv_lock_init(void)
 #ifndef CONFIG_PT_RECLAIM
 static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
-	tlb_remove_page(tlb, table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #else
 static void native_tlb_remove_table(struct mmu_gather *tlb, void *table)
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index a6cd9660e29ec..f9516024cbe5d 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -23,7 +23,9 @@ EXPORT_SYMBOL(physical_mask);
 static inline
 void paravirt_tlb_remove_table(struct mmu_gather *tlb, void *table)
 {
-	tlb_remove_page(tlb, table);
+	struct ptdesc *ptdesc = (struct ptdesc *)table;
+
+	tlb_remove_page(tlb, ptdesc_page(ptdesc));
 }
 #else
 static inline
@@ -62,7 +64,7 @@ void ___pte_free_tlb(struct mmu_gather *tlb, struct page *pte)
 {
 	pagetable_dtor(page_ptdesc(pte));
 	paravirt_release_pte(page_to_pfn(pte));
-	paravirt_tlb_remove_table(tlb, pte);
+	paravirt_tlb_remove_table(tlb, page_ptdesc(pte));
 }
 
 #if CONFIG_PGTABLE_LEVELS > 2
@@ -78,7 +80,7 @@ void ___pmd_free_tlb(struct mmu_gather *tlb, pmd_t *pmd)
 	tlb->need_flush_all = 1;
 #endif
 	pagetable_dtor(ptdesc);
-	paravirt_tlb_remove_table(tlb, ptdesc_page(ptdesc));
+	paravirt_tlb_remove_table(tlb, ptdesc);
 }
 
 #if CONFIG_PGTABLE_LEVELS > 3
@@ -88,7 +90,7 @@ void ___pud_free_tlb(struct mmu_gather *tlb, pud_t *pud)
 
 	pagetable_dtor(ptdesc);
 	paravirt_release_pud(__pa(pud) >> PAGE_SHIFT);
-	paravirt_tlb_remove_table(tlb, virt_to_page(pud));
+	paravirt_tlb_remove_table(tlb, ptdesc);
 }
 
 #if CONFIG_PGTABLE_LEVELS > 4
@@ -98,7 +100,7 @@ void ___p4d_free_tlb(struct mmu_gather *tlb, p4d_t *p4d)
 
 	pagetable_dtor(ptdesc);
 	paravirt_release_p4d(__pa(p4d) >> PAGE_SHIFT);
-	paravirt_tlb_remove_table(tlb, virt_to_page(p4d));
+	paravirt_tlb_remove_table(tlb, ptdesc);
 }
 #endif	/* CONFIG_PGTABLE_LEVELS > 4 */
 #endif	/* CONFIG_PGTABLE_LEVELS > 3 */
-- 
2.20.1


