Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C603073F2F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 05:44:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Bw6j1qqb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QqrFJ53W1z3dnD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jun 2023 13:44:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=Bw6j1qqb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1132; helo=mail-yw1-x1132.google.com; envelope-from=vishal.moola@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QqqcN07bKz3bvJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Jun 2023 13:16:19 +1000 (AEST)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-57059626276so44706997b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jun 2023 20:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687835778; x=1690427778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UurGuuLzED1CKQ5+YtAa+uldlNlkULcrhOlEPtYgkts=;
        b=Bw6j1qqbA7rK2Dm84VNEOP66RtUUiWxR5Sye2bW+eq3uYQIAY2EgG1iwdb2DLJnhG8
         GeCT0K/ZwJIKUih4HIgcFRg+mw1EU/RmQtL9RCws+bBmnGeSgMwKEqV8Sq7OOh2ekNKy
         KxZzPsUUwTKcYY2uR69y6/3CJ/yQh13J76r7SLJTov+ctRLrvX63ZMz8HGYd0YBMtxPR
         d4bJ4wdUGuyrpgX3PWgY/0ePtHqJFHhYHpUgd8NRua4eh9nOB+MqmDgdNijgrl/iljgo
         W4AbA6WKPV5xVJmow0GDfY5w1hM9Ipzkd6LQ2xSzFc3wc9cyZI8JF3nhcsteILote3wU
         0FOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687835778; x=1690427778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UurGuuLzED1CKQ5+YtAa+uldlNlkULcrhOlEPtYgkts=;
        b=ao/2qHmkRlX4aGFFtRPwMVynkALexpI0yiiEmpsCwTNx8ogFa348wuNSNKXz2keWhl
         vigEzq+jhpFeJmHOGaUNBeW9oFfMwhcnR8reNKCpNNpCHfHMQoga8XNX7ZfJbGw/t1WE
         LYNC3psH1XXv/CNiYq/8hOsQhqLHG/CVvD6lPW3AphDRjp1UIWQe0kq/h3XNL/CsiiQ1
         FkXakFwcRIkcaVwHVNvuYhNSnUmkKDOhG3zEmmLEge7UMlmmQ4SkpAdbLuQ0O9cPPsws
         ChabPTrdcTM4L+6wZi+sUk7E9uIEpRjWVYm/NILjpVvXY2Pc7mW+HdBDu6S5gNfpw4x1
         qk2w==
X-Gm-Message-State: AC+VfDyNfrzbpgsCNFryg1vu2cj9X8eL1Qhu/FYI8Eg+UMbW7Kcnau74
	G/n3QjxLgArOiZNNLpDNYRM=
X-Google-Smtp-Source: ACHHUZ48cJY/DPvk+Kk12K3DwipJ5tKtap76NQbk/m6+l8TYs0OHWXs1Miee1fTjpWtp4A4P8vJjEA==
X-Received: by 2002:a81:4e88:0:b0:565:ba4b:aa81 with SMTP id c130-20020a814e88000000b00565ba4baa81mr32811368ywb.45.1687835777737;
        Mon, 26 Jun 2023 20:16:17 -0700 (PDT)
Received: from unknowna0e70b2ca394.attlocal.net ([2600:1700:2f7d:1800::16])
        by smtp.googlemail.com with ESMTPSA id s4-20020a0dd004000000b0057399b3bd26sm1614798ywd.33.2023.06.26.20.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 20:16:17 -0700 (PDT)
From: "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>
Subject: [PATCH v6 33/33] mm: Remove pgtable_{pmd, pte}_page_{ctor, dtor}() wrappers
Date: Mon, 26 Jun 2023 20:14:31 -0700
Message-Id: <20230627031431.29653-34-vishal.moola@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230627031431.29653-1-vishal.moola@gmail.com>
References: <20230627031431.29653-1-vishal.moola@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, kvm@vger.kernel.org, linux-openrisc@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-sh@vger.kernel.org, linux-um@lists.infradead.org, linux-mips@vger.kernel.org, linux-csky@vger.kernel.org, "Vishal Moola \(Oracle\)" <vishal.moola@gmail.com>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Hugh Dickins <hughd@google.com>, Mike Rapoport <rppt@kernel.org>, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These functions are no longer necessary. Remove them and cleanup
Documentation referencing them.

Signed-off-by: Vishal Moola (Oracle) <vishal.moola@gmail.com>
Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 Documentation/mm/split_page_table_lock.rst    | 12 +++++------
 .../zh_CN/mm/split_page_table_lock.rst        | 14 ++++++-------
 include/linux/mm.h                            | 20 -------------------
 3 files changed, 13 insertions(+), 33 deletions(-)

diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
index a834fad9de12..e4f6972eb6c0 100644
--- a/Documentation/mm/split_page_table_lock.rst
+++ b/Documentation/mm/split_page_table_lock.rst
@@ -58,7 +58,7 @@ Support of split page table lock by an architecture
 ===================================================
 
 There's no need in special enabling of PTE split page table lock: everything
-required is done by pgtable_pte_page_ctor() and pgtable_pte_page_dtor(), which
+required is done by pagetable_pte_ctor() and pagetable_pte_dtor(), which
 must be called on PTE table allocation / freeing.
 
 Make sure the architecture doesn't use slab allocator for page table
@@ -68,8 +68,8 @@ This field shares storage with page->ptl.
 PMD split lock only makes sense if you have more than two page table
 levels.
 
-PMD split lock enabling requires pgtable_pmd_page_ctor() call on PMD table
-allocation and pgtable_pmd_page_dtor() on freeing.
+PMD split lock enabling requires pagetable_pmd_ctor() call on PMD table
+allocation and pagetable_pmd_dtor() on freeing.
 
 Allocation usually happens in pmd_alloc_one(), freeing in pmd_free() and
 pmd_free_tlb(), but make sure you cover all PMD table allocation / freeing
