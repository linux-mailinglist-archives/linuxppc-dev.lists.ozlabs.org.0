Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA2B85F264
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 09:05:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fxxz19jE;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fxxz19jE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgQgN1TF5z2xmC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 19:05:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fxxz19jE;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fxxz19jE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgQfd6d2Pz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 19:04:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708589094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Qz0IA0kUehz+OG0swe7slV1s58KjzFRhgWAnSqUkqI=;
	b=fxxz19jESmDTBE6Ttcpn4CluMCZmCDheD1gdMQcQzbyCS7U8umZ4dea9kAzxwJ1VM7PWpZ
	AUKgAegVR7lq1rJ/jqpNurTKJyPyNPUY/Ge57mZt4257swRszsZPi94axgGr6CHs68rmAR
	lm//rBceeo18txFywinYPPS9IHSDi4g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708589094;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=2Qz0IA0kUehz+OG0swe7slV1s58KjzFRhgWAnSqUkqI=;
	b=fxxz19jESmDTBE6Ttcpn4CluMCZmCDheD1gdMQcQzbyCS7U8umZ4dea9kAzxwJ1VM7PWpZ
	AUKgAegVR7lq1rJ/jqpNurTKJyPyNPUY/Ge57mZt4257swRszsZPi94axgGr6CHs68rmAR
	lm//rBceeo18txFywinYPPS9IHSDi4g=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-413-6o3MKRCvMWqm8pVXW1FMRA-1; Thu, 22 Feb 2024 03:04:53 -0500
X-MC-Unique: 6o3MKRCvMWqm8pVXW1FMRA-1
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-6e430252451so2031468a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 00:04:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708589092; x=1709193892;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Qz0IA0kUehz+OG0swe7slV1s58KjzFRhgWAnSqUkqI=;
        b=oCachSdMPmXMRexcTMUpQGNJjHs93EauHx19Ubd6QeBPI8hzMEKpk5HMu63FGEmRTo
         0z3uZbGEQPuf3dtdPDZFXe0uHAnsPI2htSUDUOwaN3SJ1oCsTZL3jvTBx/x4ZXk8QvL4
         ieotzQ6UNoSjF+cEZS99jlNms14DIyEZHf8Xuw3KhWJGw9bRHKq24EojLEb7GfuR/AXI
         9LybHu+ZHxw+XAzG1I/ClBN1NFwjkJzEGNRq4CBrGpXpoR/mOnRRvk6B58wrMJ0kHA+X
         quNCrghWwD8HkucQVzMBhRCixxa+sap6rP+lmBO1ctMULcF7+jxxYUR3vEryNUNxrS25
         Vj3A==
X-Forwarded-Encrypted: i=1; AJvYcCVrfhX0bLa/i3IadsCbCrMvJLloKGEJ8jv+f5SCYTQDDMJXMP3C9SjVizYdskC7k1XB+jhfSRiUPSnAsaa+6Mmoy5Rrh3IM1Nx4oeUQmA==
X-Gm-Message-State: AOJu0Yz1KSJ9tF6ouRmPkORhNyDvilWntDPJF3T6mH0/IZ5EhN8DK7DU
	yfM3iFjbDPlxDVrTUl/0oTnpHtPQuzRfAmVk+707K40SVkeZ8j2d8TE4w8pUT1mGUYzqI+jbmY1
	E8E6oo3+DLAWciLFFZraV8pjmbHlOBf3rLR+BX65bsde812NqQ5vDSd2VzaOmwBI=
X-Received: by 2002:a05:6359:4113:b0:176:6149:5558 with SMTP id kh19-20020a056359411300b0017661495558mr16051634rwc.1.1708589092281;
        Thu, 22 Feb 2024 00:04:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZ/pl9m1WfSqai2cvVXv5Lf1ZKvJ4xKR9ln5/WSKPeld/1kI04FNn1XDkCL6gJC29eFxMWrw==
X-Received: by 2002:a05:6359:4113:b0:176:6149:5558 with SMTP id kh19-20020a056359411300b0017661495558mr16051606rwc.1.1708589091922;
        Thu, 22 Feb 2024 00:04:51 -0800 (PST)
Received: from x1n ([43.228.180.230])
        by smtp.gmail.com with ESMTPSA id a21-20020a056a0011d500b006e0d1e6036bsm10300214pfu.129.2024.02.22.00.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Feb 2024 00:04:51 -0800 (PST)
Date: Thu, 22 Feb 2024 16:04:38 +0800
From: Peter Xu <peterx@redhat.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH v2 03/13] mm: Provide generic pmd_thp_or_huge()
Message-ID: <ZdcAFpRijQdaYV2A@x1n>
References: <20240103091423.400294-1-peterx@redhat.com>
 <20240103091423.400294-4-peterx@redhat.com>
 <20240115175551.GP734935@nvidia.com>
 <ZdXEYfs_xhS_9gRo@x1n>
 <20240221125753.GQ13330@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20240221125753.GQ13330@nvidia.com>
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

