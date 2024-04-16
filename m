Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 260148A750A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Apr 2024 21:41:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jgy+Qg9u;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQuEHSDq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VJvYZ6Hk4z3vX0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Apr 2024 05:41:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jgy+Qg9u;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NQuEHSDq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=peterx@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VJvXq461hz2xQ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Apr 2024 05:40:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713296455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/Ml3SF+cSrbD320vnXWBxDDeH0gsE7DWJx9HUiNlVQ=;
	b=Jgy+Qg9u2xMxKL5BV4b4UX2TZqAq8oaoOpyM+2J/3RQU7ZSpFO+GkMLINPia96PKfRi/Gk
	WUnssEgUQc8J6fLHhmARAKI4KXBR/yAjfy/UsbhWuLxkklenbJSBlKrOnFNHyCaWU0hsFI
	VOz0kv7bUMO180Iy69MODmKWCVxIMHE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713296456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2/Ml3SF+cSrbD320vnXWBxDDeH0gsE7DWJx9HUiNlVQ=;
	b=NQuEHSDqjwAbF/rx7vWHL7ZcjqgCEwzB+TUXtcovxtLGkXc338gvhMzRLvPFF96APaqmeQ
	DXdHqJfxFIDVuXNCuUjXJmtf7j/+pwApQ8hbVi1vBQBLbl5WV2rQWMiIuTEP1RA+ULBl5E
	cOilkL/d2cBHmXqa2tnq5TtF9SDFZn0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-205-woO_MxFoPhuWsTZS0Fh4EA-1; Tue, 16 Apr 2024 15:40:54 -0400
X-MC-Unique: woO_MxFoPhuWsTZS0Fh4EA-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4311d908f3cso24785391cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Apr 2024 12:40:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713296453; x=1713901253;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2/Ml3SF+cSrbD320vnXWBxDDeH0gsE7DWJx9HUiNlVQ=;
        b=SAX7ykFsKX+RhRRJTS3w67QFTot8j8bzWvkQvkvu8VkZOv2iv4RUvH9Z1gfTMpECsO
         4S+o4XhOdIF8Nz1XGCXDursCccwNM5l0wx/4OGYo6osrZeft/0w+mz3BuvYAwhtLbDWb
         KD7kORJUGgezkjX9MznKxJ2ySgMosN6RiL8uxRdLfqgP+o0yexAbZQY+KDCn2IjkGVuT
         Xzu1ZFK0dq4stXOcDjJV8ND7vC6nwak/Mtr5FswgD5pin3PwU060iNCYoyGK8ZCpFN1s
         oZzLzcUItxm24Eym933hMWv9L4ZmRbZs9MZEyLenrOjOXwE2Jgnq9zP6PXV/ItARB4ae
         i46w==
X-Forwarded-Encrypted: i=1; AJvYcCUHIQsjl4TI55I0GFDtXdwPLXVfkMEsZetC8nC/iCIlpXep1Y+YcD42CeqXie/cjbYE6qGKnknj2Ad0Bpj7uTOBzzkAFigvg6Q3KLV6Eg==
X-Gm-Message-State: AOJu0YxsE5I+usDo8tTpv6CmgRSh0wfc22D/ZvjBCnEHcmCg75AiJBxD
	QYHhVI2GDL+VZKNQF0swA55Lll/9tGnPVbDPDNGA/4HXMfwQasCBQ3an4+PeOrnZqB3IMpptbQl
	R7g8KVNzR1m1pH7T69DgQ/H0cEttrHewdxgYNj9JCE1hnYUSb5Ei6SHDQubsnpNs=
X-Received: by 2002:a0c:d64a:0:b0:69b:6124:1ac5 with SMTP id e10-20020a0cd64a000000b0069b61241ac5mr12574627qvj.6.1713296453254;
        Tue, 16 Apr 2024 12:40:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFM2TMuxlTE64M5wRSrKp9X4hT8djPoNFx5MjBvlHy4YWGI0mZHWgHn5d59fTUt+Qi0LQ06Yw==
X-Received: by 2002:a0c:d64a:0:b0:69b:6124:1ac5 with SMTP id e10-20020a0cd64a000000b0069b61241ac5mr12574601qvj.6.1713296452672;
        Tue, 16 Apr 2024 12:40:52 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id v17-20020a0ced51000000b0069b7edb9665sm2468071qvq.19.2024.04.16.12.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 12:40:52 -0700 (PDT)
Date: Tue, 16 Apr 2024 15:40:50 -0400
From: Peter Xu <peterx@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 0/8] Reimplement huge pages without hugepd on powerpc
 8xx
