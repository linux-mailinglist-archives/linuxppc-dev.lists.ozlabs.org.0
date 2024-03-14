Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 381B187BE84
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Mar 2024 15:09:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eUUUPCHw;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eUUUPCHw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TwTlp6nntz3vby
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Mar 2024 01:09:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eUUUPCHw;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eUUUPCHw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TwTl44FLyz3dHV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Mar 2024 01:09:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710425340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H0Ur324GEdYx6Na4EUzT7uu0LrdRXgiT37bQ9SRfD/k=;
	b=eUUUPCHwLI87TuF9T4tgynGR2l98K59NC+DjzGG6EuLSmXZlPoS5pE3CzkqohYEXys1XT3
	i+Ri1mPWQOBHQyf84ddyQztD/jO8q6dSyFx68kAob2Z9PIbrB2s6qd0IS+Zf/8mrVs9dbE
	4pHtFwbuHNJI0lEtIGENcSH+ast1nQw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710425340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H0Ur324GEdYx6Na4EUzT7uu0LrdRXgiT37bQ9SRfD/k=;
	b=eUUUPCHwLI87TuF9T4tgynGR2l98K59NC+DjzGG6EuLSmXZlPoS5pE3CzkqohYEXys1XT3
	i+Ri1mPWQOBHQyf84ddyQztD/jO8q6dSyFx68kAob2Z9PIbrB2s6qd0IS+Zf/8mrVs9dbE
	4pHtFwbuHNJI0lEtIGENcSH+ast1nQw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-681-OI6MakTNPWC4MHP1LjIiiw-1; Thu, 14 Mar 2024 10:08:58 -0400
X-MC-Unique: OI6MakTNPWC4MHP1LjIiiw-1
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-690ab2b0de1so3111866d6.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Mar 2024 07:08:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710425337; x=1711030137;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H0Ur324GEdYx6Na4EUzT7uu0LrdRXgiT37bQ9SRfD/k=;
        b=Cq6Vz7mrcmWHanUvB6cVHwhUY9E9QsG5KUxD1ea6GfTbdekjtvJxoNIW5zBmCwx/28
         cIixoInlceeNaNT2MTNwiCeeuNW1u033mpceg6qmm2cDR5+bhAmEl8pw60wGQUfGnugo
         viW30KFAoFWsrVZuaA7LDnq+UdcP9y+iNz8c5+IlbtttJuvt3GT7Lvda/8VYODKRm4Qy
         0jyO0gEa61dIybgKM3fceydaVcmmVw3g//EmDp8XBOtXDzB6bTpxCpLXsCfZCAmnDB48
         fKewVYBxtpj+x6+K8iRKNWCUbl1RDDAXEy8B8KLfi9U9hz1y2Luj4RO6YsN3nRKefdlH
         KKtw==
X-Forwarded-Encrypted: i=1; AJvYcCVVuonBu60hVEs+WGPBu0RbATee/HGcNyXPzudAuNdUdMGt2DuJ4jaQjTZkowWqFz36JEGLin2UIX3XjZFNY9IcKhaTgsrv9S0gSfHYaA==
X-Gm-Message-State: AOJu0YycBY/hWU1OfwN0EhUFSpRyGtosb8DLnC9P1PYW/UQw9iciYCoU
	rgTaZhGrHtruiZISUogBLbWXSnUDsQYokNa7mIMfue7BQD9/MuP+ul/066worqUWIVNUvdxjlqy
	nDskQfRQ4mG/3NErh2mjpG05Ul5fX3S7iixMRg8Gpa592Sl9UBbw4fIZSG9SOvRY=
X-Received: by 2002:a05:6214:568f:b0:690:d848:5223 with SMTP id qm15-20020a056214568f00b00690d8485223mr1930032qvb.1.1710425336508;
        Thu, 14 Mar 2024 07:08:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHucQiNsYz/grbilWzCKNHDTJ2JNCr8u+qXqtyrFQdPGNDAiC8YJGtZ0KjeTmr272RirFzDNA==
X-Received: by 2002:a05:6214:568f:b0:690:d848:5223 with SMTP id qm15-20020a056214568f00b00690d8485223mr1929810qvb.1.1710425332941;
        Thu, 14 Mar 2024 07:08:52 -0700 (PDT)
Received: from x1n ([99.254.121.117])
        by smtp.gmail.com with ESMTPSA id eq9-20020ad45969000000b0069155a36f67sm499868qvb.9.2024.03.14.07.08.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 07:08:52 -0700 (PDT)
Date: Thu, 14 Mar 2024 10:08:50 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 12/13] mm/treewide: Remove pXd_huge()
Message-ID: <ZfME8vjFhl8AdyFe@x1n>
References: <20240313214719.253873-1-peterx@redhat.com>
 <20240313214719.253873-13-peterx@redhat.com>
 <7e93ab99-c956-42d0-9afd-3c856f3ad951@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <7e93ab99-c956-42d0-9afd-3c856f3ad951@csgroup.eu>
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

