Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF6A88769E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 03:16:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E2onWG02;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E2onWG02;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V1jVN5tWMz3vcP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Mar 2024 13:16:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E2onWG02;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=E2onWG02;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V1jTd0l6Wz3dV4
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Mar 2024 13:15:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711160129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pAkp5p3e769nx5gm8jMLR0gRsGSeiOkGgQjUssudat0=;
	b=E2onWG02mtI9NWZ539rc+FGL3e+FzxxUNlhpw0EB41GoQGXRYlrAuAJ48alY3d0dODV9cm
	XYBNlBKgyC7erd3RkV3FJMmI84cQ5+Dls+w3QBGOCwr+/rI/JJPIPVUxWKt7CVV5NqxntU
	OfmzaoO7LZkXzkC5kV5g7bJLwIA8ItA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711160129;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pAkp5p3e769nx5gm8jMLR0gRsGSeiOkGgQjUssudat0=;
	b=E2onWG02mtI9NWZ539rc+FGL3e+FzxxUNlhpw0EB41GoQGXRYlrAuAJ48alY3d0dODV9cm
	XYBNlBKgyC7erd3RkV3FJMmI84cQ5+Dls+w3QBGOCwr+/rI/JJPIPVUxWKt7CVV5NqxntU
	OfmzaoO7LZkXzkC5kV5g7bJLwIA8ItA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-526-iy7ASRdoOdm7bd2_QjFiRg-1; Fri, 22 Mar 2024 22:15:27 -0400
X-MC-Unique: iy7ASRdoOdm7bd2_QjFiRg-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-430c9bbe925so5082321cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Mar 2024 19:15:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711160124; x=1711764924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pAkp5p3e769nx5gm8jMLR0gRsGSeiOkGgQjUssudat0=;
        b=ExNxhfRznKM8qwjeF2DXWOEVzPOgDWmHp5x+ZUk1cMHNNhmFXBv1aQ8zCwoqqJxiWN
         Sqp+BZvmyC8wLlbyDcW6ijfmj1Pf+1rAk+wkE4jmGRlhJfZ7LSbBSIzvn2A9ndsR3AT/
         6NYi2kxI68Ak3UsP95Fp1hN7PLDUVjgBQ8+R+P0ZxN0Zl1WPztKeibH44yh53Gf+icgm
         2/hxFXWWkD6zyDRTdjaakTLv/SW9x6iGeoUbJk44UJjDSEDDoEkQ6DMcQhZvdZLjg5TA
         /mrZWuV17GR11u13qJyg5YvIwXWPj6wTB8KrPu7+O14RlSuV8WCrlqQxcgKsLsXxE2fQ
         k6QA==
X-Forwarded-Encrypted: i=1; AJvYcCUL13ZMnf21k5QfJExabwlVOGJtkwHHSwfxW3EySUfVPywQ2DZ6WjQ1e6I/bd3HjCxMTopK95xsE8hsC03lkofuIjTNUaSAhqqDqsaXpw==
X-Gm-Message-State: AOJu0YxCWVEEHuyfX6z9vYZm4AiE3A+6/7jARTeDqkjWWdexwo8gTLRV
	S97MS2ig5dzNf8qgLhvSM5lGU3VRmF8sWFDiqdralsWcZQONZ9yfqoenvPP8g/QKeLrU6yU1AiW
	uB4IYV8+nQbOMG52K+TGEJMw+KM09Y2Zop4jK/soKlXjq6sti7saN0+kK+dXGuj8=
X-Received: by 2002:a05:622a:528b:b0:431:3e97:fb0b with SMTP id dr11-20020a05622a528b00b004313e97fb0bmr799012qtb.3.1711160124131;
        Fri, 22 Mar 2024 19:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSSiaxwf9qVJ61bWD658BkK6bIoISbqMAPHSz2R/uod8u0yF1+dnf1k4ZlNnixmtjYf7I/qg==
X-Received: by 2002:a05:622a:528b:b0:431:3e97:fb0b with SMTP id dr11-20020a05622a528b00b004313e97fb0bmr798965qtb.3.1711160123562;
        Fri, 22 Mar 2024 19:15:23 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id f9-20020a05622a114900b0043140cd9996sm152221qty.38.2024.03.22.19.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Mar 2024 19:15:23 -0700 (PDT)
Date: Fri, 22 Mar 2024 22:15:20 -0400
From: Peter Xu <peterx@redhat.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 12/12] mm/gup: Handle hugetlb in the generic
 follow_page_mask code
Message-ID: <Zf47OKjYjkUhs6AT@x1n>
References: <20240321220802.679544-1-peterx@redhat.com>
 <20240321220802.679544-13-peterx@redhat.com>
 <20240322134818.9b312f77629f79fcf1564b6f@linux-foundation.org>
 <Zf4mR_OxE5Ft4VJg@x1n>
