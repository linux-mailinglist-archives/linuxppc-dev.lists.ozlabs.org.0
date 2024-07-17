Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF4AB934492
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 00:07:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VOlm/XVE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EAuUkb1Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WPVRK51lPz3dLR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2024 08:07:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VOlm/XVE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EAuUkb1Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WPVKt3Bsnz3cbX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2024 08:02:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UK+6jdtPUvq+CqmhBfq9bfGaFmN7od9JwWK0He3qEgI=;
	b=VOlm/XVEQv1w+8cG1/huqZ6PENNtkyCZruAvvAh9gtogaR4RFKamYdJ+ZyH0w0sciB3jpE
	48fsRAX79jPK+FtqUcOrjv65vzGbcCJhPm10U79INu6zQZz7aVYd/BIFFCuYP5C3ggWYdZ
	VYwE1knVPcw+72k9SKApXBOzHoBGJ8Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721253759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UK+6jdtPUvq+CqmhBfq9bfGaFmN7od9JwWK0He3qEgI=;
	b=EAuUkb1QZaupZ2P2BtaoTK92Ry5PO0A9L+/MEypTGHUn4FpxsFiUlKPf3vQmSpPMBZRp0X
	Ik1iebhkICXS0CsuU2GGlfXP/z5esf2Updhkx15JQV42tJ8Lno/66ZfJzhHDJhr+ZHgczS
	L7+kehDz5bPDw1TWmKO9HDEaQ8lPqik=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-s8eU9wbNPI2n2E2SEZvy9A-1; Wed, 17 Jul 2024 18:02:35 -0400
X-MC-Unique: s8eU9wbNPI2n2E2SEZvy9A-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6b792d6fe5bso618606d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jul 2024 15:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721253754; x=1721858554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UK+6jdtPUvq+CqmhBfq9bfGaFmN7od9JwWK0He3qEgI=;
        b=jNZBzB1Kvv0WQ5ZBaG5PkBK3kw0qrIycwmjsxLY1pgK7pNgidrxtXKvelaPa1s8IDy
         82xuCic8Y1hL+9UQ0q1NpX/kWfhiVU/pXhlebLhYrsI9p5RmfQ6U6wlZX1t+oBipYXRz
         rAn2pNMota3MGQFNnPXT0YjhTWMnz88hcjvdWD38wz5ZiQGeAUjq1TW0YokC3Hj7V00G
         Wp+5eXWJnvW8VPK6CQpKsfa7/BNfD/PrIVMFst1pRfx98J5X40dRsfL9WUh4CVLya97X
         dq08ClkMHQJYSELCPUAGhv9v2cS21smHBb7uhS8vPngHL6bIkozBOMjF9nIbzasKGHQQ
         AKMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgyiTzGCAfr3BQvM70+mwPgzxepMUby0Zq1bU9c13K0zktmaCYelJWPSzOufNAtErQSfXSQDkFGw3IFqdcF0hfSYzzSbeU+usxx6yivw==
X-Gm-Message-State: AOJu0YyJkJwdNUKBCM5D7SOFTYwbDlv4/MP37SV1R+DhsWbUG9QJ6qv4
	2+BTd6UgH9bcKwWZQetnlvKIj/twBx3gOwdvrdoElcUwdu92lqTTdULKS7MqqEIiSCskgJWh2Ej
	7R9kxim9y8XCN9GCfULUac6NpQwXeEHHodwhuHsYpVzugUc77JpcxbOquBWYYnkE=
X-Received: by 2002:a05:622a:178f:b0:447:f3d8:e394 with SMTP id d75a77b69052e-44f86186c77mr22821021cf.2.1721253753692;
        Wed, 17 Jul 2024 15:02:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjoecSnH17WsLUAfbk8D5niviaBnv9p9n7X7ysSM2hooHGbHoRt5hE2vvjgIUgbHso/7wvBQ==
X-Received: by 2002:a05:622a:178f:b0:447:f3d8:e394 with SMTP id d75a77b69052e-44f86186c77mr22820481cf.2.1721253752855;
        Wed, 17 Jul 2024 15:02:32 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f5b83f632sm53071651cf.85.2024.07.17.15.02.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:02:32 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC 5/6] mm/huge_mapping: Create huge_mapping_pxx.c
Date: Wed, 17 Jul 2024 18:02:18 -0400
Message-ID: <20240717220219.3743374-6-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240717220219.3743374-1-peterx@redhat.com>
References: <20240717220219.3743374-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: linux-arm-kernel@lists.infradead.org, linux-s390@vger.kernel.org, Alistair Popple <apopple@nvidia.com>, Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@redhat.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, peterx@redhat.com, Michal Hocko <mhocko@kernel.org>, Alex Williamson <alex.williamson@redhat.com>, linux-riscv@lists.infradead.org, Matthew Wilcox <willy@infradead.org>, Jason Gunthorpe <jgg@nvidia.com>, sparclinux@vger.kernel.org, Axel Rasmussen <axelrasmussen@google.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

At some point, we need to decouple "huge mapping" with THP, for any non-THP
huge mappings in the future (hugetlb, pfnmap, etc..).  This is the first
step towards it.

Or say, we already started to do this when PGTABLE_HAS_HUGE_LEAVES option
was introduced: that is the first thing Linux start to describe LEAVEs
rather than THPs when it is about huge mappings.  Before that, mostly any
huge mapping will have THP involved, like devmap.  Hugetlb is special only
because we duplicated the whole world there, but we also have a demand to
decouple that now.

Linux used to have huge_memory.c which only compiles with THP enabled, I
wished it was called thp.c from the start.  In reality, it contains more
than processing THP: any huge mapping (even if not falling into THP
category) will be able to leverage many of these helpers, but unfortunately
this file is not compiled if !THP.  These helpers are normally only about
the pgtable operations, which may not be directly relevant to what type of
huge folio (e.g. THP) underneath, or perhaps even if there's no vmemmap to
back it.

It's better we move them out of THP world.

Create a new set of files huge_mapping_p[mu]d.c.  This patch starts to move
quite a few essential helpers from huge_memory.c into these new files, so
that they'll start to work and compile rely on PGTABLE_HAS_PXX_LEAVES
rather than THP.  Split them into two files by nature so that e.g. archs
that only supports PMD huge mapping can avoid compiling the whole -pud
file, with the hope to reduce the size of object compiled and linked.

No functional change intended, but only code movement.  Said that, there
will be some "ifdef" machinery changes to pass all kinds of compilations.

Cc: Jason Gunthorpe <jgg@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Oscar Salvador <osalvador@suse.de>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 include/linux/huge_mm.h             |  318 +++++---
 include/linux/pgtable.h             |   23 +-
 include/trace/events/huge_mapping.h |   41 +
 include/trace/events/thp.h          |   28 -
 mm/Makefile                         |    2 +
 mm/huge_mapping_pmd.c               |  979 +++++++++++++++++++++++
 mm/huge_mapping_pud.c               |  235 ++++++
 mm/huge_memory.c                    | 1125 +--------------------------
 8 files changed, 1472 insertions(+), 1279 deletions(-)
 create mode 100644 include/trace/events/huge_mapping.h
 create mode 100644 mm/huge_mapping_pmd.c
 create mode 100644 mm/huge_mapping_pud.c

diff --git a/include/linux/huge_mm.h b/include/linux/huge_mm.h
index d8b642ad512d..aea2784df8ef 100644
--- a/include/linux/huge_mm.h
+++ b/include/linux/huge_mm.h
@@ -8,43 +8,214 @@
 #include <linux/fs.h> /* only for vma_is_dax() */
 #include <linux/kobject.h>
 
+#ifdef CONFIG_PGTABLE_HAS_PUD_LEAVES
+void huge_pud_set_accessed(struct vm_fault *vmf, pud_t orig_pud);
 void touch_pud(struct vm_area_struct *vma, unsigned long addr,
 	       pud_t *pud, bool write);
-void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
-	       pmd_t *pmd, bool write);
-pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
-vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf);
-int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
-		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
-		  struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma);
-void huge_pmd_set_accessed(struct vm_fault *vmf);
 int copy_huge_pud(struct mm_struct *dst_mm, struct mm_struct *src_mm,
 		  pud_t *dst_pud, pud_t *src_pud, unsigned long addr,
 		  struct vm_area_struct *vma);
+int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma, pud_t *pud,
+		 unsigned long addr);
+int change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		    pud_t *pudp, unsigned long addr, pgprot_t newprot,
+		    unsigned long cp_flags);
+void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
+		unsigned long address);
+spinlock_t *__pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma);
 
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-void huge_pud_set_accessed(struct vm_fault *vmf, pud_t orig_pud);
-#else
-static inline void huge_pud_set_accessed(struct vm_fault *vmf, pud_t orig_pud)
+static inline spinlock_t *
+pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma)
 {
+	if (pud_trans_huge(*pud) || pud_devmap(*pud))
+		return __pud_trans_huge_lock(pud, vma);
+	else
+		return NULL;
 }
-#endif
 
+#define split_huge_pud(__vma, __pud, __address)				\
+	do {								\
+		pud_t *____pud = (__pud);				\
+		if (pud_trans_huge(*____pud) || pud_devmap(*____pud))	\
+			__split_huge_pud(__vma, __pud, __address);	\
+	}  while (0)
+#else  /* CONFIG_PGTABLE_HAS_PUD_LEAVES */
+static inline void
+huge_pud_set_accessed(struct vm_fault *vmf, pud_t orig_pud)
+{
+}
+
+static inline int
+change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		pud_t *pudp, unsigned long addr, pgprot_t newprot,
+		unsigned long cp_flags)
+{
+	return 0;
+}
+
+static inline spinlock_t *
+pud_trans_huge_lock(pud_t *pud,
+		struct vm_area_struct *vma)
+{
+	return NULL;
+}
+
+static inline void
+touch_pud(struct vm_area_struct *vma, unsigned long addr,
+	       pud_t *pud, bool write)
+{
+}
+
+static inline int
+copy_huge_pud(struct mm_struct *dst_mm, struct mm_struct *src_mm,
+	      pud_t *dst_pud, pud_t *src_pud, unsigned long addr,
+	      struct vm_area_struct *vma)
+{
+	return 0;
+}
+
+static inline int
+zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma, pud_t *pud,
+	     unsigned long addr)
+{
+	return 0;
+}
+
+static inline void
+__split_huge_pud(struct vm_area_struct *vma, pud_t *pud, unsigned long address)
+{
+}
+
+#define split_huge_pud(__vma, __pud, __address) do {} while (0)
+#endif  /* CONFIG_PGTABLE_HAS_PUD_LEAVES */
+
+#ifdef CONFIG_PGTABLE_HAS_PMD_LEAVES
+void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	       pmd_t *pmd, bool write);
+pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma);
+int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
+		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
+		  struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma);
+void huge_pmd_set_accessed(struct vm_fault *vmf);
 vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf);
-bool madvise_free_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
-			   pmd_t *pmd, unsigned long addr, unsigned long next);
 int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma, pmd_t *pmd,
 		 unsigned long addr);
-int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma, pud_t *pud,
-		 unsigned long addr);
 bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 		   unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd);
 int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		    pmd_t *pmd, unsigned long addr, pgprot_t newprot,
 		    unsigned long cp_flags);
+void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
+		unsigned long address, bool freeze, struct folio *folio);
+void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
+			   pmd_t *pmd, bool freeze, struct folio *folio);
+void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
+		bool freeze, struct folio *folio);
+spinlock_t *__pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma);
+bool can_change_pmd_writable(struct vm_area_struct *vma, unsigned long addr,
+			     pmd_t pmd);
+void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd);
+
+static inline int is_swap_pmd(pmd_t pmd)
+{
+	return !pmd_none(pmd) && !pmd_present(pmd);
+}
+
+/* mmap_lock must be held on entry */
+static inline spinlock_t *
+pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma)
+{
+	if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd))
+		return __pmd_trans_huge_lock(pmd, vma);
+	else
+		return NULL;
+}
+
+#define split_huge_pmd(__vma, __pmd, __address)				\
+	do {								\
+		pmd_t *____pmd = (__pmd);				\
+		if (is_swap_pmd(*____pmd) || pmd_is_leaf(*____pmd))	\
+			__split_huge_pmd(__vma, __pmd, __address,	\
+					 false, NULL);			\
+	}  while (0)
+#else  /* CONFIG_PGTABLE_HAS_PMD_LEAVES */
+static inline spinlock_t *
+pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma)
+{
+	return NULL;
+}
+
+static inline int is_swap_pmd(pmd_t pmd)
+{
+	return 0;
+}
 
+static inline void
+__split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
+		 unsigned long address, bool freeze, struct folio *folio)
+{
+}
+#define split_huge_pmd(__vma, __pmd, __address)  do {} while (0)
+
+static inline int
+copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
+	      pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
+	      struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
+{
+	return 0;
+}
+
+static inline int
+zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma, pmd_t *pmd,
+	     unsigned long addr)
+{
+	return 0;
+}
+
+static inline vm_fault_t
+do_huge_pmd_wp_page(struct vm_fault *vmf)
+{
+	return 0;
+}
+
+static inline void
+huge_pmd_set_accessed(struct vm_fault *vmf)
+{
+}
+
+static inline int
+change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		pmd_t *pmd, unsigned long addr, pgprot_t newprot,
+		unsigned long cp_flags)
+{
+	return 0;
+}
+
+static inline bool
+move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
+	      unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
+{
+	return false;
+}
+
+static inline void
+split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
+		      pmd_t *pmd, bool freeze, struct folio *folio)
+{
+}
+
+static inline void
+split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
+		       bool freeze, struct folio *folio)
+{
+}
+#endif  /* CONFIG_PGTABLE_HAS_PMD_LEAVES */
+
+bool madvise_free_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
+			   pmd_t *pmd, unsigned long addr, unsigned long next);
 vm_fault_t vmf_insert_pfn_pmd(struct vm_fault *vmf, pfn_t pfn, bool write);
 vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write);
+struct folio *mm_get_huge_zero_folio(struct mm_struct *mm);
 
 enum transparent_hugepage_flag {
 	TRANSPARENT_HUGEPAGE_UNSUPPORTED,
@@ -130,6 +301,9 @@ extern unsigned long huge_anon_orders_always;
 extern unsigned long huge_anon_orders_madvise;
 extern unsigned long huge_anon_orders_inherit;
 
+void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
+				unsigned long haddr, pmd_t *pmd);
+
 static inline bool hugepage_global_enabled(void)
 {
 	return transparent_hugepage_flags &
@@ -332,44 +506,6 @@ static inline int split_huge_page(struct page *page)
 }
 void deferred_split_folio(struct folio *folio);
 
