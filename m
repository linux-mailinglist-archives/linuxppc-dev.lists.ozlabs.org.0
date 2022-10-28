Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B65F2611696
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 17:59:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MzS023gKRz3cK0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Oct 2022 02:58:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CqcSrMD2;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CqcSrMD2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CqcSrMD2;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CqcSrMD2;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MzRz53D37z3cFk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Oct 2022 02:58:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666972684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4h7qjUXjTtRvctXOxGac74UvVU5N5blmNjcxZ+F+ZAE=;
	b=CqcSrMD2svsm1W/7rAbeIOsOamlqZkTWJTYj0KxKiap5Y30Fs31yKN7eqJ4mVWfFs2Ql2b
	EWnzEFj7Gedhbjrf8rWanVwBm1uRrvuoVupPHYkPVbK8O5lDBLnb9r0eycV7DT0OeFthsS
	lH38ATNCYX73KwhICvK58NsmsMoHEjw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666972684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4h7qjUXjTtRvctXOxGac74UvVU5N5blmNjcxZ+F+ZAE=;
	b=CqcSrMD2svsm1W/7rAbeIOsOamlqZkTWJTYj0KxKiap5Y30Fs31yKN7eqJ4mVWfFs2Ql2b
	EWnzEFj7Gedhbjrf8rWanVwBm1uRrvuoVupPHYkPVbK8O5lDBLnb9r0eycV7DT0OeFthsS
	lH38ATNCYX73KwhICvK58NsmsMoHEjw=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-TxB9YNxpNWiqJYc2qPetww-1; Fri, 28 Oct 2022 11:58:02 -0400
X-MC-Unique: TxB9YNxpNWiqJYc2qPetww-1
Received: by mail-qt1-f199.google.com with SMTP id br5-20020a05622a1e0500b00394c40fee51so3579006qtb.17
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 08:58:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JZ6yJrsNWaZL1mSi1+tvHOq5SMXsifQHw4WS6aiyzU0=;
        b=Hah3MAOuXI2zChE9F+EHKxiduOoNxrIWpBtepU5iT64Z+U1CBB9uyEdgwqKHDiHRr0
         KiToGX6bh+8D/b7iLfpgmZqSfFsdswjWgi0+qGVJXWdluzUN/ncPaartIPRSd9J6xTMW
         W2IYIS0D2LovydL1l0VsdmJHtiAxUJ58dCOk+eyhxNa2hkv2qp1mzHyv38x0ele5Hx0K
         Whc9Ycp5v4eecGFHX/QRyPQtZ8E9evuClFfdqMyAVd/VVg3+yUHG3xCmyLB+wZl0rdV1
         UuVUCXr/8WNWW7Vw/5sBhrfyLmtUJIkSo7QahqMFD1s312Vb4TYxIBdz0JTmY+vFnff1
         utaQ==
X-Gm-Message-State: ACrzQf3J/mAG9vyZtEE/2KZUj+B2EwRCxeAJLz1AO2Ol4oL9L9y1sstM
	NSzgzIKR8Rl4qITsBr+V1luWrvB+6CrZM9gMyuSFolDocnuOwAwUHp9o7f412N5jT+rlW7TC/Kp
	PFRur0x69BGBulpDYojZKcbzZvQ==
X-Received: by 2002:a05:620a:298a:b0:6ee:e31f:6247 with SMTP id r10-20020a05620a298a00b006eee31f6247mr37888895qkp.744.1666972681965;
        Fri, 28 Oct 2022 08:58:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5zikpCggckW3kZmG1QOaNP6E0NjoUZTCfDs/eJV24ipKqDVWXHGGzTxuDAUamvi+z0+bbMXQ==
X-Received: by 2002:a05:620a:298a:b0:6ee:e31f:6247 with SMTP id r10-20020a05620a298a00b006eee31f6247mr37888868qkp.744.1666972681621;
        Fri, 28 Oct 2022 08:58:01 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id e12-20020a37ac0c000000b006e9b3096482sm3096362qkm.64.2022.10.28.08.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 08:58:00 -0700 (PDT)
Date: Fri, 28 Oct 2022 11:57:59 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v3] hugetlb: simplify hugetlb handling in follow_page_mask
Message-ID: <Y1v8B/6QYwt5hUgU@x1n>
References: <20220919021348.22151-1-mike.kravetz@oracle.com>
 <Y1mtz7dFAlhGRsAd@x1n>
 <Y1nR/KToV44GKZ5G@monkey>
 <Y1rdVLMDD4PMt3s3@x1n>
 <Y1v0/Y4Xiut2FWx4@monkey>