Message-ID: <Zh7UQl5kMd_Q1ow-@x1n>
References: <cover.1711377230.git.christophe.leroy@csgroup.eu>
 <20240325163840.GF6245@nvidia.com>
 <ZhgMqF7SNaISrYMJ@x1n>
 <d236ce4a-1dde-4ee9-8cef-fe96242c2f4b@csgroup.eu>
 <ZhlFokakZo3c90C6@x1n>
 <d3a4c5a6-0fd6-4518-a76b-04dcf2ea2f2c@csgroup.eu>
 <8f7d4343-6bfd-4c1c-aeaf-350abde770ca@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <8f7d4343-6bfd-4c1c-aeaf-350abde770ca@csgroup.eu>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 16, 2024 at 10:58:33AM +0000, Christophe Leroy wrote:
> 
> 
> Le 15/04/2024 à 21:12, Christophe Leroy a écrit :
> > 
> > 
> > Le 12/04/2024 à 16:30, Peter Xu a écrit :
> >> On Fri, Apr 12, 2024 at 02:08:03PM +0000, Christophe Leroy wrote:
> >>>
> >>>
> >>> Le 11/04/2024 à 18:15, Peter Xu a écrit :
> >>>> On Mon, Mar 25, 2024 at 01:38:40PM -0300, Jason Gunthorpe wrote:
> >>>>> On Mon, Mar 25, 2024 at 03:55:53PM +0100, Christophe Leroy wrote:
> >>>>>> This series reimplements hugepages with hugepd on powerpc 8xx.
> >>>>>>
> >>>>>> Unlike most architectures, powerpc 8xx HW requires a two-level
> >>>>>> pagetable topology for all page sizes. So a leaf PMD-contig approach
> >>>>>> is not feasible as such.
> >>>>>>
> >>>>>> Possible sizes are 4k, 16k, 512k and 8M.
> >>>>>>
> >>>>>> First level (PGD/PMD) covers 4M per entry. For 8M pages, two PMD 
> >>>>>> entries
> >>>>>> must point to a single entry level-2 page table. Until now that was
> >>>>>> done using hugepd. This series changes it to use standard page tables
> >>>>>> where the entry is replicated 1024 times on each of the two 
> >>>>>> pagetables
> >>>>>> refered by the two associated PMD entries for that 8M page.
> >>>>>>
> >>>>>> At the moment it has to look into each helper to know if the
> >>>>>> hugepage ptep is a PTE or a PMD in order to know it is a 8M page or
> >>>>>> a lower size. I hope this can me handled by core-mm in the future.
> >>>>>>
> >>>>>> There are probably several ways to implement stuff, so feedback is
> >>>>>> very welcome.
> >>>>>
> >>>>> I thought it looks pretty good!
> >>>>
> >>>> I second it.
> >>>>
> >>>> I saw the discussions in patch 1.  Christophe, I suppose you're 
> >>>> exploring
> >>>> the big hammer over hugepd, and perhaps went already with the 32bit pmd
> >>>> solution for nohash/32bit challenge you mentioned?
> >>>>
> >>>> I'm trying to position my next step; it seems like at least I should 
> >>>> not
> >>>> adding any more hugepd code, then should I go with ARCH_HAS_HUGEPD 
> >>>> checks,
> >>>> or you're going to have an RFC soon then I can base on top?
> >>>
> >>> Depends on what you expect by "soon".
> >>>
> >>> I sure won't be able to send any RFC before end of April.
> >>>
> >>> Should be possible to have something during May.
> >>
> >> That's good enough, thanks.  I'll see what is the best I can do.
> >>
> >> Then do you think I can leave p4d/pgd leaves alone?  Please check the 
> >> other
> >> email where I'm not sure whether pgd leaves ever existed for any of
> >> PowerPC.  That's so far what I plan to do, on teaching pgtable walkers
> >> recognize pud and lower for all leaves.  Then if Power can switch from
> >> hugepd to this it should just work.
> > 
> > Well, if I understand correctly, something with no PMD will include 
> > <asm-generic/pgtable-nopmd.h> and will therefore only have .... pmd 
> > entries (hence no pgd/p4d/pud entries). Looks odd but that's what it is. 
> > pgd_populate(), p4d_populate(), pud_populate() are all "do { } while 
> > (0)" and only pmd_populate exists. So only pmd_leaf() will exist in that 
> > case.
> > 
> > And therefore including <asm-generic/pgtable-nop4d.h> means .... you 
> > have p4d entries. Doesn't mean you have p4d_leaf() but that needs to be 
> > checked.
> > 
> > 
> >>
> >> Even if pgd exists (then something I overlooked..), I'm wondering whether
> >> we can push that downwards to be either pud/pmd (and looks like we all
> >> agree p4d is never used on Power).  That may involve some pgtable
> >> operations moving from pgd level to lower, e.g. my pure imagination would
> >> look like starting with:
> > 
> > Yes I think there is no doubt that p4d is never used:
> > 
> > arch/powerpc/include/asm/book3s/32/pgtable.h:#include 
> > <asm-generic/pgtable-nopmd.h>
> > arch/powerpc/include/asm/book3s/64/pgtable.h:#include 
> > <asm-generic/pgtable-nop4d.h>
> > arch/powerpc/include/asm/nohash/32/pgtable.h:#include 
> > <asm-generic/pgtable-nopmd.h>
> > arch/powerpc/include/asm/nohash/64/pgtable-4k.h:#include 
> > <asm-generic/pgtable-nop4d.h>
> > 
> > But that means that PPC32 have pmd entries and PPC64 have p4d entries ...
> > 
> >>
> >> #define PTE_INDEX_SIZE    PTE_SHIFT
> >> #define PMD_INDEX_SIZE    0
> >> #define PUD_INDEX_SIZE    0
> >> #define PGD_INDEX_SIZE    (32 - PGDIR_SHIFT)
> >>
> >> To:
> >>
> >> #define PTE_INDEX_SIZE    PTE_SHIFT
> >> #define PMD_INDEX_SIZE    (32 - PMD_SHIFT)
> >> #define PUD_INDEX_SIZE    0
> >> #define PGD_INDEX_SIZE    0
> > 
> > But then you can't anymore have #define PTRS_PER_PMD 1 from 
> > <asm-generic/pgtable-nop4d.h>
> > 
> >>
> >> And the rest will need care too.  I hope moving downward is easier
> >> (e.g. the walker should always exist for lower levels but not always for
> >> higher levels), but I actually have little idea on whether there's any
> >> other implications, so please bare with me on stupid mistakes.
> >>
> >> I just hope pgd leaves don't exist already, then I think it'll be 
> >> simpler.
> >>
> >> Thanks,
> >>
> 
> Digging into asm-generic/pgtable-nopmd.h, I see a definition of 
> pud_leaf() always returning 0, introduced by commit 2c8a81dc0cc5 
> ("riscv/mm: fix two page table check related issues")
> 
> So should asm-generic/pgtable-nopud.h contain the same for p4d_leaf() 