-void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long address, bool freeze, struct folio *folio);
-
-#define split_huge_pmd(__vma, __pmd, __address)				\
-	do {								\
-		pmd_t *____pmd = (__pmd);				\
-		if (is_swap_pmd(*____pmd) || pmd_trans_huge(*____pmd)	\
-					|| pmd_devmap(*____pmd))	\
-			__split_huge_pmd(__vma, __pmd, __address,	\
-						false, NULL);		\
-	}  while (0)
-
-
-void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
-		bool freeze, struct folio *folio);
-
-void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
-		unsigned long address);
-
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-int change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
-		    pud_t *pudp, unsigned long addr, pgprot_t newprot,
-		    unsigned long cp_flags);
-#else
-static inline int
-change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
-		pud_t *pudp, unsigned long addr, pgprot_t newprot,
-		unsigned long cp_flags) { return 0; }
-#endif
-
-#define split_huge_pud(__vma, __pud, __address)				\
-	do {								\
-		pud_t *____pud = (__pud);				\
-		if (pud_trans_huge(*____pud)				\
-					|| pud_devmap(*____pud))	\
-			__split_huge_pud(__vma, __pud, __address);	\
-	}  while (0)
-
 int hugepage_madvise(struct vm_area_struct *vma, unsigned long *vm_flags,
 		     int advice);
 int madvise_collapse(struct vm_area_struct *vma,
@@ -377,31 +513,6 @@ int madvise_collapse(struct vm_area_struct *vma,
 		     unsigned long start, unsigned long end);
 void vma_adjust_trans_huge(struct vm_area_struct *vma, unsigned long start,
 			   unsigned long end, long adjust_next);
-spinlock_t *__pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma);
-spinlock_t *__pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma);
-
-static inline int is_swap_pmd(pmd_t pmd)
-{
-	return !pmd_none(pmd) && !pmd_present(pmd);
-}
-
-/* mmap_lock must be held on entry */
-static inline spinlock_t *pmd_trans_huge_lock(pmd_t *pmd,
-		struct vm_area_struct *vma)
-{
-	if (is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) || pmd_devmap(*pmd))
-		return __pmd_trans_huge_lock(pmd, vma);
-	else
-		return NULL;
-}
-static inline spinlock_t *pud_trans_huge_lock(pud_t *pud,
-		struct vm_area_struct *vma)
-{
-	if (pud_trans_huge(*pud) || pud_devmap(*pud))
-		return __pud_trans_huge_lock(pud, vma);
-	else
-		return NULL;
-}
 
 /**
  * folio_test_pmd_mappable - Can we map this folio with a PMD?
@@ -416,6 +527,7 @@ struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pmd_t *pmd, int flags, struct dev_pagemap **pgmap);
 
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf);
+vm_fault_t do_huge_pmd_anonymous_page(struct vm_fault *vmf);
 
 extern struct folio *huge_zero_folio;
 extern unsigned long huge_zero_pfn;
@@ -445,13 +557,17 @@ static inline bool thp_migration_supported(void)
 	return IS_ENABLED(CONFIG_ARCH_ENABLE_THP_MIGRATION);
 }
 
-void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
-			   pmd_t *pmd, bool freeze, struct folio *folio);
 bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
 			   pmd_t *pmdp, struct folio *folio);
 
 #else /* CONFIG_TRANSPARENT_HUGEPAGE */
 
+static inline void
+__split_huge_zero_page_pmd(struct vm_area_struct *vma,
+			   unsigned long haddr, pmd_t *pmd)
+{
+}
+
 static inline bool folio_test_pmd_mappable(struct folio *folio)
 {
 	return false;
@@ -505,16 +621,6 @@ static inline int split_huge_page(struct page *page)
 	return 0;
 }
 static inline void deferred_split_folio(struct folio *folio) {}
-#define split_huge_pmd(__vma, __pmd, __address)	\
-	do { } while (0)
-
-static inline void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long address, bool freeze, struct folio *folio) {}
-static inline void split_huge_pmd_address(struct vm_area_struct *vma,
-		unsigned long address, bool freeze, struct folio *folio) {}
-static inline void split_huge_pmd_locked(struct vm_area_struct *vma,
-					 unsigned long address, pmd_t *pmd,
-					 bool freeze, struct folio *folio) {}
 
 static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
 					 unsigned long addr, pmd_t *pmdp,
@@ -523,9 +629,6 @@ static inline bool unmap_huge_pmd_locked(struct vm_area_struct *vma,
 	return false;
 }
 
-#define split_huge_pud(__vma, __pmd, __address)	\
-	do { } while (0)
-
 static inline int hugepage_madvise(struct vm_area_struct *vma,
 				   unsigned long *vm_flags, int advice)
 {
@@ -545,20 +648,6 @@ static inline void vma_adjust_trans_huge(struct vm_area_struct *vma,
 					 long adjust_next)
 {
 }
-static inline int is_swap_pmd(pmd_t pmd)
-{
-	return 0;
-}
-static inline spinlock_t *pmd_trans_huge_lock(pmd_t *pmd,
-		struct vm_area_struct *vma)
-{
-	return NULL;
-}
-static inline spinlock_t *pud_trans_huge_lock(pud_t *pud,
-		struct vm_area_struct *vma)
-{
-	return NULL;
-}
 
 static inline vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 {
@@ -606,15 +695,8 @@ static inline int next_order(unsigned long *orders, int prev)
 	return 0;
 }
 
-static inline void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
-				    unsigned long address)
-{
-}
-
-static inline int change_huge_pud(struct mmu_gather *tlb,
-				  struct vm_area_struct *vma, pud_t *pudp,
-				  unsigned long addr, pgprot_t newprot,
-				  unsigned long cp_flags)
+static inline vm_fault_t
+do_huge_pmd_anonymous_page(struct vm_fault *vmf)
 {
 	return 0;
 }
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 5a5aaee5fa1c..5e505373b113 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -628,8 +628,8 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 #endif /* __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR */
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-#ifndef __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
+#if defined(CONFIG_PGTABLE_HAS_PMD_LEAVES) && \
+	!defined(__HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL)
 static inline pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 					    unsigned long address, pmd_t *pmdp,
 					    int full)
@@ -638,14 +638,14 @@ static inline pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 }
 #endif
 
-#ifndef __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR_FULL
+#if defined(CONFIG_PGTABLE_HAS_PUD_LEAVES) && \
+	!defined(__HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR_FULL)
 static inline pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
 					    unsigned long address, pud_t *pudp,
 					    int full)
 {
 	return pudp_huge_get_and_clear(vma->vm_mm, address, pudp);
 }
