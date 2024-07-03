Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 915B3926A59
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 23:34:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EFq9mo+q;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EFq9mo+q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDtNK26Wjz3fQp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 07:34:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EFq9mo+q;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=EFq9mo+q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDtGH0nw5z3dhR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 07:29:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720042180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VBkUbHh5FhI05CAEJEjFs15FFfGPI8FVTV6ICfAryLc=;
	b=EFq9mo+q8BwDhjffvori4JYutxRF/weOsLZts/wwSkfMJ5FhltRy1L6u7AmXvlIR0AytvA
	BYY3ihlDBNm4l+/9H8Q/0ruO7cxv6o+nfaHxVuzD94EAPb1M9U9ny4zrfi3np4EDMpLW3E
	vNLWj6aQF9Iy50uYCN7WjADi4NVPvKY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720042180;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VBkUbHh5FhI05CAEJEjFs15FFfGPI8FVTV6ICfAryLc=;
	b=EFq9mo+q8BwDhjffvori4JYutxRF/weOsLZts/wwSkfMJ5FhltRy1L6u7AmXvlIR0AytvA
	BYY3ihlDBNm4l+/9H8Q/0ruO7cxv6o+nfaHxVuzD94EAPb1M9U9ny4zrfi3np4EDMpLW3E
	vNLWj6aQF9Iy50uYCN7WjADi4NVPvKY=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-gBCTz5aWNhequBmGG4riVQ-1; Wed, 03 Jul 2024 17:29:38 -0400
X-MC-Unique: gBCTz5aWNhequBmGG4riVQ-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5c21f76f1d1so1859eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 14:29:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042178; x=1720646978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VBkUbHh5FhI05CAEJEjFs15FFfGPI8FVTV6ICfAryLc=;
        b=n90w4mhgViYmReA6ldvgQIh4RJD7FwYq9OJi+BRiNNhRxXENOYN9lUSS4MDBw2SI49
         smyH6jr9UWRyXrBshuN37jZYYHhNw0QIMWj+edS2kd+AN9F4vABWIxFSDEjYkIW40fH/
         sO/1z9DPoIOvHCew01LIImaU6klW1HQSxZ2xBhE3OHv2ltiXwLwTxtxjN1FrXgGaaBvu
         n6aNY5HjlzwV7YSPVRaxpRq5XQ6InJrroWL0GZGMjAb8mtc2ZrH6QYW09jblxcfOCuYS
         6RXz0+pkgemEOWgGv7tVel2K2U9zLk7SN2hFo/Ah/f4m7ENniCI4F7JXfvAzrRCUMgB7
         45FA==
X-Forwarded-Encrypted: i=1; AJvYcCWw3TpMKqHDbfPldnWeoCvDZHOfNZ2mtQaT5DfRxoQjpLhCKAsgFHYRGRAKgF3qyt5YrsloInce6MKH24MX3ptvISeygGK+rIVXXrWASA==
X-Gm-Message-State: AOJu0YzEy4k5NmjcR7qLgcbLULxYZyipvFt15fjBBE2opR5d7rCWsu+J
	A/E7n7HM4vSP4tuPnHLa5+XM66ndXVzsDUs0zQRsr3a1ToTEAnxhlagJr4sr7Q6ZKEgiJBpgY7z
	+vs8Z/MqtC7ZFKsVVR/oljM9JptMCK9xLcI8kA9H7Gp9pT8ZwtRBPenyGNeYaquQ=
X-Received: by 2002:a05:6358:7f0d:b0:1a2:3bde:1425 with SMTP id e5c5f4694b2df-1a6acf18b33mr1469438355d.2.1720042177850;
        Wed, 03 Jul 2024 14:29:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFh/EdB/xSzquRBRoGgcbcKdNPV887AakpSVBbTc4I0BiDNq1hD4sw71GTYj4zNAp5JLHYzHw==
X-Received: by 2002:a05:6358:7f0d:b0:1a2:3bde:1425 with SMTP id e5c5f4694b2df-1a6acf18b33mr1469428955d.2.1720042175430;
        Wed, 03 Jul 2024 14:29:35 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4465143eb1csm54337481cf.57.2024.07.03.14.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:29:34 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 7/8] mm/x86: Add missing pud helpers