On Thu, Mar 14, 2024 at 08:56:59AM +0000, Christophe Leroy wrote:
> 
> 
> Le 13/03/2024 à 22:47, peterx@redhat.com a écrit :
> > From: Peter Xu <peterx@redhat.com>
> > 
> > This API is not used anymore, drop it for the whole tree.
> > 
> > Signed-off-by: Peter Xu <peterx@redhat.com>
> > ---
> >   arch/arm/mm/Makefile                          |  1 -
> >   arch/arm/mm/hugetlbpage.c                     | 29 -------------------
> >   arch/arm64/mm/hugetlbpage.c                   | 10 -------
> >   arch/loongarch/mm/hugetlbpage.c               | 10 -------
> >   arch/mips/include/asm/pgtable-32.h            |  2 +-
> >   arch/mips/include/asm/pgtable-64.h            |  2 +-
> >   arch/mips/mm/hugetlbpage.c                    | 10 -------
> >   arch/parisc/mm/hugetlbpage.c                  | 11 -------
> >   .../include/asm/book3s/64/pgtable-4k.h        | 10 -------
> >   .../include/asm/book3s/64/pgtable-64k.h       | 25 ----------------
> >   arch/powerpc/include/asm/nohash/pgtable.h     | 10 -------
> >   arch/riscv/mm/hugetlbpage.c                   | 10 -------
> >   arch/s390/mm/hugetlbpage.c                    | 10 -------
> >   arch/sh/mm/hugetlbpage.c                      | 10 -------
> >   arch/sparc/mm/hugetlbpage.c                   | 10 -------
> >   arch/x86/mm/hugetlbpage.c                     | 16 ----------
> >   include/linux/hugetlb.h                       | 24 ---------------
> >   17 files changed, 2 insertions(+), 198 deletions(-)
> >   delete mode 100644 arch/arm/mm/hugetlbpage.c
> > 
> 
> > diff --git a/arch/mips/include/asm/pgtable-32.h b/arch/mips/include/asm/pgtable-32.h
> > index 0e196650f4f4..92b7591aac2a 100644
> > --- a/arch/mips/include/asm/pgtable-32.h
> > +++ b/arch/mips/include/asm/pgtable-32.h
> > @@ -129,7 +129,7 @@ static inline int pmd_none(pmd_t pmd)
> >   static inline int pmd_bad(pmd_t pmd)
> >   {
> >   #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
> > -	/* pmd_huge(pmd) but inline */
> > +	/* pmd_leaf(pmd) but inline */
> 
> Shouldn't this comment have been changed in patch 11 ?

IMHO it's fine to be here, as this is the patch to finally drop _huge().
Patch 11 only converts the callers to use _leaf()s.  So this comment is
still valid until this patch, because this patch removes that definition.

> 
> >   	if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
> 
> Unlike pmd_huge() which is an outline function, pmd_leaf() is a macro so 
> it could be used here instead of open coping.

I worry it will break things as pmd_leaf() can sometimes be defined after
arch *pgtable.h headers.  So I avoided touching it except what I think I'm
confident.  I had a feeling it's inlined just because of a similar reason
for the old _huge().

> 
> >   		return 0;
> >   #endif
> > diff --git a/arch/mips/include/asm/pgtable-64.h b/arch/mips/include/asm/pgtable-64.h
> > index 20ca48c1b606..7c28510b3768 100644
> > --- a/arch/mips/include/asm/pgtable-64.h
> > +++ b/arch/mips/include/asm/pgtable-64.h
> > @@ -245,7 +245,7 @@ static inline int pmd_none(pmd_t pmd)
> >   static inline int pmd_bad(pmd_t pmd)
> >   {
> >   #ifdef CONFIG_MIPS_HUGE_TLB_SUPPORT
> > -	/* pmd_huge(pmd) but inline */
> > +	/* pmd_leaf(pmd) but inline */
> 
> Same
> 
> >   	if (unlikely(pmd_val(pmd) & _PAGE_HUGE))
> 
> Same
> 
> >   		return 0;
> >   #endif
> 
> > diff --git a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
> > index 2fce3498b000..579a7153857f 100644
> > --- a/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
> > +++ b/arch/powerpc/include/asm/book3s/64/pgtable-64k.h
> > @@ -4,31 +4,6 @@
> >   
> >   #ifndef __ASSEMBLY__
> >   #ifdef CONFIG_HUGETLB_PAGE
> > -/*
> > - * We have PGD_INDEX_SIZ = 12 and PTE_INDEX_SIZE = 8, so that we can have
> > - * 16GB hugepage pte in PGD and 16MB hugepage pte at PMD;
> > - *
> > - * Defined in such a way that we can optimize away code block at build time
> > - * if CONFIG_HUGETLB_PAGE=n.
> > - *
> > - * returns true for pmd migration entries, THP, devmap, hugetlb
> > - * But compile time dependent on CONFIG_HUGETLB_PAGE
> > - */
> 
> Should we keep this comment somewhere for documentation ?

The 2nd/3rd paragraphs are definitely obsolete, so should be dropped.

OTOH, I'm not sure how much that will help if e.g. I move that over to
pmd_leaf(): a check over cpu_to_be64(_PAGE_PTE) is an implementation as
simple as it could be to explain itself with even no comment to me..

I also don't fully digest why that 1st paragraph discusses PGD entries: for
example, there's no pgd_huge() defined.  It may not mean that the comment
is wrong, perhaps it means that I may lack some knowledge around this area
on Power..

Would you suggest how I should move paragraph 1 (and help to explain what
it is describing)?  Or maybe we can provide a separate patch for Power's
huge page sizes but posted separately (and very possibly I'm not the best
candidate then..).

> 
> > -static inline int pmd_huge(pmd_t pmd)
> > -{
> > -	/*
> > -	 * leaf pte for huge page
> > -	 */
> > -	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
> > -}
> > -
> > -static inline int pud_huge(pud_t pud)
> > -{
> > -	/*
> > -	 * leaf pte for huge page
> > -	 */
> > -	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
> > -}
> >   
> >   /*
> >    * With 64k page size, we have hugepage ptes in the pgd and pmd entries. We don't

-- 
Peter Xu

