Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEA287BD27
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 14:00:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YipXpQqB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YipXpQqB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwSCg49yLz3dX3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 00:00:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YipXpQqB;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YipXpQqB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwSBv2XZjz303d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 23:59:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710421170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKCzOVXDDLeWui+9xMnOflGFcsiyeRgIZTuCOA+l7OQ=;
	b=YipXpQqBSD1mqnNCmBGE6r4keAW+xNh3XH4UqpTxJkG7jULnmyiizl5FSp45QQLzogBI55
	1oVM1WvXvARPW4ONc1mxPiKpqfz8Ux9krqKP0ji8CD6zZANsnOtJlvX2k4iFQa+WHgel5t
	4bmVLSmCpw2XqyJIfl9TVWPwmsen27A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710421170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jKCzOVXDDLeWui+9xMnOflGFcsiyeRgIZTuCOA+l7OQ=;
	b=YipXpQqBSD1mqnNCmBGE6r4keAW+xNh3XH4UqpTxJkG7jULnmyiizl5FSp45QQLzogBI55
	1oVM1WvXvARPW4ONc1mxPiKpqfz8Ux9krqKP0ji8CD6zZANsnOtJlvX2k4iFQa+WHgel5t
	4bmVLSmCpw2XqyJIfl9TVWPwmsen27A=
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-605-UbHzCFYCPXaIa5ImyrdY8Q-1; Thu, 14 Mar 2024 08:59:27 -0400
X-MC-Unique: UbHzCFYCPXaIa5ImyrdY8Q-1
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-4d424421d4aso121576e0c.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 05:59:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710421167; x=1711025967;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKCzOVXDDLeWui+9xMnOflGFcsiyeRgIZTuCOA+l7OQ=;
        b=YirFoQcPrSIW48w+RDecs4Ay153hOA60KAo6WGeB1eBUFztvQ6oOrSUbFFIZzYr8iu
         rgJh2/Lf3YV8ET+n2PdDco9xUg/TUIXHOWfyQUWSzmS4xh3QRvNT/CDQ04fHKaKvNBPm
         c2/l88UNc97FBEyDbRiSityRazX4MMXCcsA+P9WZvPpumYSwcqVzLpAmiA2+5KLYtLix
         FIZf7a+opP9FOCVBuWlN3YUIJqdY/DAJnBW3DpmwL+FcVN3HsseOasSM6+ojQ9+6eleT
         gLZVp36fxQRTWFo41RQSykFEuw+AAmp8mPguDfA2AEIP9X1np3kx2lIYQVYLqzkKpbUS
         G8xw==
X-Forwarded-Encrypted: i=1; AJvYcCWUkjxXj3PuDwh3sFrTLgtAHhc2BIdpFv0ONz7YRG2AN486cEA0dX33RxKCIJhR1ZFbCbMGAgI971YxdhDu8nT982fPbqTGZ1AMUBmAYg==
X-Gm-Message-State: AOJu0Yw/NUuMlmWEUdkEmp8HVjylLQ7ZWv73sUcojK2449n5KVagX46o
	DAxPjp/cm8RpVn80UBh1PsJr2bGHe1wmEOzZR6/0ar28LZ4nhBCYdOKCpcD++XsmYimBM8Re0SK
	PnhJU7UxQV1HuKJz2dYedcWOH3y3pV4G0w6sSPcW1PG9mAgJ0Y7kqKaHYc1zQ/+Y=
X-Received: by 2002:a67:f405:0:b0:476:7cf:5495 with SMTP id p5-20020a67f405000000b0047607cf5495mr1410181vsn.3.1710421167249;
        Thu, 14 Mar 2024 05:59:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFpB2lM/GBtztEZpRh5zxenkJs3cKW/cbCqzpceWYQibEUdWkJxv7eCQPooUilH8iyb4M7ppQ==
X-Received: by 2002:a67:f405:0:b0:476:7cf:5495 with SMTP id p5-20020a67f405000000b0047607cf5495mr1410155vsn.3.1710421166816;
        Thu, 14 Mar 2024 05:59:26 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id q14-20020a05621419ee00b00690edd77658sm413155qvc.75.2024.03.14.05.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 05:59:26 -0700 (PDT)