MIME-Version: 1.0
In-Reply-To: <Y1v0/Y4Xiut2FWx4@monkey>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/mixed; boundary="oZ7pR8BiPAaKWB7x"
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
Cc: Naoya Horiguchi <naoya.horiguchi@linux.dev>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--oZ7pR8BiPAaKWB7x
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Oct 28, 2022 at 08:27:57AM -0700, Mike Kravetz wrote:
> On 10/27/22 15:34, Peter Xu wrote:
> > On Wed, Oct 26, 2022 at 05:34:04PM -0700, Mike Kravetz wrote:
> > > On 10/26/22 17:59, Peter Xu wrote:
> > 
> > If we want to use the vma read lock to protect here as the slow gup path,
> > then please check again with below [1] - I think we'll also need to protect
> > it with fast-gup (probably with trylock only, because fast-gup cannot
> > sleep) or it'll encounter the same race, iiuc.
> > 
> > Actually, instead of using vma lock, I really think this is another problem
> > and needs standalone fixing.  The problem is we allows huge_pte_offset() to
> > walk the process pgtable without any protection, while pmd unsharing can
> > drop a page anytime.  huge_pte_offset() is always facing use-after-free
> > when walking the PUD page.
> > 
> > We may want RCU lock to protect the pgtable pages from getting away when
> > huge_pte_offset() is walking it, it'll be safe then because pgtable pages
> > are released in RCU fashion only (e.g. in above example, process [2] will
> > munmap() and release the last ref to the "used to be shared" pmd and the
> > PUD that maps the shared pmds will be released only after a RCU grace
> > period), and afaict that's also what's protecting fast-gup from accessing
> > freed pgtable pages.
> > 
> > If with all huge_pte_offset() callers becoming RCU-safe, then IIUC we can
> > drop the vma lock in all GUP code, aka, in hugetlb_follow_page_mask() here,
> > because both slow and fast gup should be safe too in the same manner.
> > 
> > Thanks,
> > 
> > > > IIUC it's also the same as fast-gup - afaiu we don't take the read vma lock
> > > > in fast-gup too but I also think it's safe.  But I hope I didn't miss
> > > > something.
> > 
> > [1]
> 
> Thanks Peter!  I think the best thing would be to eliminate the vma_lock
> calls in this patch.  The code it is replacing/simplifying does not do any
> locking, so no real regression.

Agreed.

> 
> I think a scheme like you describe above is going to require some more
> thought/work.  It might be better as a follow on patch.

So above is only a thought, but if you think it's so far not very wrong and
worth trying, I can see what I can get from it by some upcoming patches.

It shouldn't need a lot of change, but basically looking after all
huge_pte_offset() to make sure they're safe regarding walking the PUD.  I'm
attaching an initial patch to just start to comment on the usage of
huge_pte_offset() first because that'll be the gust of the upcoming
patchset (if there'll be), further comments welcomed too.  Thanks.

-- 
Peter Xu

--oZ7pR8BiPAaKWB7x
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-mm-hugetlb-Comment-huge_pte_offset-for-its-locking-r.patch"

From 186c56026ce8ccc555d3c7ebc0e7e8fd76e9e5c9 Mon Sep 17 00:00:00 2001
From: Peter Xu <peterx@redhat.com>
Date: Thu, 27 Oct 2022 17:41:11 -0400
Subject: [PATCH] mm/hugetlb: Comment huge_pte_offset() for its locking
 requirements
Content-type: text/plain

huge_pte_offset() is potentially a pgtable walker, looking up pte_t* for a
hugetlb address.

Normally, it's always safe to walk the pgtable as long as we're with the
mmap lock held for either read or write, because that guarantees the
pgtable pages will always be valid during the process.

But it's not true for hugetlbfs: hugetlbfs has the pmd sharing feature, it
means that even with mmap lock held, the PUD pgtable page can still go away
from under us if pmd unsharing is possible during the walk.

It's not always the case, e.g.:

  (1) If the mapping is private we're not prone to pmd sharing or
      unsharing, so it's okay.

  (2) If we're with the hugetlb vma lock held for either read/write, it's
      okay too because pmd unshare cannot happen at all.

Document all these explicitly for huge_pte_offset(), because it's really
not that obvious.  This also tells all the callers on what it needs to
guarantee huge_pte_offset() thread-safety.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/arm64/mm/hugetlbpage.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index 35e9a468d13e..90f084643718 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -329,6 +329,35 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, struct vm_area_struct *vma,
 	return ptep;
 }
 
+/*
+ * huge_pte_offset(): Walk the hugetlb pgtable until the last level PTE.
+ * Returns the pte_t* if found, or NULL if the address is not mapped.
+ *
+ * NOTE: since this function will walk all the pgtable pages (including not
+ * only normal pgtable page, but also PUD that can be unshared concurrently
+ * for VM_SHARED), the caller of this function should be responsible of its
+ * thread safety.  One can follow this rule:
+ *
+ *  (1) For private mappings: pmd unsharing is not possible, so it'll
+ *      always be safe if we're with the mmap sem for either read or write.
+ *      This is normally always the case, so IOW we don't need to do
+ *      anything special.
+ *
+ *  (2) For shared mappings: pmd unsharing is possible (so PUD page can go
+ *      away from under us!  It can be done by a pmd unshare with a follow
+ *      up munmap() on the other process), then we need either:
+ *
+ *     (2.1) hugetlb vma lock read or write held, to make sure pmd unshare
+ *           won't happen upon the range, or,
+ *
+ *     (2.2) RCU read lock, to make sure even pmd unsharing happened, the
+ *           old shared PUD page won't get freed from under us, so even of
+ *           the pte_t* can be obsolete, at least it's still always safe to
+ *           access the PUD page.
+ *
+ * PS: from the regard of (2.2), it's the same logic of fast-gup being safe
+ * for generic mm, as long as RCU is used to free any pgtable page.
+ */
 pte_t *huge_pte_offset(struct mm_struct *mm,
 		       unsigned long addr, unsigned long sz)
 {
-- 
2.37.3


--oZ7pR8BiPAaKWB7x--