-#endif
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 #ifndef __HAVE_ARCH_PTEP_GET_AND_CLEAR_FULL
@@ -894,9 +894,9 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm,
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 #endif
+
 #ifndef __HAVE_ARCH_PUDP_SET_WRPROTECT
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+#ifdef CONFIG_PGTABLE_HAS_PUD_LEAVES
 static inline void pudp_set_wrprotect(struct mm_struct *mm,
 				      unsigned long address, pud_t *pudp)
 {
@@ -910,8 +910,7 @@ static inline void pudp_set_wrprotect(struct mm_struct *mm,
 {
 	BUILD_BUG();
 }
-#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
-#endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
+#endif /* CONFIG_PGTABLE_HAS_PUD_LEAVES */
 #endif
 
 #ifndef pmdp_collapse_flush
@@ -1735,7 +1734,6 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
 #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
  * ARCHes with special requirements for evicting THP backing TLB entries can
  * implement this. Otherwise also, it can help optimize normal TLB flush in
@@ -1745,10 +1743,15 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
  * invalidate the entire TLB which is not desirable.
  * e.g. see arch/arc: flush_pmd_tlb_range
  */
+#ifdef CONFIG_PGTABLE_HAS_PMD_LEAVES
 #define flush_pmd_tlb_range(vma, addr, end)	flush_tlb_range(vma, addr, end)
-#define flush_pud_tlb_range(vma, addr, end)	flush_tlb_range(vma, addr, end)
 #else
 #define flush_pmd_tlb_range(vma, addr, end)	BUILD_BUG()
+#endif
+
+#ifdef CONFIG_PGTABLE_HAS_PUD_LEAVES
+#define flush_pud_tlb_range(vma, addr, end)	flush_tlb_range(vma, addr, end)
+#else
 #define flush_pud_tlb_range(vma, addr, end)	BUILD_BUG()
 #endif
 #endif
diff --git a/include/trace/events/huge_mapping.h b/include/trace/events/huge_mapping.h
new file mode 100644
index 000000000000..20036d090ce5
--- /dev/null
+++ b/include/trace/events/huge_mapping.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM huge_mapping
+
+#if !defined(_TRACE_HUGE_MAPPING_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _TRACE_HUGE_MAPPING_H
+
+#include <linux/types.h>
+#include <linux/tracepoint.h>
+
+DECLARE_EVENT_CLASS(migration_pmd,
+
+		TP_PROTO(unsigned long addr, unsigned long pmd),
+
+		TP_ARGS(addr, pmd),
+
+		TP_STRUCT__entry(
+			__field(unsigned long, addr)
+			__field(unsigned long, pmd)
+		),
+
+		TP_fast_assign(
+			__entry->addr = addr;
+			__entry->pmd = pmd;
+		),
+		TP_printk("addr=%lx, pmd=%lx", __entry->addr, __entry->pmd)
+);
+
+DEFINE_EVENT(migration_pmd, set_migration_pmd,
+	TP_PROTO(unsigned long addr, unsigned long pmd),
+	TP_ARGS(addr, pmd)
+);
+
+DEFINE_EVENT(migration_pmd, remove_migration_pmd,
+	TP_PROTO(unsigned long addr, unsigned long pmd),
+	TP_ARGS(addr, pmd)
+);
+#endif /* _TRACE_HUGE_MAPPING_H */
+
+/* This part must be outside protection */
+#include <trace/define_trace.h>
diff --git a/include/trace/events/thp.h b/include/trace/events/thp.h
index f50048af5fcc..395b574b1c79 100644
--- a/include/trace/events/thp.h
+++ b/include/trace/events/thp.h
@@ -66,34 +66,6 @@ DEFINE_EVENT(hugepage_update, hugepage_update_pud,
 	    TP_PROTO(unsigned long addr, unsigned long pud, unsigned long clr, unsigned long set),
 	    TP_ARGS(addr, pud, clr, set)
 );
-
-DECLARE_EVENT_CLASS(migration_pmd,
-
-		TP_PROTO(unsigned long addr, unsigned long pmd),
-
-		TP_ARGS(addr, pmd),
-
-		TP_STRUCT__entry(
-			__field(unsigned long, addr)
-			__field(unsigned long, pmd)
-		),
-
-		TP_fast_assign(
-			__entry->addr = addr;
-			__entry->pmd = pmd;
-		),
-		TP_printk("addr=%lx, pmd=%lx", __entry->addr, __entry->pmd)
-);
-
-DEFINE_EVENT(migration_pmd, set_migration_pmd,
-	TP_PROTO(unsigned long addr, unsigned long pmd),
-	TP_ARGS(addr, pmd)
-);
-
-DEFINE_EVENT(migration_pmd, remove_migration_pmd,
-	TP_PROTO(unsigned long addr, unsigned long pmd),
-	TP_ARGS(addr, pmd)
-);
 #endif /* _TRACE_THP_H */
 
 /* This part must be outside protection */
diff --git a/mm/Makefile b/mm/Makefile
index d2915f8c9dc0..3a846121b1f5 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -95,6 +95,8 @@ obj-$(CONFIG_MIGRATION) += migrate.o
 obj-$(CONFIG_NUMA) += memory-tiers.o
 obj-$(CONFIG_DEVICE_MIGRATION) += migrate_device.o
 obj-$(CONFIG_TRANSPARENT_HUGEPAGE) += huge_memory.o khugepaged.o
+obj-$(CONFIG_PGTABLE_HAS_PMD_LEAVES) += huge_mapping_pmd.o
+obj-$(CONFIG_PGTABLE_HAS_PUD_LEAVES) += huge_mapping_pud.o
 obj-$(CONFIG_PAGE_COUNTER) += page_counter.o
 obj-$(CONFIG_MEMCG_V1) += memcontrol-v1.o
 obj-$(CONFIG_MEMCG) += memcontrol.o vmpressure.o
diff --git a/mm/huge_mapping_pmd.c b/mm/huge_mapping_pmd.c
new file mode 100644
index 000000000000..7b85e2a564d6
--- /dev/null
+++ b/mm/huge_mapping_pmd.c
@@ -0,0 +1,979 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  Copyright (C) 2024  Red Hat, Inc.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/mm.h>
+#include <linux/sched.h>
+#include <linux/sched/mm.h>
+#include <linux/sched/coredump.h>
+#include <linux/sched/numa_balancing.h>
+#include <linux/highmem.h>
+#include <linux/hugetlb.h>
+#include <linux/mmu_notifier.h>
+#include <linux/rmap.h>
+#include <linux/swap.h>
+#include <linux/shrinker.h>
+#include <linux/mm_inline.h>
+#include <linux/swapops.h>
+#include <linux/backing-dev.h>
+#include <linux/dax.h>
+#include <linux/mm_types.h>
+#include <linux/khugepaged.h>
+#include <linux/freezer.h>
+#include <linux/pfn_t.h>
+#include <linux/mman.h>
+#include <linux/memremap.h>
+#include <linux/pagemap.h>
+#include <linux/debugfs.h>
+#include <linux/migrate.h>
+#include <linux/hashtable.h>
+#include <linux/userfaultfd_k.h>
+#include <linux/page_idle.h>
+#include <linux/shmem_fs.h>
+#include <linux/oom.h>
+#include <linux/numa.h>
+#include <linux/page_owner.h>
+#include <linux/sched/sysctl.h>
+#include <linux/memory-tiers.h>
+#include <linux/compat.h>
+#include <linux/pgalloc_tag.h>
+
+#include <asm/tlb.h>
+#include <asm/pgalloc.h>
+#include "internal.h"
+#include "swap.h"
+
+#define CREATE_TRACE_POINTS
+#include <trace/events/huge_mapping.h>
+
+/*
+ * Returns page table lock pointer if a given pmd maps a thp, NULL otherwise.
+ *
+ * Note that if it returns page table lock pointer, this routine returns without
+ * unlocking page table lock. So callers must unlock it.
+ */
+spinlock_t *__pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma)
+{
+	spinlock_t *ptl;
+
+	ptl = pmd_lock(vma->vm_mm, pmd);
+	if (likely(is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) ||
+		   pmd_devmap(*pmd)))
+		return ptl;
+	spin_unlock(ptl);
+	return NULL;
+}
+
+pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
+{
+	if (likely(vma->vm_flags & VM_WRITE))
+		pmd = pmd_mkwrite(pmd, vma);
+	return pmd;
+}
+
+void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
+	       pmd_t *pmd, bool write)
+{
+	pmd_t _pmd;
+
+	_pmd = pmd_mkyoung(*pmd);
+	if (write)
+		_pmd = pmd_mkdirty(_pmd);
+	if (pmdp_set_access_flags(vma, addr & HPAGE_PMD_MASK,
+				  pmd, _pmd, write))
+		update_mmu_cache_pmd(vma, addr, pmd);
+}
+
+int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
+		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
+		  struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
+{
+	spinlock_t *dst_ptl, *src_ptl;
+	struct page *src_page;
+	struct folio *src_folio;
+	pmd_t pmd;
+	pgtable_t pgtable = NULL;
+	int ret = -ENOMEM;
+
+	/* Skip if can be re-fill on fault */
+	if (!vma_is_anonymous(dst_vma))
+		return 0;
+
+	pgtable = pte_alloc_one(dst_mm);
+	if (unlikely(!pgtable))
+		goto out;
+
+	dst_ptl = pmd_lock(dst_mm, dst_pmd);
+	src_ptl = pmd_lockptr(src_mm, src_pmd);
+	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
+
+	ret = -EAGAIN;
+	pmd = *src_pmd;
+
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+	if (unlikely(is_swap_pmd(pmd))) {
+		swp_entry_t entry = pmd_to_swp_entry(pmd);
+
+		VM_BUG_ON(!is_pmd_migration_entry(pmd));
+		if (!is_readable_migration_entry(entry)) {
+			entry = make_readable_migration_entry(
+							swp_offset(entry));
+			pmd = swp_entry_to_pmd(entry);
+			if (pmd_swp_soft_dirty(*src_pmd))
+				pmd = pmd_swp_mksoft_dirty(pmd);
+			if (pmd_swp_uffd_wp(*src_pmd))
+				pmd = pmd_swp_mkuffd_wp(pmd);
+			set_pmd_at(src_mm, addr, src_pmd, pmd);
+		}
+		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
+		mm_inc_nr_ptes(dst_mm);
+		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
+		if (!userfaultfd_wp(dst_vma))
+			pmd = pmd_swp_clear_uffd_wp(pmd);
+		set_pmd_at(dst_mm, addr, dst_pmd, pmd);
+		ret = 0;
+		goto out_unlock;
+	}
+#endif
+
+	if (unlikely(!pmd_trans_huge(pmd))) {
+		pte_free(dst_mm, pgtable);
+		goto out_unlock;
+	}
+	/*
+	 * When page table lock is held, the huge zero pmd should not be
+	 * under splitting since we don't split the page itself, only pmd to
+	 * a page table.
+	 */
+	if (is_huge_zero_pmd(pmd)) {
+		/*
+		 * mm_get_huge_zero_folio() will never allocate a new
+		 * folio here, since we already have a zero page to
+		 * copy. It just takes a reference.
+		 */
+		mm_get_huge_zero_folio(dst_mm);
+		goto out_zero_page;
+	}
+
+	src_page = pmd_page(pmd);
+	VM_BUG_ON_PAGE(!PageHead(src_page), src_page);
+	src_folio = page_folio(src_page);
+
+	folio_get(src_folio);
+	if (unlikely(folio_try_dup_anon_rmap_pmd(src_folio, src_page, src_vma))) {
+		/* Page maybe pinned: split and retry the fault on PTEs. */
+		folio_put(src_folio);
+		pte_free(dst_mm, pgtable);
+		spin_unlock(src_ptl);
+		spin_unlock(dst_ptl);
+		__split_huge_pmd(src_vma, src_pmd, addr, false, NULL);
+		return -EAGAIN;
+	}
+	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
+out_zero_page:
+	mm_inc_nr_ptes(dst_mm);
+	pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
+	pmdp_set_wrprotect(src_mm, addr, src_pmd);
+	if (!userfaultfd_wp(dst_vma))
+		pmd = pmd_clear_uffd_wp(pmd);
+	pmd = pmd_mkold(pmd_wrprotect(pmd));
+	set_pmd_at(dst_mm, addr, dst_pmd, pmd);
+
+	ret = 0;
+out_unlock:
+	spin_unlock(src_ptl);
+	spin_unlock(dst_ptl);
+out:
+	return ret;
+}
+
+void huge_pmd_set_accessed(struct vm_fault *vmf)
+{
+	bool write = vmf->flags & FAULT_FLAG_WRITE;
+
+	vmf->ptl = pmd_lock(vmf->vma->vm_mm, vmf->pmd);
+	if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd)))
+		goto unlock;
+
+	touch_pmd(vmf->vma, vmf->address, vmf->pmd, write);
+
+unlock:
+	spin_unlock(vmf->ptl);
+}
+
+vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf)
+{
+	const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
+	struct vm_area_struct *vma = vmf->vma;
+	struct folio *folio;
+	struct page *page;
+	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
+	pmd_t orig_pmd = vmf->orig_pmd;
+
+	vmf->ptl = pmd_lockptr(vma->vm_mm, vmf->pmd);
+	VM_BUG_ON_VMA(!vma->anon_vma, vma);
+
+	if (is_huge_zero_pmd(orig_pmd))
+		goto fallback;
+
+	spin_lock(vmf->ptl);
+
+	if (unlikely(!pmd_same(*vmf->pmd, orig_pmd))) {
+		spin_unlock(vmf->ptl);
+		return 0;
+	}
+
+	page = pmd_page(orig_pmd);
+	folio = page_folio(page);
+	VM_BUG_ON_PAGE(!PageHead(page), page);
+
+	/* Early check when only holding the PT lock. */
+	if (PageAnonExclusive(page))
+		goto reuse;
+
+	if (!folio_trylock(folio)) {
+		folio_get(folio);
+		spin_unlock(vmf->ptl);
+		folio_lock(folio);
+		spin_lock(vmf->ptl);
+		if (unlikely(!pmd_same(*vmf->pmd, orig_pmd))) {
+			spin_unlock(vmf->ptl);
+			folio_unlock(folio);
+			folio_put(folio);
+			return 0;
+		}
+		folio_put(folio);
+	}
+
+	/* Recheck after temporarily dropping the PT lock. */
+	if (PageAnonExclusive(page)) {
+		folio_unlock(folio);
+		goto reuse;
+	}
+
+	/*
+	 * See do_wp_page(): we can only reuse the folio exclusively if
+	 * there are no additional references. Note that we always drain
+	 * the LRU cache immediately after adding a THP.
+	 */
+	if (folio_ref_count(folio) >
+			1 + folio_test_swapcache(folio) * folio_nr_pages(folio))
+		goto unlock_fallback;
+	if (folio_test_swapcache(folio))
+		folio_free_swap(folio);
+	if (folio_ref_count(folio) == 1) {
+		pmd_t entry;
+
+		folio_move_anon_rmap(folio, vma);
+		SetPageAnonExclusive(page);
+		folio_unlock(folio);
+reuse:
+		if (unlikely(unshare)) {
+			spin_unlock(vmf->ptl);
+			return 0;
+		}
+		entry = pmd_mkyoung(orig_pmd);
+		entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
+		if (pmdp_set_access_flags(vma, haddr, vmf->pmd, entry, 1))
+			update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
+		spin_unlock(vmf->ptl);
+		return 0;
+	}
+
+unlock_fallback:
+	folio_unlock(folio);
+	spin_unlock(vmf->ptl);
+fallback:
+	__split_huge_pmd(vma, vmf->pmd, vmf->address, false, NULL);
+	return VM_FAULT_FALLBACK;
+}
+
+bool can_change_pmd_writable(struct vm_area_struct *vma, unsigned long addr,
+			     pmd_t pmd)
+{
+	struct page *page;
+
+	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
+		return false;
+
+	/* Don't touch entries that are not even readable (NUMA hinting). */
+	if (pmd_protnone(pmd))
+		return false;
+
+	/* Do we need write faults for softdirty tracking? */
+	if (pmd_needs_soft_dirty_wp(vma, pmd))
+		return false;
+
+	/* Do we need write faults for uffd-wp tracking? */
+	if (userfaultfd_huge_pmd_wp(vma, pmd))
+		return false;
+
+	if (!(vma->vm_flags & VM_SHARED)) {
+		/* See can_change_pte_writable(). */
+		page = vm_normal_page_pmd(vma, addr, pmd);
+		return page && PageAnon(page) && PageAnonExclusive(page);
+	}
+
+	/* See can_change_pte_writable(). */
+	return pmd_dirty(pmd);
+}
+
+void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd)
+{
+	pgtable_t pgtable;
+
+	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
+	pte_free(mm, pgtable);
+	mm_dec_nr_ptes(mm);
+}
+
+int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		 pmd_t *pmd, unsigned long addr)
+{
+	pmd_t orig_pmd;
+	spinlock_t *ptl;
+
+	tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
+
+	ptl = __pmd_trans_huge_lock(pmd, vma);
+	if (!ptl)
+		return 0;
+	/*
+	 * For architectures like ppc64 we look at deposited pgtable
+	 * when calling pmdp_huge_get_and_clear. So do the
+	 * pgtable_trans_huge_withdraw after finishing pmdp related
+	 * operations.
+	 */
+	orig_pmd = pmdp_huge_get_and_clear_full(vma, addr, pmd,
+						tlb->fullmm);
+	arch_check_zapped_pmd(vma, orig_pmd);
+	tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
+	if (vma_is_special_huge(vma)) {
+		if (arch_needs_pgtable_deposit())
+			zap_deposited_table(tlb->mm, pmd);
+		spin_unlock(ptl);
+	} else if (is_huge_zero_pmd(orig_pmd)) {
+		zap_deposited_table(tlb->mm, pmd);
+		spin_unlock(ptl);
+	} else {
+		struct folio *folio = NULL;
+		int flush_needed = 1;
+
+		if (pmd_present(orig_pmd)) {
+			struct page *page = pmd_page(orig_pmd);
+
+			folio = page_folio(page);
+			folio_remove_rmap_pmd(folio, page, vma);
+			WARN_ON_ONCE(folio_mapcount(folio) < 0);
+			VM_BUG_ON_PAGE(!PageHead(page), page);
+		} else if (thp_migration_supported()) {
+			swp_entry_t entry;
+
+			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
+			entry = pmd_to_swp_entry(orig_pmd);
+			folio = pfn_swap_entry_folio(entry);
+			flush_needed = 0;
+		} else
+			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
+
+		if (folio_test_anon(folio)) {
+			zap_deposited_table(tlb->mm, pmd);
+			add_mm_counter(tlb->mm, MM_ANONPAGES, -HPAGE_PMD_NR);
+		} else {
+			if (arch_needs_pgtable_deposit())
+				zap_deposited_table(tlb->mm, pmd);
+			add_mm_counter(tlb->mm, mm_counter_file(folio),
+				       -HPAGE_PMD_NR);
+		}
+
+		spin_unlock(ptl);
+		if (flush_needed)
+			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
+	}
+	return 1;
+}
+
+static pmd_t move_soft_dirty_pmd(pmd_t pmd)
+{
+#ifdef CONFIG_MEM_SOFT_DIRTY
+	if (unlikely(is_pmd_migration_entry(pmd)))
+		pmd = pmd_swp_mksoft_dirty(pmd);
+	else if (pmd_present(pmd))
+		pmd = pmd_mksoft_dirty(pmd);
+#endif
+	return pmd;
+}
+
+#ifndef pmd_move_must_withdraw
+static inline int pmd_move_must_withdraw(spinlock_t *new_pmd_ptl,
+					 spinlock_t *old_pmd_ptl,
+					 struct vm_area_struct *vma)
+{
+	/*
+	 * With split pmd lock we also need to move preallocated
+	 * PTE page table if new_pmd is on different PMD page table.
+	 *
+	 * We also don't deposit and withdraw tables for file pages.
+	 */
+	return (new_pmd_ptl != old_pmd_ptl) && vma_is_anonymous(vma);
+}
+#endif
+
+bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
+		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
+{
+	spinlock_t *old_ptl, *new_ptl;
+	pmd_t pmd;
+	struct mm_struct *mm = vma->vm_mm;
+	bool force_flush = false;
+
+	/*
+	 * The destination pmd shouldn't be established, free_pgtables()
+	 * should have released it; but move_page_tables() might have already
+	 * inserted a page table, if racing against shmem/file collapse.
+	 */
+	if (!pmd_none(*new_pmd)) {
+		VM_BUG_ON(pmd_trans_huge(*new_pmd));
+		return false;
+	}
+
+	/*
+	 * We don't have to worry about the ordering of src and dst
+	 * ptlocks because exclusive mmap_lock prevents deadlock.
+	 */
+	old_ptl = __pmd_trans_huge_lock(old_pmd, vma);
+	if (old_ptl) {
+		new_ptl = pmd_lockptr(mm, new_pmd);
+		if (new_ptl != old_ptl)
+			spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
+		pmd = pmdp_huge_get_and_clear(mm, old_addr, old_pmd);
+		if (pmd_present(pmd))
+			force_flush = true;
+		VM_BUG_ON(!pmd_none(*new_pmd));
+
+		if (pmd_move_must_withdraw(new_ptl, old_ptl, vma)) {
+			pgtable_t pgtable;
+			pgtable = pgtable_trans_huge_withdraw(mm, old_pmd);
+			pgtable_trans_huge_deposit(mm, new_pmd, pgtable);
+		}
+		pmd = move_soft_dirty_pmd(pmd);
+		set_pmd_at(mm, new_addr, new_pmd, pmd);
+		if (force_flush)
+			flush_pmd_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
+		if (new_ptl != old_ptl)
+			spin_unlock(new_ptl);
+		spin_unlock(old_ptl);
+		return true;
+	}
+	return false;
+}
+
+/*
+ * Returns
+ *  - 0 if PMD could not be locked
+ *  - 1 if PMD was locked but protections unchanged and TLB flush unnecessary
+ *      or if prot_numa but THP migration is not supported
+ *  - HPAGE_PMD_NR if protections changed and TLB flush necessary
+ */
+int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		    pmd_t *pmd, unsigned long addr, pgprot_t newprot,
+		    unsigned long cp_flags)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	spinlock_t *ptl;
+	pmd_t oldpmd, entry;
+	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
+	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
+	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
+	int ret = 1;
+
+	tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
+
+	if (prot_numa && !thp_migration_supported())
+		return 1;
+
+	ptl = __pmd_trans_huge_lock(pmd, vma);
+	if (!ptl)
+		return 0;
+
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+	if (is_swap_pmd(*pmd)) {
+		swp_entry_t entry = pmd_to_swp_entry(*pmd);
+		struct folio *folio = pfn_swap_entry_folio(entry);
+		pmd_t newpmd;
+
+		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
+		if (is_writable_migration_entry(entry)) {
+			/*
+			 * A protection check is difficult so
+			 * just be safe and disable write
+			 */
+			if (folio_test_anon(folio))
+				entry = make_readable_exclusive_migration_entry(swp_offset(entry));
+			else
+				entry = make_readable_migration_entry(swp_offset(entry));
+			newpmd = swp_entry_to_pmd(entry);
+			if (pmd_swp_soft_dirty(*pmd))
+				newpmd = pmd_swp_mksoft_dirty(newpmd);
+		} else {
+			newpmd = *pmd;
+		}
+
+		if (uffd_wp)
+			newpmd = pmd_swp_mkuffd_wp(newpmd);
+		else if (uffd_wp_resolve)
+			newpmd = pmd_swp_clear_uffd_wp(newpmd);
+		if (!pmd_same(*pmd, newpmd))
+			set_pmd_at(mm, addr, pmd, newpmd);
+		goto unlock;
+	}
+#endif
+
+	if (prot_numa) {
+		struct folio *folio;
+		bool toptier;
+		/*
+		 * Avoid trapping faults against the zero page. The read-only
+		 * data is likely to be read-cached on the local CPU and
+		 * local/remote hits to the zero page are not interesting.
+		 */
+		if (is_huge_zero_pmd(*pmd))
+			goto unlock;
+
+		if (pmd_protnone(*pmd))
+			goto unlock;
+
+		folio = pmd_folio(*pmd);
+		toptier = node_is_toptier(folio_nid(folio));
+		/*
+		 * Skip scanning top tier node if normal numa
+		 * balancing is disabled
+		 */
+		if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
+		    toptier)
+			goto unlock;
+
+		if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING &&
+		    !toptier)
+			folio_xchg_access_time(folio,
+					       jiffies_to_msecs(jiffies));
+	}
+	/*
+	 * In case prot_numa, we are under mmap_read_lock(mm). It's critical
+	 * to not clear pmd intermittently to avoid race with MADV_DONTNEED
+	 * which is also under mmap_read_lock(mm):
+	 *
+	 *	CPU0:				CPU1:
+	 *				change_huge_pmd(prot_numa=1)
+	 *				 pmdp_huge_get_and_clear_notify()
+	 * madvise_dontneed()
+	 *  zap_pmd_range()
+	 *   pmd_trans_huge(*pmd) == 0 (without ptl)
+	 *   // skip the pmd
+	 *				 set_pmd_at();
+	 *				 // pmd is re-established
+	 *
+	 * The race makes MADV_DONTNEED miss the huge pmd and don't clear it
+	 * which may break userspace.
+	 *
+	 * pmdp_invalidate_ad() is required to make sure we don't miss
+	 * dirty/young flags set by hardware.
+	 */
+	oldpmd = pmdp_invalidate_ad(vma, addr, pmd);
+
+	entry = pmd_modify(oldpmd, newprot);
+	if (uffd_wp)
+		entry = pmd_mkuffd_wp(entry);
+	else if (uffd_wp_resolve)
+		/*
+		 * Leave the write bit to be handled by PF interrupt
+		 * handler, then things like COW could be properly
+		 * handled.
+		 */
+		entry = pmd_clear_uffd_wp(entry);
+
+	/* See change_pte_range(). */
+	if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) && !pmd_write(entry) &&
+	    can_change_pmd_writable(vma, addr, entry))
+		entry = pmd_mkwrite(entry, vma);
+
+	ret = HPAGE_PMD_NR;
+	set_pmd_at(mm, addr, pmd, entry);
+
+	if (huge_pmd_needs_flush(oldpmd, entry))
+		tlb_flush_pmd_range(tlb, addr, HPAGE_PMD_SIZE);
+unlock:
+	spin_unlock(ptl);
+	return ret;
+}
+
+static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
+		unsigned long haddr, bool freeze)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	struct folio *folio;
+	struct page *page;
+	pgtable_t pgtable;
+	pmd_t old_pmd, _pmd;
+	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
+	bool anon_exclusive = false, dirty = false;
+	unsigned long addr;
+	pte_t *pte;
+	int i;
+
+	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
+	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
+	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
+	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd) &&
+		  !pmd_devmap(*pmd));
+
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	count_vm_event(THP_SPLIT_PMD);
+#endif
+
+	if (!vma_is_anonymous(vma)) {
+		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
+		/*
+		 * We are going to unmap this huge page. So
+		 * just go ahead and zap it
+		 */
+		if (arch_needs_pgtable_deposit())
+			zap_deposited_table(mm, pmd);
+		if (vma_is_special_huge(vma))
+			return;
+		if (unlikely(is_pmd_migration_entry(old_pmd))) {
+			swp_entry_t entry;
+
+			entry = pmd_to_swp_entry(old_pmd);
+			folio = pfn_swap_entry_folio(entry);
+		} else {
+			page = pmd_page(old_pmd);
+			folio = page_folio(page);
+			if (!folio_test_dirty(folio) && pmd_dirty(old_pmd))
+				folio_mark_dirty(folio);
+			if (!folio_test_referenced(folio) && pmd_young(old_pmd))
+				folio_set_referenced(folio);
+			folio_remove_rmap_pmd(folio, page, vma);
+			folio_put(folio);
+		}
+		add_mm_counter(mm, mm_counter_file(folio), -HPAGE_PMD_NR);
+		return;
+	}
+
+	if (is_huge_zero_pmd(*pmd)) {
+		/*
+		 * FIXME: Do we want to invalidate secondary mmu by calling
+		 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
+		 * inside __split_huge_pmd() ?
+		 *
+		 * We are going from a zero huge page write protected to zero
+		 * small page also write protected so it does not seems useful
+		 * to invalidate secondary mmu at this time.
+		 */
+		return __split_huge_zero_page_pmd(vma, haddr, pmd);
+	}
+
+	pmd_migration = is_pmd_migration_entry(*pmd);
+	if (unlikely(pmd_migration)) {
+		swp_entry_t entry;
+
+		old_pmd = *pmd;
+		entry = pmd_to_swp_entry(old_pmd);
+		page = pfn_swap_entry_to_page(entry);
+		write = is_writable_migration_entry(entry);
+		if (PageAnon(page))
+			anon_exclusive = is_readable_exclusive_migration_entry(entry);
+		young = is_migration_entry_young(entry);
+		dirty = is_migration_entry_dirty(entry);
+		soft_dirty = pmd_swp_soft_dirty(old_pmd);
+		uffd_wp = pmd_swp_uffd_wp(old_pmd);
+	} else {
+		/*
+		 * Up to this point the pmd is present and huge and userland has
+		 * the whole access to the hugepage during the split (which
+		 * happens in place). If we overwrite the pmd with the not-huge
+		 * version pointing to the pte here (which of course we could if
+		 * all CPUs were bug free), userland could trigger a small page
+		 * size TLB miss on the small sized TLB while the hugepage TLB
+		 * entry is still established in the huge TLB. Some CPU doesn't
+		 * like that. See
+		 * http://support.amd.com/TechDocs/41322_10h_Rev_Gd.pdf, Erratum
+		 * 383 on page 105. Intel should be safe but is also warns that
+		 * it's only safe if the permission and cache attributes of the
+		 * two entries loaded in the two TLB is identical (which should
+		 * be the case here). But it is generally safer to never allow
+		 * small and huge TLB entries for the same virtual address to be
+		 * loaded simultaneously. So instead of doing "pmd_populate();
+		 * flush_pmd_tlb_range();" we first mark the current pmd
+		 * notpresent (atomically because here the pmd_trans_huge must
+		 * remain set at all times on the pmd until the split is
+		 * complete for this pmd), then we flush the SMP TLB and finally
+		 * we write the non-huge version of the pmd entry with
+		 * pmd_populate.
+		 */
+		old_pmd = pmdp_invalidate(vma, haddr, pmd);
+		page = pmd_page(old_pmd);
+		folio = page_folio(page);
+		if (pmd_dirty(old_pmd)) {
+			dirty = true;
+			folio_set_dirty(folio);
+		}
+		write = pmd_write(old_pmd);
+		young = pmd_young(old_pmd);
+		soft_dirty = pmd_soft_dirty(old_pmd);
+		uffd_wp = pmd_uffd_wp(old_pmd);
+
+		VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
+		VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
+
+		/*
+		 * Without "freeze", we'll simply split the PMD, propagating the
+		 * PageAnonExclusive() flag for each PTE by setting it for
+		 * each subpage -- no need to (temporarily) clear.
+		 *
+		 * With "freeze" we want to replace mapped pages by
+		 * migration entries right away. This is only possible if we
+		 * managed to clear PageAnonExclusive() -- see
+		 * set_pmd_migration_entry().
+		 *
+		 * In case we cannot clear PageAnonExclusive(), split the PMD
+		 * only and let try_to_migrate_one() fail later.
+		 *
+		 * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
+		 */
+		anon_exclusive = PageAnonExclusive(page);
+		if (freeze && anon_exclusive &&
+		    folio_try_share_anon_rmap_pmd(folio, page))
+			freeze = false;
+		if (!freeze) {
+			rmap_t rmap_flags = RMAP_NONE;
+
+			folio_ref_add(folio, HPAGE_PMD_NR - 1);
+			if (anon_exclusive)
+				rmap_flags |= RMAP_EXCLUSIVE;
+			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
+						 vma, haddr, rmap_flags);
+		}
+	}
+
+	/*
+	 * Withdraw the table only after we mark the pmd entry invalid.
+	 * This's critical for some architectures (Power).
+	 */
+	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
+	pmd_populate(mm, &_pmd, pgtable);
+
+	pte = pte_offset_map(&_pmd, haddr);
+	VM_BUG_ON(!pte);
+
+	/*
+	 * Note that NUMA hinting access restrictions are not transferred to
+	 * avoid any possibility of altering permissions across VMAs.
+	 */
+	if (freeze || pmd_migration) {
+		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
+			pte_t entry;
+			swp_entry_t swp_entry;
+
+			if (write)
+				swp_entry = make_writable_migration_entry(
+							page_to_pfn(page + i));
+			else if (anon_exclusive)
+				swp_entry = make_readable_exclusive_migration_entry(
+							page_to_pfn(page + i));
+			else
+				swp_entry = make_readable_migration_entry(
+							page_to_pfn(page + i));
+			if (young)
+				swp_entry = make_migration_entry_young(swp_entry);
+			if (dirty)
+				swp_entry = make_migration_entry_dirty(swp_entry);
+			entry = swp_entry_to_pte(swp_entry);
+			if (soft_dirty)
+				entry = pte_swp_mksoft_dirty(entry);
+			if (uffd_wp)
+				entry = pte_swp_mkuffd_wp(entry);
+
+			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
+			set_pte_at(mm, addr, pte + i, entry);
+		}
+	} else {
+		pte_t entry;
+
+		entry = mk_pte(page, READ_ONCE(vma->vm_page_prot));
+		if (write)
+			entry = pte_mkwrite(entry, vma);
+		if (!young)
+			entry = pte_mkold(entry);
+		/* NOTE: this may set soft-dirty too on some archs */
+		if (dirty)
+			entry = pte_mkdirty(entry);
+		if (soft_dirty)
+			entry = pte_mksoft_dirty(entry);
+		if (uffd_wp)
+			entry = pte_mkuffd_wp(entry);
+
+		for (i = 0; i < HPAGE_PMD_NR; i++)
+			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
+
+		set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
+	}
+	pte_unmap(pte);
+
+	if (!pmd_migration)
+		folio_remove_rmap_pmd(folio, page, vma);
+	if (freeze)
+		put_page(page);
+
+	smp_wmb(); /* make pte visible before pmd */
+	pmd_populate(mm, pmd, pgtable);
+}
+
+void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
+			   pmd_t *pmd, bool freeze, struct folio *folio)
+{
+	VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
+	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
+	VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
+	VM_BUG_ON(freeze && !folio);
+
+	/*
+	 * When the caller requests to set up a migration entry, we
+	 * require a folio to check the PMD against. Otherwise, there
+	 * is a risk of replacing the wrong folio.
+	 */
+	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
+	    is_pmd_migration_entry(*pmd)) {
+		if (folio && folio != pmd_folio(*pmd))
+			return;
+		__split_huge_pmd_locked(vma, pmd, address, freeze);
+	}
+}
+
+void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
+		unsigned long address, bool freeze, struct folio *folio)
+{
+	spinlock_t *ptl;
+	struct mmu_notifier_range range;
+
+	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
+				address & HPAGE_PMD_MASK,
+				(address & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE);
+	mmu_notifier_invalidate_range_start(&range);
+	ptl = pmd_lock(vma->vm_mm, pmd);
+	split_huge_pmd_locked(vma, range.start, pmd, freeze, folio);
+	spin_unlock(ptl);
+	mmu_notifier_invalidate_range_end(&range);
+}
+
+void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
+		bool freeze, struct folio *folio)
+{
+	pmd_t *pmd = mm_find_pmd(vma->vm_mm, address);
+
+	if (!pmd)
+		return;
+
+	__split_huge_pmd(vma, pmd, address, freeze, folio);
+}
+
+#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
+int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
+		struct page *page)
+{
+	struct folio *folio = page_folio(page);
+	struct vm_area_struct *vma = pvmw->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long address = pvmw->address;
+	bool anon_exclusive;
+	pmd_t pmdval;
+	swp_entry_t entry;
+	pmd_t pmdswp;
+
+	if (!(pvmw->pmd && !pvmw->pte))
+		return 0;
+
+	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
+	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
+
+	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
+	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
+	if (anon_exclusive && folio_try_share_anon_rmap_pmd(folio, page)) {
+		set_pmd_at(mm, address, pvmw->pmd, pmdval);
+		return -EBUSY;
+	}
+
+	if (pmd_dirty(pmdval))
+		folio_mark_dirty(folio);
+	if (pmd_write(pmdval))
+		entry = make_writable_migration_entry(page_to_pfn(page));
+	else if (anon_exclusive)
+		entry = make_readable_exclusive_migration_entry(page_to_pfn(page));
+	else
+		entry = make_readable_migration_entry(page_to_pfn(page));
+	if (pmd_young(pmdval))
+		entry = make_migration_entry_young(entry);
+	if (pmd_dirty(pmdval))
+		entry = make_migration_entry_dirty(entry);
+	pmdswp = swp_entry_to_pmd(entry);
+	if (pmd_soft_dirty(pmdval))
+		pmdswp = pmd_swp_mksoft_dirty(pmdswp);
+	if (pmd_uffd_wp(pmdval))
+		pmdswp = pmd_swp_mkuffd_wp(pmdswp);
+	set_pmd_at(mm, address, pvmw->pmd, pmdswp);
+	folio_remove_rmap_pmd(folio, page, vma);
+	folio_put(folio);
+	trace_set_migration_pmd(address, pmd_val(pmdswp));
+
+	return 0;
+}
+
+void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
+{
+	struct folio *folio = page_folio(new);
+	struct vm_area_struct *vma = pvmw->vma;
+	struct mm_struct *mm = vma->vm_mm;
+	unsigned long address = pvmw->address;
+	unsigned long haddr = address & HPAGE_PMD_MASK;
+	pmd_t pmde;
+	swp_entry_t entry;
+
+	if (!(pvmw->pmd && !pvmw->pte))
+		return;
+
+	entry = pmd_to_swp_entry(*pvmw->pmd);
+	folio_get(folio);
+	pmde = mk_huge_pmd(new, READ_ONCE(vma->vm_page_prot));
+	if (pmd_swp_soft_dirty(*pvmw->pmd))
+		pmde = pmd_mksoft_dirty(pmde);
+	if (is_writable_migration_entry(entry))
+		pmde = pmd_mkwrite(pmde, vma);
+	if (pmd_swp_uffd_wp(*pvmw->pmd))
+		pmde = pmd_mkuffd_wp(pmde);
+	if (!is_migration_entry_young(entry))
+		pmde = pmd_mkold(pmde);
+	/* NOTE: this may contain setting soft-dirty on some archs */
+	if (folio_test_dirty(folio) && is_migration_entry_dirty(entry))
+		pmde = pmd_mkdirty(pmde);
+
+	if (folio_test_anon(folio)) {
+		rmap_t rmap_flags = RMAP_NONE;
+
+		if (!is_readable_migration_entry(entry))
+			rmap_flags |= RMAP_EXCLUSIVE;
+
+		folio_add_anon_rmap_pmd(folio, new, vma, haddr, rmap_flags);
+	} else {
+		folio_add_file_rmap_pmd(folio, new, vma);
+	}
+	VM_BUG_ON(pmd_write(pmde) && folio_test_anon(folio) && !PageAnonExclusive(new));
+	set_pmd_at(mm, haddr, pvmw->pmd, pmde);
+
+	/* No need to invalidate - it was non-present before */
+	update_mmu_cache_pmd(vma, address, pvmw->pmd);
+	trace_remove_migration_pmd(address, pmd_val(pmde));
+}
+#endif
diff --git a/mm/huge_mapping_pud.c b/mm/huge_mapping_pud.c
new file mode 100644
index 000000000000..c3a6bffe2871
--- /dev/null
+++ b/mm/huge_mapping_pud.c
@@ -0,0 +1,235 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ *  Copyright (C) 2024  Red Hat, Inc.
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/mm.h>
+#include <linux/sched.h>
+#include <linux/sched/mm.h>
+#include <linux/sched/coredump.h>
+#include <linux/sched/numa_balancing.h>
+#include <linux/highmem.h>
+#include <linux/hugetlb.h>
+#include <linux/mmu_notifier.h>
+#include <linux/rmap.h>
+#include <linux/swap.h>
+#include <linux/shrinker.h>
+#include <linux/mm_inline.h>
+#include <linux/swapops.h>
+#include <linux/backing-dev.h>
+#include <linux/dax.h>
+#include <linux/mm_types.h>
+#include <linux/khugepaged.h>
+#include <linux/freezer.h>
+#include <linux/pfn_t.h>
+#include <linux/mman.h>
+#include <linux/memremap.h>
+#include <linux/pagemap.h>
+#include <linux/debugfs.h>
+#include <linux/migrate.h>
+#include <linux/hashtable.h>
+#include <linux/userfaultfd_k.h>
+#include <linux/page_idle.h>
+#include <linux/shmem_fs.h>
+#include <linux/oom.h>
+#include <linux/numa.h>
+#include <linux/page_owner.h>
+#include <linux/sched/sysctl.h>
+#include <linux/memory-tiers.h>
+#include <linux/compat.h>
+#include <linux/pgalloc_tag.h>
+
+#include <asm/tlb.h>
+#include <asm/pgalloc.h>
+#include "internal.h"
+#include "swap.h"
+
+/*
+ * Returns page table lock pointer if a given pud maps a thp, NULL otherwise.
+ *
+ * Note that if it returns page table lock pointer, this routine returns without
+ * unlocking page table lock. So callers must unlock it.
+ */
+spinlock_t *__pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma)
+{
+	spinlock_t *ptl;
+
+	ptl = pud_lock(vma->vm_mm, pud);
+	if (likely(pud_trans_huge(*pud) || pud_devmap(*pud)))
+		return ptl;
+	spin_unlock(ptl);
+	return NULL;
+}
+
+void touch_pud(struct vm_area_struct *vma, unsigned long addr,
+	       pud_t *pud, bool write)
+{
+	pud_t _pud;
+
+	_pud = pud_mkyoung(*pud);
+	if (write)
+		_pud = pud_mkdirty(_pud);
+	if (pudp_set_access_flags(vma, addr & HPAGE_PUD_MASK,
+				  pud, _pud, write))
+		update_mmu_cache_pud(vma, addr, pud);
+}
+
+int copy_huge_pud(struct mm_struct *dst_mm, struct mm_struct *src_mm,
+		  pud_t *dst_pud, pud_t *src_pud, unsigned long addr,
+		  struct vm_area_struct *vma)
+{
+	spinlock_t *dst_ptl, *src_ptl;
+	pud_t pud;
+	int ret;
+
+	dst_ptl = pud_lock(dst_mm, dst_pud);
+	src_ptl = pud_lockptr(src_mm, src_pud);
+	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
+
+	ret = -EAGAIN;
+	pud = *src_pud;
+	if (unlikely(!pud_trans_huge(pud) && !pud_devmap(pud)))
+		goto out_unlock;
+
+	/*
+	 * When page table lock is held, the huge zero pud should not be
+	 * under splitting since we don't split the page itself, only pud to
+	 * a page table.
+	 */
+	if (is_huge_zero_pud(pud)) {
+		/* No huge zero pud yet */
+	}
+
+	/*
+	 * TODO: once we support anonymous pages, use
+	 * folio_try_dup_anon_rmap_*() and split if duplicating fails.
+	 */
+	pudp_set_wrprotect(src_mm, addr, src_pud);
+	pud = pud_mkold(pud_wrprotect(pud));
+	set_pud_at(dst_mm, addr, dst_pud, pud);
+
+	ret = 0;
+out_unlock:
+	spin_unlock(src_ptl);
+	spin_unlock(dst_ptl);
+	return ret;
+}
+
+void huge_pud_set_accessed(struct vm_fault *vmf, pud_t orig_pud)
+{
+	bool write = vmf->flags & FAULT_FLAG_WRITE;
+
+	vmf->ptl = pud_lock(vmf->vma->vm_mm, vmf->pud);
+	if (unlikely(!pud_same(*vmf->pud, orig_pud)))
+		goto unlock;
+
+	touch_pud(vmf->vma, vmf->address, vmf->pud, write);
+unlock:
+	spin_unlock(vmf->ptl);
+}
+
+/*
+ * Returns:
+ *
+ * - 0: if pud leaf changed from under us
+ * - 1: if pud can be skipped
+ * - HPAGE_PUD_NR: if pud was successfully processed
+ */
+int change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		    pud_t *pudp, unsigned long addr, pgprot_t newprot,
+		    unsigned long cp_flags)
+{
+	struct mm_struct *mm = vma->vm_mm;
+	pud_t oldpud, entry;
+	spinlock_t *ptl;
+
+	tlb_change_page_size(tlb, HPAGE_PUD_SIZE);
+
+	/* NUMA balancing doesn't apply to dax */
+	if (cp_flags & MM_CP_PROT_NUMA)
+		return 1;
+
+	/*
+	 * Huge entries on userfault-wp only works with anonymous, while we
+	 * don't have anonymous PUDs yet.
+	 */
+	if (WARN_ON_ONCE(cp_flags & MM_CP_UFFD_WP_ALL))
+		return 1;
+
+	ptl = __pud_trans_huge_lock(pudp, vma);
+	if (!ptl)
+		return 0;
+
+	/*
+	 * Can't clear PUD or it can race with concurrent zapping.  See
+	 * change_huge_pmd().
+	 */
+	oldpud = pudp_invalidate(vma, addr, pudp);
+	entry = pud_modify(oldpud, newprot);
+	set_pud_at(mm, addr, pudp, entry);
+	tlb_flush_pud_range(tlb, addr, HPAGE_PUD_SIZE);
+
+	spin_unlock(ptl);
+	return HPAGE_PUD_NR;
+}
+
+int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
+		 pud_t *pud, unsigned long addr)
+{
+	spinlock_t *ptl;
+	pud_t orig_pud;
+
+	ptl = __pud_trans_huge_lock(pud, vma);
+	if (!ptl)
+		return 0;
+
+	orig_pud = pudp_huge_get_and_clear_full(vma, addr, pud, tlb->fullmm);
+	arch_check_zapped_pud(vma, orig_pud);
+	tlb_remove_pud_tlb_entry(tlb, pud, addr);
+	if (vma_is_special_huge(vma)) {
+		spin_unlock(ptl);
+		/* No zero page support yet */
+	} else {
+		/* No support for anonymous PUD pages yet */
+		BUG();
+	}
+	return 1;
+}
+
+static void __split_huge_pud_locked(struct vm_area_struct *vma, pud_t *pud,
+		unsigned long haddr)
+{
+	VM_BUG_ON(haddr & ~HPAGE_PUD_MASK);
+	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
+	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PUD_SIZE, vma);
+	VM_BUG_ON(!pud_trans_huge(*pud) && !pud_devmap(*pud));
+
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && \
+	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
+	count_vm_event(THP_SPLIT_PUD);
+#endif
+
+	pudp_huge_clear_flush(vma, haddr, pud);
+}
+
+void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
+		unsigned long address)
+{
+	spinlock_t *ptl;
+	struct mmu_notifier_range range;
+
+	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
+				address & HPAGE_PUD_MASK,
+				(address & HPAGE_PUD_MASK) + HPAGE_PUD_SIZE);
+	mmu_notifier_invalidate_range_start(&range);
+	ptl = pud_lock(vma->vm_mm, pud);
+	if (unlikely(!pud_trans_huge(*pud) && !pud_devmap(*pud)))
+		goto out;
+	__split_huge_pud_locked(vma, pud, range.start);
+
+out:
+	spin_unlock(ptl);
+	mmu_notifier_invalidate_range_end(&range);
+}
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 554dec14b768..11aee24ce21a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -838,13 +838,6 @@ static int __init setup_transparent_hugepage(char *str)
 }
 __setup("transparent_hugepage=", setup_transparent_hugepage);
 
