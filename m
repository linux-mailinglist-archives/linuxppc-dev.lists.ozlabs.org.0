Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9D885D3D0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 10:38:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TWbID7n+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TWbID7n+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfrnB3YKtz3cRd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 20:38:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TWbID7n+;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TWbID7n+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfrmN6Wqjz2xct
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 20:37:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708508273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BdaKpo1zKogZCn5PWAqhqXGnoFVUrqpY1LtEmaKu+FM=;
	b=TWbID7n+qbDmuF4T2xzcnY5fP3IEI2OKoLN5qO2Xzf/mWmj4777RmxQYNuT8IPYJjvZIvK
	xL2depBBZbYVeGeluk7AWUiutzNPb919EQDblH3GnmGunihd4L35Vt4G4l+0Ul+3zZ9irv
	e3P4yOZONvEhAaj7dYKP5DScZEk5Axc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708508273;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BdaKpo1zKogZCn5PWAqhqXGnoFVUrqpY1LtEmaKu+FM=;
	b=TWbID7n+qbDmuF4T2xzcnY5fP3IEI2OKoLN5qO2Xzf/mWmj4777RmxQYNuT8IPYJjvZIvK
	xL2depBBZbYVeGeluk7AWUiutzNPb919EQDblH3GnmGunihd4L35Vt4G4l+0Ul+3zZ9irv
	e3P4yOZONvEhAaj7dYKP5DScZEk5Axc=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-4cqlvdpmMpK395xYbqJ6eQ-1; Wed, 21 Feb 2024 04:37:51 -0500
X-MC-Unique: 4cqlvdpmMpK395xYbqJ6eQ-1
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6db0e05548fso1863915b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 01:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708508270; x=1709113070;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BdaKpo1zKogZCn5PWAqhqXGnoFVUrqpY1LtEmaKu+FM=;
        b=BTO952HugBtTAhhuyZgtYdt1KZf/V2NrPrcKqyuwc3PeOJod+OlcuUJknY0lb8Jc0I
         wY+5l1j7dgr8kESfAeaVwm4uPVVGhfY+kdEVeF2wi4PQiJ/ts0D6LYoiEpUBmtoA/h3G
         TcAeeAjuz4+P7ecoS03E379jD8cJkmGy09Gxm/cHX+emaEPAotmk/Lug+yzzJdhozy4H
         V8tL7eaxVyhMVNa//n5C5B0RsZSYsMqjCjma+HB7w+5ZSo3XdgcF2c8pc4goPZaZR3LW
         C461rFFKkLDkvcLtEONUyWdjL/Mjst9nIBzBiSbN8SYJY2TxjWd6SKlnprQMT4ddAlnl
         9pTw==
X-Forwarded-Encrypted: i=1; AJvYcCWuRhPzNz4EeanH/XZriFeTN+c84X4Rp3wJoLNhLIHjl+6RU4MnoD6SohMA5fwXY96RbdmEl0cn1F9O1kTU++st9gq0i5BAzRPZ2QVxNw==
X-Gm-Message-State: AOJu0Yw6WuSClGMaMx3F7W7pLSvRcje7QT8wof7UA0DZRT4N5CfJ5q82
	FV2UjGQLuj7DvLuOaUki4ZuptZTfSnymOVzCxFukTeBOxipQPUk3v/+JpsSuGVYfS8S9ZrBjEI9
	18p6ahYTCpSnr2a9AoU4D+muofAk8MbbPvacDVq6PkOJ0U6kuo4Sz66Ee7z0YVxE=
X-Received: by 2002:a05:6a00:3d13:b0:6e4:672b:f384 with SMTP id lo19-20020a056a003d1300b006e4672bf384mr7669552pfb.2.1708508269937;
        Wed, 21 Feb 2024 01:37:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGnK/5Xc9SKm0wQPEnUuYiqinVCHstqfWVnR5OuYxZ4xQLJmopCSPYZqNRQ2oNZWFAP27lsbg==
X-Received: by 2002:a05:6a00:3d13:b0:6e4:672b:f384 with SMTP id lo19-20020a056a003d1300b006e4672bf384mr7669524pfb.2.1708508269578;
        Wed, 21 Feb 2024 01:37:49 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id e11-20020aa7980b000000b006e4698d53casm4990624pfl.140.2024.02.21.01.37.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 01:37:49 -0800 (PST)
Date: Wed, 21 Feb 2024 17:37:37 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 03/13] mm: Provide generic pmd_thp_or_huge()
Message-ID: <ZdXEYfs_xhS_9gRo@x1n>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-4-peterx@redhat.com>
 <20240115175551.GP734935@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240115175551.GP734935@nvidia.com>
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

