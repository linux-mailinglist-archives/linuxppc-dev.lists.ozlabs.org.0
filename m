Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1CB85D76B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 12:50:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FbVC0V8V;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OCEOFLXS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfvjC6Mvyz3cFf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 22:50:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FbVC0V8V;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OCEOFLXS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfvhQ05hsz2xYY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 22:49:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708516177;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bin7AzDlChDSAGWFKufeiYIoVcIyTk+S1hiBB6egTbw=;
	b=FbVC0V8Vhc5mwXZVypQyqzb+ZrZh+Acye/6/ruKuW6r3ol7YQ6Pd/vc4MJxeyng8+0Th6m
	rRYcPY5IHPbAmxIeKFjsjZaFXtTxz6FXYQ1OLwLUyXxj/ST1EHCQDqwDZDrsYwtk1jQPAw
	QZVu2//lL6CSg5p+VUEEQTxLKZfdPpo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708516178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bin7AzDlChDSAGWFKufeiYIoVcIyTk+S1hiBB6egTbw=;
	b=OCEOFLXSBD/8i8sv08qzPzUotE5t9YcrE7a6KoeucaqH/pNhreQka3+8FR55mhZtukJmcA
	kR9Ej93WZT+FGBZiuf2Lzb8QeJCaldJocDwt+A4Gw71JPcVrEi9eFaWfjhiNagnCM3TRcn
	84jqc4cDLWZF6cjr0nxrvvGQZdlAVYI=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-c5GCFaqqOIeJcY91M1MxhQ-1; Wed, 21 Feb 2024 06:49:36 -0500
X-MC-Unique: c5GCFaqqOIeJcY91M1MxhQ-1
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5a0168a3df5so207268eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 03:49:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708516175; x=1709120975;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bin7AzDlChDSAGWFKufeiYIoVcIyTk+S1hiBB6egTbw=;
        b=avcrH/P0Nyj9KNc8i5+TEkLv7kFolmBlRT530zhCl/MZ25eOKxGpGV9D7QJ2RCJ+JR
         fXnAoiePKeIhsl9NXr1ECdkMNp78R+R9d17OujhGYxHwS/5pwS35nNS9di62uJhfVl8B
         Azuq2LkVsvLDllWyRJInzOILzFq1wmscWUL0hJLRXF7CeuUMHFx3vti0TSzyx1uCZmKd
         slc9c1mDakJsdnoWks+YJWrXnlC7NhyYp6KEGRuk3vnK0WG3XK9v6va4LD4zvjgX8+7V
         NmGd1pNRQxaQXCxn784jIC/dBahJe8MpTkfOrKn+0qUt28Z53flFqCN4Rl5ceZsKtO7j
         4OZg==
X-Forwarded-Encrypted: i=1; AJvYcCUc8K7lcJohCHFX4/NYLfl2JB2QCf+znL6KloWAenfJMsVTLLE3tHr4gO4ek4Ym+mHUI2YH3lP+VekXTs0qm8c1Wkv6g5TvTc/Xq8bjLg==
X-Gm-Message-State: AOJu0Yxvji4XmOijVNnwsUoa+MHXT1RGxYMss7+jrtoljyZXkgezKltg
	pf64jeK14BbAKCAlbnO044IzDrIzygBWshKjByAYktxdmcvrgzy3ILHrz6sbstZpxzUNFJmfApD
	Tg7oQcY/lk3vElyTbbC9yCl/scqSPcfVXkJYacE+HkAIa7z3dNKK3WQHYa53eB/0=
X-Received: by 2002:a05:6358:e49a:b0:178:9f1d:65e3 with SMTP id by26-20020a056358e49a00b001789f1d65e3mr16912446rwb.0.1708516175626;
        Wed, 21 Feb 2024 03:49:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGzL228YTGBKB2uXR1bZQUntRIhXzOYaVH/u+cU7rZshqOXYoJ5XOeq8q0ePg1PQ/TTyms+Jw==
X-Received: by 2002:a05:6358:e49a:b0:178:9f1d:65e3 with SMTP id by26-20020a056358e49a00b001789f1d65e3mr16912401rwb.0.1708516175144;
        Wed, 21 Feb 2024 03:49:35 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id w24-20020aa78598000000b006e4695e519csm5146763pfn.194.2024.02.21.03.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 03:49:34 -0800 (PST)
