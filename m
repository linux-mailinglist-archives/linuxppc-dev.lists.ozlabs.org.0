Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D92931AF4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 21:26:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZQ1PeKSH;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=flfJvGLw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNByj2N0Mz2y8p
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 05:26:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZQ1PeKSH;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=flfJvGLw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNBsS5PVTz3cY5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 05:22:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721071321;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9JbEXa1vvY/QVlVssvu52FPZK180R34zP6ifpD40mks=;
	b=ZQ1PeKSHc8PZc6E5seHJ5P7PN3LdirgMsFVEYuMcc6YrUko6YSiZyF9pNUQJF0xpI68e0f
	f8kp0IFzn4VFUWWoM3uoU9BPix0eeBCxzqW7oVNqP956Ix/AW09NJ9+tjVOGyzZsfz7fcY
	pBDd7oK/GddPOs0Z7AgA/7l0klI9mQA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721071322;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9JbEXa1vvY/QVlVssvu52FPZK180R34zP6ifpD40mks=;
	b=flfJvGLwLLZWvkqHRodV+35F9hz6TetCnXSwTJ/2AQJJtYb7nFGA5P5iGdi7xroeCGYkSl
	1KMf0aXWfPby9vq88OkQL6/P7cuZhodnlnSILfxXYNJ+ScwqbAAc1nGrNFWOb0hLAOZVYp
	j/2eSj8itefbPaKkJeqCGTvkVeePv98=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-549-geiQnMTgOtejxzRurETfBw-1; Mon, 15 Jul 2024 15:21:59 -0400
X-MC-Unique: geiQnMTgOtejxzRurETfBw-1
Received: by mail-yb1-f197.google.com with SMTP id 3f1490d57ef6-e05a1434e17so676207276.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 12:21:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721071319; x=1721676119;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JbEXa1vvY/QVlVssvu52FPZK180R34zP6ifpD40mks=;
        b=ktMqZJ7agOUcgSwHyrjzGe4ppts/Yc5N0AS3pVUZpLAEoFqOv7g75313dr1V44I99Y
         KIOtdjlIkjbkCAiq4FbFvoq4TROmivdVN+4vObis6l+d4IpV/6fWTInSiGOYXO/d51jT
         rgi4f/mTLXZlL2bGdKI+RIOFs4+Imo9sjFTagGyyQNm8hKuZazODoME/sI0viY7CNGsV
         hOsSjsVF1cu6+Hli1jjITs6DDxBF/Md/w+eXCPVLOz+oyxxucnqcVt+pIj7usjAFb4Jd
         /4Z5icQ7fPmh7+MX47fam180s+wdAZ0uw2wVpo2n2oe/+mG5zdUC4UzeBfAvZXmz/NFC
         /AFQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1dUsDn/5GMmwgoYaJ+MvZH/DAa5GNn1e8r6TpGnsx2diZYUtUQ/uqAD+tF8wBBlP61guS3BFjJjXgLxoQudLLmy75NqhowawX2VK61Q==
X-Gm-Message-State: AOJu0YxN9psqR/arab3mvqq1xX3ct7Bq1bVPMe2nZ3apgwahAmcQI2fL
	0UCsE8LC+1+QT/Znt15PAzX4c+OSrW2UxTdIblt44SOhpdb82xxCWQ8ADW+VwFaWocQ+S6J+yI1
	P3Yeq7M4x8sAPdQu8uAcvP4Mo61hotX2nuUogMTYJEvVzRFHUSCPVsNSAAY5qs28=
X-Received: by 2002:a25:2d11:0:b0:e05:900d:32e6 with SMTP id 3f1490d57ef6-e05d3c17338mr350134276.8.1721071319222;
        Mon, 15 Jul 2024 12:21:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmDbyBksbC4qmpVrfmmZ0A/VGjIJHLQ2OfuPZrkWmoJhvnJgk6xUDZyR/TdOg4zaQrzDq1HQ==