On Mon, Jan 15, 2024 at 01:55:51PM -0400, Jason Gunthorpe wrote:
> On Wed, Jan 03, 2024 at 05:14:13PM +0800, peterx@redhat.com wrote:
> > From: Peter Xu <peterx@redhat.com>
> > 
> > ARM defines pmd_thp_or_huge(), detecting either a THP or a huge PMD.  It
> > can be a helpful helper if we want to merge more THP and hugetlb code
> > paths.  Make it a generic default implementation, only exist when
> > CONFIG_MMU.  Arch can overwrite it by defining its own version.
> > 
> > For example, ARM's pgtable-2level.h defines it to always return false.
> > 
> > Keep the macro declared with all config, it should be optimized to a false
> > anyway if !THP && !HUGETLB.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >  include/linux/pgtable.h | 4 ++++
> >  mm/gup.c                | 3 +--
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > index 466cf477551a..2b42e95a4e3a 100644
> > --- a/include/linux/pgtable.h
> > +++ b/include/linux/pgtable.h
> > @@ -1362,6 +1362,10 @@ static inline int pmd_write(pmd_t pmd)
> >  #endif /* pmd_write */
> >  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> >  
> > +#ifndef pmd_thp_or_huge
> > +#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
> > +#endif
> 
> Why not just use pmd_leaf() ?
> 
> This GUP case seems to me exactly like what pmd_leaf() should really
> do and be used for..

I think I mostly agree with you, and these APIs are indeed confusing.  IMHO
the challenge is about the risk of breaking others on small changes in the
details where evil resides.

> 
> eg x86 does:
> 
> #define pmd_leaf	pmd_large
> static inline int pmd_large(pmd_t pte)
> 	return pmd_flags(pte) & _PAGE_PSE;
> 
> static inline int pmd_trans_huge(pmd_t pmd)
> 	return (pmd_val(pmd) & (_PAGE_PSE|_PAGE_DEVMAP)) == _PAGE_PSE;
> 
> int pmd_huge(pmd_t pmd)
>         return !pmd_none(pmd) &&
>                 (pmd_val(pmd) & (_PAGE_PRESENT|_PAGE_PSE)) != _PAGE_PRESENT;

For example, here I don't think it's strictly pmd_leaf()? As pmd_huge()
will return true if PRESENT=0 && PSE=0 (as long as none pte ruled out
first), while pmd_leaf() will return false; I think that came from
cbef8478bee5.  I'm not sure whether that is the best solution, e.g., from a
1st glance it seems better to me to process swap entries separately
(including both migration and poisoned entries)..

Sparc has similar things there, which in that case I'm not sure whether a
direct replace is always safe.

Besides that, there're also other cases where it's not clear of such direct
replacement, not until further investigated.  E.g., arm-3level has:

#define pmd_leaf(pmd)		pmd_sect(pmd)
#define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
						 PMD_TYPE_SECT)
#define PMD_TYPE_SECT		(_AT(pmdval_t, 1) << 0)

While pmd_huge() there relies on PMD_TABLE_BIT ()

int pmd_huge(pmd_t pmd)
{
	return pmd_val(pmd) && !(pmd_val(pmd) & PMD_TABLE_BIT);
}

#define PMD_TABLE_BIT		(_AT(pmdval_t, 1) << 1)

These are just the trivial details that I wanted to avoid to touch in this
series, so as to resolve the hugetlb issue separately from others.

The new pmd_huge_or_thp() is not ideal, but that easily isolates all these
trivial details / evils out of the picture, so that we can tackle them one
by one.  It is strictly an OR or huge||thp, so it's hopefully safe to not
break anything yet from that regard.

> 
> I spot checked a couple arches and it looks like it holds up.
> 
> Further, it looks to me like this site in GUP is the only core code
> caller..
> 
> So, I'd suggest a small series to go arch by arch and convert the arch
> to use pmd_huge() == pmd_leaf(). Then retire pmd_huge() as a public
> API.
> 
> > diff --git a/mm/gup.c b/mm/gup.c
> > index df83182ec72d..eebae70d2465 100644
> > --- a/mm/gup.c
> > +++ b/mm/gup.c
> > @@ -3004,8 +3004,7 @@ static int gup_pmd_range(pud_t *pudp, pud_t pud, unsigned long addr, unsigned lo
> >  		if (!pmd_present(pmd))
> >  			return 0;
> >  
> > -		if (unlikely(pmd_trans_huge(pmd) || pmd_huge(pmd) ||
> > -			     pmd_devmap(pmd))) {
> > +		if (unlikely(pmd_thp_or_huge(pmd) || pmd_devmap(pmd))) {
> >  			/* See gup_pte_range() */
> >  			if (pmd_protnone(pmd))
> >  				return 0;
> 
> And the devmap thing here doesn't make any sense either. The arch
> should ensure that pmd_devmap() implies pmd_leaf(). Since devmap is a
> purely SW construct it almost certainly does already anyhow.

Yep, but only if pmd_leaf() is safe to be put here. A pmd devmap should
always imply as a pmd_leaf() indeed.

Thanks,

-- 
Peter Xu