Date: Thu, 14 Mar 2024 08:59:22 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 11/13] mm/treewide: Replace pXd_huge() with pXd_leaf()
Message-ID: <ZfL0qh0re5BpYGba@x1n>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-12-peterx@redhat.com>
 <0f929f80-92fd-4824-a7d6-839f1aef4c8a@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <0f929f80-92fd-4824-a7d6-839f1aef4c8a@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Muchun Song <muchun.song@linux.dev>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 14, 2024 at 08:50:20AM +0000, Christophe Leroy wrote:
> 
> 
> Le 13/03/2024 à 22:47, peterx@redhat.com a écrit :
> > From: Peter Xu <peterx@redhat.com>
> > 
> > Now after we're sure all pXd_huge() definitions are the same as pXd_leaf(),
> > reuse it.  Luckily, pXd_huge() isn't widely used.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   arch/arm/include/asm/pgtable-3level.h | 2 +-
> >   arch/arm64/include/asm/pgtable.h      | 2 +-
> >   arch/arm64/mm/hugetlbpage.c           | 4 ++--
> >   arch/loongarch/mm/hugetlbpage.c       | 2 +-
> >   arch/mips/mm/tlb-r4k.c                | 2 +-
> >   arch/powerpc/mm/pgtable_64.c          | 6 +++---
> >   arch/x86/mm/pgtable.c                 | 4 ++--
> >   mm/gup.c                              | 4 ++--
> >   mm/hmm.c                              | 2 +-
> >   mm/memory.c                           | 2 +-
> >   10 files changed, 15 insertions(+), 15 deletions(-)
> > 
> > diff --git a/arch/arm/include/asm/pgtable-3level.h b/arch/arm/include/asm/pgtable-3level.h
> > index e7aecbef75c9..9e3c44f0aea2 100644
> > --- a/arch/arm/include/asm/pgtable-3level.h
> > +++ b/arch/arm/include/asm/pgtable-3level.h
> > @@ -190,7 +190,7 @@ static inline pte_t pte_mkspecial(pte_t pte)
> >   #define pmd_dirty(pmd)		(pmd_isset((pmd), L_PMD_SECT_DIRTY))
> >   
> >   #define pmd_hugewillfault(pmd)	(!pmd_young(pmd) || !pmd_write(pmd))
> > -#define pmd_thp_or_huge(pmd)	(pmd_huge(pmd) || pmd_trans_huge(pmd))
> > +#define pmd_thp_or_huge(pmd)	(pmd_leaf(pmd) || pmd_trans_huge(pmd))
> 
> Previous patch said pmd_trans_huge() implies pmd_leaf().

Ah here I remember I kept this arm definition there because I think we
should add a patch to drop pmd_thp_or_huge() completely.  If you won't mind
I can add one more patch instead of doing it here.  Then I keep this patch
purely as a replacement patch without further changes on arch-cleanups.

> 
> Or is that only for GUP ?

I think it should apply to all.

> 
> >   
> >   #ifdef CONFIG_TRANSPARENT_HUGEPAGE
> >   #define pmd_trans_huge(pmd)	(pmd_val(pmd) && !pmd_table(pmd))
> 
> 
> > diff --git a/mm/hmm.c b/mm/hmm.c
> > index c95b9ec5d95f..93aebd9cc130 100644
> > --- a/mm/hmm.c
> > +++ b/mm/hmm.c
> > @@ -429,7 +429,7 @@ static int hmm_vma_walk_pud(pud_t *pudp, unsigned long start, unsigned long end,
> >   		return hmm_vma_walk_hole(start, end, -1, walk);
> >   	}
> >   
> > -	if (pud_huge(pud) && pud_devmap(pud)) {
> > +	if (pud_leaf(pud) && pud_devmap(pud)) {
> 
> Didn't previous patch say devmap implies leaf ? Or is it only for GUP ?

This is an extra safety check that I didn't remove.  Devmap used separate
bits even though I'm not clear on why.  It should still imply a leaf though.

Thanks,

> 
> >   		unsigned long i, npages, pfn;
> >   		unsigned int required_fault;
> >   		unsigned long *hmm_pfns;
> 
> 

-- 
Peter Xu

