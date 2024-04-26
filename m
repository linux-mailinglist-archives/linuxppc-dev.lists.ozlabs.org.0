Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B86CC8B3C87
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Apr 2024 18:13:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iaVBsi9+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iaVBsi9+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VQySp2j0cz3cZ7
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2024 02:13:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iaVBsi9+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iaVBsi9+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VQyS06DBSz3cXL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2024 02:12:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714147964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eYUqEa4yY2qzSFoFdIvLcLWvg/98iZ7Cq/Vjg2cb5Pg=;
	b=iaVBsi9+KvAPRxFNS7Tpx2ZfTKHOwWJXU8AR5ITqSqRR1neFprAUhkGAWqITtivyad7jyz
	wUdKxC1jXCM+keMcB0kWSmQV9WwfgfXFxEvbBOHRH4WD9VYWqzMRDkfiDq77AqN3QHPy+B
	aVsdPHVQgN3Of9mzpMc6Vj7bR9Yvhk0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714147964;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eYUqEa4yY2qzSFoFdIvLcLWvg/98iZ7Cq/Vjg2cb5Pg=;
	b=iaVBsi9+KvAPRxFNS7Tpx2ZfTKHOwWJXU8AR5ITqSqRR1neFprAUhkGAWqITtivyad7jyz
	wUdKxC1jXCM+keMcB0kWSmQV9WwfgfXFxEvbBOHRH4WD9VYWqzMRDkfiDq77AqN3QHPy+B
	aVsdPHVQgN3Of9mzpMc6Vj7bR9Yvhk0=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-251-Pz7GR7mCMVq92MO6YbS34g-1; Fri, 26 Apr 2024 12:12:42 -0400
X-MC-Unique: Pz7GR7mCMVq92MO6YbS34g-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5aa35f3393bso594195eaf.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Apr 2024 09:12:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714147962; x=1714752762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYUqEa4yY2qzSFoFdIvLcLWvg/98iZ7Cq/Vjg2cb5Pg=;
        b=fCJ1aa6PHr7Kkg9rpTbbZSBI56YpTnlndIPJPszFGq2fnyfZmvFSEbvORT+omzT5Ij
         dnDEhkzquJSQPERGUbp8bCE8nRRLnPhRY8U+PkxvMFiRJI3KeZo1FIppbZITfeEYo9xE
         Nls665dO7jeP94z6qta2X+6S8Y3OAMJ9I5inFREtrdpPCz/bKGqyalZN2tgBLMMDOj4w
         87nw5DLG9Wni9YCcGllrspS1XS9IOWzcirh8d0d8vkOCg1UnICpKiIhFLUNYWxXmwkl/
         bdCuBD6hj9/fVODSZFA4gUeFdrscUEnDOzqG7K0Fe+bVYOCI3SjkdhGpoaDfY90ijYga
         efOg==
X-Forwarded-Encrypted: i=1; AJvYcCXN4n9OS7pKQsKUZwVp8oIAZW67JdK82qbYDGpidHm/f9IrYCbnYAnN/raUy01tNi8qkdX8ycP1cIPZVfMUCGH612M3c1q8E5tB+tGh1A==
X-Gm-Message-State: AOJu0YyxHcIVgCB9wlqc5Cvv3cH7vA9OgGp6skKSKFm3nqGdf6mM3yRe
	HhOgSox/Ux/8bocLIl4+kxCvyHVNWQaweLVvq5z5WJNNLbfRBtzKYebWDSpJ6D2u+766GuXrKTg
	auLsUDDqzTo4wQepo+VXFPDl5VDqk3dle/XwT8xVBJc7Plpw86w5OOnrHT5m4wVo=
X-Received: by 2002:a05:6870:a40f:b0:235:3e97:ed24 with SMTP id m15-20020a056870a40f00b002353e97ed24mr3125232oal.1.1714147961419;
        Fri, 26 Apr 2024 09:12:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKK09FSsz1w18C9O+QSKywaneNtUpj/aPvoeb+SOH3u9egTJYXPSkxUgqSN3BOrRHAMYNm3w==
X-Received: by 2002:a05:6870:a40f:b0:235:3e97:ed24 with SMTP id m15-20020a056870a40f00b002353e97ed24mr3125169oal.1.1714147960484;
        Fri, 26 Apr 2024 09:12:40 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id m6-20020ac807c6000000b00434fd7d6d00sm8007149qth.2.2024.04.26.09.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 09:12:40 -0700 (PDT)
Date: Fri, 26 Apr 2024 12:12:32 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 1/3] mm/gup: consistently name GUP-fast functions
Message-ID: <ZivScN8-Uoi9eye8@x1n>
References: <20240402125516.223131-1-david@redhat.com>
 <20240402125516.223131-2-david@redhat.com>
 <e685c532-8330-4a57-bc08-c67845e0c352@redhat.com>
 <Ziuv2jLY1wgBITiP@x1n>
