Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FFA6101C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 21:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mywrd6xnfz3cFG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 06:35:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vu9bkJw8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a3lSqT8v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vu9bkJw8;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=a3lSqT8v;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mywqf4JCPz2xvF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 06:34:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666899289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tx2gESFAK3253ffbrGpKyhHhqag34Mq8L8Hseba/Seg=;
	b=Vu9bkJw8TRa/D5xfIylb0gcMA5meH752mnJN5pmyznU+RWclfRaHKke1VVGKfe+ztI65un
	jdwHBevLdQ3HJi8CZvYyc8B9FjFp+uB0OyQ0SFnO/oUxJf7H4K6fROYE9UtiSTNWwgn7Hn
	47YDqzTXmudDTzTDM2N5K4z2o7fpPgc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1666899290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tx2gESFAK3253ffbrGpKyhHhqag34Mq8L8Hseba/Seg=;
	b=a3lSqT8vSgt12uzaB8klTAe5kZ9WrWgYSFIpIs8A0nsxLTLYkk33sx+A8jn37YTqOZCtPF
	NU2xsH2h7MRnLZvYkJaTOHR4Ar9PwclT7eCHYWm89BwKagvFTbqJnWbQOCZJWFlk5vRdk/
	wL03eS5SCaGGglspoHsm6iN/hALBHeo=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-193-lTAReQIxMK6QpAvi89hnDg-1; Thu, 27 Oct 2022 15:34:47 -0400
X-MC-Unique: lTAReQIxMK6QpAvi89hnDg-1
Received: by mail-il1-f197.google.com with SMTP id w15-20020a056e021c8f00b003006eca5e09so2269178ill.11
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Oct 2022 12:34:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tx2gESFAK3253ffbrGpKyhHhqag34Mq8L8Hseba/Seg=;
        b=wQhxqcx5b1E3kIQfoZYaQo2C/Bgf+QgKuux79+ea/pF4Aj3felc082fsl60tqYDEWV
         jYVQyylNG5IUejhnrQqy/aktagCib1ySbK4Z4CZ0nODMgpNCIWWgBecd3JqsOndeyzef
         D4oXjCvEF5eux1guLqX6/XtFLbqEEbXld/ipAOu5GDPwCU/4/lYaPYPOsjwZgwoTu1jE
         T0SeN6KZy+PhPsRAVUOpJfoHXdZvJrpMyJgjUbkiiwY5ET9fPR+6ot/jvwHJon9QBrg2
         aO82pwB++vNuS2j893Eq0hCCYdZzx+aq+0PhFLqkBJ8FoaB6nELABJFTi8DLqPFDj01T
         LrOQ==
X-Gm-Message-State: ACrzQf3l4ykkgyVDSah+V0CLPof53YltqPzaK7rJ9MvFAaN65sMSRhQY
	dNDIyp8+ChXJTgOIQMv00Y67jlcQpQdM6m7i4S3MuWTZJ38E/jRaxpaHdMHVkYm1ayuzFfagvGS
	Zs7b5L2cAahQH79zLAPBD+co/nw==
X-Received: by 2002:a6b:c5c4:0:b0:6a2:4ab2:6490 with SMTP id v187-20020a6bc5c4000000b006a24ab26490mr29199025iof.129.1666899286612;
        Thu, 27 Oct 2022 12:34:46 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6cGzT9i6Rfwi656plZyQuUAv9OHOayiwU9jMYHr7uBSa1oyZ7maHvd2m5rccwbYfR9LbeHzg==
X-Received: by 2002:a6b:c5c4:0:b0:6a2:4ab2:6490 with SMTP id v187-20020a6bc5c4000000b006a24ab26490mr29199002iof.129.1666899286241;
        Thu, 27 Oct 2022 12:34:46 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-46-70-31-27-79.dsl.bell.ca. [70.31.27.79])
        by smtp.gmail.com with ESMTPSA id n4-20020a056638110400b00374ff5df5ccsm868543jal.167.2022.10.27.12.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 12:34:45 -0700 (PDT)
Date: Thu, 27 Oct 2022 15:34:44 -0400
From: Peter Xu <peterx@redhat.com>
To: Mike Kravetz <mike.kravetz@oracle.com>
Subject: Re: [PATCH v3] hugetlb: simplify hugetlb handling in follow_page_mask
Message-ID: <Y1rdVLMDD4PMt3s3@x1n>
References: <20220919021348.22151-1-mike.kravetz@oracle.com>
 <Y1mtz7dFAlhGRsAd@x1n>
 <Y1nR/KToV44GKZ5G@monkey>