X-Received: by 2002:a25:2d11:0:b0:e05:900d:32e6 with SMTP id 3f1490d57ef6-e05d3c17338mr350112276.8.1721071318815;
        Mon, 15 Jul 2024 12:21:58 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b761978d30sm24039356d6.31.2024.07.15.12.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 12:21:58 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/8] mm/x86: arch_check_zapped_pud()
Date: Mon, 15 Jul 2024 15:21:40 -0400
Message-ID: <20240715192142.3241557-7-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240715192142.3241557-1-peterx@redhat.com>
References: <20240715192142.3241557-1-peterx@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce arch_check_zapped_pud() to sanity check shadow stack on PUD zaps.
It has the same logic of the PMD helper.

One thing to mention is, it might be a good idea to use page_table_check in
the future for trapping wrong setups of shadow stack pgtable entries [1].
That is left for the future as a separate effort.

[1] https://lore.kernel.org/all/59d518698f664e07c036a5098833d7b56b953305.camel@intel.com

Cc: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/x86/include/asm/pgtable.h | 10 ++++++++++
 arch/x86/mm/pgtable.c          |  7 +++++++
 include/linux/pgtable.h        |  7 +++++++
 mm/huge_memory.c               |  4 +++-
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index 25fc6d809572..cdf044c2ad6e 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -169,6 +169,13 @@ static inline int pud_young(pud_t pud)
 	return pud_flags(pud) & _PAGE_ACCESSED;
 }
 
+static inline bool pud_shstk(pud_t pud)
+{
+	return cpu_feature_enabled(X86_FEATURE_SHSTK) &&
+	       (pud_flags(pud) & (_PAGE_RW | _PAGE_DIRTY | _PAGE_PSE)) ==
+	       (_PAGE_DIRTY | _PAGE_PSE);
+}
+
 static inline int pte_write(pte_t pte)
 {
 	/*
@@ -1662,6 +1669,9 @@ void arch_check_zapped_pte(struct vm_area_struct *vma, pte_t pte);
 #define arch_check_zapped_pmd arch_check_zapped_pmd
 void arch_check_zapped_pmd(struct vm_area_struct *vma, pmd_t pmd);
 
+#define arch_check_zapped_pud arch_check_zapped_pud
+void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud);
+
 #ifdef CONFIG_XEN_PV
 #define arch_has_hw_nonleaf_pmd_young arch_has_hw_nonleaf_pmd_young
 static inline bool arch_has_hw_nonleaf_pmd_young(void)
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 93e54ba91fbf..564b8945951e 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -926,3 +926,10 @@ void arch_check_zapped_pmd(struct vm_area_struct *vma, pmd_t pmd)
 	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) &&
 			pmd_shstk(pmd));
 }
+
+void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud)
+{
+	/* See note in arch_check_zapped_pte() */
+	VM_WARN_ON_ONCE(!(vma->vm_flags & VM_SHADOW_STACK) &&
+			pud_shstk(pud));
+}
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 2a6a3cccfc36..2289e9f7aa1b 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -447,6 +447,13 @@ static inline void arch_check_zapped_pmd(struct vm_area_struct *vma,
 }
 #endif
 
+#ifndef arch_check_zapped_pud
+static inline void arch_check_zapped_pud(struct vm_area_struct *vma,
+					 pud_t pud)
+{
+}
+#endif
+
 #ifndef __HAVE_ARCH_PTEP_GET_AND_CLEAR
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long address,
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 9fec5bd1c8b0..c10247bef08a 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2291,12 +2291,14 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 		 pud_t *pud, unsigned long addr)
 {
 	spinlock_t *ptl;
+	pud_t orig_pud;
 
 	ptl = __pud_trans_huge_lock(pud, vma);
 	if (!ptl)
 		return 0;
 
-	pudp_huge_get_and_clear_full(vma, addr, pud, tlb->fullmm);
+	orig_pud = pudp_huge_get_and_clear_full(vma, addr, pud, tlb->fullmm);
+	arch_check_zapped_pud(vma, orig_pud);
 	tlb_remove_pud_tlb_entry(tlb, pud, addr);
 	if (vma_is_special_huge(vma)) {
 		spin_unlock(ptl);
-- 
2.45.0