I think should be yes for this, and..

> and asm-generic/pgtable-nop4d.h contain the same for pgd_leaf() ?

.. probably no for this?  It seems pgd is just slightly special.

Firstly, I notice that the -nopmd.h actually includes -nopud.h already, and
further that includes -nop4d.h.  It means we can only have below options:

  a) nopmd + nopud + nop4d
  b) nopud + nop4d
  c) nop4d

It should also mean we can't randomly choose which layer to skip with the
current header arrangements.. at the meantime, all 32bit PowerPC should
perhaps fall into a), while 64 bits fall into c).  That looks all fine for
now.

Above p4d_leaf()==false [1] should be fine when -nopud.h included, because
that already included nop4d.h, it means "p4d level is skipped" in the
pgtable.  Then it doesn't make sense if p4d_leaf() can ever return true.
That's the same when pud_leaf()==false looks sane when an arch included
-nopmd.h as that in turn implies -nopud too.

pgd seems different, because -nop4d.h didn't include anything else like
"-nopgd.h"..  so I don't see further implication on pgd sololy from the
headers. I guess that's also why 32bit Power uses pgd+pte for the two
levels; it looks like pgd is special among the others.

However I think it still didn't mean that we can't push pgd to pmd, making
pgd+pte into pmd+pte.  Though here we may want to move from:

  #include <asm-generic/pgtable-nopmd.h>
  (pmd/pud/p4d not used)

Into:

  #include <asm-generic/pgtable-nopud.h>
  (pud/p4d not used)

Then we may need to provide something similar to what's in -nopXd.h for
pgds.

But let's loop back to the very beginning: I don't think we have either pgd
leaves or p4d leaves for PowerPC.  Note that hugepd looks possible to exist
in pgd entries (per wiki page [1]), however I don't even think it's true in
reality, as I mentioned elsewhere on reading __find_linux_pte() and it
always go directly into p4d.  I highly doubt in reality the "pgd hugepd
entries" are actually processed by the p4d layer here:

	if (is_hugepd(__hugepd(p4d_val(p4d)))) {
		hpdp = (hugepd_t *)&p4d;
		goto out_huge;
	}

Because when with "nop4d" it doesn't mean "there is no p4d" but what it
really meant is "we have only one p4d entry (which is actually exactly the
pgd entry..)".  After all, is_hugepd() works for all levels.

Taking E500 nohash 32 as example, it has these:

  "pgd entry covering 2M" -> "hugepd with one hugepte covering one 4M hugepage"
                                   ^
  "pgd entry covering 2M" ---------+

I suspect this "pgd covering 2M" is processed by the p4d code above, rather
than pgd level.  Then in the future world where there's no hugepd, it'll
naturally become a pgtable page at pte level.

Thanks,

[1] https://github.com/linuxppc/wiki/wiki/Huge-pages

-- 
Peter Xu