@@ -77,7 +77,7 @@ paths: i.e X86_PAE preallocate few PMDs on pgd_alloc().
 
 With everything in place you can set CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK.
 
-NOTE: pgtable_pte_page_ctor() and pgtable_pmd_page_ctor() can fail -- it must
+NOTE: pagetable_pte_ctor() and pagetable_pmd_ctor() can fail -- it must
 be handled properly.
 
 page->ptl
@@ -97,7 +97,7 @@ trick:
    split lock with enabled DEBUG_SPINLOCK or DEBUG_LOCK_ALLOC, but costs
    one more cache line for indirect access;
 
-The spinlock_t allocated in pgtable_pte_page_ctor() for PTE table and in
-pgtable_pmd_page_ctor() for PMD table.
+The spinlock_t allocated in pagetable_pte_ctor() for PTE table and in
+pagetable_pmd_ctor() for PMD table.
 
 Please, never access page->ptl directly -- use appropriate helper.
diff --git a/Documentation/translations/zh_CN/mm/split_page_table_lock.rst b/Documentation/translations/zh_CN/mm/split_page_table_lock.rst
index 4fb7aa666037..a2c288670a24 100644
--- a/Documentation/translations/zh_CN/mm/split_page_table_lock.rst
+++ b/Documentation/translations/zh_CN/mm/split_page_table_lock.rst
@@ -56,16 +56,16 @@ Hugetlb特定的辅助函数:
 架构对分页表锁的支持
 ====================
 
-没有必要特别启用PTE分页表锁：所有需要的东西都由pgtable_pte_page_ctor()
-和pgtable_pte_page_dtor()完成，它们必须在PTE表分配/释放时被调用。
+没有必要特别启用PTE分页表锁：所有需要的东西都由pagetable_pte_ctor()
+和pagetable_pte_dtor()完成，它们必须在PTE表分配/释放时被调用。
 
 确保架构不使用slab分配器来分配页表：slab使用page->slab_cache来分配其页
 面。这个区域与page->ptl共享存储。
 
 PMD分页锁只有在你有两个以上的页表级别时才有意义。
 
-启用PMD分页锁需要在PMD表分配时调用pgtable_pmd_page_ctor()，在释放时调
-用pgtable_pmd_page_dtor()。
+启用PMD分页锁需要在PMD表分配时调用pagetable_pmd_ctor()，在释放时调
+用pagetable_pmd_dtor()。
 
 分配通常发生在pmd_alloc_one()中，释放发生在pmd_free()和pmd_free_tlb()
 中，但要确保覆盖所有的PMD表分配/释放路径：即X86_PAE在pgd_alloc()中预先
@@ -73,7 +73,7 @@ PMD分页锁只有在你有两个以上的页表级别时才有意义。
 
 一切就绪后，你可以设置CONFIG_ARCH_ENABLE_SPLIT_PMD_PTLOCK。
 
-注意：pgtable_pte_page_ctor()和pgtable_pmd_page_ctor()可能失败--必
+注意：pagetable_pte_ctor()和pagetable_pmd_ctor()可能失败--必
 须正确处理。
 
 page->ptl
@@ -90,7 +90,7 @@ page->ptl用于访问分割页表锁，其中'page'是包含该表的页面struc
    的指针并动态分配它。这允许在启用DEBUG_SPINLOCK或DEBUG_LOCK_ALLOC的
    情况下使用分页锁，但由于间接访问而多花了一个缓存行。
 
-PTE表的spinlock_t分配在pgtable_pte_page_ctor()中，PMD表的spinlock_t
-分配在pgtable_pmd_page_ctor()中。
+PTE表的spinlock_t分配在pagetable_pte_ctor()中，PMD表的spinlock_t
+分配在pagetable_pmd_ctor()中。
 
 请不要直接访问page->ptl - -使用适当的辅助函数。
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0e4d5f6d10e5..dc0f19f35424 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2873,11 +2873,6 @@ static inline bool pagetable_pte_ctor(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline bool pgtable_pte_page_ctor(struct page *page)
-{
-	return pagetable_pte_ctor(page_ptdesc(page));
-}
-
 static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
@@ -2887,11 +2882,6 @@ static inline void pagetable_pte_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
-static inline void pgtable_pte_page_dtor(struct page *page)
-{
-	pagetable_pte_dtor(page_ptdesc(page));
-}
-
 pte_t *__pte_offset_map(pmd_t *pmd, unsigned long addr, pmd_t *pmdvalp);
 static inline pte_t *pte_offset_map(pmd_t *pmd, unsigned long addr)
 {
@@ -2993,11 +2983,6 @@ static inline bool pagetable_pmd_ctor(struct ptdesc *ptdesc)
 	return true;
 }
 
-static inline bool pgtable_pmd_page_ctor(struct page *page)
-{
-	return pagetable_pmd_ctor(page_ptdesc(page));
-}
-
 static inline void pagetable_pmd_dtor(struct ptdesc *ptdesc)
 {
 	struct folio *folio = ptdesc_folio(ptdesc);
@@ -3007,11 +2992,6 @@ static inline void pagetable_pmd_dtor(struct ptdesc *ptdesc)
 	lruvec_stat_sub_folio(folio, NR_PAGETABLE);
 }
 
-static inline void pgtable_pmd_page_dtor(struct page *page)
-{
-	pagetable_pmd_dtor(page_ptdesc(page));
-}
-
 /*
  * No scalability reason to split PUD locks yet, but follow the same pattern
  * as the PMD locks to make it easier if we decide to.  The VM should not be
-- 
2.40.1