MIME-Version: 1.0
In-Reply-To: <Ziuv2jLY1wgBITiP@x1n>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: linux-s390@vger.kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 26, 2024 at 09:44:58AM -0400, Peter Xu wrote:
> On Fri, Apr 26, 2024 at 09:17:47AM +0200, David Hildenbrand wrote:
> > On 02.04.24 14:55, David Hildenbrand wrote:
> > > Let's consistently call the "fast-only" part of GUP "GUP-fast" and rename
> > > all relevant internal functions to start with "gup_fast", to make it
> > > clearer that this is not ordinary GUP. The current mixture of
> > > "lockless", "gup" and "gup_fast" is confusing.
> > > 
> > > Further, avoid the term "huge" when talking about a "leaf" -- for
> > > example, we nowadays check pmd_leaf() because pmd_huge() is gone. For the
> > > "hugepd"/"hugepte" stuff, it's part of the name ("is_hugepd"), so that
> > > stays.
> > > 
> > > What remains is the "external" interface:
> > > * get_user_pages_fast_only()
> > > * get_user_pages_fast()
> > > * pin_user_pages_fast()
> > > 
> > > The high-level internal functions for GUP-fast (+slow fallback) are now:
> > > * internal_get_user_pages_fast() -> gup_fast_fallback()
> > > * lockless_pages_from_mm() -> gup_fast()
> > > 
> > > The basic GUP-fast walker functions:
> > > * gup_pgd_range() -> gup_fast_pgd_range()
> > > * gup_p4d_range() -> gup_fast_p4d_range()
> > > * gup_pud_range() -> gup_fast_pud_range()
> > > * gup_pmd_range() -> gup_fast_pmd_range()
> > > * gup_pte_range() -> gup_fast_pte_range()
> > > * gup_huge_pgd()  -> gup_fast_pgd_leaf()
> > > * gup_huge_pud()  -> gup_fast_pud_leaf()
> > > * gup_huge_pmd()  -> gup_fast_pmd_leaf()
> > > 
> > > The weird hugepd stuff:
> > > * gup_huge_pd() -> gup_fast_hugepd()
> > > * gup_hugepte() -> gup_fast_hugepte()
> > 
> > I just realized that we end up calling these from follow_hugepd() as well.
> > And something seems to be off, because gup_fast_hugepd() won't have the VMA
> > even in the slow-GUP case to pass it to gup_must_unshare().
> > 
> > So these are GUP-fast functions and the terminology seem correct. But the
> > usage from follow_hugepd() is questionable,
> > 
> > commit a12083d721d703f985f4403d6b333cc449f838f6
> > Author: Peter Xu <peterx@redhat.com>
> > Date:   Wed Mar 27 11:23:31 2024 -0400
> > 
> >     mm/gup: handle hugepd for follow_page()
> > 
> > 
> > states "With previous refactors on fast-gup gup_huge_pd(), most of the code
> > can be leveraged", which doesn't look quite true just staring the the
> > gup_must_unshare() call where we don't pass the VMA. Also,
> > "unlikely(pte_val(pte) != pte_val(ptep_get(ptep)" doesn't make any sense for
> > slow GUP ...
> 
> Yes it's not needed, just doesn't look worthwhile to put another helper on
> top just for this.  I mentioned this in the commit message here:
> 
>   There's something not needed for follow page, for example, gup_hugepte()
>   tries to detect pgtable entry change which will never happen with slow
>   gup (which has the pgtable lock held), but that's not a problem to check.
> 
> > 
> > @Peter, any insights?
> 
> However I think we should pass vma in for sure, I guess I overlooked that,
> and it didn't expose in my tests too as I probably missed ./cow.
> 
> I'll prepare a separate patch on top of this series and the gup-fast rename
> patches (I saw this one just reached mm-stable), and I'll see whether I can
> test it too if I can find a Power system fast enough.  I'll probably drop
> the "fast" in the hugepd function names too.

Hmm, so when I enable 2M hugetlb I found ./cow is even failing on x86.

  # ./cow  | grep -B1 "not ok"
  # [RUN] vmsplice() + unmap in child ... with hugetlb (2048 kB)
  not ok 161 No leak from parent into child
  --
  # [RUN] vmsplice() + unmap in child with mprotect() optimization ... with hugetlb (2048 kB)
  not ok 215 No leak from parent into child
  --
  # [RUN] vmsplice() before fork(), unmap in parent after fork() ... with hugetlb (2048 kB)
  not ok 269 No leak from child into parent
  --
  # [RUN] vmsplice() + unmap in parent after fork() ... with hugetlb (2048 kB)
  not ok 323 No leak from child into parent

And it looks like it was always failing.. perhaps since the start?  We
didn't do the same on hugetlb v.s. normal anon from that regard on the
vmsplice() fix.

I drafted a patch to allow refcount>1 detection as the same, then all tests
pass for me, as below.

David, I'd like to double check with you before I post anything: is that
your intention to do so when working on the R/O pinning or not?

Thanks,

=========
From 7300c249738dadda1457c755b597c1551dfe8dc6 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Fri, 26 Apr 2024 11:41:12 -0400
Subject: [PATCH] mm/hugetlb: Fix vmsplice case on memory leak once more

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 mm/hugetlb.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 417fc5cdb6ee..1ca102013561 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -5961,10 +5961,13 @@ static vm_fault_t hugetlb_wp(struct folio *pagecache_folio,
 
 retry_avoidcopy:
 	/*
-	 * If no-one else is actually using this page, we're the exclusive
-	 * owner and can reuse this page.
+	 * If the page is marked exlusively owned (e.g. longterm pinned),
+	 * we can reuse it.  Otherwise if no-one else is using this page,
+	 * we can savely set the exclusive bit and reuse it.
 	 */
-	if (folio_mapcount(old_folio) == 1 && folio_test_anon(old_folio)) {
+	if (folio_test_anon(old_folio) &&
+	    (PageAnonExclusive(&old_folio->page) ||
+	     folio_ref_count(old_folio) == 1)) {
 		if (!PageAnonExclusive(&old_folio->page)) {
 			folio_move_anon_rmap(old_folio, vma);
 			SetPageAnonExclusive(&old_folio->page);
-- 
2.44.0


-- 
Peter Xu