MIME-Version: 1.0
In-Reply-To: <Zf4mR_OxE5Ft4VJg@x1n>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Matthew Wilcox <willy@infradead.org>, Christoph Hellwig <hch@infradead.org>, linux-arm-kernel@lists.infradead.org, Jason Gunthorpe <jgg@nvidia.com>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 08:45:59PM -0400, Peter Xu wrote:
> On Fri, Mar 22, 2024 at 01:48:18PM -0700, Andrew Morton wrote:
> > On Thu, 21 Mar 2024 18:08:02 -0400 peterx@redhat.com wrote:
> > 
> > > From: Peter Xu <peterx@redhat.com>
> > > 
> > > Now follow_page() is ready to handle hugetlb pages in whatever form, and
> > > over all architectures.  Switch to the generic code path.
> > > 
> > > Time to retire hugetlb_follow_page_mask(), following the previous
> > > retirement of follow_hugetlb_page() in 4849807114b8.
> > > 
> > > There may be a slight difference of how the loops run when processing slow
> > > GUP over a large hugetlb range on cont_pte/cont_pmd supported archs: each
> > > loop of __get_user_pages() will resolve one pgtable entry with the patch
> > > applied, rather than relying on the size of hugetlb hstate, the latter may
> > > cover multiple entries in one loop.
> > > 
> > > A quick performance test on an aarch64 VM on M1 chip shows 15% degrade over
> > > a tight loop of slow gup after the path switched.  That shouldn't be a
> > > problem because slow-gup should not be a hot path for GUP in general: when
> > > page is commonly present, fast-gup will already succeed, while when the
> > > page is indeed missing and require a follow up page fault, the slow gup
> > > degrade will probably buried in the fault paths anyway.  It also explains
> > > why slow gup for THP used to be very slow before 57edfcfd3419 ("mm/gup:
> > > accelerate thp gup even for "pages != NULL"") lands, the latter not part of
> > > a performance analysis but a side benefit.  If the performance will be a
> > > concern, we can consider handle CONT_PTE in follow_page().
> > > 
> > > Before that is justified to be necessary, keep everything clean and simple.
> > > 
> > 
> > mm/gup.c:33:21: warning: 'follow_hugepd' declared 'static' but never defined [-Wunused-function]
> >    33 | static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
> >       |                     ^~~~~~~~~~~~~
> > 
> > --- a/mm/gup.c~mm-gup-handle-hugepd-for-follow_page-fix
> > +++ a/mm/gup.c
> > @@ -30,10 +30,12 @@ struct follow_page_context {
> >  	unsigned int page_mask;
> >  };
> >  
> > +#ifdef CONFIG_HAVE_FAST_GUP
> >  static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
> >  				  unsigned long addr, unsigned int pdshift,
> >  				  unsigned int flags,
> >  				  struct follow_page_context *ctx);
> > +#endif
> >  
> >  static inline void sanity_check_pinned_pages(struct page **pages,
> >  					     unsigned long npages)
> > _
> > 
> > 
> > This looks inelegant.
> > 
> > That's two build issues so far.  Please be more expansive in the
> > Kconfig variations when testing.  Especially when mucking with pgtable
> > macros.
> 
> Andrew,
> 
> Apologies for that, and also for a slightly late response.  Yeah it's time
> I'll need my set of things to do serious build tests, and I'll at least
> start to cover a few error prone configs/archs in with that.
> 
> I was trying to rely on the build bot in many of previous such cases, as
> that was quite useful to me to cover many build issues without investing my
> own test setups, but I think for some reason it retired and stopped working
> for a while.  Maybe I shouldn't have relied on it at all.
> 
> For this specific issue, I'm not sure if CONFIG_HAVE_FAST_GUP is proper?
> As follow_hugepd() is used in slow gup not fast.  So maybe we can put that
> under CONFIG_MMU below that code (and I think we can drop "static" too as I
> don't think it's anything useful).  My version of fixup attached at the end

the static is useful; below patch did pass on m68k but won't on
x86.. ignore that please.

> of email, and I verified it on m68k build.
> 
> I do plan to post a small fixup series to fix these issues (so far it may
> contain 1 formal patch to touch up vmstat_item_print_in_thp, and 2 fixups
> where I'll mark the subject with "fixup!" properly).  Either you can pick
> up below or you can wait for my small patchset, should be there either
> today or tomorrow.

I changed plan here too; I found more users of HPAGE_PMD_NR assuming it's
defined even if !CONFIG_MMU.  That's weird, as CONFIG_MMU doesn't even
define PMD_SHIFT...  To fix this I decided to use the old trick on using
BUILD_BUG() like it used to work before; frankly I don't know how that
didn't throw warnings, but i'll make sure it passes all known builds (ps: I
still haven't got my build harness ready, so that will still be limited but
should solve known issues).

In short: please wait for my fixup series.  Thanks.

> 
> Thanks,
> 
> ===8<===
> diff --git a/mm/gup.c b/mm/gup.c
> index 4cd349390477..a2ed8203495a 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -30,11 +30,6 @@ struct follow_page_context {
>         unsigned int page_mask;
>  };
>  
> -static struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
> -                                 unsigned long addr, unsigned int pdshift,
> -                                 unsigned int flags,
> -                                 struct follow_page_context *ctx);
> -
>  static inline void sanity_check_pinned_pages(struct page **pages,
>                                              unsigned long npages)
>  {
> @@ -505,6 +500,12 @@ static inline void mm_set_has_pinned_flag(unsigned long *mm_flags)
>  }
>  
>  #ifdef CONFIG_MMU
> +
> +struct page *follow_hugepd(struct vm_area_struct *vma, hugepd_t hugepd,
> +                          unsigned long addr, unsigned int pdshift,
> +                          unsigned int flags,
> +                          struct follow_page_context *ctx);
> +
>  static struct page *no_page_table(struct vm_area_struct *vma,
>                                   unsigned int flags, unsigned long address)
>  {
> ===8<===
> 
> -- 
> Peter Xu

-- 
Peter Xu