-pmd_t maybe_pmd_mkwrite(pmd_t pmd, struct vm_area_struct *vma)
-{
-	if (likely(vma->vm_flags & VM_WRITE))
-		pmd = pmd_mkwrite(pmd, vma);
-	return pmd;
-}
-
 #ifdef CONFIG_MEMCG
 static inline
 struct deferred_split *get_deferred_split_queue(struct folio *folio)
@@ -1313,19 +1306,6 @@ vm_fault_t vmf_insert_pfn_pud(struct vm_fault *vmf, pfn_t pfn, bool write)
 EXPORT_SYMBOL_GPL(vmf_insert_pfn_pud);
 #endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
 
-void touch_pmd(struct vm_area_struct *vma, unsigned long addr,
-	       pmd_t *pmd, bool write)
-{
-	pmd_t _pmd;
-
-	_pmd = pmd_mkyoung(*pmd);
-	if (write)
-		_pmd = pmd_mkdirty(_pmd);
-	if (pmdp_set_access_flags(vma, addr & HPAGE_PMD_MASK,
-				  pmd, _pmd, write))
-		update_mmu_cache_pmd(vma, addr, pmd);
-}
-
 struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
 		pmd_t *pmd, int flags, struct dev_pagemap **pgmap)
 {
@@ -1366,309 +1346,6 @@ struct page *follow_devmap_pmd(struct vm_area_struct *vma, unsigned long addr,
 	return page;
 }
 
-int copy_huge_pmd(struct mm_struct *dst_mm, struct mm_struct *src_mm,
-		  pmd_t *dst_pmd, pmd_t *src_pmd, unsigned long addr,
-		  struct vm_area_struct *dst_vma, struct vm_area_struct *src_vma)
-{
-	spinlock_t *dst_ptl, *src_ptl;
-	struct page *src_page;
-	struct folio *src_folio;
-	pmd_t pmd;
-	pgtable_t pgtable = NULL;
-	int ret = -ENOMEM;
-
-	/* Skip if can be re-fill on fault */
-	if (!vma_is_anonymous(dst_vma))
-		return 0;
-
-	pgtable = pte_alloc_one(dst_mm);
-	if (unlikely(!pgtable))
-		goto out;
-
-	dst_ptl = pmd_lock(dst_mm, dst_pmd);
-	src_ptl = pmd_lockptr(src_mm, src_pmd);
-	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
-
-	ret = -EAGAIN;
-	pmd = *src_pmd;
-
-#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-	if (unlikely(is_swap_pmd(pmd))) {
-		swp_entry_t entry = pmd_to_swp_entry(pmd);
-
-		VM_BUG_ON(!is_pmd_migration_entry(pmd));
-		if (!is_readable_migration_entry(entry)) {
-			entry = make_readable_migration_entry(
-							swp_offset(entry));
-			pmd = swp_entry_to_pmd(entry);
-			if (pmd_swp_soft_dirty(*src_pmd))
-				pmd = pmd_swp_mksoft_dirty(pmd);
-			if (pmd_swp_uffd_wp(*src_pmd))
-				pmd = pmd_swp_mkuffd_wp(pmd);
-			set_pmd_at(src_mm, addr, src_pmd, pmd);
-		}
-		add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
-		mm_inc_nr_ptes(dst_mm);
-		pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
-		if (!userfaultfd_wp(dst_vma))
-			pmd = pmd_swp_clear_uffd_wp(pmd);
-		set_pmd_at(dst_mm, addr, dst_pmd, pmd);
-		ret = 0;
-		goto out_unlock;
-	}
-#endif
-
-	if (unlikely(!pmd_trans_huge(pmd))) {
-		pte_free(dst_mm, pgtable);
-		goto out_unlock;
-	}
-	/*
-	 * When page table lock is held, the huge zero pmd should not be
-	 * under splitting since we don't split the page itself, only pmd to
-	 * a page table.
-	 */
-	if (is_huge_zero_pmd(pmd)) {
-		/*
-		 * mm_get_huge_zero_folio() will never allocate a new
-		 * folio here, since we already have a zero page to
-		 * copy. It just takes a reference.
-		 */
-		mm_get_huge_zero_folio(dst_mm);
-		goto out_zero_page;
-	}
-
-	src_page = pmd_page(pmd);
-	VM_BUG_ON_PAGE(!PageHead(src_page), src_page);
-	src_folio = page_folio(src_page);
-
-	folio_get(src_folio);
-	if (unlikely(folio_try_dup_anon_rmap_pmd(src_folio, src_page, src_vma))) {
-		/* Page maybe pinned: split and retry the fault on PTEs. */
-		folio_put(src_folio);
-		pte_free(dst_mm, pgtable);
-		spin_unlock(src_ptl);
-		spin_unlock(dst_ptl);
-		__split_huge_pmd(src_vma, src_pmd, addr, false, NULL);
-		return -EAGAIN;
-	}
-	add_mm_counter(dst_mm, MM_ANONPAGES, HPAGE_PMD_NR);
-out_zero_page:
-	mm_inc_nr_ptes(dst_mm);
-	pgtable_trans_huge_deposit(dst_mm, dst_pmd, pgtable);
-	pmdp_set_wrprotect(src_mm, addr, src_pmd);
-	if (!userfaultfd_wp(dst_vma))
-		pmd = pmd_clear_uffd_wp(pmd);
-	pmd = pmd_mkold(pmd_wrprotect(pmd));
-	set_pmd_at(dst_mm, addr, dst_pmd, pmd);
-
-	ret = 0;
-out_unlock:
-	spin_unlock(src_ptl);
-	spin_unlock(dst_ptl);
-out:
-	return ret;
-}
-
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-void touch_pud(struct vm_area_struct *vma, unsigned long addr,
-	       pud_t *pud, bool write)
-{
-	pud_t _pud;
-
-	_pud = pud_mkyoung(*pud);
-	if (write)
-		_pud = pud_mkdirty(_pud);
-	if (pudp_set_access_flags(vma, addr & HPAGE_PUD_MASK,
-				  pud, _pud, write))
-		update_mmu_cache_pud(vma, addr, pud);
-}
-
-int copy_huge_pud(struct mm_struct *dst_mm, struct mm_struct *src_mm,
-		  pud_t *dst_pud, pud_t *src_pud, unsigned long addr,
-		  struct vm_area_struct *vma)
-{
-	spinlock_t *dst_ptl, *src_ptl;
-	pud_t pud;
-	int ret;
-
-	dst_ptl = pud_lock(dst_mm, dst_pud);
-	src_ptl = pud_lockptr(src_mm, src_pud);
-	spin_lock_nested(src_ptl, SINGLE_DEPTH_NESTING);
-
-	ret = -EAGAIN;
-	pud = *src_pud;
-	if (unlikely(!pud_trans_huge(pud) && !pud_devmap(pud)))
-		goto out_unlock;
-
-	/*
-	 * When page table lock is held, the huge zero pud should not be
-	 * under splitting since we don't split the page itself, only pud to
-	 * a page table.
-	 */
-	if (is_huge_zero_pud(pud)) {
-		/* No huge zero pud yet */
-	}
-
-	/*
-	 * TODO: once we support anonymous pages, use
-	 * folio_try_dup_anon_rmap_*() and split if duplicating fails.
-	 */
-	pudp_set_wrprotect(src_mm, addr, src_pud);
-	pud = pud_mkold(pud_wrprotect(pud));
-	set_pud_at(dst_mm, addr, dst_pud, pud);
-
-	ret = 0;
-out_unlock:
-	spin_unlock(src_ptl);
-	spin_unlock(dst_ptl);
-	return ret;
-}
-
-void huge_pud_set_accessed(struct vm_fault *vmf, pud_t orig_pud)
-{
-	bool write = vmf->flags & FAULT_FLAG_WRITE;
-
-	vmf->ptl = pud_lock(vmf->vma->vm_mm, vmf->pud);
-	if (unlikely(!pud_same(*vmf->pud, orig_pud)))
-		goto unlock;
-
-	touch_pud(vmf->vma, vmf->address, vmf->pud, write);
-unlock:
-	spin_unlock(vmf->ptl);
-}
-#endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
-
-void huge_pmd_set_accessed(struct vm_fault *vmf)
-{
-	bool write = vmf->flags & FAULT_FLAG_WRITE;
-
-	vmf->ptl = pmd_lock(vmf->vma->vm_mm, vmf->pmd);
-	if (unlikely(!pmd_same(*vmf->pmd, vmf->orig_pmd)))
-		goto unlock;
-
-	touch_pmd(vmf->vma, vmf->address, vmf->pmd, write);
-
-unlock:
-	spin_unlock(vmf->ptl);
-}
-
-vm_fault_t do_huge_pmd_wp_page(struct vm_fault *vmf)
-{
-	const bool unshare = vmf->flags & FAULT_FLAG_UNSHARE;
-	struct vm_area_struct *vma = vmf->vma;
-	struct folio *folio;
-	struct page *page;
-	unsigned long haddr = vmf->address & HPAGE_PMD_MASK;
-	pmd_t orig_pmd = vmf->orig_pmd;
-
-	vmf->ptl = pmd_lockptr(vma->vm_mm, vmf->pmd);
-	VM_BUG_ON_VMA(!vma->anon_vma, vma);
-
-	if (is_huge_zero_pmd(orig_pmd))
-		goto fallback;
-
-	spin_lock(vmf->ptl);
-
-	if (unlikely(!pmd_same(*vmf->pmd, orig_pmd))) {
-		spin_unlock(vmf->ptl);
-		return 0;
-	}
-
-	page = pmd_page(orig_pmd);
-	folio = page_folio(page);
-	VM_BUG_ON_PAGE(!PageHead(page), page);
-
-	/* Early check when only holding the PT lock. */
-	if (PageAnonExclusive(page))
-		goto reuse;
-
-	if (!folio_trylock(folio)) {
-		folio_get(folio);
-		spin_unlock(vmf->ptl);
-		folio_lock(folio);
-		spin_lock(vmf->ptl);
-		if (unlikely(!pmd_same(*vmf->pmd, orig_pmd))) {
-			spin_unlock(vmf->ptl);
-			folio_unlock(folio);
-			folio_put(folio);
-			return 0;
-		}
-		folio_put(folio);
-	}
-
-	/* Recheck after temporarily dropping the PT lock. */
-	if (PageAnonExclusive(page)) {
-		folio_unlock(folio);
-		goto reuse;
-	}
-
-	/*
-	 * See do_wp_page(): we can only reuse the folio exclusively if
-	 * there are no additional references. Note that we always drain
-	 * the LRU cache immediately after adding a THP.
-	 */
-	if (folio_ref_count(folio) >
-			1 + folio_test_swapcache(folio) * folio_nr_pages(folio))
-		goto unlock_fallback;
-	if (folio_test_swapcache(folio))
-		folio_free_swap(folio);
-	if (folio_ref_count(folio) == 1) {
-		pmd_t entry;
-
-		folio_move_anon_rmap(folio, vma);
-		SetPageAnonExclusive(page);
-		folio_unlock(folio);
-reuse:
-		if (unlikely(unshare)) {
-			spin_unlock(vmf->ptl);
-			return 0;
-		}
-		entry = pmd_mkyoung(orig_pmd);
-		entry = maybe_pmd_mkwrite(pmd_mkdirty(entry), vma);
-		if (pmdp_set_access_flags(vma, haddr, vmf->pmd, entry, 1))
-			update_mmu_cache_pmd(vma, vmf->address, vmf->pmd);
-		spin_unlock(vmf->ptl);
-		return 0;
-	}
-
-unlock_fallback:
-	folio_unlock(folio);
-	spin_unlock(vmf->ptl);
-fallback:
-	__split_huge_pmd(vma, vmf->pmd, vmf->address, false, NULL);
-	return VM_FAULT_FALLBACK;
-}
-
-static inline bool can_change_pmd_writable(struct vm_area_struct *vma,
-					   unsigned long addr, pmd_t pmd)
-{
-	struct page *page;
-
-	if (WARN_ON_ONCE(!(vma->vm_flags & VM_WRITE)))
-		return false;
-
-	/* Don't touch entries that are not even readable (NUMA hinting). */
-	if (pmd_protnone(pmd))
-		return false;
-
-	/* Do we need write faults for softdirty tracking? */
-	if (pmd_needs_soft_dirty_wp(vma, pmd))
-		return false;
-
-	/* Do we need write faults for uffd-wp tracking? */
-	if (userfaultfd_huge_pmd_wp(vma, pmd))
-		return false;
-
-	if (!(vma->vm_flags & VM_SHARED)) {
-		/* See can_change_pte_writable(). */
-		page = vm_normal_page_pmd(vma, addr, pmd);
-		return page && PageAnon(page) && PageAnonExclusive(page);
-	}
-
-	/* See can_change_pte_writable(). */
-	return pmd_dirty(pmd);
-}
-
 /* NUMA hinting page fault entry point for trans huge pmds */
 vm_fault_t do_huge_pmd_numa_page(struct vm_fault *vmf)
 {
@@ -1830,342 +1507,6 @@ bool madvise_free_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	return ret;
 }
 