Date: Wed,  3 Jul 2024 17:29:17 -0400
Message-ID: <20240703212918.2417843-8-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240703212918.2417843-1-peterx@redhat.com>
References: <20240703212918.2417843-1-peterx@redhat.com>
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, peterx@redhat.com, Christophe Leroy <christophe.leroy@csgroup.eu>, Thomas Gleixner <tglx@linutronix.de>, Dave Jiang <dave.jiang@intel.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org, Hugh Dickins <hughd@google.com>, Matthew Wilcox <willy@infradead.org>, Ingo Molnar <mingo@redhat.com>, Huang Ying <ying.huang@intel.com>, Rik van Riel <riel@surriel.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "Kirill A . Shutemov" <kirill@shutemov.name>, Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>, Mel Gorman <mgorman@techsingularity.net>, Andrew Morton <akpm@linux-foundation.org>, Rick P Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These new helpers will be needed for pud entry updates soon.  Introduce
these helpers by referencing the pmd ones.  Namely:

- pudp_invalidate()
- pud_modify()

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/x86/include/asm/pgtable.h | 55 +++++++++++++++++++++++++++++-----
 arch/x86/mm/pgtable.c          | 11 +++++++
 2 files changed, 58 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index cdf044c2ad6e..701593c53f3b 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -782,6 +782,12 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
 		      __pgprot(pmd_flags(pmd) & ~(_PAGE_PRESENT|_PAGE_PROTNONE)));
 }
 
+static inline pud_t pud_mkinvalid(pud_t pud)
+{
+	return pfn_pud(pud_pfn(pud),
+		       __pgprot(pud_flags(pud) & ~(_PAGE_PRESENT|_PAGE_PROTNONE)));
+}
+
 static inline u64 flip_protnone_guard(u64 oldval, u64 val, u64 mask);
 
 static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
@@ -829,14 +835,8 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 	pmd_result = __pmd(val);
 
 	/*
-	 * To avoid creating Write=0,Dirty=1 PMDs, pte_modify() needs to avoid:
-	 *  1. Marking Write=0 PMDs Dirty=1
-	 *  2. Marking Dirty=1 PMDs Write=0
-	 *
-	 * The first case cannot happen because the _PAGE_CHG_MASK will filter
-	 * out any Dirty bit passed in newprot. Handle the second case by
-	 * going through the mksaveddirty exercise. Only do this if the old
-	 * value was Write=1 to avoid doing this on Shadow Stack PTEs.
+	 * Avoid creating shadow stack PMD by accident.  See comment in
+	 * pte_modify().
 	 */
 	if (oldval & _PAGE_RW)
 		pmd_result = pmd_mksaveddirty(pmd_result);
@@ -846,6 +846,29 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 	return pmd_result;
 }
 
+static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
+{
+	pudval_t val = pud_val(pud), oldval = val;
+	pud_t pud_result;
+
+	val &= _HPAGE_CHG_MASK;
+	val |= check_pgprot(newprot) & ~_HPAGE_CHG_MASK;
+	val = flip_protnone_guard(oldval, val, PHYSICAL_PUD_PAGE_MASK);
+
+	pud_result = __pud(val);
+
+	/*
+	 * Avoid creating shadow stack PUD by accident.  See comment in
+	 * pte_modify().
+	 */
+	if (oldval & _PAGE_RW)
+		pud_result = pud_mksaveddirty(pud_result);
+	else
+		pud_result = pud_clear_saveddirty(pud_result);
+
+	return pud_result;
+}
+
 /*
  * mprotect needs to preserve PAT and encryption bits when updating
  * vm_page_prot
@@ -1384,10 +1407,26 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 }
 #endif
 
+static inline pud_t pudp_establish(struct vm_area_struct *vma,
+		unsigned long address, pud_t *pudp, pud_t pud)
+{
+	page_table_check_pud_set(vma->vm_mm, pudp, pud);
+	if (IS_ENABLED(CONFIG_SMP)) {
+		return xchg(pudp, pud);
+	} else {
+		pud_t old = *pudp;
+		WRITE_ONCE(*pudp, pud);
+		return old;
+	}
+}
+
 #define __HAVE_ARCH_PMDP_INVALIDATE_AD
 extern pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma,
 				unsigned long address, pmd_t *pmdp);
 
+pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+		      pud_t *pudp);
+
 /*
  * Page table pages are page-aligned.  The lower half of the top
  * level is used for userspace and the top half for the kernel.
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 564b8945951e..9d97a1b99160 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -641,6 +641,17 @@ pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
 }
 #endif
 
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+		     pud_t *pudp)
+{
+	VM_WARN_ON_ONCE(!pud_present(*pudp));
+	pud_t old = pudp_establish(vma, address, pudp, pud_mkinvalid(*pudp));
+	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
+	return old;
+}
+#endif
+
 /**
  * reserve_top_address - reserves a hole in the top of kernel address space
  * @reserve - size of hole to reserve
-- 
2.45.0