MIME-Version: 1.0
In-Reply-To: <Y1nR/KToV44GKZ5G@monkey>
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
Cc: Naoya Horiguchi <naoya.horiguchi@linux.dev>, linux-ia64@vger.kernel.org, David Hildenbrand <david@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Muchun Song <songmuchun@bytedance.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Baolin Wang <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 26, 2022 at 05:34:04PM -0700, Mike Kravetz wrote:
> On 10/26/22 17:59, Peter Xu wrote:
> > Hi, Mike,
> > 
> > On Sun, Sep 18, 2022 at 07:13:48PM -0700, Mike Kravetz wrote:
> > > +struct page *hugetlb_follow_page_mask(struct vm_area_struct *vma,
> > > +				unsigned long address, unsigned int flags)
> > > +{
> > > +	struct hstate *h = hstate_vma(vma);
> > > +	struct mm_struct *mm = vma->vm_mm;
> > > +	unsigned long haddr = address & huge_page_mask(h);
> > > +	struct page *page = NULL;
> > > +	spinlock_t *ptl;
> > > +	pte_t *pte, entry;
> > > +
> > > +	/*
> > > +	 * FOLL_PIN is not supported for follow_page(). Ordinary GUP goes via
> > > +	 * follow_hugetlb_page().
> > > +	 */
> > > +	if (WARN_ON_ONCE(flags & FOLL_PIN))
> > > +		return NULL;
> > > +
> > > +retry:
> > > +	/*
> > > +	 * vma lock prevents racing with another thread doing a pmd unshare.
> > > +	 * This keeps pte as returned by huge_pte_offset valid.
> > > +	 */
> > > +	hugetlb_vma_lock_read(vma);
> > 
> > I'm not sure whether it's okay to take a rwsem here, as the code can be
> > called by e.g. FOLL_NOWAIT?
> 
> I think you are right.  This is possible even thought not called this
> way today,
> 
> > I'm wondering whether it's fine to just drop this anyway, just always walk
> > it lockless.  IIUC gup callers should be safe here because the worst case
> > is the caller will fetch a wrong page, but then it should be invalidated
> > very soon with mmu notifiers.  One thing worth mention is that pmd unshare
> > should never free a pgtable page.
> 
> You are correct in that pmd unshare will not directly free a pgtable page.
> However, I think a 'very worst case' race could be caused by two threads(1,2)
> in the same process A, and another process B.  Processes A and B share a PMD.
> - Process A thread 1 gets a *ptep via huge_pte_offset and gets scheduled out.
> - Process A thread 2 calls mprotect to change protection and unshares
>   the PMD shared with process B.
> - Process B then unmaps the PMD shared with process A and the PMD page
>   gets deleted.

[2]

> - The *ptep in Process A thread 1 then points into a freed page.
> This is VERY unlikely, but I do think it is possible and is the reason I
> may be overcautious about protecting against races with pmd unshare.

Yes this is possible, I just realized that actually huge_pte_offset() is a
soft pgtable walker too.  Thanks for pointing that out.

If we want to use the vma read lock to protect here as the slow gup path,
then please check again with below [1] - I think we'll also need to protect
it with fast-gup (probably with trylock only, because fast-gup cannot
sleep) or it'll encounter the same race, iiuc.

Actually, instead of using vma lock, I really think this is another problem
and needs standalone fixing.  The problem is we allows huge_pte_offset() to
walk the process pgtable without any protection, while pmd unsharing can
drop a page anytime.  huge_pte_offset() is always facing use-after-free
when walking the PUD page.

We may want RCU lock to protect the pgtable pages from getting away when
huge_pte_offset() is walking it, it'll be safe then because pgtable pages
are released in RCU fashion only (e.g. in above example, process [2] will
munmap() and release the last ref to the "used to be shared" pmd and the
PUD that maps the shared pmds will be released only after a RCU grace
period), and afaict that's also what's protecting fast-gup from accessing
freed pgtable pages.

If with all huge_pte_offset() callers becoming RCU-safe, then IIUC we can
drop the vma lock in all GUP code, aka, in hugetlb_follow_page_mask() here,
because both slow and fast gup should be safe too in the same manner.

Thanks,

> > IIUC it's also the same as fast-gup - afaiu we don't take the read vma lock
> > in fast-gup too but I also think it's safe.  But I hope I didn't miss
> > something.

[1]

-- 
Peter Xu

