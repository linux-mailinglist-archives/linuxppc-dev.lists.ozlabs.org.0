Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96FE1926A4E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 23:32:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DU3S/ARu;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DU3S/ARu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDtKt35g6z3fKh
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2024 07:32:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DU3S/ARu;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=DU3S/ARu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDtG83MSmz3fRG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2024 07:29:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720042173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DPSgdrK+/9txvlBVeWURx0wHDXuvLt3nB8aMlUhEkV8=;
	b=DU3S/ARuYOtYgQvPVYGFJHUfw982tFqFnSkjx/rfTZXn9e5kGnxA9hd+e5k99fUCaGI8Dq
	L3L0fi4XVg//3JKEvuzkibnUWJetnAct5B1pKlbB46OLh9Y6Z4aleOo+coSAp+Mggl9tEf
	djd5ipudyxVXzgetpHrxHtCOXxeW0fs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720042173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DPSgdrK+/9txvlBVeWURx0wHDXuvLt3nB8aMlUhEkV8=;
	b=DU3S/ARuYOtYgQvPVYGFJHUfw982tFqFnSkjx/rfTZXn9e5kGnxA9hd+e5k99fUCaGI8Dq
	L3L0fi4XVg//3JKEvuzkibnUWJetnAct5B1pKlbB46OLh9Y6Z4aleOo+coSAp+Mggl9tEf
	djd5ipudyxVXzgetpHrxHtCOXxeW0fs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-G8XcGgF9MaOrHwIIKDMHog-1; Wed, 03 Jul 2024 17:29:31 -0400
X-MC-Unique: G8XcGgF9MaOrHwIIKDMHog-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-446597b9e32so2328711cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2024 14:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720042170; x=1720646970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DPSgdrK+/9txvlBVeWURx0wHDXuvLt3nB8aMlUhEkV8=;
        b=Bhtk0WjZxWDOCOdieqk/0HmwJIxFIniKe6jFv8vMyC/2dJrk1nQhU1VXIiulBjcdgV
         rvO3RBQbkH6hSATQowVDlxgAydJdsJblA3bafU0yb0fkAkgGRyuesQbP8KVe2/lSgAhv
         lwAUk6TrL/fiBoaieiceqQjhiuqsY2p0MY+WYl0HxEw2MHAykgzvKZAf6POLr6qXiJcS
         OClunxgN07LEycnjDoHlyvptVv2YvoRCBy75iYBuKrLlEHyw6ZBZ0VdFipx9RI9SkUj9
         4xf7O5qocWUW51H+QD/E7YYyjiZRJGrDAGIhYj7cY1hxzccH2i1JmmNJ3J1KUUusHxMQ
         qUqA==
X-Forwarded-Encrypted: i=1; AJvYcCXS19n9Slk7Y/5SRwGgVCuM6aTXajO/cm/pQSsjwKp7cWAu8dxoyisEydqMqUqGLtE0itz8BgBeJsNkAYzxJ81H1swVDVCtg7oOIEjjJg==
X-Gm-Message-State: AOJu0YyliwDBtQD43eEmxW45D46L1x8tTtzorjGAa1QNNArK/6XFL/OU
	a2PGEWojGZ2Lhmmu+vvygIPy/XtUObXpGwYXOyYJcZj6eBs2LzkjEIBFn/QVK+FGwT9/jZFbdII
	YqKweLW/jlgZdRpWw70j8RDWWdsOK5NCXb5IKS4fpG5ao+xVEFcHQiYWt/K6P1VAlYhPJoTY=
X-Received: by 2002:a05:622a:102:b0:446:5d1b:5a2e with SMTP id d75a77b69052e-44662f544a3mr145792321cf.5.1720042170197;
        Wed, 03 Jul 2024 14:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbwAQwNTOhld77jh3m6+0aceNgmx9fLMFpnLFNTJ0A2GCbsDu4E9EVwwSQY1Fjy1mOFnq/rQ==
X-Received: by 2002:a05:622a:102:b0:446:5d1b:5a2e with SMTP id d75a77b69052e-44662f544a3mr145792111cf.5.1720042169860;
        Wed, 03 Jul 2024 14:29:29 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4465143eb1csm54337481cf.57.2024.07.03.14.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 14:29:29 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v2 4/8] mm/powerpc: Add missing pud helpers
Date: Wed,  3 Jul 2024 17:29:14 -0400
Message-ID: <20240703212918.2417843-5-peterx@redhat.com>
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
them by referencing the pmd ones.  Namely:

- pudp_invalidate()
- pud_modify()

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  3 +++
 arch/powerpc/mm/book3s64/pgtable.c           | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 519b1743a0f4..5da92ba68a45 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1124,6 +1124,7 @@ extern pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot);
 extern pud_t pfn_pud(unsigned long pfn, pgprot_t pgprot);
 extern pmd_t mk_pmd(struct page *page, pgprot_t pgprot);
 extern pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot);
+extern pud_t pud_modify(pud_t pud, pgprot_t newprot);
 extern void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 		       pmd_t *pmdp, pmd_t pmd);
 extern void set_pud_at(struct mm_struct *mm, unsigned long addr,
@@ -1384,6 +1385,8 @@ static inline pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm,
 #define __HAVE_ARCH_PMDP_INVALIDATE
 extern pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 			     pmd_t *pmdp);
+extern pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+			     pud_t *pudp);
 
 #define pmd_move_must_withdraw pmd_move_must_withdraw
 struct spinlock;
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index f4d8d3c40e5c..5a4a75369043 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -176,6 +176,17 @@ pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 	return __pmd(old_pmd);
 }
 
+pud_t pudp_invalidate(struct vm_area_struct *vma, unsigned long address,
+		      pud_t *pudp)
+{
+	unsigned long old_pud;
+
+	VM_WARN_ON_ONCE(!pud_present(*pudp));
+	old_pud = pud_hugepage_update(vma->vm_mm, address, pudp, _PAGE_PRESENT, _PAGE_INVALID);
+	flush_pud_tlb_range(vma, address, address + HPAGE_PUD_SIZE);
+	return __pud(old_pud);
+}
+
 pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 				   unsigned long addr, pmd_t *pmdp, int full)
 {
@@ -259,6 +270,15 @@ pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
 	pmdv &= _HPAGE_CHG_MASK;
 	return pmd_set_protbits(__pmd(pmdv), newprot);
 }
+
+pud_t pud_modify(pud_t pud, pgprot_t newprot)
+{
+	unsigned long pudv;
+
+	pudv = pud_val(pud);
+	pudv &= _HPAGE_CHG_MASK;
+	return pud_set_protbits(__pud(pudv), newprot);
+}
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 /* For use by kexec, called with MMU off */
-- 
2.45.0