Date: Wed, 21 Feb 2024 19:49:22 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 10/13] mm/gup: Handle huge pud for follow_pud_mask()
Message-ID: <ZdXjQjow4fa41ORD@x1n>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-11-peterx@redhat.com>
 <20240115184900.GV734935@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240115184900.GV734935@nvidia.com>
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
Cc: James Houghton <jthoughton@google.com>, David Hildenbrand <david@redhat.com>, Yang Shi <shy828301@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>, linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>, Christoph Hellwig <hch@infradead.org>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, Axel Rasmussen <axelrasmussen@google.com>, Rik van Riel <riel@surriel.com>, John Hubbard <jhubbard@nvidia.com>, "Kirill A . Shutemov" <kirill@shutemov.name>, linux-arm-kernel@lists.infradead.org, Lorenzo Stoakes <lstoakes@gmail.com>, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 15, 2024 at 02:49:00PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 03, 2024 at 05:14:20PM +0800, peterx@redhat.com wrote:
> > diff --git a/mm/gup.c b/mm/gup.c
> > index 63845b3ec44f..760406180222 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -525,6 +525,70 @@ static struct page *no_page_table(struct vm_area_struct *vma,
> >  	return NULL;
> >  }
> >  
> > +#ifdef CONFIG_PGTABLE_HAS_HUGE_LEAVES
> > +static struct page *follow_huge_pud(struct vm_area_struct *vma,
> > +				    unsigned long addr, pud_t *pudp,
> > +				    int flags, struct follow_page_context *ctx)
> > +{
> > +	struct mm_struct *mm = vma->vm_mm;
> > +	struct page *page;
> > +	pud_t pud = *pudp;
> > +	unsigned long pfn = pud_pfn(pud);
> > +	int ret;
> > +
> > +	assert_spin_locked(pud_lockptr(mm, pudp));
> > +
> > +	if ((flags & FOLL_WRITE) && !pud_write(pud))
> > +		return NULL;
> > +
> > +	if (!pud_present(pud))
> > +		return NULL;
> > +
> > +	pfn += (addr & ~PUD_MASK) >> PAGE_SHIFT;
> > +
> > +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
> > +	if (pud_devmap(pud)) {
> 
> Can this use IS_ENABLED(CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD) ?

Sure.

> 
> > +		/*
> > +		 * device mapped pages can only be returned if the caller
> > +		 * will manage the page reference count.
> > +		 *
> > +		 * At least one of FOLL_GET | FOLL_PIN must be set, so
> > +		 * assert that here:
> > +		 */
> > +		if (!(flags & (FOLL_GET | FOLL_PIN)))
> > +			return ERR_PTR(-EEXIST);
> > +
> > +		if (flags & FOLL_TOUCH)
> > +			touch_pud(vma, addr, pudp, flags & FOLL_WRITE);
> > +
> > +		ctx->pgmap = get_dev_pagemap(pfn, ctx->pgmap);
> > +		if (!ctx->pgmap)
> > +			return ERR_PTR(-EFAULT);
> > +	}
> > +#endif	/* CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD */
> > +	page = pfn_to_page(pfn);
> > +
> > +	if (!pud_devmap(pud) && !pud_write(pud) &&
> > +	    gup_must_unshare(vma, flags, page))
> > +		return ERR_PTR(-EMLINK);
> > +
> > +	ret = try_grab_page(page, flags);
> > +	if (ret)
> > +		page = ERR_PTR(ret);
> > +	else
> > +		ctx->page_mask = HPAGE_PUD_NR - 1;
> > +
> > +	return page;
> > +}
> > +#else  /* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
> > +static struct page *follow_huge_pud(struct vm_area_struct *vma,
> > +				    unsigned long addr, pud_t *pudp,
> > +				    int flags, struct follow_page_context *ctx)
> > +{
> > +	return NULL;
> > +}
> > +#endif	/* CONFIG_PGTABLE_HAS_HUGE_LEAVES */
> > +
> >  static int follow_pfn_pte(struct vm_area_struct *vma, unsigned long address,
> >  		pte_t *pte, unsigned int flags)
> >  {
> > @@ -760,11 +824,11 @@ static struct page *follow_pud_mask(struct vm_area_struct *vma,
> >  
> >  	pudp = pud_offset(p4dp, address);
> >  	pud = READ_ONCE(*pudp);
> > -	if (pud_none(pud))
> > +	if (pud_none(pud) || !pud_present(pud))
> >  		return no_page_table(vma, flags, address);
> 
> Isn't 'pud_none() || !pud_present()' redundent? A none pud is
> non-present, by definition?

Hmm yes, seems redundant.  Let me drop it.

> 
> > -	if (pud_devmap(pud)) {
> > +	if (pud_huge(pud)) {
> >  		ptl = pud_lock(mm, pudp);
> > -		page = follow_devmap_pud(vma, address, pudp, flags, &ctx->pgmap);
> > +		page = follow_huge_pud(vma, address, pudp, flags, ctx);
> >  		spin_unlock(ptl);
> >  		if (page)
> >  			return page;
> 
> Otherwise it looks OK to me
> 
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks!

-- 
Peter Xu

