Return-Path: <linuxppc-dev+bounces-33-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA7C94F970
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 00:13:52 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WTZLjtwd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FqBb78o8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjTLk2B4Fz2xT8;
	Tue, 13 Aug 2024 08:13:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WTZLjtwd;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FqBb78o8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjN0c2y6qz2xQG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 04:12:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723486365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j48ti3LHCtaDfvs8kVCshb+r8YjKqoQPQoRoRoS7ZWU=;
	b=WTZLjtwd6Dgx6mEVhBwyvTKqcht2uGsmQSaBkrBeScEW0L1Qbgwi4b+Jr2nipphsEBVOfj
	X4bQD0HuMR81sfv8xgX8JPubQrO6EC8kb5qKa7vFi2R2ROkZatYJffX8+W8MrKmhZStm6w
	fHqtPgbImhpXUKuQ6SBbnQDiltnPODY=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1723486366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=j48ti3LHCtaDfvs8kVCshb+r8YjKqoQPQoRoRoS7ZWU=;
	b=FqBb78o8PXUVqSjPeJBYDDx/gQ9Ck1yIyPzQEe7cCZS3h8iQhz+d3t93dZksd+7LXPKA95
	IEnEmvc5BHs8Le4RK4AOuq8QZamR8pxcV9f5RiY2iYKgLFs2KJ3/17rznE6nMx2remSJ5u
	OzIpnTPdaXRPhCClknvXFb9qnscMQCY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-AmMGj11xPPWXAmzCRRf5Uw-1; Mon, 12 Aug 2024 14:12:43 -0400
X-MC-Unique: AmMGj11xPPWXAmzCRRf5Uw-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6b792d6fe5bso12232816d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2024 11:12:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723486362; x=1724091162;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j48ti3LHCtaDfvs8kVCshb+r8YjKqoQPQoRoRoS7ZWU=;
        b=Z6RbDnqy5xtF1RO4qJ/lPFdOn9/kRviK6O4q3P/ctyEtypz2FHWaKdBBcKyZDRgKfY
         mMuoHtv75DuNW+xmXv/CY3uVTQxwHh80OUxvxYR55oOhTNVkKW1w5/HPYqwj8ZdxxV+c
         b9vvOe1SDDlDrw4nY7ab1t1/wNyFGBKiNNqM0xDjl54WIVRFRBD9Z1O4Awr1WDNnnnVl
         0axfuoTlH4/cnjH+qYx3xTB0/XZfo8quTMEHnSiPa7x4OhDdYECFQcWhnglD+fLKonyL
         ffvAD6FyygRal7bmipMwXAgAnWVIJCAkj6aORcvZQaGVbDUn0chg2SVGtqFztpMnt+2e
         0GkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUodl88ssHSUaeobyf8PuyILNYUr0pvYgacXFIwh4LffFEDVJRm/tSSBolw6dwYv1NZ5bQ6JFOq5BLsADY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwcFoAJOF6J5Nejmr7TdRQjGxoXPxaqhj5m84znutwhc5TFph1D
	jkkisuoAlKKtyDwHhArDrrSUf9kse6cbe7wGBb8Xa2CK43YkImFrPuq1I5YnXVszXhfV0WrGI/I
	4NxpDXQ67JlFUY1R8dsfz8S9v0LLoLqWtXb8SWwnS68N+xcjRJq7grV7NdYNJ/A4=
X-Received: by 2002:a05:620a:4609:b0:79d:6273:9993 with SMTP id af79cd13be357-7a4e15be5b1mr69032185a.6.1723486362339;
        Mon, 12 Aug 2024 11:12:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnMgvJOIkVw2s4SdK0L87wmxjCzEZ4UjgHz1yAaoa3V+0fWl6Gh90ffNusNtYhZ+374uYqxw==
X-Received: by 2002:a05:620a:4609:b0:79d:6273:9993 with SMTP id af79cd13be357-7a4e15be5b1mr69028285a.6.1723486361844;
        Mon, 12 Aug 2024 11:12:41 -0700 (PDT)
Received: from x1n.redhat.com (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a4c7dee013sm268663985a.84.2024.08.12.11.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 11:12:41 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Cc: "Kirill A . Shutemov" <kirill@shutemov.name>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Matthew Wilcox <willy@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	James Houghton <jthoughton@google.com>,
	Huang Ying <ying.huang@intel.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	peterx@redhat.com,
	Vlastimil Babka <vbabka@suse.cz>,
	Rick P Edgecombe <rick.p.edgecombe@intel.com>,
	Hugh Dickins <hughd@google.com>,
	Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Rik van Riel <riel@surriel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Mel Gorman <mgorman@techsingularity.net>,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linuxppc-dev@lists.ozlabs.org,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Oscar Salvador <osalvador@suse.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v5 6/7] mm/x86: Add missing pud helpers
Date: Mon, 12 Aug 2024 14:12:24 -0400
Message-ID: <20240812181225.1360970-7-peterx@redhat.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240812181225.1360970-1-peterx@redhat.com>
References: <20240812181225.1360970-1-peterx@redhat.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

Some new helpers will be needed for pud entry updates soon.  Introduce
these helpers by referencing the pmd ones.  Namely:

  - pudp_invalidate(): this helper invalidates a huge pud before a split
  happens, so that the invalidated pud entry will make sure no race will
  happen (either with software, like a concurrent zap, or hardware, like
  a/d bit lost).

  - pud_modify(): this helper applies a new pgprot to an existing huge pud
  mapping.

For more information on why we need these two helpers, please refer to the
corresponding pmd helpers in the mprotect() code path.

When at it, simplify the pud_modify()/pmd_modify() comments on shadow stack
pgtable entries to reference pte_modify() to avoid duplicating the whole
paragraph three times.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: x86@kernel.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/x86/include/asm/pgtable.h | 57 +++++++++++++++++++++++++++++-----
 arch/x86/mm/pgtable.c          | 12 +++++++
 2 files changed, 61 insertions(+), 8 deletions(-)

diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index fdb8ac9e7030..8d12bfad6a1d 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -787,6 +787,12 @@ static inline pmd_t pmd_mkinvalid(pmd_t pmd)
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
@@ -834,14 +840,8 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
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
@@ -851,6 +851,29 @@ static inline pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot)
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
@@ -1389,10 +1412,28 @@ static inline pmd_t pmdp_establish(struct vm_area_struct *vma,
 }
 #endif
 
+#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
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
+#endif
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
index 36e7139a61d9..5745a354a241 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -641,6 +641,18 @@ pmd_t pmdp_invalidate_ad(struct vm_area_struct *vma, unsigned long address,
 }
 #endif
 
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE) && \
+	defined(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD)
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