-static inline void zap_deposited_table(struct mm_struct *mm, pmd_t *pmd)
-{
-	pgtable_t pgtable;
-
-	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
-	pte_free(mm, pgtable);
-	mm_dec_nr_ptes(mm);
-}
-
-int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
-		 pmd_t *pmd, unsigned long addr)
-{
-	pmd_t orig_pmd;
-	spinlock_t *ptl;
-
-	tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
-
-	ptl = __pmd_trans_huge_lock(pmd, vma);
-	if (!ptl)
-		return 0;
-	/*
-	 * For architectures like ppc64 we look at deposited pgtable
-	 * when calling pmdp_huge_get_and_clear. So do the
-	 * pgtable_trans_huge_withdraw after finishing pmdp related
-	 * operations.
-	 */
-	orig_pmd = pmdp_huge_get_and_clear_full(vma, addr, pmd,
-						tlb->fullmm);
-	arch_check_zapped_pmd(vma, orig_pmd);
-	tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
-	if (vma_is_special_huge(vma)) {
-		if (arch_needs_pgtable_deposit())
-			zap_deposited_table(tlb->mm, pmd);
-		spin_unlock(ptl);
-	} else if (is_huge_zero_pmd(orig_pmd)) {
-		zap_deposited_table(tlb->mm, pmd);
-		spin_unlock(ptl);
-	} else {
-		struct folio *folio = NULL;
-		int flush_needed = 1;
-
-		if (pmd_present(orig_pmd)) {
-			struct page *page = pmd_page(orig_pmd);
-
-			folio = page_folio(page);
-			folio_remove_rmap_pmd(folio, page, vma);
-			WARN_ON_ONCE(folio_mapcount(folio) < 0);
-			VM_BUG_ON_PAGE(!PageHead(page), page);
-		} else if (thp_migration_supported()) {
-			swp_entry_t entry;
-
-			VM_BUG_ON(!is_pmd_migration_entry(orig_pmd));
-			entry = pmd_to_swp_entry(orig_pmd);
-			folio = pfn_swap_entry_folio(entry);
-			flush_needed = 0;
-		} else
-			WARN_ONCE(1, "Non present huge pmd without pmd migration enabled!");
-
-		if (folio_test_anon(folio)) {
-			zap_deposited_table(tlb->mm, pmd);
-			add_mm_counter(tlb->mm, MM_ANONPAGES, -HPAGE_PMD_NR);
-		} else {
-			if (arch_needs_pgtable_deposit())
-				zap_deposited_table(tlb->mm, pmd);
-			add_mm_counter(tlb->mm, mm_counter_file(folio),
-				       -HPAGE_PMD_NR);
-		}
-
-		spin_unlock(ptl);
-		if (flush_needed)
-			tlb_remove_page_size(tlb, &folio->page, HPAGE_PMD_SIZE);
-	}
-	return 1;
-}
-
-#ifndef pmd_move_must_withdraw
-static inline int pmd_move_must_withdraw(spinlock_t *new_pmd_ptl,
-					 spinlock_t *old_pmd_ptl,
-					 struct vm_area_struct *vma)
-{
-	/*
-	 * With split pmd lock we also need to move preallocated
-	 * PTE page table if new_pmd is on different PMD page table.
-	 *
-	 * We also don't deposit and withdraw tables for file pages.
-	 */
-	return (new_pmd_ptl != old_pmd_ptl) && vma_is_anonymous(vma);
-}
-#endif
-
-static pmd_t move_soft_dirty_pmd(pmd_t pmd)
-{
-#ifdef CONFIG_MEM_SOFT_DIRTY
-	if (unlikely(is_pmd_migration_entry(pmd)))
-		pmd = pmd_swp_mksoft_dirty(pmd);
-	else if (pmd_present(pmd))
-		pmd = pmd_mksoft_dirty(pmd);
-#endif
-	return pmd;
-}
-
-bool move_huge_pmd(struct vm_area_struct *vma, unsigned long old_addr,
-		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
-{
-	spinlock_t *old_ptl, *new_ptl;
-	pmd_t pmd;
-	struct mm_struct *mm = vma->vm_mm;
-	bool force_flush = false;
-
-	/*
-	 * The destination pmd shouldn't be established, free_pgtables()
-	 * should have released it; but move_page_tables() might have already
-	 * inserted a page table, if racing against shmem/file collapse.
-	 */
-	if (!pmd_none(*new_pmd)) {
-		VM_BUG_ON(pmd_trans_huge(*new_pmd));
-		return false;
-	}
-
-	/*
-	 * We don't have to worry about the ordering of src and dst
-	 * ptlocks because exclusive mmap_lock prevents deadlock.
-	 */
-	old_ptl = __pmd_trans_huge_lock(old_pmd, vma);
-	if (old_ptl) {
-		new_ptl = pmd_lockptr(mm, new_pmd);
-		if (new_ptl != old_ptl)
-			spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
-		pmd = pmdp_huge_get_and_clear(mm, old_addr, old_pmd);
-		if (pmd_present(pmd))
-			force_flush = true;
-		VM_BUG_ON(!pmd_none(*new_pmd));
-
-		if (pmd_move_must_withdraw(new_ptl, old_ptl, vma)) {
-			pgtable_t pgtable;
-			pgtable = pgtable_trans_huge_withdraw(mm, old_pmd);
-			pgtable_trans_huge_deposit(mm, new_pmd, pgtable);
-		}
-		pmd = move_soft_dirty_pmd(pmd);
-		set_pmd_at(mm, new_addr, new_pmd, pmd);
-		if (force_flush)
-			flush_pmd_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
-		if (new_ptl != old_ptl)
-			spin_unlock(new_ptl);
-		spin_unlock(old_ptl);
-		return true;
-	}
-	return false;
-}
-
-/*
- * Returns
- *  - 0 if PMD could not be locked
- *  - 1 if PMD was locked but protections unchanged and TLB flush unnecessary
- *      or if prot_numa but THP migration is not supported
- *  - HPAGE_PMD_NR if protections changed and TLB flush necessary
- */
-int change_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
-		    pmd_t *pmd, unsigned long addr, pgprot_t newprot,
-		    unsigned long cp_flags)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	spinlock_t *ptl;
-	pmd_t oldpmd, entry;
-	bool prot_numa = cp_flags & MM_CP_PROT_NUMA;
-	bool uffd_wp = cp_flags & MM_CP_UFFD_WP;
-	bool uffd_wp_resolve = cp_flags & MM_CP_UFFD_WP_RESOLVE;
-	int ret = 1;
-
-	tlb_change_page_size(tlb, HPAGE_PMD_SIZE);
-
-	if (prot_numa && !thp_migration_supported())
-		return 1;
-
-	ptl = __pmd_trans_huge_lock(pmd, vma);
-	if (!ptl)
-		return 0;
-
-#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-	if (is_swap_pmd(*pmd)) {
-		swp_entry_t entry = pmd_to_swp_entry(*pmd);
-		struct folio *folio = pfn_swap_entry_folio(entry);
-		pmd_t newpmd;
-
-		VM_BUG_ON(!is_pmd_migration_entry(*pmd));
-		if (is_writable_migration_entry(entry)) {
-			/*
-			 * A protection check is difficult so
-			 * just be safe and disable write
-			 */
-			if (folio_test_anon(folio))
-				entry = make_readable_exclusive_migration_entry(swp_offset(entry));
-			else
-				entry = make_readable_migration_entry(swp_offset(entry));
-			newpmd = swp_entry_to_pmd(entry);
-			if (pmd_swp_soft_dirty(*pmd))
-				newpmd = pmd_swp_mksoft_dirty(newpmd);
-		} else {
-			newpmd = *pmd;
-		}
-
-		if (uffd_wp)
-			newpmd = pmd_swp_mkuffd_wp(newpmd);
-		else if (uffd_wp_resolve)
-			newpmd = pmd_swp_clear_uffd_wp(newpmd);
-		if (!pmd_same(*pmd, newpmd))
-			set_pmd_at(mm, addr, pmd, newpmd);
-		goto unlock;
-	}
-#endif
-
-	if (prot_numa) {
-		struct folio *folio;
-		bool toptier;
-		/*
-		 * Avoid trapping faults against the zero page. The read-only
-		 * data is likely to be read-cached on the local CPU and
-		 * local/remote hits to the zero page are not interesting.
-		 */
-		if (is_huge_zero_pmd(*pmd))
-			goto unlock;
-
-		if (pmd_protnone(*pmd))
-			goto unlock;
-
-		folio = pmd_folio(*pmd);
-		toptier = node_is_toptier(folio_nid(folio));
-		/*
-		 * Skip scanning top tier node if normal numa
-		 * balancing is disabled
-		 */
-		if (!(sysctl_numa_balancing_mode & NUMA_BALANCING_NORMAL) &&
-		    toptier)
-			goto unlock;
-
-		if (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING &&
-		    !toptier)
-			folio_xchg_access_time(folio,
-					       jiffies_to_msecs(jiffies));
-	}
-	/*
-	 * In case prot_numa, we are under mmap_read_lock(mm). It's critical
-	 * to not clear pmd intermittently to avoid race with MADV_DONTNEED
-	 * which is also under mmap_read_lock(mm):
-	 *
-	 *	CPU0:				CPU1:
-	 *				change_huge_pmd(prot_numa=1)
-	 *				 pmdp_huge_get_and_clear_notify()
-	 * madvise_dontneed()
-	 *  zap_pmd_range()
-	 *   pmd_trans_huge(*pmd) == 0 (without ptl)
-	 *   // skip the pmd
-	 *				 set_pmd_at();
-	 *				 // pmd is re-established
-	 *
-	 * The race makes MADV_DONTNEED miss the huge pmd and don't clear it
-	 * which may break userspace.
-	 *
-	 * pmdp_invalidate_ad() is required to make sure we don't miss
-	 * dirty/young flags set by hardware.
-	 */
-	oldpmd = pmdp_invalidate_ad(vma, addr, pmd);
-
-	entry = pmd_modify(oldpmd, newprot);
-	if (uffd_wp)
-		entry = pmd_mkuffd_wp(entry);
-	else if (uffd_wp_resolve)
-		/*
-		 * Leave the write bit to be handled by PF interrupt
-		 * handler, then things like COW could be properly
-		 * handled.
-		 */
-		entry = pmd_clear_uffd_wp(entry);
-
-	/* See change_pte_range(). */
-	if ((cp_flags & MM_CP_TRY_CHANGE_WRITABLE) && !pmd_write(entry) &&
-	    can_change_pmd_writable(vma, addr, entry))
-		entry = pmd_mkwrite(entry, vma);
-
-	ret = HPAGE_PMD_NR;
-	set_pmd_at(mm, addr, pmd, entry);
-
-	if (huge_pmd_needs_flush(oldpmd, entry))
-		tlb_flush_pmd_range(tlb, addr, HPAGE_PMD_SIZE);
-unlock:
-	spin_unlock(ptl);
-	return ret;
-}
-
-/*
- * Returns:
- *
- * - 0: if pud leaf changed from under us
- * - 1: if pud can be skipped
- * - HPAGE_PUD_NR: if pud was successfully processed
- */
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-int change_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
-		    pud_t *pudp, unsigned long addr, pgprot_t newprot,
-		    unsigned long cp_flags)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	pud_t oldpud, entry;
-	spinlock_t *ptl;
-
-	tlb_change_page_size(tlb, HPAGE_PUD_SIZE);
-
-	/* NUMA balancing doesn't apply to dax */
-	if (cp_flags & MM_CP_PROT_NUMA)
-		return 1;
-
-	/*
-	 * Huge entries on userfault-wp only works with anonymous, while we
-	 * don't have anonymous PUDs yet.
-	 */
-	if (WARN_ON_ONCE(cp_flags & MM_CP_UFFD_WP_ALL))
-		return 1;
-
-	ptl = __pud_trans_huge_lock(pudp, vma);
-	if (!ptl)
-		return 0;
-
-	/*
-	 * Can't clear PUD or it can race with concurrent zapping.  See
-	 * change_huge_pmd().
-	 */
-	oldpud = pudp_invalidate(vma, addr, pudp);
-	entry = pud_modify(oldpud, newprot);
-	set_pud_at(mm, addr, pudp, entry);
-	tlb_flush_pud_range(tlb, addr, HPAGE_PUD_SIZE);
-
-	spin_unlock(ptl);
-	return HPAGE_PUD_NR;
-}
-#endif
-
 #ifdef CONFIG_USERFAULTFD
 /*
  * The PT lock for src_pmd and dst_vma/src_vma (for reading) are locked by
@@ -2306,105 +1647,8 @@ int move_pages_huge_pmd(struct mm_struct *mm, pmd_t *dst_pmd, pmd_t *src_pmd, pm
 }
 #endif /* CONFIG_USERFAULTFD */
 
