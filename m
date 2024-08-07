Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EBF94B0AE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 21:51:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EoTQY8MX;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EoTQY8MX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfLR50WFpz3bhD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 05:51:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EoTQY8MX;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EoTQY8MX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfLMM35bWz3dL2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 05:48:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723060108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FAGFj0FHVAq5pVRnc576bB34mI1HflD3zt6t4lJRJgM=;
	b=EoTQY8MX/sjXJgghtqS7Zec906j68az8Rwxns7odhETIK2WTcCiWZY6nkyBTACEI0gx8c9
	vUlha9QSFM+nTnenWoT+wshS2GTdi93sOAPUapByQWj+aoWlVmbNchGh3LEhBOa4H6y+UW
	oaRVjYLgxD8LJoZFuQa0tnvzdM1MGbA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723060108;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FAGFj0FHVAq5pVRnc576bB34mI1HflD3zt6t4lJRJgM=;
	b=EoTQY8MX/sjXJgghtqS7Zec906j68az8Rwxns7odhETIK2WTcCiWZY6nkyBTACEI0gx8c9
	vUlha9QSFM+nTnenWoT+wshS2GTdi93sOAPUapByQWj+aoWlVmbNchGh3LEhBOa4H6y+UW
	oaRVjYLgxD8LJoZFuQa0tnvzdM1MGbA=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-yTy3uU3PM6-_PBJnK6JPHw-1; Wed, 07 Aug 2024 15:48:26 -0400
X-MC-Unique: yTy3uU3PM6-_PBJnK6JPHw-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5d5cc01aee6so12866eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Aug 2024 12:48:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723060106; x=1723664906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FAGFj0FHVAq5pVRnc576bB34mI1HflD3zt6t4lJRJgM=;
        b=kwqmW/qVfjXs+ZDoXDd01GrbMBKTu3MWyl0O2ZjPEYxRL3cd+uSMWKmnlkCO5AT+Dn
         msZJnexzXrjeZCKdGqLWA3Tf7ZumE4XugFz4+wnek8960eg0J94B4eXX7+5O++OenRHx
         GepMcmIDsN+rcrgBvsd7bUzGLdqm8fRskuDCfswCBLQ4Kv+/+7AIpmy7lZg+kuuVGRI2
         3NrmcMMMTCMKPI/lKbC8z+3T4c+J5uZPstWskRMu5A0xpONflYRpiyNXUz4wk5NrVx9z
         axzzT/8gLTC9itPNNtun8NprgZ7cmggJf7u/kODyj2p4C8wp58x4pcRwOC10RnHHedhf
         qVQQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoARvwZ8UjuibatPNZ7np6U231lAoGxUu271lfM4vXFItsgYVMZb2+1YDUeorOarIfRkeks+C/2119x9E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxlIHa/aGLdEbJ60XVgbsehkgddqXTF8x31LgApRJkOjoKcVUzY
	T0XXgZAKY6fnonlTstjRoGVuihfKm5ELhma2z3KE8latDIjROCwovq4n2VCr5VO9/3Dx5QLouPv
	cHeQWkIROHDcAYAGCsr7CnmgT+6wIxBLOxR/+HsA2K0AfNG2JUievK9449mxTK10=
X-Received: by 2002:a4a:b90c:0:b0:5cd:920:de44 with SMTP id 006d021491bc7-5d6636caa6bmr12611330eaf.2.1723060105978;
        Wed, 07 Aug 2024 12:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE55jmIe/WZbCw3l3NTgyyno7WLqIqKlQdXAtW30hkxt69+d9woKPh92QMpZkY/maA+61+r6A==
X-Received: by 2002:a4a:b90c:0:b0:5cd:920:de44 with SMTP id 006d021491bc7-5d6636caa6bmr12611307eaf.2.1723060105619;
        Wed, 07 Aug 2024 12:48:25 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bb9c78ae4asm59853256d6.33.2024.08.07.12.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Aug 2024 12:48:24 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v4 5/7] mm/x86: arch_check_zapped_pud()
Date: Wed,  7 Aug 2024 15:48:09 -0400
Message-ID: <20240807194812.819412-6-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240807194812.819412-1-peterx@redhat.com>
References: <20240807194812.819412-1-peterx@redhat.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, Mel Gorman <mgorman@techsingularity.net>
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
Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/x86/include/asm/pgtable.h | 10 ++++++++++
 arch/x86/mm/pgtable.c          |  7 +++++++
 include/linux/pgtable.h        |  7 +++++++
 mm/huge_memory.c               |  4 +++-
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index a2a3bd4c1bda..fdb8ac9e7030 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -174,6 +174,13 @@ static inline int pud_young(pud_t pud)
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
@@ -1667,6 +1674,9 @@ void arch_check_zapped_pte(struct vm_area_struct *vma, pte_t pte);
 #define arch_check_zapped_pmd arch_check_zapped_pmd
 void arch_check_zapped_pmd(struct vm_area_struct *vma, pmd_t pmd);
 
+#define arch_check_zapped_pud arch_check_zapped_pud
+void arch_check_zapped_pud(struct vm_area_struct *vma, pud_t pud);
+
 #ifdef CONFIG_XEN_PV
 #define arch_has_hw_nonleaf_pmd_young arch_has_hw_nonleaf_pmd_young
 static inline bool arch_has_hw_nonleaf_pmd_young(void)
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index f5931499c2d6..d4b3ccf90236 100644
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
index 0024266dea0a..81c5da0708ed 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -2293,12 +2293,14 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
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