On Wed, Feb 21, 2024 at 08:57:53AM -0400, Jason Gunthorpe wrote:
> On Wed, Feb 21, 2024 at 05:37:37PM +0800, Peter Xu wrote:
> > On Mon, Jan 15, 2024 at 01:55:51PM -0400, Jason Gunthorpe wrote:
> > > On Wed, Jan 03, 2024 at 05:14:13PM +0800, peterx@redhat.com wrote:
> > > > From: Peter Xu <peterx@redhat.com>
> > > > 
> > > > ARM defines pmd_thp_or_huge(), detecting either a THP or a huge PMD.  It
> > > > can be a helpful helper if we want to merge more THP and hugetlb code
> > > > paths.  Make it a generic default implementation, only exist when
> > > > CONFIG_MMU.  Arch can overwrite it by defining its own version.
> > > > 
> > > > For example, ARM's pgtable-2level.h defines it to always return false.
> > > > 
> > > > Keep the macro declared with all config, it should be optimized to a false
> > > > anyway if !THP && !HUGETLB.
> > > > 
> > > > Signed-off-by: Peter Xu <peterx@redhat.com>
> > > > ---
> > > >  include/linux/pgtable.h | 4 ++++
> > > >  mm/gup.c                | 3 +--
> > > >  2 files changed, 5 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> > > > index 466cf477551a..2b42e95a4e3a 100644
> > > > --- a/include/linux/pgtable.h
> > > > +++ b/include/linux/pgtable.h
> > > > @@ -1362,6 +1362,10 @@ static inline int pmd_write(pmd_t pmd)
> > > >  #endif /* pmd_write */
> > > >  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
> > > >  
> > > > +#ifndef pmd_thp_or_huge
> > > > +#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
> > > > +#endif
> > > 
> > > Why not just use pmd_leaf() ?
> > > 
> > > This GUP case seems to me exactly like what pmd_leaf() should really
> > > do and be used for..
> > 
> > I think I mostly agree with you, and these APIs are indeed confusing.  IMHO
> > the challenge is about the risk of breaking others on small changes in the
> > details where evil resides.
> 
> These APIs are super confusing, which is why I brought it up.. Adding
> even more subtly different variations is not helping.
> 
> I think pmd_leaf means the entry is present and refers to a physical
> page not another radix level.
> 
> > > eg x86 does:
> > > 
> > > #define pmd_leaf	pmd_large
> > > static inline int pmd_large(pmd_t pte)
> > > 	return pmd_flags(pte) & _PAGE_PSE;
> > > 
> > > static inline int pmd_trans_huge(pmd_t pmd)
> > > 	return (pmd_val(pmd) & (_PAGE_PSE|_PAGE_DEVMAP)) == _PAGE_PSE;
> > > 
> > > int pmd_huge(pmd_t pmd)
> > >         return !pmd_none(pmd) &&
> > >                 (pmd_val(pmd) & (_PAGE_PRESENT|_PAGE_PSE)) != _PAGE_PRESENT;
> > 
> > For example, here I don't think it's strictly pmd_leaf()? As pmd_huge()
> > will return true if PRESENT=0 && PSE=0 (as long as none pte ruled out
> > first), while pmd_leaf() will return false; I think that came from
> > cbef8478bee5. 
> 
> Yikes, but do you even want to handle non-present entries in GUP
> world? Isn't everything gated by !present in the first place?

I am as confused indeed.

> 
> > Besides that, there're also other cases where it's not clear of such direct
> > replacement, not until further investigated.  E.g., arm-3level has:
> > 
> > #define pmd_leaf(pmd)		pmd_sect(pmd)
> > #define pmd_sect(pmd)		((pmd_val(pmd) & PMD_TYPE_MASK) == \
> > 						 PMD_TYPE_SECT)
> > #define PMD_TYPE_SECT		(_AT(pmdval_t, 1) << 0)
> > 
> > While pmd_huge() there relies on PMD_TABLE_BIT ()
> 
> I looked at tht, it looked OK.. 
> 
> #define PMD_TYPE_MASK               (_AT(pmdval_t, 3) << 0)
> #define PMD_TABLE_BIT               (_AT(pmdval_t, 1) << 1)
> 
> It is the same stuff, just a little confusingly written

True, my eyes decided to skip all the shifts. :-( Ok then, let me see
whether I can give it a stab on the pXd_huge() mess.

Thanks,

-- 
Peter Xu