-/*
- * Returns page table lock pointer if a given pmd maps a thp, NULL otherwise.
- *
- * Note that if it returns page table lock pointer, this routine returns without
- * unlocking page table lock. So callers must unlock it.
- */
-spinlock_t *__pmd_trans_huge_lock(pmd_t *pmd, struct vm_area_struct *vma)
-{
-	spinlock_t *ptl;
-	ptl = pmd_lock(vma->vm_mm, pmd);
-	if (likely(is_swap_pmd(*pmd) || pmd_trans_huge(*pmd) ||
-			pmd_devmap(*pmd)))
-		return ptl;
-	spin_unlock(ptl);
-	return NULL;
-}
-
-/*
- * Returns page table lock pointer if a given pud maps a thp, NULL otherwise.
- *
- * Note that if it returns page table lock pointer, this routine returns without
- * unlocking page table lock. So callers must unlock it.
- */
-spinlock_t *__pud_trans_huge_lock(pud_t *pud, struct vm_area_struct *vma)
-{
-	spinlock_t *ptl;
-
-	ptl = pud_lock(vma->vm_mm, pud);
-	if (likely(pud_trans_huge(*pud) || pud_devmap(*pud)))
-		return ptl;
-	spin_unlock(ptl);
-	return NULL;
-}
-
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
-int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
-		 pud_t *pud, unsigned long addr)
-{
-	spinlock_t *ptl;
-	pud_t orig_pud;
-
-	ptl = __pud_trans_huge_lock(pud, vma);
-	if (!ptl)
-		return 0;
-
-	orig_pud = pudp_huge_get_and_clear_full(vma, addr, pud, tlb->fullmm);
-	arch_check_zapped_pud(vma, orig_pud);
-	tlb_remove_pud_tlb_entry(tlb, pud, addr);
-	if (vma_is_special_huge(vma)) {
-		spin_unlock(ptl);
-		/* No zero page support yet */
-	} else {
-		/* No support for anonymous PUD pages yet */
-		BUG();
-	}
-	return 1;
-}
-
-static void __split_huge_pud_locked(struct vm_area_struct *vma, pud_t *pud,
-		unsigned long haddr)
-{
-	VM_BUG_ON(haddr & ~HPAGE_PUD_MASK);
-	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
-	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PUD_SIZE, vma);
-	VM_BUG_ON(!pud_trans_huge(*pud) && !pud_devmap(*pud));
-
-	count_vm_event(THP_SPLIT_PUD);
-
-	pudp_huge_clear_flush(vma, haddr, pud);
-}
-
-void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
-		unsigned long address)
-{
-	spinlock_t *ptl;
-	struct mmu_notifier_range range;
-
-	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
-				address & HPAGE_PUD_MASK,
-				(address & HPAGE_PUD_MASK) + HPAGE_PUD_SIZE);
-	mmu_notifier_invalidate_range_start(&range);
-	ptl = pud_lock(vma->vm_mm, pud);
-	if (unlikely(!pud_trans_huge(*pud) && !pud_devmap(*pud)))
-		goto out;
-	__split_huge_pud_locked(vma, pud, range.start);
-
-out:
-	spin_unlock(ptl);
-	mmu_notifier_invalidate_range_end(&range);
-}
-#else
-void __split_huge_pud(struct vm_area_struct *vma, pud_t *pud,
-		unsigned long address)
-{
-}
-#endif /* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
-
-static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
-		unsigned long haddr, pmd_t *pmd)
+void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
+				unsigned long haddr, pmd_t *pmd)
 {
 	struct mm_struct *mm = vma->vm_mm;
 	pgtable_t pgtable;
@@ -2444,274 +1688,6 @@ static void __split_huge_zero_page_pmd(struct vm_area_struct *vma,
 	pmd_populate(mm, pmd, pgtable);
 }
 
-static void __split_huge_pmd_locked(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long haddr, bool freeze)
-{
-	struct mm_struct *mm = vma->vm_mm;
-	struct folio *folio;
-	struct page *page;
-	pgtable_t pgtable;
-	pmd_t old_pmd, _pmd;
-	bool young, write, soft_dirty, pmd_migration = false, uffd_wp = false;
-	bool anon_exclusive = false, dirty = false;
-	unsigned long addr;
-	pte_t *pte;
-	int i;
-
-	VM_BUG_ON(haddr & ~HPAGE_PMD_MASK);
-	VM_BUG_ON_VMA(vma->vm_start > haddr, vma);
-	VM_BUG_ON_VMA(vma->vm_end < haddr + HPAGE_PMD_SIZE, vma);
-	VM_BUG_ON(!is_pmd_migration_entry(*pmd) && !pmd_trans_huge(*pmd)
-				&& !pmd_devmap(*pmd));
-
-	count_vm_event(THP_SPLIT_PMD);
-
-	if (!vma_is_anonymous(vma)) {
-		old_pmd = pmdp_huge_clear_flush(vma, haddr, pmd);
-		/*
-		 * We are going to unmap this huge page. So
-		 * just go ahead and zap it
-		 */
-		if (arch_needs_pgtable_deposit())
-			zap_deposited_table(mm, pmd);
-		if (vma_is_special_huge(vma))
-			return;
-		if (unlikely(is_pmd_migration_entry(old_pmd))) {
-			swp_entry_t entry;
-
-			entry = pmd_to_swp_entry(old_pmd);
-			folio = pfn_swap_entry_folio(entry);
-		} else {
-			page = pmd_page(old_pmd);
-			folio = page_folio(page);
-			if (!folio_test_dirty(folio) && pmd_dirty(old_pmd))
-				folio_mark_dirty(folio);
-			if (!folio_test_referenced(folio) && pmd_young(old_pmd))
-				folio_set_referenced(folio);
-			folio_remove_rmap_pmd(folio, page, vma);
-			folio_put(folio);
-		}
-		add_mm_counter(mm, mm_counter_file(folio), -HPAGE_PMD_NR);
-		return;
-	}
-
-	if (is_huge_zero_pmd(*pmd)) {
-		/*
-		 * FIXME: Do we want to invalidate secondary mmu by calling
-		 * mmu_notifier_arch_invalidate_secondary_tlbs() see comments below
-		 * inside __split_huge_pmd() ?
-		 *
-		 * We are going from a zero huge page write protected to zero
-		 * small page also write protected so it does not seems useful
-		 * to invalidate secondary mmu at this time.
-		 */
-		return __split_huge_zero_page_pmd(vma, haddr, pmd);
-	}
-
-	pmd_migration = is_pmd_migration_entry(*pmd);
-	if (unlikely(pmd_migration)) {
-		swp_entry_t entry;
-
-		old_pmd = *pmd;
-		entry = pmd_to_swp_entry(old_pmd);
-		page = pfn_swap_entry_to_page(entry);
-		write = is_writable_migration_entry(entry);
-		if (PageAnon(page))
-			anon_exclusive = is_readable_exclusive_migration_entry(entry);
-		young = is_migration_entry_young(entry);
-		dirty = is_migration_entry_dirty(entry);
-		soft_dirty = pmd_swp_soft_dirty(old_pmd);
-		uffd_wp = pmd_swp_uffd_wp(old_pmd);
-	} else {
-		/*
-		 * Up to this point the pmd is present and huge and userland has
-		 * the whole access to the hugepage during the split (which
-		 * happens in place). If we overwrite the pmd with the not-huge
-		 * version pointing to the pte here (which of course we could if
-		 * all CPUs were bug free), userland could trigger a small page
-		 * size TLB miss on the small sized TLB while the hugepage TLB
-		 * entry is still established in the huge TLB. Some CPU doesn't
-		 * like that. See
-		 * http://support.amd.com/TechDocs/41322_10h_Rev_Gd.pdf, Erratum
-		 * 383 on page 105. Intel should be safe but is also warns that
-		 * it's only safe if the permission and cache attributes of the
-		 * two entries loaded in the two TLB is identical (which should
-		 * be the case here). But it is generally safer to never allow
-		 * small and huge TLB entries for the same virtual address to be
-		 * loaded simultaneously. So instead of doing "pmd_populate();
-		 * flush_pmd_tlb_range();" we first mark the current pmd
-		 * notpresent (atomically because here the pmd_trans_huge must
-		 * remain set at all times on the pmd until the split is
-		 * complete for this pmd), then we flush the SMP TLB and finally
-		 * we write the non-huge version of the pmd entry with
-		 * pmd_populate.
-		 */
-		old_pmd = pmdp_invalidate(vma, haddr, pmd);
-		page = pmd_page(old_pmd);
-		folio = page_folio(page);
-		if (pmd_dirty(old_pmd)) {
-			dirty = true;
-			folio_set_dirty(folio);
-		}
-		write = pmd_write(old_pmd);
-		young = pmd_young(old_pmd);
-		soft_dirty = pmd_soft_dirty(old_pmd);
-		uffd_wp = pmd_uffd_wp(old_pmd);
-
-		VM_WARN_ON_FOLIO(!folio_ref_count(folio), folio);
-		VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
-
-		/*
-		 * Without "freeze", we'll simply split the PMD, propagating the
-		 * PageAnonExclusive() flag for each PTE by setting it for
-		 * each subpage -- no need to (temporarily) clear.
-		 *
-		 * With "freeze" we want to replace mapped pages by
-		 * migration entries right away. This is only possible if we
-		 * managed to clear PageAnonExclusive() -- see
-		 * set_pmd_migration_entry().
-		 *
-		 * In case we cannot clear PageAnonExclusive(), split the PMD
-		 * only and let try_to_migrate_one() fail later.
-		 *
-		 * See folio_try_share_anon_rmap_pmd(): invalidate PMD first.
-		 */
-		anon_exclusive = PageAnonExclusive(page);
-		if (freeze && anon_exclusive &&
-		    folio_try_share_anon_rmap_pmd(folio, page))
-			freeze = false;
-		if (!freeze) {
-			rmap_t rmap_flags = RMAP_NONE;
-
-			folio_ref_add(folio, HPAGE_PMD_NR - 1);
-			if (anon_exclusive)
-				rmap_flags |= RMAP_EXCLUSIVE;
-			folio_add_anon_rmap_ptes(folio, page, HPAGE_PMD_NR,
-						 vma, haddr, rmap_flags);
-		}
-	}
-
-	/*
-	 * Withdraw the table only after we mark the pmd entry invalid.
-	 * This's critical for some architectures (Power).
-	 */
-	pgtable = pgtable_trans_huge_withdraw(mm, pmd);
-	pmd_populate(mm, &_pmd, pgtable);
-
-	pte = pte_offset_map(&_pmd, haddr);
-	VM_BUG_ON(!pte);
-
-	/*
-	 * Note that NUMA hinting access restrictions are not transferred to
-	 * avoid any possibility of altering permissions across VMAs.
-	 */
-	if (freeze || pmd_migration) {
-		for (i = 0, addr = haddr; i < HPAGE_PMD_NR; i++, addr += PAGE_SIZE) {
-			pte_t entry;
-			swp_entry_t swp_entry;
-
-			if (write)
-				swp_entry = make_writable_migration_entry(
-							page_to_pfn(page + i));
-			else if (anon_exclusive)
-				swp_entry = make_readable_exclusive_migration_entry(
-							page_to_pfn(page + i));
-			else
-				swp_entry = make_readable_migration_entry(
-							page_to_pfn(page + i));
-			if (young)
-				swp_entry = make_migration_entry_young(swp_entry);
-			if (dirty)
-				swp_entry = make_migration_entry_dirty(swp_entry);
-			entry = swp_entry_to_pte(swp_entry);
-			if (soft_dirty)
-				entry = pte_swp_mksoft_dirty(entry);
-			if (uffd_wp)
-				entry = pte_swp_mkuffd_wp(entry);
-
-			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
-			set_pte_at(mm, addr, pte + i, entry);
-		}
-	} else {
-		pte_t entry;
-
-		entry = mk_pte(page, READ_ONCE(vma->vm_page_prot));
-		if (write)
-			entry = pte_mkwrite(entry, vma);
-		if (!young)
-			entry = pte_mkold(entry);
-		/* NOTE: this may set soft-dirty too on some archs */
-		if (dirty)
-			entry = pte_mkdirty(entry);
-		if (soft_dirty)
-			entry = pte_mksoft_dirty(entry);
-		if (uffd_wp)
-			entry = pte_mkuffd_wp(entry);
-
-		for (i = 0; i < HPAGE_PMD_NR; i++)
-			VM_WARN_ON(!pte_none(ptep_get(pte + i)));
-
-		set_ptes(mm, haddr, pte, entry, HPAGE_PMD_NR);
-	}
-	pte_unmap(pte);
-
-	if (!pmd_migration)
-		folio_remove_rmap_pmd(folio, page, vma);
-	if (freeze)
-		put_page(page);
-
-	smp_wmb(); /* make pte visible before pmd */
-	pmd_populate(mm, pmd, pgtable);
-}
-
-void split_huge_pmd_locked(struct vm_area_struct *vma, unsigned long address,
-			   pmd_t *pmd, bool freeze, struct folio *folio)
-{
-	VM_WARN_ON_ONCE(folio && !folio_test_pmd_mappable(folio));
-	VM_WARN_ON_ONCE(!IS_ALIGNED(address, HPAGE_PMD_SIZE));
-	VM_WARN_ON_ONCE(folio && !folio_test_locked(folio));
-	VM_BUG_ON(freeze && !folio);
-
-	/*
-	 * When the caller requests to set up a migration entry, we
-	 * require a folio to check the PMD against. Otherwise, there
-	 * is a risk of replacing the wrong folio.
-	 */
-	if (pmd_trans_huge(*pmd) || pmd_devmap(*pmd) ||
-	    is_pmd_migration_entry(*pmd)) {
-		if (folio && folio != pmd_folio(*pmd))
-			return;
-		__split_huge_pmd_locked(vma, pmd, address, freeze);
-	}
-}
-
-void __split_huge_pmd(struct vm_area_struct *vma, pmd_t *pmd,
-		unsigned long address, bool freeze, struct folio *folio)
-{
-	spinlock_t *ptl;
-	struct mmu_notifier_range range;
-
-	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma->vm_mm,
-				address & HPAGE_PMD_MASK,
-				(address & HPAGE_PMD_MASK) + HPAGE_PMD_SIZE);
-	mmu_notifier_invalidate_range_start(&range);
-	ptl = pmd_lock(vma->vm_mm, pmd);
-	split_huge_pmd_locked(vma, range.start, pmd, freeze, folio);
-	spin_unlock(ptl);
-	mmu_notifier_invalidate_range_end(&range);
-}
-
-void split_huge_pmd_address(struct vm_area_struct *vma, unsigned long address,
-		bool freeze, struct folio *folio)
-{
-	pmd_t *pmd = mm_find_pmd(vma->vm_mm, address);
-
-	if (!pmd)
-		return;
-
-	__split_huge_pmd(vma, pmd, address, freeze, folio);
-}
-
 static inline void split_huge_pmd_if_needed(struct vm_area_struct *vma, unsigned long address)
 {
 	/*
@@ -3772,100 +2748,3 @@ static int __init split_huge_pages_debugfs(void)
 late_initcall(split_huge_pages_debugfs);
 #endif
 
-#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
-int set_pmd_migration_entry(struct page_vma_mapped_walk *pvmw,
-		struct page *page)
-{
-	struct folio *folio = page_folio(page);
-	struct vm_area_struct *vma = pvmw->vma;
-	struct mm_struct *mm = vma->vm_mm;
-	unsigned long address = pvmw->address;
-	bool anon_exclusive;
-	pmd_t pmdval;
-	swp_entry_t entry;
-	pmd_t pmdswp;
-
-	if (!(pvmw->pmd && !pvmw->pte))
-		return 0;
-
-	flush_cache_range(vma, address, address + HPAGE_PMD_SIZE);
-	pmdval = pmdp_invalidate(vma, address, pvmw->pmd);
-
-	/* See folio_try_share_anon_rmap_pmd(): invalidate PMD first. */
-	anon_exclusive = folio_test_anon(folio) && PageAnonExclusive(page);
-	if (anon_exclusive && folio_try_share_anon_rmap_pmd(folio, page)) {
-		set_pmd_at(mm, address, pvmw->pmd, pmdval);
-		return -EBUSY;
-	}
-
-	if (pmd_dirty(pmdval))
-		folio_mark_dirty(folio);
-	if (pmd_write(pmdval))
-		entry = make_writable_migration_entry(page_to_pfn(page));
-	else if (anon_exclusive)
-		entry = make_readable_exclusive_migration_entry(page_to_pfn(page));
-	else
-		entry = make_readable_migration_entry(page_to_pfn(page));
-	if (pmd_young(pmdval))
-		entry = make_migration_entry_young(entry);
-	if (pmd_dirty(pmdval))
-		entry = make_migration_entry_dirty(entry);
-	pmdswp = swp_entry_to_pmd(entry);
-	if (pmd_soft_dirty(pmdval))
-		pmdswp = pmd_swp_mksoft_dirty(pmdswp);
-	if (pmd_uffd_wp(pmdval))
-		pmdswp = pmd_swp_mkuffd_wp(pmdswp);
-	set_pmd_at(mm, address, pvmw->pmd, pmdswp);
-	folio_remove_rmap_pmd(folio, page, vma);
-	folio_put(folio);
-	trace_set_migration_pmd(address, pmd_val(pmdswp));
-
-	return 0;
-}
-
-void remove_migration_pmd(struct page_vma_mapped_walk *pvmw, struct page *new)
-{
-	struct folio *folio = page_folio(new);
-	struct vm_area_struct *vma = pvmw->vma;
-	struct mm_struct *mm = vma->vm_mm;
-	unsigned long address = pvmw->address;
-	unsigned long haddr = address & HPAGE_PMD_MASK;
-	pmd_t pmde;
-	swp_entry_t entry;
-
-	if (!(pvmw->pmd && !pvmw->pte))
-		return;
-
-	entry = pmd_to_swp_entry(*pvmw->pmd);
-	folio_get(folio);
-	pmde = mk_huge_pmd(new, READ_ONCE(vma->vm_page_prot));
-	if (pmd_swp_soft_dirty(*pvmw->pmd))
-		pmde = pmd_mksoft_dirty(pmde);
-	if (is_writable_migration_entry(entry))
-		pmde = pmd_mkwrite(pmde, vma);
-	if (pmd_swp_uffd_wp(*pvmw->pmd))
-		pmde = pmd_mkuffd_wp(pmde);
-	if (!is_migration_entry_young(entry))
-		pmde = pmd_mkold(pmde);
-	/* NOTE: this may contain setting soft-dirty on some archs */
-	if (folio_test_dirty(folio) && is_migration_entry_dirty(entry))
-		pmde = pmd_mkdirty(pmde);
-
-	if (folio_test_anon(folio)) {
-		rmap_t rmap_flags = RMAP_NONE;
-
-		if (!is_readable_migration_entry(entry))
-			rmap_flags |= RMAP_EXCLUSIVE;
-
-		folio_add_anon_rmap_pmd(folio, new, vma, haddr, rmap_flags);
-	} else {
-		folio_add_file_rmap_pmd(folio, new, vma);
-	}
-	VM_BUG_ON(pmd_write(pmde) && folio_test_anon(folio) && !PageAnonExclusive(new));
-	set_pmd_at(mm, haddr, pvmw->pmd, pmde);
-
-	/* No need to invalidate - it was non-present before */
-	update_mmu_cache_pmd(vma, address, pvmw->pmd);
-	trace_remove_migration_pmd(address, pmd_val(pmde));
-}
-#endif
-- 
2.45.0

